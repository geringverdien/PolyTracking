local Rig = {}

local BONE_DIRECTION = Vector3.New(0, 1, 0)

function Rig:MakeSkeleton(landmarks: number, bones: number): {instance: model, points: {}, bones: {}}
    local skeleton = {
        instance = nil,
        points = {},
        bones = {}
    }

    local model: Model = Instance.New("Model")
    model.Name = "Skeleton"

    skeleton.instance = model

    -- local pointsModel: Model = Instance.New("Model")
    -- pointsModel.Name = "Points"
    -- pointsModel.Parent = model

    -- for i = 0, landmarks - 1 do 
    --     local part: Part = Instance.New("Part")
    --     part.Name = tostring(i)
    --     part.Color = Color.FromRGB(1, 0, 0)
    --     part.Anchored = true
    --     part.Size = Vector3.New(0.1)

    --     part.Parent = pointsModel

    --     skeleton.points[i] = part
    -- end

    local bonesModel: Model = Instance.New("Model")
    bonesModel.Name = "Bones"
    bonesModel.Parent = model

    for i = 0, bones - 1 do
        local part: Part = Instance.New("Part")
        part.Name = tostring(i)
        part.Color = Color.FromRGB(255, 0, 0)
        part.Mass = 1000
        part.Anchored = true

        part.Parent = bonesModel

        skeleton.bones[i] = part
    end


    return skeleton
end

function Rig:AlignBone(C: {
        Part: Part, 
        A: Vector3, 
        B: Vector3, 
        Thickness: number, 
        Scale: number, 
        Offset: Vector3,
        Rotation: Quaternion?,
        Speed: number
    })

    assert(C and C.Part and C.A and C.B, "Align is missing args")

    local bonePart = C.Part
    local scale = C.Scale or 1
    local Offset = C.Offset or Vector3.Zero
    local localA = Vector3.New(C.A.X, -C.A.Y, -C.A.Z) * scale
    local localB = Vector3.New(C.B.X, -C.B.Y, -C.B.Z) * scale
    local poseOffset = localB - localA
    local poseLength = poseOffset.Magnitude
    if poseLength < 0.0001 then return end

    local poseRotation = Quaternion.FromToRotation(
        BONE_DIRECTION,
        poseOffset / poseLength
    )

    if C.Rotation then
        localA = C.Rotation * localA
        localB = C.Rotation * localB
    end

    local A = Offset + localA
    local B = Offset + localB
    local thickness = C.Thickness and (C.Thickness * scale) or (0.1 * scale)
    local tweenSpeed = C.Speed or 0


    local offset = B - A
    local length = offset.Magnitude

    if length < 0.0001 then return end

    local position = (A + B) / 2

    local rotation = poseRotation
    if C.Rotation then
        rotation = C.Rotation * rotation
    end

    local size = Vector3.New(thickness) + BONE_DIRECTION * (length - thickness)

    --print(length, position, rotation)

    if tweenSpeed == 0 then
        bonePart.Position = position
        bonePart.Quaternion = rotation
        bonePart.Size = size
        return
    end

    local tween = Tween:NewTween() do
        tween.Parallel = true
        tween:TweenPosition(bonePart, position, tweenSpeed)
        tween:TweenQuaternion(bonePart.Quaternion, rotation, tweenSpeed, function(quat)
            bonePart.Quaternion = quat
        end)
        tween:TweenSize(bonePart, size, tweenSpeed)

        tween:Play()
    end
end

function Rig:AlignPoint(C: {
        Part: Part, 
        Pos: Vector3, 
        Scale: number, 
        Offset: Vector3
    })

    assert(C and C.Part and C.Pos)

    local Part = C.Part
    local Pos = C.Pos
    local Scale = C.Scale or 1
    local Offset = C.Offset or Vector3.Zero

    Part.Position = Offset + Vector3.New(Pos.X, -Pos.Y, -Pos.Z) * Scale
    Part.Size = Vector3.New(0.05 * Scale)

end

function Rig:AlignPart(C: {
        Part: Part, 
        A: Vector3, 
        B: Vector3,
        Scale: number, 
        Offset: Vector3,
        Rotation: Quaternion?,
        Speed: number
    })

    assert(C and C.Part and C.A and C.B, "Align is missing args")

    local targetPart = C.Part
    local scale = C.Scale or 1
    local Offset = C.Offset or Vector3.Zero
    local localA = Vector3.New(C.A.X, -C.A.Y, -C.A.Z) * scale
    local localB = Vector3.New(C.B.X, -C.B.Y, -C.B.Z) * scale
    local poseOffset = localB - localA
    local poseLength = poseOffset.Magnitude
    if poseLength < 0.0001 then return end

    local poseRotation = Quaternion.FromToRotation(
        BONE_DIRECTION,
        poseOffset / poseLength
    )

    if C.Rotation then
        localA = C.Rotation * localA
        localB = C.Rotation * localB
    end

    local A = Offset + localA
    local B = Offset + localB
    local tweenSpeed = C.Speed or 0


    local offset = B - A
    local length = offset.Magnitude

    if length < 0.0001 then return end

    local position = (A + B) / 2

    local rotation = poseRotation
    if C.Rotation then
        rotation = C.Rotation * rotation
    end


    if tweenSpeed == 0 then
        targetPart.Position = position
        targetPart.Quaternion = rotation
        return
    end

    local tween = Tween:NewTween() do
        tween.Parallel = true
        tween:TweenPosition(targetPart, position, tweenSpeed)
        tween:TweenQuaternion(targetPart.Quaternion, rotation, tweenSpeed, function(quat)
            targetPart.Quaternion = quat
        end)

        tween:Play()
    end
end

return Rig