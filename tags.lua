
local tyrannical = require("tyrannical")
local awful = require("awful")

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "ksnapshot", "pinentry", "kdesudo", "kcalc", "kcolorchooser",
    "konsole", "dolphin", "keepassx", "emulator64-x86",
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "ksnapshot", "pinentry", "kdesudo", "kcolorchooser",
    --"TeamSpeak", "Mumble", "Android Studio", "Intellij IDEA", "Eclipse", "Kontact",
     "mpv", "dolphin", "keepassx",
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
    "ksnapshot",
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.centered = {
    "keepassx",
}

tyrannical.settings.block_children_focus_stealing = false --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client

tyrannical.tags = {
    {
        name        = "1:term",                 -- Call the tag "Term"
        init        = true,                   -- Load the tag on startup
        exclusive   = true,                   -- Refuse any other type of clients (by classes)
        screen      = {1,2},                  -- Create this tag on screen 1 and screen 2
        layout      = awful.layout.suit.tile, -- Use the tile layout
        mwfact      = 0.6,
        --exec_once   = {"konsole"}, --When the tag is accessed for the first time, execute this command
        --instance    = {"dev", "ops"},         -- Accept the following instances. This takes precedence over 'class'
        class       = { --Accept the following classes, refuse everything else (because of "exclusive=true")
            "Konsole",
            "konsole",
        }
    },
    {
        name        = "2:web",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        layout      = awful.layout.suit.floating,      -- Use the max layout
        class = {
            "Iceweasel",
            "google-chrome",
            "Firefox",
            "Konqueror"
        }
    },
    {
        name = "3:com",
        init        = true,
        exclusive   = true,
        screen      = {1,2},
        layout      = awful.layout.suit.floating,
        class  = {
            "Icedove",
            "mutt",
            "TeamSpeak 3",
            "Pidgin",
            "Thunderbird",
            "KMail",
            "Kontact",
            "Kopete",
            "Mumble"
        }
    },
    {
        name = "4:float",
        init        = true,
        exclusive   = false,
        screen      = {1,2},
        layout      = awful.layout.suit.floating,
        class ={
        }
    },
}
