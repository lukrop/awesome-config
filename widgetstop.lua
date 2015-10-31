local vicious = require("vicious")
-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

local font = "DejaVu Sans 8"

--{{-- Time and Date Widget }} --
tdwidget = wibox.widget.textbox()
local strf = '| <span color="white">%d %b - <b>%H:%M</b></span>'
vicious.register(tdwidget, vicious.widgets.date, strf, 30)

clockicon = wibox.widget.imagebox()
clockicon:set_image(beautiful.clock)

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
    return '| RX: <span color="white">'..args["{"..interface.." down_mb}"]..'</span> '
    ..'TX: <span color="white">'..args["{"..interface.." up_mb}"]..'</span> ' end, 2)

---{{---| Wifi Signal Widget |-------
wifiwidget = wibox.widget.imagebox()
-- vicious.register(neticon, vicious.widgets.wifi, function(widget, args)
--     local sigstrength = tonumber(args["{link}"])
--     if sigstrength > 69 then
--         neticon:set_image(beautiful.nethigh)
--     elseif sigstrength > 40 and sigstrength < 70 then
--         neticon:set_image(beautiful.netmedium)
--     else
--         neticon:set_image(beautiful.netlow)
--     end
-- end, 120, 'wlan0')
vicious.register(wifiwidget, vicious.widgets.wifi, '| Wifi: <span color="white">$1%</span> ', 60, 'wlan0')

--{{ Battery Widget }} --
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.baticon)

batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, '| BAT: <span color="white">$1$2%</span> ', 30, "BAT0" )


--{{---| File Size widget |-----
fswidget = wibox.widget.textbox()

vicious.register(fswidget, vicious.widgets.fs,
'<span background="#D0785D" font="' .. font .. '"> <span font="' .. font .. '" color="#EEEEEE">${/home used_gb}/${/home avail_gb} GB </span></span>', 
800)

fsicon = wibox.widget.imagebox()
fsicon:set_image(beautiful.fsicon)

----{{--| Volume / volume icon |----------
volume = wibox.widget.textbox()
vicious.register(volume, vicious.widgets.volume,
'| VOL: <span color="white">$1%</span> ', 0.3, "Master")

volumeicon = wibox.widget.imagebox()
vicious.register(volumeicon, vicious.widgets.volume, function(widget, args)
    local paraone = tonumber(args[1])

    if args[2] == "♩" or paraone == 0 then
        volumeicon:set_image(beautiful.mute)
    elseif paraone >= 67 and paraone <= 100 then
        volumeicon:set_image(beautiful.volhi)
    elseif paraone >= 33 and paraone <= 66 then
        volumeicon:set_image(beautiful.volmed)
    else
        volumeicon:set_image(beautiful.vollow)
    end

end, 0.3, "Master")

--{{---| CPU / sensors widget |-----------
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu,
'| CPU: <span color="white">$1%</span> ', 5)

cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.cpuicon)

--{{--| MEM widget |-----------------
memwidget = wibox.widget.textbox()

vicious.register(memwidget, vicious.widgets.mem, '| RAM: <span color="white">$1%</span> ($2MB) ', 20)
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.mem)


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
    if s == 1 then right_layout:add(wibox.widget.systray()) end

    -- right_layout:add(mytextclock)
    --right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    --right_layout:add(memicon)
    right_layout:add(memwidget)
    --right_layout:add(volumeicon)
    right_layout:add(volume)
    --right_layout:add(fsicon)
    --right_layout:add(fswidget)
    --right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(wifiwidget)
    right_layout:add(netwidget)
    --right_layout:add(clockicon)
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

-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()

