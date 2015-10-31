-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "terminal", terminal },
                                    { "vim", editor_cmd },
                                    { "iceweasel", "iceweasel" },
                                    { "icedove", "icedove" },
                                    { "chrome", "google-chrome" },
                                    { "TS3", "/home/lukrop/.local/share/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh"},
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
