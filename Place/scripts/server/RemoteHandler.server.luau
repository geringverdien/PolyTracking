local SetURL: NetworkEvent = ScriptService:WaitChild("SetURL")
local URLValue: StringValue = ServerHidden:WaitChild("URL")

local SetScale: NetworkEvent = ScriptService:WaitChild("SetScale")
local ScaleValue: StringValue = ServerHidden:WaitChild("Scale")

local SetFPS: NetworkEvent = ScriptService:WaitChild("SetFPS")
local FPSValue: IntValue = ServerHidden:WaitChild("FPS")



SetURL.InvokedServer:Connect(function(plr: Player, message: NetMessage)
    if not plr.IsCreator then return end

    local url = message:GetString("url")
    if not url or #url < 10 then return end 

    URLValue.Value = url

    print("Set URL")
end)

SetScale.InvokedServer:Connect(function(plr: Player, message: NetMessage)
    if not plr.IsCreator then return end

    local n = message:GetNumber("scale")
    if not n or n <= 0 then return end 

    ScaleValue.Value = n

    print("Set Scale:", n)
end)

SetFPS.InvokedServer:Connect(function(plr: Player, message: NetMessage)
    if not plr.IsCreator then return end

    local n = message:GetInt("fps")
    if not n or n <= 0 then return end 

    FPSValue.Value = n

    print("Set FPS:", n)
end)