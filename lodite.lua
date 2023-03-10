-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
minetest.override_item(modname.. ":lodite",{
	groups = {
		cracky = 2,
		crystal = 1
	},
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":lodite_crystal",{
	groups = {
		snappy = 1,
		attached_node = 1,
		crystal = 1
	},
})
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

