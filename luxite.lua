-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
minetest.override_item(modname.. ":luxite",{
	groups = {
		cracky = 2,
		crystal = 1,
		lux_emit = 1
	},
	light_source = 3, glow = 1,
	drop_in_place = {name = "nc_lux:flux_source"}
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":luxite_crystal",{
	groups = {
		snappy = 1,
		attached_node = 1,
		crystal = 1,
		lux_emit = 1
	},
	light_source = 3, glow = 1
})
-- ================================================================== --

