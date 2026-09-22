local EquipSword: NetworkEvent = ScriptService:WaitChild("EquipSword")

local ScaleValue: NumberValue = ServerHidden:WaitChild("Scale")

local AlignFolder: Folder = Environment:WaitChild("Aligns")
local Root: Part = AlignFolder:WaitChild("Root")
local RightHand: Part = AlignFolder:WaitChild("RightHand")

local Sword: Model = ServerHidden:WaitChild("Sword")
local Handle: Part = Sword:WaitChild("Handle")
local Hitbox: Part = Handle:WaitChild("Hitbox")
local SwordMesh = Handle:WaitChild("SwordMesh")
local Unsheath: Sound = Sword:WaitChild("Unsheath")
local Slash: Sound = Sword:WaitChild("Slash")

local swordEquipped = false
local swordUpdateConnection

local sizeFactor = 0.2
local SWORD_DOWNWARD_TILT = 0.2
local swordScale = ScaleValue.Value * sizeFactor

local function updateSword()
    if not swordEquipped then return end

    local direction = RightHand.Position - Root.Position
    direction += Vector3.New(0, -SWORD_DOWNWARD_TILT, 0)
    if direction.Magnitude < 0.0001 then return end

    Sword.Position = RightHand.Position
    Sword.Quaternion = Quaternion.FromToRotation(
        Vector3.New(0, 1, 0),
        direction / direction.Magnitude
    )
end


EquipSword.InvokedServer:Connect(function(plr, msg)
    if not plr.IsCreator then return end

    local doEquip = msg:GetBool("equip")
    swordEquipped = doEquip

    if swordEquipped then
        SwordMesh.Size = Vector3.New(0.5)
        Handle.Anchored = true
        Sword.Parent = Environment
        updateSword()
        swordUpdateConnection = Hooks.Updated:Connect(updateSword)
        Unsheath:Play()
    else
        if swordUpdateConnection then
            swordUpdateConnection:Disconnect()
            swordUpdateConnection = nil
        end

        Sword.Parent = ServerHidden
        SwordMesh.Size = Vector3.New(0)
    end
end)

local swordDebounce = false
Hitbox.Touched:Connect(function(hit: Physical)
    if not swordEquipped or Sword.Parent == ServerHidden then return end
    if hit.ClassName ~= "Player" and hit.ClassName ~= "NPC" then return end
    if hit.IsCreator and hit.Name ~= "Player2" then return end 
    if swordDebounce then return end

    swordDebounce = true
    hit.Health -= 25
    Slash:Play()
    wait(0.33)
    swordDebounce = false
end)

ScaleValue.Changed:Connect(function()
    swordScale = ScaleValue.Value * sizeFactor

    if swordEquipped then 
        Sword.Size = Vector3.New(swordScale)
    end
end)