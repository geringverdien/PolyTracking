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
local rpgBarrel: Part = rpgHandle:WaitChild("Barrel")
local rpgShoot: Sound = rpgModel:WaitChild("Shoot")


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
        pointOffset = Vector3.New(0, -2.5, 0),
        debounce = false
    }
}

local swordToy, rpgToy = toys.sword, toys.rpg

for toyName, toyData in pairs(toys) do
    toyData.updateConnection = nil
end

local function getCreatorRotation(): Quaternion
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.IsCreator and plr.Character then
            return plr.Character.Quaternion
        end
    end

    return Quaternion.New()
end


local function getToyRotation(direction: Vector3): Quaternion
    local rigRotation = getCreatorRotation()
    return rigRotation * Quaternion.FromToRotation(
        Vector3.New(0, 1, 0),
        direction / direction.Magnitude
    )
end

local function getToyDirection(toy): Vector3
    local rigRotation = getCreatorRotation()
    local inv = rigRotation:Inverse()
    local direction = inv * (RightHand.Position - Root.Position)
    return direction + toy.pointOffset
end

EquipToy.InvokedServer:Connect(function(plr: Player, msg: NetMessage)
    if not plr.IsCreator then return end
    if Root.Position == Vector3.Zero then return end

    local targetToy = msg:GetString("toy")

    if toys.equipped then
        toys.equipped.toggleEquip(false)
    end

    if targetToy == "none" then
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

local function alignTo(toy, alignPart: Part)
    local direction = getToyDirection(toy)
    if direction.Magnitude < 0.0001 then return end

    toy.model.Position = alignPart.Position
    toy.model.Quaternion = getToyRotation(direction)
end

-- Sword
swordToy.update = function(dt: number)
    if toys.equipped ~= swordToy then return end
    alignTo(swordToy, RightHand)
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
    alignTo(rpgToy, RightHand)
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

rpgToy.activated = function()
    if rpgToy.debounce then return end
    rpgToy.debounce = true
    spawn(function()
        wait(3)
        rpgToy.debounce = false
    end)

    rpgShoot:Play()

    local shootDirection = rpgBarrel.Quaternion * Vector3.New(0, 1, 0)
    local _raycast = Environment:Raycast(
        rpgBarrel.Position,
        shootDirection,
        1000,
        {rpgModel, Players:GetPlayers()[1]}
    )

    local rocket: Part = Instance.New("Part") do
        rocket.Name = "rocket"
        rocket.Anchored = true
        rocket.Size = Vector3.New(0.5, 1.5, 0.5) * Vector3.New(toyScale)
        rocket.Position = rpgBarrel.Position
        rocket.Quaternion = rpgBarrel.Quaternion
        rocket.Parent = Environment
    end

    local rocketConnection = nil
    local rocketTouched = nil
    local shootStart = time()

    rocketConnection = Hooks.Updated:Connect(function(dt)
        if time() - shootStart > 5 then
            rocket:Destroy()
            rocketConnection:Disconnect()
            return
        end

        rocket.Position += shootDirection * (dt * 40)
    end)

    rocketTouched = rocket.Touched:Connect(function(hit: Physical)
        if hit:IsDescendantOf(rpgModel) or hit:IsDescendantOf(Players:GetPlayers()[1]) then return end
        rocketConnection:Disconnect()
        rocketTouched:Disconnect()
        local explosion: Explosion = Instance.New("Explosion")
        explosion.Position = rocket.Position
        explosion.Parent = Environment
        rocket:Destroy()
        wait(2)
        explosion:Destroy()
        rocketTouched = nil
        rocketConnection = nil
    end)
end
