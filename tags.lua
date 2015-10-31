-- Shifty configured tags.
shifty.config.tags = {
    [" 1:term"] = {
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
        spawn     = "iceweasel",
    },
    [" 3:com"] = {
        layout    = awful.layout.suit.floating,
        position  = 3,
        exclusive = true,
        spawn     = "icedove"
    },
    [" 4:float"] = {
        layout    = awful.layout.suit.floating,
        position  = 4,
        -- nopopup   = true,
    },
    [" 5:media"] = {
        layout    = awful.layout.suit.tile,
        position  = 5,
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
            "Google Chrome"
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
        },
        tag = " 3:com",
    },
    {
        match = {
            class = {
                "TeamSpeak",
                "Pidgin",
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
        },
        -- run = function (c) c.maximized = true end,
    },
    {
        match = {
            "terminator",
            "x-terminal-emulator",
        },
        intrusive = true,
        honorsizehints = false,
        floating = true,
        -- tag = "1:term",
    },
    {
        match = {
            "KeePassX",
        },
        tag = " 4:float",
    },
    {
        match = {
            class = {
                "mpv",
            },
        },
        floating = true,
        tag = " 5:media",
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

