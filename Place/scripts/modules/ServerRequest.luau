local module = {}

function module:GetData(url: string, clearBacklog: boolean): (boolean, buffer)
    local req = HttpRequestData.New() do
        req.Method = Enums.HttpRequestMethod.Get
        req.URL = url .. (clearBacklog and "?clear=1" or "")
        req.Headers = {
            ["Content-Type"] = "application/octet-stream"
        }
    end

    local res = Http:RequestAsync(req)
    local success = res.Success

    if not success then 
        print("request failed") 
        return false, nil 
    end 

    --print("got buffer request")
    return true, res.Buffer
end

return module