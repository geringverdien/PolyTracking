local Rig = require(ScriptService:WaitChild("Rig"))

local Parts: Folder = Environment:WaitChild("TestParts")

local a, b, Bone = Parts:WaitChild("A"), Parts:WaitChild("B"), Parts:WaitChild("Bone")

wait(2)

Rig:AlignBone({
    Part = Bone,
    A = a.Position,
    B = b.Position,
    Speed = 0,
    Thickness = 0.3,
    Scale = 1
})

local p: Player = Players:GetPlayers()[1]
local char = p.Character

-- while wait() do
--     a.Position = char.Position

--     Bones:Align({
--         Part = Bone,
--         A = a.Position,
--         B = b.Position,
--         Speed = 0,
--         Thickness = 0.3,
--         Scale = 1
--     })
-- end