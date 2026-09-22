import cv2
import mediapipe as mp
import numpy as np
from flask import Flask, request
from mediapipe.tasks.python import vision
from mediapipe.tasks.python.vision import drawing_utils
from mediapipe.tasks.python.vision import drawing_styles
import threading
from waitress import create_server
import time
from pyngrok import ngrok
from pathlib import Path
import struct
from collections import deque

MODEL_PATH = Path(__file__).with_name("pose_landmarker_heavy.task") # https://developers.google.com/edge/mediapipe/solutions/vision/pose_landmarker#models
PROCESS_FPS = 20
PREVIEW_SHOW_CAMERA = True
PORT = 8080


shutdown_event = threading.Event()
tunnel_url = None

app = Flask(__name__)
pose_buffer = deque(maxlen=600)
pose_buffer_lock = threading.Lock()
client_initialized = False

def start_public_tunnel(port):
    global tunnel_url
    time.sleep(2)
    if shutdown_event.is_set():
        return
    try:
        tunnel = ngrok.connect(port)
        tunnel_url = tunnel.public_url
        print("\n" + "=" * 60)
        print(f"  NGROK TUNNEL READY: ")
        print(f"  {tunnel_url}")
        print("=" * 60 + "\n")
        print(flush=True)

    except Exception as e:
        print(f"[Tunnel Error] Could not start ngrok tunnel: {e}", flush=True)

def webcam():
    try:
        webcam_loop()
    except Exception as error:
        import traceback
        print(f"[Webcam Error] {error}", flush=True)
        traceback.print_exc()
        shutdown_event.set()

def webcam_loop():
    
    pose_options = mp.tasks.vision.PoseLandmarkerOptions(
        base_options=mp.tasks.BaseOptions(model_asset_path=str(MODEL_PATH)),
        running_mode=mp.tasks.vision.RunningMode.VIDEO,
        num_poses=1,
        min_pose_detection_confidence=0.5,
        min_pose_presence_confidence=0.5,
        min_tracking_confidence=0.5,
    )

    cap = cv2.VideoCapture(0)
    try:
        if not cap.isOpened():
            raise RuntimeError("Could not open camera at index 0")

        window_name = "Pose Landmarks"
        cv2.namedWindow(window_name, cv2.WINDOW_NORMAL)
        cv2.resizeWindow(window_name, 640, 480)
        process_interval = 1.0 / float(PROCESS_FPS)
        next_process_time = time.monotonic()
        timestamp_ms = 0
        last_pose_landmarks = []
        pose_landmark_style = drawing_styles.get_default_pose_landmarks_style()
        pose_connection_style = drawing_utils.DrawingSpec(
            color=(0, 255, 0), thickness=3
        )

        with mp.tasks.vision.PoseLandmarker.create_from_options(pose_options) as landmarker:
            while not shutdown_event.is_set() and cap.isOpened():
                ret, frame = cap.read()
                if not ret:
                    raise RuntimeError("Camera stopped returning frames")

                now = time.monotonic()
                if now >= next_process_time:
                    next_process_time = now + process_interval
                    timestamp_ms += int(process_interval * 1000)

                    rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                    image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb_frame)
                    results = landmarker.detect_for_video(image, timestamp_ms)
                    if results.pose_landmarks:
                        last_pose_landmarks = results.pose_landmarks

                    if results.pose_world_landmarks:
                        world_landmarks = results.pose_world_landmarks[0]
                        frame_data = b"".join(
                            struct.pack("<3f", point.x, point.y, point.z)
                            for point in world_landmarks
                        )
                        with pose_buffer_lock:
                            pose_buffer.append(frame_data)

                rgb_preview = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                if PREVIEW_SHOW_CAMERA:
                    annotated_rgb_frame = np.copy(rgb_preview)
                else:
                    annotated_rgb_frame = np.zeros_like(rgb_preview)
                for pose_landmarks in last_pose_landmarks:
                    drawing_utils.draw_landmarks(
                        image=annotated_rgb_frame,
                        landmark_list=pose_landmarks,
                        connections=vision.PoseLandmarksConnections.POSE_LANDMARKS,
                        landmark_drawing_spec=pose_landmark_style,
                        connection_drawing_spec=pose_connection_style,
                    )
                frame = cv2.cvtColor(annotated_rgb_frame, cv2.COLOR_RGB2BGR)

                cv2.imshow(window_name, frame)
                if cv2.waitKey(1) & 0xFF == ord("q"):
                    shutdown_event.set()
                    break

    finally:
        cap.release()
        cv2.destroyAllWindows()
        shutdown_event.set()
        print("[Webcam] Stopped", flush=True)

@app.route('/', methods=['GET'])
def get_landmarks():
    global client_initialized
    force_clear = request.args.get("clear", "").lower() == "1"

    with pose_buffer_lock:
        if force_clear or not client_initialized:
            pose_buffer.clear()
            client_initialized = True
            payload = b""
        else:
            payload = b"".join(pose_buffer)
            pose_buffer.clear()
    return app.response_class(payload, mimetype="application/octet-stream")

if __name__ == '__main__':
    webcam_thread = threading.Thread(target=webcam, name="webcam")
    tunnel_thread = threading.Thread(
        target=start_public_tunnel, args=(PORT,), name="ngrok"
    )
    webcam_thread.start()
    tunnel_thread.start()
    print(f"Local Server running at http://localhost:{PORT}", flush=True)
    http_server = create_server(
        app, host='0.0.0.0', port=PORT, connection_limit=1000, channel_timeout=5
    )
    http_thread = threading.Thread(target=http_server.run, name="http-server")
    http_thread.start()
    try:
        while not shutdown_event.wait(0.5):
            pass
    except KeyboardInterrupt:
        print("\n[Server] Shutting down", flush=True)
    finally:
        shutdown_event.set()
        http_server.close()
        if tunnel_url:
            ngrok.disconnect(tunnel_url)
        ngrok.kill()
        webcam_thread.join(timeout=5)
        tunnel_thread.join(timeout=3)
        http_thread.join(timeout=5)
        print("[Server] Shutdown complete", flush=True)