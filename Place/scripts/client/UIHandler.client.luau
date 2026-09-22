local SetURL: NetworkEvent = ScriptService:WaitChild("SetURL")
local SetScale: NetworkEvent = ScriptService:WaitChild("SetScale")
local SetFPS: NetworkEvent = ScriptService:WaitChild("SetFPS")

local lp = Players.LocalPlayer

local GUI = script.Parent

if not lp.IsCreator then
    GUI:Destroy()
    return
end

local URLInput: UITextInput = GUI:WaitChild("URLInput")
local ScaleInput: UITextInput = GUI:WaitChild("ScaleInput")
local FPSInput: UITextInput = GUI:WaitChild("FPSInput")

URLInput.Submitted:Connect(function()
    local message = NetMessage.New()
    message:AddString("url", URLInput.Text)

    SetURL:InvokeServer(message)
end)

ScaleInput.Submitted:Connect(function()
    local scale = tonumber(ScaleInput.Text)
    if scale == nil or scale <= 0 then return end

    local message = NetMessage.New()
    message:AddNumber("scale", ScaleInput.Text)

    SetScale:InvokeServer(message)
end)

FPSInput.Submitted:Connect(function()
    local tonum = tonumber(FPSInput.Text)
    if not tonumber(tonum) then return end
    local fps = math.ceil(tonum)

    local message = NetMessage.New()
    message:AddInt("fps", fps)

    SetFPS:InvokeServer(message)
end)
