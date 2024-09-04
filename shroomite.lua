-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
  local frost = modname.. ".png"
  local mineral = "(" ..frost.. "^[colorize:#00a86b:180)^wc_naturae_mycelium.png"		--JADE
  local crystal = "(" ..mineral.. ")^[mask:" ..modname.. "_mask.png"

minetest.override_item(modname.. ":shroomite",{
	tiles = {mineral},
	light_source = 12, glow = 1,
	drop_in_place = {name = "nc_lux:flux_source"}
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":shroomite_crystal",{
	tiles = {mineral.. "^[mask:" ..modname.. "_mask.png"},
	inventory_image = mineral.. "^[mask:" ..modname.. "_mask.png",
	light_source = 12, glow = 1
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":shroomite_lattice",{
	tiles = {mineral},
	light_source = 12, glow = 1
})
-- ================================================================== --

local function shroomite_tools(item)
	minetest.override_item(item,{
		groups = {lux_emit = 1},
		light_source = 6, glow = 1
	})
end
------------------------------------------------------------------------
shroomite_tools(modname.. ":tool_pick_shroomite")
shroomite_tools(modname.. ":tool_spade_shroomite")
shroomite_tools(modname.. ":tool_hatchet_shroomite")
shroomite_tools(modname.. ":tool_mallet_shroomite")
shroomite_tools(modname.. ":adze_shroomite")
shroomite_tools(modname.. ":mace_shroomite")
-- ================================================================== --

