-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
minetest.override_item(modname.. ":adamant",{
	groups = {
		cracky = 5,
		crystal = 1,
		lux_absorb = 10
	},
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":adamant_crystal",{
	groups = {
		snappy = 1,
		attached_node = 1,
		crystal = 1,
		lux_absorb = 10
	},
	light_source = 1, glow = 1
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":adamant_lattice",{
	groups = {
		cracky = 5,
		crystal = 1,
		lux_absorb = 10
	},
	light_source = 1, glow = 1
})
-- ================================================================== --

