-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --

local function tool_crystal(id, desc, mohs, color)

local crystal = modname.. ".png^[colorize:" ..color


	local function tooltip(name, group)
		local tool = modname .. ":tool_" .. name:lower() .. "_" ..id
		local wood = "nc_woodwork:tool_" .. name:lower()
		minetest.register_tool(tool, {
				description = desc.. "-Tipped " .. name,
				inventory_image = "nc_woodwork_tool_" .. name:lower() .. ".png^(" ..crystal.. "^[mask:"
				.. modname .. "_tip_" .. name:lower() .. ".png)",
				tool_wears_to = wood,
				groups = {
					flammable = 2,
					crystalline = 1
				},
				tool_capabilities = nodecore.toolcaps({
						uses = 0.5,
						[group] = mohs
					}),
				on_ignite = "wc_crystals:" ..id.. "_crystal",
				sounds = nodecore.sounds("nc_optics_glassy")
			})
		nodecore.register_craft({
				label = "assemble " .. tool,
				action = "stackapply",
				wield = {name = "wc_crystals:" ..id.. "_crystal"},
				consumewield = 1,
				indexkeys = {wood},
				nodes = {{match = wood, replace = "air"}},
				items = {tool}
			})
	end

	tooltip("Mallet", "thumpy")
	tooltip("Spade", "crumbly")
	tooltip("Hatchet", "choppy")
	tooltip("Pick", "cracky")

-- ================================================================== --

	local adzedef
	adzedef = {
		description = desc.. "-Tipped Adze",
		inventory_image = "nc_woodwork_adze.png^(" ..crystal.. "^[mask:" .. modname .. "_tip_adze.png)",
		groups = {
			flammable = 2,
			crystalline = 1,
		},
		tool_capabilities = nodecore.toolcaps({
				uses = 0.5,
				choppy = mohs-1,
				crumbly = mohs,
				cracky = mohs-2,
			}),
		on_ignite = "wc_crystals:" ..id.. "_crystal",
		sounds = nodecore.sounds("nc_optics_glassy"),
		tool_wears_to = "nc_woodwork:adze"
	}
	minetest.register_tool(modname .. ":adze_" ..id, adzedef)

	nodecore.register_craft({
			label = "assemble " ..id.. " adze",
			action = "stackapply",
			wield = {name = "wc_crystals:" ..id.. "_crystal"},
			consumewield = 1,
			indexkeys = {"nc_woodwork:adze"},
			nodes = {
				{
					match = {
						name = "nc_woodwork:adze",
						wear = 0.05
					},
					replace = "air"
				},
			},
			items = {
				{name = modname .. ":adze_" ..id}
			},
		})

-- ================================================================== --

	local macedef
	macedef = {
		description = desc.. " Mace",
		inventory_image = "(nc_lode_tempered.png^[mask:" ..modname.. "_mace_handle.png)^(" ..crystal.. "^[mask:" ..modname .. "_mace_head.png)",
		groups = {
			crystalline = 2,
			crystal_mace = 1
		},
		tool_capabilities = nodecore.toolcaps({
				uses = 2.5,
				snappy = mohs-1,
				choppy = mohs,
				crumbly = mohs,
				cracky = mohs,
				thumpy = mohs+2
			}),
		sounds = nodecore.sounds("nc_optics_glassy"),
		tool_wears_to = "nc_lode:rod_tempered"
	}
	minetest.register_tool(modname .. ":mace_" ..id, macedef)

	nodecore.register_craft({
			label = "anvil craft " ..id.. " mace",
			action = "pummel",
			toolgroups = {thumpy = 4},
			indexkeys = {"wc_crystals:" ..id},
			nodes = {
				{
					match = {name = "wc_crystals:" ..id},
					replace = "air"
				},
				{
					y = -1,
					match = {name = "nc_lode:rod_tempered"},
					replace = "air"
				},
				{
					y = -2,
					match = "nc_lode:block_tempered"
				}
			},
			items = {
				modname .. ":mace"
			}
		})
-- ================================================================== --

	nodecore.register_craft({
			label = "anvil recycle " ..id.. " mace",
			action = "pummel",
			toolgroups = {choppy = 5},
			indexkeys = {"group:crystal_mace"},
			nodes = {
				{
					match = {groups = {crystal_mace = true}},
					replace = "air"
				},
				{
					y = -1,
					match = "nc_lode:block_tempered"
				}

			},
			items = {
				{name = "wc_crystals:" ..id.. "_crystal", count = 4, scatter = 4},
				{name = "nc_lode:rod_tempered"}
			},
			itemscatter = 4
		})

-- ================================================================== --
end
-- ================================================================== --

tool_crystal("lodite",			"Lodite",			4,	"#592720:180")		--CAPUT MORTUUM
tool_crystal("luxite",			"Luxite",			4,	"#fcf75e:160")		--ICTERINE
------------------------------------------------------------------------
if minetest.get_modpath("wc_adamant") then
	tool_crystal("adamant",		"Pure Adamantine",	9,	"#40e0d0:120")		--TURQUOISE
end
------------------------------------------------------------------------
if minetest.settings:get_bool(modname .. ".real_crystals", true) then
	tool_crystal("quartz",		"Quartz",			4,	"#f4f0ec:180")		--ISABELLINE
	tool_crystal("amethyst",		"Amethyst",		4,	"#4b0082:180")		--INDIGO
	tool_crystal("selenite",		"Selenite",		2,	"#ffffff:64")		--WHITE
	tool_crystal("celestine",	"Celestine",		2,	"#00bfff:120")		--DEEP SKY BLUE
	tool_crystal("jasper",		"Jasper",			4,	"#9b111e:140")		--RUBY RED
	tool_crystal("chrysoprase",	"Chrysoprase",		4,	"#3cb371:140")		--SEA GREEN
	tool_crystal("onyx",		"Onyx",			4,	"#353839:180")		--ONYX
	tool_crystal("citrine",		"Citrine",		4,	"#dfff00:140")		--CHARTREUSE
	tool_crystal("aragonite",	"Aragonite",		3,	"#e48400:140")		--FULVOUS
	tool_crystal("rhodochrosite",	"Rhodochrosite",	3,	"#fba0e3:160")		--LAVENDER ROSE
	tool_crystal("pyrite",		"Pyrite",			3,	"#b5a642:180")		--BRASS
end
------------------------------------------------------------------------
if minetest.settings:get_bool(modname .. ".birthstones", true) then
	tool_crystal("ruby",		"Ruby",			5,	"#9b111e:160")		--RUBY RED
	tool_crystal("sapphire",		"Sapphire",		5,	"#0f52ba:160")		--SAPPHIRE
	tool_crystal("emerald",		"Emerald",		4,	"#007f66:160")		--VIRIDIAN
	tool_crystal("topaz",		"Topaz",			4,	"#e48400:160")		--FULVOUS
	tool_crystal("garnet",		"Garnet",			4,	"#960018:160")		--CARMINE
	tool_crystal("aquamarine",	"Aquamarine",		4,	"#7fffd4:160")		--AQUAMARINE
	tool_crystal("peridot",		"Peridot",		4,	"#40e0d0:160")		--TURQUOISE
	tool_crystal("tourmaline",	"Tourmaline",		4,	"#bd33a4:160")		--BYZANTINE
	tool_crystal("alexandrite",	"Alexandrite",		5,	"#120a8f:160")		--ULTRAMARINE
	tool_crystal("diamond",		"Diamond",		6,	"#ffffff:0")		--WHITE
end
