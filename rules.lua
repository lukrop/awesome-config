local awful = require("awful")
local beautiful = require("beautiful")
awful.rules = require("awful.rules")
awful.rules.rules = {
    {
        -- All clients will match this rule.
        rule = { },
        properties = { border_width = beautiful.border_width,
                       border_color = beautiful.border_normal,
                       focus = true,
                       keys = clientkeys,
                       buttons = clientbuttons }
    },
    -- { rule = { class = "terminator" },
    --   except = { tag = "1:tile" },
    --   properties = { floating = true } },
    -- { rule = { class = "pinentry" },
    --   properties = { floating = true } },
    -- { rule = { class = "gimp" },
    --   properties = { floating = true } },
}

