local NPC: NPC = script.Parent

NPC.Died:Connect(function()
    wait(3)
    NPC:Respawn()
end)