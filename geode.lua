-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, math, pairs
    = minetest, nodecore, math, pairs
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-----<>----------------------------------------------------------<>-----
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
-----<>----------------------------------------------------------<>-----
minetest.register_craftitem(modname .. ":geode", {
	description = "Geode",
	inventory_image = modname.. "_geode.png",
	groups = {geode = 1},
	sounds = nodecore.sounds("nc_optics_glassy")
})
-----<>----------------------------------------------------------<>-----
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
--local real_crystals = {...}
--local birthstones = {...}
--local categories = {real_crystals, birthstones}
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
local crystals = {
    "wc_crystals:lodite_crystal",
    "wc_crystals:luxite_crystal",
}
local categories = {} -- List of lists
categories.real_crystals = {
    "wc_crystals:quartz_crystal",
    "wc_crystals:amethyst_crystal",
    "wc_crystals:selenite_crystal",
    "wc_crystals:celestine_crystal",
    "wc_crystals:jasper_crystal",
    "wc_crystals:chrysoprase_crystal",
    "wc_crystals:onyx_crystal",
    "wc_crystals:citrine_crystal",
    "wc_crystals:aragonite_crystal",
    "wc_crystals:rhodochrosite_crystal",
    "wc_crystals:pyrite_crystal"
}
categories.birthstones = {
	"wc_crystals:ruby_crystal",
	"wc_crystals:sapphire_crystal",
	"wc_crystals:emerald_crystal",
	"wc_crystals:topaz_crystal",
	"wc_crystals:garnet_crystal",
	"wc_crystals:aquamarine_crystal",
	"wc_crystals:peridot_crystal",
	"wc_crystals:tourmaline_crystal",
	"wc_crystals:alexandrite_crystal",
	"wc_crystals:diamond_crystal"
}
for category, set in pairs(categories) do -- For each (keyname, list) aka category name and set
	print("CATEGORY", category)
    if minetest.settings:get_bool(modname .. "." .. category, true) then -- Check if it is enabled
		print("ENABLED")
        for _, value in pairs(set) do -- Loop through each value in the set, ignoring the key
			print("ADDING", value)
            crystals[#crystals + 1] = value -- or table.insert(crystals, value)
        end
    end
end
-----<>----------------------------------------------------------<>-----
nodecore.register_craft({
	label = "crack open geode",
	action = "pummel",
	toolgroups = {thumpy = 3, cracky = 3},
	indexkeys = {modname .. ":geode"},
	nodes = {
		{match = modname .. ":geode", replace = "air"}
	},
	after=function(pos)
		local yield = math.random(1,4)
		nodecore.item_eject(pos, {name = "nc_stonework:chip"}, 2, yield)
		nodecore.item_eject(pos, nodecore.pickrand(crystals), 2, 1)

	end
})
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
-----<>----------------------------------------------------------<>-----
--local t1 = {} -- table literal
--t1.key = "value" -- setting value by key name with syntactic sugar
--t1["key2"] = "value2" -- setting value by key name explicitly
--t1[1] = "value3" -- setting value by index (can only be explicit)

--local t2 = {
--    key = "value", -- syntactic sugar keyname in literal
--    ["key2"] = "value2", -- explicit keyname in literal
--    [1] = "value3", -- explicit index in literal
--}

--local t3 = {t1, t2} -- table literal with implicit indexes, equivalent to {[1] = t1, [2] = t2}

--for key, value in ipairs(t) do print(key, value) end -- prints keys and values for CONTIGUOUS NUMERIC indexes (1,2,3...) in order
--for key, value in pairs(t) do print(key, value) end -- prints EVERY key and value in an INDETERMINATE order
-----<>----------------------------------------------------------<>-----
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--