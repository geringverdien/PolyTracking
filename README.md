# PolyTracking
Full Body motion tracking in Polytoria powered by Mediapipe :3

# Requirements
- Python v3.14.7 or higher
- [ngrok](https://ngrok.com) account, installed and locally authenticated with an [authtoken](https://dashboard.ngrok.com/get-started/your-authtoken)
- A connected camera device (virtual cameras also work)

# Setup
## Python Backend (./src)
This is what setup would look like on an Arch based distro with fish shell, commands probably vary if you are on Windows or mac

```bash
cd ./src

# Other mediapipe models can be found at https://developers.google.com/edge/mediapipe/solutions/vision/pose_landmarker#models
curl "https://storage.googleapis.com/mediapipe-models/pose_landmarker/pose_landmarker_heavy/float16/latest/pose_landmarker_heavy.task" > pose_landmarker_heavy.task


python -m venv ./.venv
source /.venv/bin/activate.fish # Depends on OS and shell

pip install -r requirements.txt
python main.py
```
If successful a preview window should open

## Polytoria game (./Place)
- Copy ngrok URL from python output (e.g. "https://foo-bar-etc.ngrok-free.dev")
- Launch game (local test and online server both work)
- Paste url in bottom left input, hit enter
- Rig should now be visible ingame


# Configuration
## ./src
- `MODEL_PATH` - path to mediapipe model, leave default if you followed the setup
- `PROCESS_FPS` - speed of pose tracking, must be equal to in-game FPS config to stay synced 
- `PREVIEW_SHOW_CAMERA` - show real camera feed in preview (True) or hide it (False)
- `PORT` - port for web tunnel, leave default if there are no problems 

## Game
### UI Input fields
- `URL` - the ngrok url
- `Scale` - the size of the rig
- `FPS` - causes desync if not equal to `PROCESS_FPS`

### ./scripts/server/MainHandler.server.luau
This is the main handler for the motion tracking rig, only edit this if you know what you're doing

---
## Suggestions and Issues are appreciated :)