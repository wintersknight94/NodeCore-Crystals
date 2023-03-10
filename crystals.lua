-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
	= minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
local function register_crystal(id, desc, mohs, color)
------------------------------------------------------------------------
--local frost = "nc_optics_glass_frost.png^[opacity:200"
  local frost = modname.. ".png"
  local mineral = frost.. "^[colorize:" ..color
  local crystal = "(" ..mineral.. ")^[mask:" ..modname.. "_mask.png"
------------------------------------------------------------------------
  local lt = 1/16
  local lw = 3/16
  local ll = 1/2
  local lf = 1/8
------------------------------------------------------------------------
	minetest.register_node(modname.. ":" ..id, {
		description = desc,
		tiles = {mineral},
		drawtype = "glasslike",
		use_texture_alpha = "blend",
		groups = {
			cracky = mohs,
			crystal = 1,
			lux_absorb = 20,
		},
		sounds = nodecore.sounds("nc_optics_glassy"),
--		light_source = 10 --for testing purposes
	})
------------------------------------------------------------------------
	minetest.register_node(modname.. ":" ..id.. "_crystal", {
		description = desc.. " Crystal",
		tiles = {mineral.. "^[mask:" ..modname.. "_mask.png"},
		inventory_image = mineral.. "^[mask:" ..modname.. "_mask.png",
		use_texture_alpha = "blend",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		paramtype2 = "wallmounted",
		groups = {
			snappy = 1,
			attached_node = 1,
			crystal = 1,
			lux_absorb = 20,
		},
		sounds = nodecore.sounds("nc_optics_glassy"),
		selection_box = {
			type = "fixed",
			fixed = {-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}
		},
--		drop_in_place = "air",
	})
------------------------------------------------------------------------
	minetest.register_node(modname.. ":" ..id.. "_lattice", {
		description = desc.. " Lattice",
		tiles = {mineral},
		drawtype = "nodebox",
		node_box = nodecore.fixedbox(
			{-lt, -ll, -lt, lt, ll, lt},
			{-ll, -lt, -lt, ll, lt, lt},
			{-lt, -lt, -ll, lt, lt, ll}
		),
		selection_box = nodecore.fixedbox(
			{-lf, -ll, -lf, lf, ll, lf},
			{-ll, -lf, -lf, ll, lf, lf},
			{-lf, -lf, -ll, lf, lf, ll}
		),
		paramtype = "light",
		use_texture_alpha = "blend",
		climbable = true,
		sunlight_propagates = true,
		groups = {cracky = mohs, crystal = 1, lattice = 1},
		sounds = nodecore.sounds("nc_optics_glassy"),
--		light_source = 10 --for testing purposes
	})
------------------------------------------------------------------------
	nodecore.register_craft({
		label = "break crystal to shards",
		action = "pummel",
		nodes = {
			{match = modname.. ":" ..id, replace = "air"}
		},
		items = {
			{name = modname .. ":" ..id.. "_crystal", count = 4, scatter = 5}
		},
		toolgroups = {cracky = mohs},
		itemscatter = 5
	})
end
-- ================================================================== --
register_crystal("lodite",		"Lodite",			3,	"#592720:180")		--CAPUT MORTUUM
register_crystal("luxite",		"Luxite",			3,	"#fcf75e:160")		--ICTERINE
------------------------------------------------------------------------
if minetest.get_modpath("wc_adamant") then
	register_crystal("adamant",		"Pure Adamantine",	6,	"#40e0d0:120")		--TURQUOISE
end
------------------------------------------------------------------------
if minetest.settings:get_bool(modname .. ".real_crystals", true) then
	register_crystal("quartz",		"Quartz",			4,	"#f4f0ec:180")		--ISABELLINE
	register_crystal("amethyst",		"Amethyst",		4,	"#4b0082:180")		--INDIGO
	register_crystal("selenite",		"Selenite",		2,	"#ffffff:64")		--WHITE
	register_crystal("celestine",		"Celestine",		2,	"#00bfff:120")		--DEEP SKY BLUE
	register_crystal("jasper",		"Jasper",			4,	"#9b111e:140")		--RUBY RED
	register_crystal("chrysoprase",	"Chrysoprase",		4,	"#3cb371:140")		--SEA GREEN
	register_crystal("onyx",			"Onyx",			4,	"#353839:180")		--ONYX
	register_crystal("citrine",		"Citrine",		4,	"#dfff00:140")		--CHARTREUSE
	register_crystal("aragonite",		"Aragonite",		3,	"#e48400:140")		--FULVOUS
	register_crystal("rhodochrosite",	"Rhodochrosite",	3,	"#fba0e3:160")		--LAVENDER ROSE
	register_crystal("pyrite",		"Pyrite",			3,	"#b5a642:180")		--BRASS
end
------------------------------------------------------------------------
if minetest.settings:get_bool(modname .. ".birthstones", true) then
	register_crystal("ruby",			"Ruby",			5,	"#9b111e:160")		--RUBY RED
	register_crystal("sapphire",		"Sapphire",		5,	"#0f52ba:160")		--SAPPHIRE
	register_crystal("emerald",		"Emerald",		4,	"#007f66:160")		--VIRIDIAN
	register_crystal("topaz",		"Topaz",			4,	"#e48400:160")		--FULVOUS
	register_crystal("garnet",		"Garnet",			4,	"#960018:160")		--CARMINE
	register_crystal("aquamarine",	"Aquamarine",		4,	"#7fffd4:160")		--AQUAMARINE
	register_crystal("peridot",		"Peridot",		4,	"#40e0d0:160")		--TURQUOISE
	register_crystal("tourmaline",	"Tourmaline",		4,	"#bd33a4:160")		--BYZANTINE
	register_crystal("alexandrite",	"Alexandrite",		5,	"#120a8f:160")		--ULTRAMARINE
	register_crystal("diamond",		"Diamond",		6,	"#ffffff:0")		--WHITE
end
------------------------------------------------------------------------
if minetest.get_modpath("wc_gloom") then
	register_crystal("shroomite",		"Shroomite",		7,	"#00a86b:180")		--JADE
end
-- ================================================================== --
nodecore.register_craft({
		label = "pulverize crystals to sand",
		action = "pummel",
		nodes = {
			{
				match = {groups = {crystal = true}},
				replace = "nc_terrain:sand"
			}
		},
		toolgroups = {thumpy = 5}
	})
-- ================================================================== --

