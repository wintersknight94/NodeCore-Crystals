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
	groups = {
		cracky = 7,
		crystal = 1,
		lux_emit = 1
	},
	light_source = 12, glow = 1,
	drop_in_place = {name = "nc_lux:flux_source"}
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":shroomite_crystal",{
	tiles = {mineral.. "^[mask:" ..modname.. "_mask.png"},
	inventory_image = mineral.. "^[mask:" ..modname.. "_mask.png",
	groups = {
		snappy = 1,
		attached_node = 1,
		crystal = 1,
		lux_emit = 1
	},
	light_source = 12, glow = 1
})
------------------------------------------------------------------------
minetest.override_item(modname.. ":shroomite_lattice",{
	tiles = {mineral},
	groups = {
		cracky = 7,
		crystal = 1,
		lux_emit = 1
	},
	light_source = 12, glow = 1
})
-- ================================================================== --

