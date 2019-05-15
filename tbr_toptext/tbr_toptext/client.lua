Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsControlPressed(0, 22) then
            SendNUIMessage("dismiss")
        end
    end
end)