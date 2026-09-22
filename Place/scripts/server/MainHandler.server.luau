local ServerRequest = require(ScriptService:WaitChild("ServerRequest"))
local Rig = require(ScriptService:WaitChild("Rig"))
local BufferReader = require(ScriptService:WaitChild("BufferReader"))

local URLValue: StringValue = ServerHidden:WaitChild("URL")
local URL = ""

local ScaleValue: NumberValue = ServerHidden:WaitChild("Scale")
local SCALE = 5

local FPSValue: IntValue = ServerHidden:WaitChild("FPS")
local FRAME_INTERVAL = 1 / 10

local skeleton
local FRONT_OFFSET = -5
local FRAME_BYTES = 33 * 3 * 4
local INITIAL_BUFFER_DELAY = 1
local frameQueue = {}
local queueHead = 1
local queueTail = 0
local playbackElapsed = 0

local pointConnections = {
    -- Face
    [0] = {5, 2},
    [5] = {8},
    [2] = {7},
    [9] = {10},

    -- Right Arm
    [12] = {14, 24, 11},
    [14] = {16},
    [16] = {18, 20, 22},
    [18] = {20},

    -- Left Arm
    [11] = {13, 23},
    [13] = {15},
    [15] = {21, 17, 19},
    [19] = {17},

    -- Right Leg
    [24] = {26, 23},
    [26] = {28},
    [28] = {32, 30},
    [32] = {30},

    -- Left Leg
    [23] = {25},
    [25] = {27},
    [27] = {29, 31},
    [29] = {31}
}

local Aligns: Folder = Environment:WaitChild("Aligns")
local Root: Part, LeftHand: Part, RightHand: Part = Aligns:WaitChild("Root"), Aligns:WaitChild("LeftHand"), Aligns:WaitChild("RightHand")

local function getMaxRequestSpeed(): number
    local reqsPerMinute = 90 + (10 * Players.PlayersCount)
    return 60 / (reqsPerMinute * 0.80)
end

local function getModelOffset(footDistance: number): Vector3
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.IsCreator then
            local plrChar = plr.Character
            local localOffset = Vector3.New(5, footDistance - 3, FRONT_OFFSET)
            return plrChar.Position + plrChar.Quaternion * localOffset
        end
    end 

    return Vector3.New(0, footDistance, FRONT_OFFSET)
end

local function getModelRotation(): Quaternion?
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.IsCreator and plr.Character then
            return plr.Character.Quaternion
        end
    end

    return nil
end

local function enqueueFrames(dataBuffer: buffer)
    local bufferLength = buffer.len(dataBuffer)
    local frameOffset = 0

    while frameOffset + FRAME_BYTES <= bufferLength do
        queueTail += 1
        frameQueue[queueTail] = {
            Buffer = dataBuffer,
            Offset = frameOffset
        }
        frameOffset += FRAME_BYTES
    end

    local maxQueuedFrames = math.max(2, math.ceil(INITIAL_BUFFER_DELAY / FRAME_INTERVAL))
    local firstQueuedFrame = queueTail - maxQueuedFrames + 1
    if queueHead < firstQueuedFrame then
        for queuedFrame = queueHead, firstQueuedFrame - 1 do
            frameQueue[queuedFrame] = nil
        end
        queueHead = firstQueuedFrame
    end
end

local function requestFrames(currentURL: string): nil
    local nextRequestTime = time()
    local firstRequest = true

    while URL == currentURL do
        local requestSuccess, dataBuffer = ServerRequest:GetData(currentURL, firstRequest)
        if requestSuccess then
            enqueueFrames(dataBuffer)
        end

        firstRequest = false

        nextRequestTime += getMaxRequestSpeed()
        local waitTime = nextRequestTime - time()
        if waitTime > 0 then
            wait(waitTime)
        else
            nextRequestTime = time()
        end
    end
end

