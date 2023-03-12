-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
nodecore.register_craft({
	label = "smelt lodite shards",
	action = "pummel",
	toolgroups = {thumpy = 2},
	touchgroups = {
		coolant = 0,
		flame = 2
	},
	indexkeys = {modname.. ":lodite_crystal"},
	nodes = {
		{
			match = {name = modname.. ":lodite_crystal", count = 8},
			replace = "air"
		}
	},
	items = {
		"nc_lode:bar_hot"
	}
})

