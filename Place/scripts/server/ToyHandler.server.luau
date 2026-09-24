local EquipToy: NetworkEvent = Hidden:WaitChild("EquipToy")
local ActivateToy: NetworkEvent = Hidden:WaitChild("ActivateToy")

local ScaleValue: NumberValue = ServerHidden:WaitChild("Scale")

local AlignFolder: Folder = Environment:WaitChild("Aligns")
local Root: Part = AlignFolder:WaitChild("Root")
local RightHand: Part = AlignFolder:WaitChild("RightHand")
local _LeftHand: Part = AlignFolder:WaitChild("LeftHand")
local _Head: Part = AlignFolder:FindChild("Head")

local ToyFolder: Folder = ServerHidden:WaitChild("Toys")

local swordModel: Model = ToyFolder:WaitChild("Sword")
local swordHandle: Part = swordModel:WaitChild("Handle")
local swordHitbox: Part = swordHandle:WaitChild("Hitbox")
local swordUnsheath: Sound = swordModel:WaitChild("Unsheath")
local swordSlash: Sound = swordModel:WaitChild("Slash")

local rpgModel: Model = ToyFolder:WaitChild("RPG")
local rpgHandle: Part = rpgModel:WaitChild("Handle")


local sizeFactor = 0.2
local toyScale = ScaleValue.Value * sizeFactor

local toys = {
    equipped = nil,
    sword = {
        model = swordModel,
        handle = swordHandle,
        pointOffset = Vector3.New(0, -2, 0),
        debounce = false
    },
    rpg = {
        model = rpgModel,
        handle = rpgHandle,
        pointOffset = Vector3.New(0, -3, 0)
    }
}

local swordToy, rpgToy = toys.sword, toys.rpg

for toyName, toyData in pairs(toys) do
    toyData.updateConnection = nil
end

EquipToy.InvokedServer:Connect(function(plr: Player, msg: NetMessage)
    if not plr.IsCreator then return end
    if Root.Position == Vector3.Zero then return end

    local targetToy = msg:GetString("toy")
    if targetToy == "none" then
        if toys.equipped then
            toys.equipped.toggleEquip(false)
        end
        toys.equipped = nil
        return
    end

    local foundToy = toys[targetToy]
    if not foundToy then return end
    toys.equipped = foundToy
    foundToy.toggleEquip(true)
end)

ActivateToy.InvokedServer:Connect(function(plr: Player, msg: NetMessage)
    if not plr.IsCreator then return end
    local equippedToy = toys.equipped
    if not equippedToy then return end
    if not equippedToy.activated then return end
    if Root.Position == Vector3.Zero then return end 

    equippedToy.activated(msg)
end)


ScaleValue.Changed:Connect(function()
    toyScale = ScaleValue.Value * sizeFactor
    local equippedToy = toys.equipped

    if not equippedToy then return end
    equippedToy.model.Size = Vector3.New(toyScale)
end)

local function toyCleanup(toy)
    if toy.updateConnection then
        toy.updateConnection:Disconnect()
        toy.updateConnection = nil
    end

    if toy.model then 
        toy.model.Parent = ToyFolder
        toy.model.Position = Vector3.New(9e9)
    end

    if toy.handle then
        toy.handle.Anchored = true
    end
end

local function scaleToy(toy)
    toy.model.Size = Vector3.New(toyScale)
end


-- Sword
swordToy.update = function(dt: number)
    if toys.equipped ~= swordToy then return end

    local direction = RightHand.Position - Root.Position
    direction += swordToy.pointOffset
    if direction.Magnitude < 0.0001 then return end

    swordModel.Position = RightHand.Position
    swordModel.Quaternion = Quaternion.FromToRotation(
        Vector3.New(0, 1, 0),
        direction / direction.Magnitude
    )
end

swordToy.toggleEquip = function(isEquipped: boolean)
    if isEquipped then
        print("equip sword")
        swordModel.Parent = Environment
        scaleToy(swordToy)
        swordToy.updateConnection = Hooks.Updated:Connect(swordToy.update)
        swordUnsheath:Play()
    else
        toyCleanup(swordToy)
    end
end

swordHitbox.Touched:Connect(function(hit: Physical)
    if toys.equipped ~= swordToy then return end
    if hit.ClassName ~= "Player" and hit.ClassName ~= "NPC" then return end
    if hit.IsCreator and hit.Name ~= "Player2" then return end 
    if swordToy.debounce then return end

    swordToy.debounce = true
    hit.Health -= 25
    swordSlash:Play()
    wait(0.33)
    swordToy.debounce = false
end)



-- RPG
rpgToy.update = function(dt: number)
    if toys.equipped ~= rpgToy then return end

    local direction = RightHand.Position - Root.Position
    direction += rpgToy.pointOffset
    if direction.Magnitude < 0.0001 then return end

    rpgModel.Position = RightHand.Position
    rpgModel.Quaternion = Quaternion.FromToRotation(
        Vector3.New(0, 1, 0),
        direction / direction.Magnitude
    )
end

rpgToy.toggleEquip = function(isEquipped: boolean)
    if isEquipped then
        rpgModel.Parent = Environment
        scaleToy(rpgToy)
        rpgToy.updateConnection = Hooks.Updated:Connect(rpgToy.update)
    else
        toyCleanup(rpgToy)
    end
end

