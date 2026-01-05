vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only
-- I may inlcude the support 'vim highlighting' if someone wants to become a
-- contributor. I can't test or find bugs and I turned off 'vim highlighting'
-- in my config.
vim.cmd("syntax off")

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