local function updateAnimation(dt: number)
    if not skeleton then return end

    playbackElapsed = math.min(playbackElapsed + dt, FRAME_INTERVAL)
    if playbackElapsed < FRAME_INTERVAL or queueHead > queueTail then return end

    playbackElapsed -= FRAME_INTERVAL
    local frame = frameQueue[queueHead]
    frameQueue[queueHead] = nil
    queueHead += 1
    local dataBuffer = frame.Buffer
    local frameOffset = frame.Offset

    local leftHeel = BufferReader:GetIdx(dataBuffer, 29, frameOffset) -- left heel
    local rightHeel = BufferReader:GetIdx(dataBuffer, 30, frameOffset) -- right heel

    local leftHeight = leftHeel.Magnitude * SCALE
    local rightHeight = rightHeel.Magnitude * SCALE
    local longestDist = math.max(leftHeight, rightHeight)


    local rightHip = BufferReader:GetIdx(dataBuffer, 24, frameOffset)
    local leftHip = BufferReader:GetIdx(dataBuffer, 23, frameOffset)

    local rootCenter = (rightHip + leftHip) / 2
    local rootHalfHeight = Vector3.New(0, 0.5, 0)

    Rig:AlignPart({
        Part = Root,
        A = rootCenter + rootHalfHeight,
        B = rootCenter - rootHalfHeight,
        Scale = SCALE,
        Offset = getModelOffset(longestDist),
        Rotation = getModelRotation(),
        Speed = FRAME_INTERVAL
    })


    for i = 0, 1 do
        local pinky = BufferReader:GetIdx(dataBuffer, 17 + i, frameOffset)
        local index = BufferReader:GetIdx(dataBuffer, 19 + i, frameOffset)

        Rig:AlignPart({
            Part = i == 0 and LeftHand or RightHand,
            A = pinky,
            B = index,
            Scale = SCALE,
            Offset = getModelOffset(longestDist),
            Rotation = getModelRotation(),
            Speed = FRAME_INTERVAL
        })
    end


    local partID = 0
    for originID, connections in pairs(pointConnections) do
        local originPosition = BufferReader:GetIdx(dataBuffer, originID, frameOffset)

        for _, targetPoint in pairs(connections) do
            local targetPosition = BufferReader:GetIdx(dataBuffer, targetPoint, frameOffset)

            Rig:AlignBone({
                Part = skeleton.bones[partID],
                A = originPosition,
                B = targetPosition,
                Scale = SCALE,
                Offset = getModelOffset(longestDist),
                Rotation = getModelRotation(),
                Thickness = 0.01,
                Speed = FRAME_INTERVAL
            })

            partID += 1
        end
    end

    -- for idx = 0, 32 do
    --     local part = skeleton.points[idx]
    --     local x, y, z = BufferReader:GetIdx(dataBuffer, idx)

    --     Rig:AlignPoint({
    --         Part = part,
    --         Pos = Vector3.New(x, y, z),
    --         Scale = SCALE,
    --         Offset = getModelOffset()
    --     })
    -- end 
end

local function init(): nil
    local currentURL = URL
    if skeleton then 
        skeleton.instance:Destroy() 
        skeleton.Bones, skeleton.Points = nil, nil
        skeleton = nil
    end
    print("init start")
    
    skeleton = Rig:MakeSkeleton(33, 31) -- 33 landmarks 31 bones
    skeleton.instance.Parent = Environment
    print("made skeleton")

    frameQueue = {}
    queueHead = 1
    queueTail = 0
    playbackElapsed = 0
    coroutine.wrap(requestFrames)(currentURL)
end

Hooks.Updated:Connect(updateAnimation)



URLValue.Changed:Connect(function()
    URL = URLValue.Value
    init()
end)

ScaleValue.Changed:Connect(function()
    SCALE = ScaleValue.Value
end)

FPSValue.Changed:Connect(function()
    FRAME_INTERVAL = 1 / FPSValue.Value
end)