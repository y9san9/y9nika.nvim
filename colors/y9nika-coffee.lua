vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "y9nika-coffee"

local core = require("y9nika.core")

local theme

if vim.o.background == "light" then
    theme = {
        background = "#eff1f5", -- Latte Base
        foreground = "#4c4f69", -- Latte Text
        primary    = "#1e66f5", -- Latte Blue (definitions)
        secondary  = "#fe640b", -- Latte Peach (variables/constants)
        marker     = "#df8e1d", -- Latte Yellow (comments)
        muted      = "#8839ef", -- Mocha Lavender
    }
else
    theme = {
        background = "#1e1e2e", -- Mocha Base
        foreground = "#cdd6f4", -- Mocha Text
        primary    = "#89b4fa", -- Mocha Blue (definitions)
        secondary  = "#fab387", -- Mocha Peach (variables/constants)
        marker     = "#f9e2af", -- Mocha Yellow (comments)
        muted      = "#cba6f7", -- Mocha Lavender
    }
end

core.apply(theme)
