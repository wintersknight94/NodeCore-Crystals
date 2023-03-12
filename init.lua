-- LUALOCALS < ---------------------------------------------------------
local include, minetest, nodecore
    = include, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------

include("crystals")

--<>--

include("luxite")
include("lodite")

if minetest.get_modpath("wc_adamant") then
	include("adamantite")
end

if minetest.get_modpath("wc_gloom") then
	include("shroomite")
end

--<>--

if minetest.settings:get_bool(modname .. ".crystal_tools", true) then
	include("tools")
end
