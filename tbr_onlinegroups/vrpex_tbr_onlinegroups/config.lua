cfg = {}

--Refresh interval in seconds
--anything from 1 to 5 is probably fine
cfg.refresh_interval = 1

--Translation table
cfg.lang = {
	online = "Players Online",
	still_loading = "Loading list...<br>Try again in a few seconds"
	--Carregando lista...<br>Tente novamente em alguns segundos
}

--The key that will activate the function
--Default key is [HOME]
--https://docs.fivem.net/game-references/controls/
cfg.key = {
	input_group = 1,
	control_index = 213
}

--The groups to show to the players in the following format:
--[DISPLAY NAME] = {vRP GROUPS LIST}
cfg.groups = {
    ["Police"] = {
        "police-recruit",
        "police-sergeant",
        "police-lieutenant",
    },
    ["Cartel"] = {
	    "cartel.lider",
        "cartel.right.arm",
        "cartel.soldier",
    },
    ["El Locos"] = {
	    "ellocos.lider",
        "ellocos.right.arm",
        "ellocos.soldier",
    },
    ["Paramedic"] = {
	    "samu-paramedico",
		"samu-medico",
        "samu-diretor",
    },
	["VIP"] = {
        "vip-platinum",
        "vip-gold",
        "vip-silver",
        "vip-bronze",
    },
    ["Mechanic"] = {"mechanic"},
    ["Lawyer"] = {"lawyer"},
	["Admin"] = {"admin"},
}