-- Themes define colours, icons, and wallpapers
beautiful.init("/home/lukrop/.config/awesome/themes/lukrop/theme.lua")

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        -- gears.wallpaper.maximized("/home/lukrop/ownCloud/pictures/wallpaper/million_years_later.jpg", s, false)
        gears.wallpaper.maximized(beautiful.wallpaper, s, false)
    end
end

