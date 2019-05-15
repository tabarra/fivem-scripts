local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")


local function UpdaterLoop()
	local allUsers = {}
	local displaySets = {}
	--Iterate users
	local users = vRP.getUsers({})
	for userID, user in pairs(users) do
		local userData = {}
		userData.userID = userID
		userData.identity = vRP.getUserIdentity({userID})
		userData.groups = vRP.getUserGroups({userID})
		table.insert(allUsers, userData)

		--Iterate groupSets
		for cGroupSet, cGroups in pairs(cfg.groups) do
			--Checking all groups inside the set
			local groupFlag = false
			for cGroupIndex, cGroupName in pairs(cGroups) do
				if userData.groups[cGroupName] ~= nil and userData.groups[cGroupName] == true then
					groupFlag = true
				end
			end
			--If the player is inside any group inside the set, add to the counter
			if groupFlag then
				if displaySets[cGroupSet] ~= nil then
					displaySets[cGroupSet] = displaySets[cGroupSet] + 1
				else
					displaySets[cGroupSet] = 1
				end
			end
		end
		
	end
	local sendData = {
		online = #allUsers,
		labels = displaySets
	}
	
	TriggerClientEvent("tbr_onlinegroups:updateData", -1, sendData)
end


--Event Handlers
RegisterNetEvent("tbr_onlinegroups:requestUpdate")
AddEventHandler("tbr_onlinegroups:requestUpdate", function()
	UpdaterLoop()
end)

AddEventHandler("vRP:playerJoin", function(userID, user, name, last_login)
	UpdaterLoop()
end)

AddEventHandler("vRP:playerLeave", function(userID, user)
	UpdaterLoop()
end)

AddEventHandler("vRP:playerRejoin", function(userID, user)
	UpdaterLoop()
end)

AddEventHandler("vRP:playerJoinGroup", function(userID, user)
	UpdaterLoop()
end)

AddEventHandler("vRP:playerLeaveGroup", function(userID, user)
	UpdaterLoop()
end)

RegisterCommand('refresh_plist', function(source, args)
	UpdaterLoop()
end)


--Execute Once
async(function()
	Citizen.Wait(cfg.refresh_interval*1000)
	UpdaterLoop()
end)
