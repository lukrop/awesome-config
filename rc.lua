-- Standard awesome library
--gears = require("gears")
--awful = require("awful")
-- Widget and layout library
--wibox = require("wibox")
-- Theme handling library
--beautiful = require("beautiful")
-- Notification library
--naughty = require("naughty")
--menubar = require("menubar")
-- shifty - dynamic tagging library
-- shifty = require("shifty")
--tyrannical = require("tyrannical")

-- {{{ Variable definitions
-- This is used later as the default terminal and editor to run.
--terminal = "terminator"
terminal = "konsole"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}

--cyclefocus = require('cyclefocus')

require("theme")
require("menu")
require("widgetstop")
require("layouts")
require("bindings")
require("awful.autofocus")
require("tags")
require("rules")
require("signals")
require("autostart")

