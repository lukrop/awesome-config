local tyrannical = require("tyrannical")
local awful = require("awful")
tyrannical.tags = {
    {
        name        = "1:tile",                 -- Call the tag "Term"
        init        = true,                   -- Load the tag on startup
        exclusive   = true,                   -- Refuse any other type of clients (by classes)
        screen      = screen.count()>1 and 2 or 1,                  -- Create this tag on screen 1 and screen 2
        layout      = awful.layout.suit.tile, -- Use the tile layout
        --exec_once   = {"konsole"}, --When the tag is accessed for the first time, execute this command
        --instance    = {"dev", "ops"},         -- Accept the following instances. This takes precedence over 'class'
        class       = { --Accept the following classes, refuse everything else (because of "exclusive=true")
            "Konsole",
        }
    },
    {
        name        = "2:web",
        init        = true,
        exclusive   = true,
        screen      = screen.count()>1 and 2 or 1,-- Setup on screen 2 if there is more than 1 screen, else on screen 1
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
        screen      = screen.count()>1 and 2 or 1,
        layout      = awful.layout.suit.floating,
        class  = {
            "Icedove",
            "mutt",
            "TeamSpeak",
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
        screen      = screen.count()>1 and 2 or 1,
        layout      = awful.layout.suit.floating,
        class ={
        }
    },
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "ksnapshot", "pinentry", "kdesudo", "kcalc", "kcolorchooser",
    "konsole", "dolphin", "keepassx",
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "ksnapshot", "pinentry", "kdesudo", "kcolorchooser",
    "Pidgin", "TeamSpeak", "Mumble", "Android Studio", "Intellij IDEA",
    "Eclipse", "mpv", "Kontact", "dolphin", "keepassx",
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
