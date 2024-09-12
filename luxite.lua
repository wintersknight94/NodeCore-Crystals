-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
minetest.override_item(modname.. ":luxite",{
	groups = {
		cracky = 3,
		crystal = 1,
		crystal_node = 1,
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
local function luxite_tools(item)
	minetest.override_item(item,{
		groups = {lux_emit = 1, flammable = 2, crystalline = 1},
		light_source = 6, glow = 1
	})
end
------------------------------------------------------------------------
luxite_tools(modname.. ":tool_pick_luxite")
luxite_tools(modname.. ":tool_spade_luxite")
luxite_tools(modname.. ":tool_hatchet_luxite")
luxite_tools(modname.. ":tool_mallet_luxite")
luxite_tools(modname.. ":adze_luxite")
luxite_tools(modname.. ":mace_luxite")
-- ================================================================== --

