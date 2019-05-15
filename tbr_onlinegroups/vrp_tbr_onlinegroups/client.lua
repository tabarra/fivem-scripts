local dataCache = {}
RegisterNetEvent("tbr_onlinegroups:updateData")
AddEventHandler("tbr_onlinegroups:updateData", function(data)
	dataCache = data
end)


function showTable()
	--Prepare HTML
	local outString = ""
	local setTimeout = 5000
	if dataCache.online ~= nil then
		outString = "<b>"..cfg.lang.online..":</b>  " .. dataCache.online .. "<br>\n<br>\n"
		for groupName, groupPlayers in pairs(dataCache.labels) do
			outString = outString .. "<b>" .. groupName ..":</b>  " .. groupPlayers .. "\n<br>"
		end
	else
		TriggerServerEvent("tbr_onlinegroups:requestUpdate")
		outString = cfg.lang.still_loading
		setTimeout = 2000
	end
	
	--Show to the user
	exports.pNotify:SendNotification({
		text = outString,
		type = "info",
		progressBar = true,
		timeout = setTimeout,
		layout = "nycolaaz",
		queue = "left",
		animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}
	})
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustReleased(cfg.key.input_group, cfg.key.control_index) then
            showTable()
        end
    end
end)