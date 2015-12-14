local vicious = require("vicious")
local awful = require("awful")
local wibox = require("wibox")

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

local font = "DejaVu Sans 8"

--{{-- Time and Date Widget }} --
tdwidget = wibox.widget.textbox()
local strf = ' <span color="white">%d %b - <b>%H:%M</b></span> '
vicious.register(tdwidget, vicious.widgets.date, strf, 30)

--{{ Net Widget }} --
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, function(widget, args)
    local interface = ""
    if args["{wlan0 carrier}"] == 1 then
        interface = "wlan0"
    elseif args["{eth0 carrier}"] == 1 then
        interface = "eth0"
    else
        return ""
    end
    return '| RX: <span color="white">'..args["{"..interface.." down_kb}"]..'</span> '
    ..'TX: <span color="white">'..args["{"..interface.." up_kb}"]..'</span> ' end, 5)

---{{---| Wifi Signal Widget |-------
-- wifiwidget = wibox.widget.textbox()
-- vicious.register(wifiwidget, vicious.widgets.wifi, function(widget, args)
--     local link = tonumber(args["{link}"])
--     if link > 0 then
--         return '| Wifi: <span color="white">' .. args['{link}'] .. '%</span> '
--     else
--         return ''
--     end
-- end, 30, 'wlan0')

-- {{{ CPU temperature
thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "($1°C) ", 5, "thermal_zone0")
-- }}}

--{{ Battery Widget }} --
batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, function(widget, args)
    local energy = tonumber(args[2])
    if energy > 0 then
        return '| BAT: <span color="white">' .. args[1] .. '<b>' .. args[2] .. '%</b> (' .. args[3] .. ')</span> '
    else
        return ''
    end
end, 30, 'BAT0' )


----{{--| Volume / volume icon |----------
volume = wibox.widget.textbox()
vicious.register(volume, vicious.widgets.volume,
'| VOL: <span color="white">$1%</span> ', 5, 'Master')

--{{---| CPU / sensors widget |-----------
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu,
' CPU: <span color="white">$1%</span> ', 5)

--{{--| MEM widget |-----------------
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, '| RAM: <span color="white">$1%</span> ($2MB) ', 30)


-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()

    -- right_layout:add(mytextclock)
    right_layout:add(cpuwidget)
    right_layout:add(thermalwidget)
    right_layout:add(memwidget)
    right_layout:add(volume)
    right_layout:add(batwidget)
    --right_layout:add(wifiwidget)
    right_layout:add(netwidget)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(tdwidget)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}
