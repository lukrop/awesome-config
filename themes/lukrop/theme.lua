---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "DejaVu Sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- theme.bg_normal     = "#222222"
-- theme.bg_focus      = "#3daee9"
-- theme.bg_urgent     = "#ff0000"
-- theme.bg_minimize   = "#444444"
-- theme.bg_systray    = theme.bg_normal
-- 
-- theme.fg_normal     = "#aaaaaa"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"
-- 
-- theme.border_width  = 1
-- theme.border_normal = "#31363b"
-- theme.border_focus  = "#3daee9"
-- theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/lukrop/.config/awesome/themes/lukrop/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/lukrop/.config/awesome/themes/lukrop/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/lukrop/.config/awesome/themes/lukrop/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/lukrop/.config/awesome/themes/lukrop/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/lukrop/.config/awesome/themes/lukrop/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/lukrop/.config/awesome/themes/lukrop/layouts/fairhw.png"
theme.layout_fairv = "/home/lukrop/.config/awesome/themes/lukrop/layouts/fairvw.png"
theme.layout_floating  = "/home/lukrop/.config/awesome/themes/lukrop/layouts/floatingw.png"
theme.layout_magnifier = "/home/lukrop/.config/awesome/themes/lukrop/layouts/magnifierw.png"
theme.layout_max = "/home/lukrop/.config/awesome/themes/lukrop/layouts/maxw.png"
theme.layout_fullscreen = "/home/lukrop/.config/awesome/themes/lukrop/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/lukrop/.config/awesome/themes/lukrop/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/lukrop/.config/awesome/themes/lukrop/layouts/tileleftw.png"
theme.layout_tile = "/home/lukrop/.config/awesome/themes/lukrop/layouts/tilew.png"
theme.layout_tiletop = "/home/lukrop/.config/awesome/themes/lukrop/layouts/tiletopw.png"
theme.layout_spiral  = "/home/lukrop/.config/awesome/themes/lukrop/layouts/spiralw.png"
theme.layout_dwindle = "/home/lukrop/.config/awesome/themes/lukrop/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- The clock icon:
theme.clock = "/home/lukrop/.config/awesome/themes/lukrop/icons/myclocknew.png"

--{{ For the wifi widget icons }} --
theme.nethigh = "/home/lukrop/.config/awesome/themes/lukrop/icons/nethigh.png"
theme.netmedium = "/home/lukrop/.config/awesome/themes/lukrop/icons/netmedium.png"
theme.netlow = "/home/lukrop/.config/awesome/themes/lukrop/icons/netlow.png"

--{{ For the battery icon }} --
theme.baticon = "/home/lukrop/.config/awesome/themes/lukrop/icons/battery.png"

--{{ For the hard drive icon }} --
theme.fsicon = "/home/lukrop/.config/awesome/themes/lukrop/icons/hdd.png"

--{{ For the volume icons }} --
theme.mute = "/home/lukrop/.config/awesome/themes/lukrop/icons/mute.png"
theme.music = "/home/lukrop/.config/awesome/themes/lukrop/icons/music.png"

--{{ For the volume icon }} --
theme.mute = "/home/lukrop/.config/awesome/themes/lukrop/icons/volmute.png"
theme.volhi = "/home/lukrop/.config/awesome/themes/lukrop/icons/volhi.png"
theme.volmed = "/home/lukrop/.config/awesome/themes/lukrop/icons/volmed.png"
theme.vollow = "/home/lukrop/.config/awesome/themes/lukrop/icons/vollow.png"

--{{ For the CPU icon }} --
theme.cpuicon = "/home/lukrop/.config/awesome/themes/lukrop/icons/cpu.png"

--{{ For the memory icon }} --
theme.mem = "/home/lukrop/.config/awesome/themes/lukrop/icons/mem.png"

--{{ For the memory icon }} --
theme.mail = "/home/lukrop/.config/awesome/themes/lukrop/icons/mail.png"
theme.mailopen = "/home/lukrop/.config/awesome/themes/lukrop/icons/mailopen.png"




-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
