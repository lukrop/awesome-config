-- Shifty configured tags.
shifty.config.tags = {
    [" 1:tile"] = {
        layout    = awful.layout.suit.tile,
        position  = 1,
        exclusive = true,
        init      = true,
        mwfact    = 0.60,
        -- spawn     = terminal
    },
    [" 2:web"] = {
        layout    = awful.layout.suit.floating,
        position  = 2,
        exclusive = true,
        init      = true,
        spawn     = "iceweasel",
        nopopup   = true,
    },
    [" 3:com"] = {
        layout    = awful.layout.suit.floating,
        position  = 3,
        exclusive = true,
        init      = true,
--        spawn     = "icedove",
        nopopup   = true,
    },
    [" 4:float"] = {
        layout    = awful.layout.suit.floating,
        position  = 4,
        init      = true,
        nopopup   = true,
    },
    [" 5:dev"] = {
        layout    = awful.layout.suit.floating,
        position  = 5,
        init      = true,
        nopopup   = true,
    },
    [" 9:media"] = {
        layout    = awful.layout.suit.tile,
        exclusive = true,
        position  = 9,
    }
}

-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
    {
        match = {
            "iceweasel",
            "Iceweasel",
            "google-chrome",
            "Google Chrome",
            "Firefox",
            "firefox"
        },
        tag = " 2:web",
    },
    {
        match = {
            "Icedove",
            "Inbox",
            "mutt",
            "TeamSpeak",
            "Pidgin",
            "Buddy.*List",
            "Icedove",
            "icedove",
            "Thunderbird",
            "thunderbird",
            "KMail",
            "Kmail",
            "kmail",
            "Kontact",
            "kontact",
            "kopete",
            "Kopete",
        },
        tag = " 3:com",
    },
    {
        match = {
            class = {
                "TeamSpeak",
                "Pidgin",
                "Kopete",
            }
        },
        floating = true,
    },
    {
        match = {
            "Iceweasel",
            "Icedove",
            "iceweasel",
            "icedove",
            "Thunderbird",
            "thunderbird",
            "KMail",
            "Kmail",
            "kmail",
            "Kontact",
            "kontact",
        },
        -- run = function (c) c.maximized = true end,
    },
    {
        match = {
            "x-terminal-emulator",
            "Konsole",
            "Dolphin",
            class = {
                "konsole",
            },
        },
        intrusive = true,
        honorsizehints = false,
        floating = true,
        -- tag = "1:term",
    },
    {
        match = {
            class = {
                "Keepassx",
                "keepassx",
                "owncloud",
            },
        },
        intrusive = true,
        floating = true,
    },
    {
        match = {
            "Android Studio",
            "Intellij IDEA",
            "Eclipse",
        },
        tag = " 5:dev",
    },
    {
        match = {
            class = {
                "mpv",
                "vlc",
            },
        },
        floating = true,
        tag = " 9:media",
    },
    {
        match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
                end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
            ),
    },
}

-- SHIFTY: default tag creation rules
-- parameter description
--  * floatBars : if floating clients should always have a titlebar
--  * guess_name : should shifty try and guess tag names when creating
--                 new (unconfigured) tags?
--  * guess_position: as above, but for position parameter
--  * run : function to exec when shifty creates a new tag
--  * all other parameters (e.g. layout, mwfact) follow awesome's tag API
shifty.config.defaults = {
    layout = awful.layout.suit.tile,
--    ncol = 1,
    mwfact = 0.60,
--    floatBars = true,
--    guess_name = true,
--    guess_position = true,
}

