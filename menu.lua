-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

webmenu = {
    { "iceweasel", "iceweasel" },
    { "icedove", "icedove" },
    { "chrome", "google-chrome" },
    { "pidgin", "pidgin" },
}

devmenu = {
    { "android-studio", "/home/lukrop/.local/share/android-studio/bin/studio.sh"},
    { "idea", "/home/lukrop/.local/share/idea-IU/bin/idea.sh"},
    { "eclipse", "eclipse"},
}

voipmenu = {
    { "Mumble", "mumble"},
    { "TS3", "/home/lukrop/.local/share/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh"},
}

mymainmenu = awful.menu({ items = {
                                    { "terminal", terminal },
                                    { "Web", webmenu },
                                    { "Dev", devmenu },
                                    { "VoIP", voipmenu },
                                    { "awesome", myawesomemenu, beautiful.awesome_icon },
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}
