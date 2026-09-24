local EquipToy: NetworkEvent = Hidden:WaitChild("EquipToy")
local ActivateToy: NetworkEvent = Hidden:WaitChild("ActivateToy")

local Root: Part = Environment:WaitChild("Aligns"):WaitChild("Root")

local lp = Players.LocalPlayer

if not lp.IsCreator then return end


local activateKeybind = Enums.KeyCode.M
local keybinds = {
    ["R"] = "sword",
    ["T"] = "rpg"
}


lastEquipped = nil

local function equipToy(toyName)
    local message = NetMessage.New()
    message:AddString("toy", toyName)

    EquipToy:InvokeServer(message)
end

local function doActivate()
    ActivateToy:InvokeServer()
end


Input.KeyDown:Connect(function(key: KeyCode, gameFocused: boolean)
    if not gameFocused then return end
    if Root.Position == Vector3.Zero then return end
    
    for keybind, toyName in pairs(keybinds) do
        if key ~= Enums.KeyCode[keybind] then continue end

        if toyName == lastEquipped then
            equipToy("none")
            lastEquipped = nil
            return
        end

        lastEquipped = toyName
        equipToy(toyName)
        return
    end

    if key == activateKeybind then
        doActivate()
    end
end)