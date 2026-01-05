vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only
-- I may inlcude the support 'vim highlighting' if someone wants to become a
-- contributor. I can't test or find bugs and I turned off 'vim highlighting'
-- in my config.
vim.cmd("syntax off")

vim.g.colors_name = "y9nika-contrast"

local theme
if vim.o.background == "light" then
    theme = {
        background = "#ffffff",
        foreground = "#000000",
        primary = "#ff6600",
        secondary = "#008800",
        muted = "#444444",
        marker = "#cc0000",
    }
else
    theme = {
        background = "#000000",
        foreground = "#ffffff",
        primary = "#ff9900",
        secondary = "#00ff00",
        muted = "#888888",
        marker = "#ff0000",
    }
end

require("y9nika.core").apply(theme)
