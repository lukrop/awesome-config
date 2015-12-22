local gears = require("gears")
local beautiful = require("beautiful")
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/lukrop/.config/awesome/themes/lukrop/theme.lua")
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        -- gears.wallpaper.maximized("/home/lukrop/ownCloud/pictures/wallpaper/million_years_later.jpg", s, false)
        -- gears.wallpaper.maximized(beautiful.wallpaper, s, false)
        gears.wallpaper.set("#222222")
    end
end

