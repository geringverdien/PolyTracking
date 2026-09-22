local EquipSword: NetworkEvent = ScriptService:WaitChild("EquipSword")

local lp = Players.LocalPlayer

if not lp.IsCreator then return end

swordEquipped = false
local function toggleSword()
    swordEquipped = not swordEquipped
    
    local message = NetMessage.New()
    message:AddBool("equip", swordEquipped)

    EquipSword:InvokeServer(message)
end

local keybinds = {
    ["R"] = toggleSword
}

Input.KeyDown:Connect(function(key: KeyCode, gameFocused: boolean)
    if not gameFocused then return end
    
    for keybind, callback in pairs(keybinds) do
        if key == Enums.KeyCode[keybind] then 
            callback()
            return
        end
    end
end)
