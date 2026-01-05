vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only. I may inlcude the
-- support for 'vim highlighting' if someone wants to become a contributor. I
-- can't test or find bugs and I turned off 'vim highlighting' in my config.
vim.cmd("syntax off")

vim.g.colors_name = "y9nika-solar"

local theme
if vim.o.background == "light" then
    theme = {
        background = "#fdf6e3",
        foreground = "#3a3a3a",
        primary    = "#268bd2",
        secondary  = "#859900",
        muted      = "#6c6c6c",
        marker     = "#dc322f",
    }
else
    theme = {
        background = "#002b36",
        foreground = "#eee8d5",
        primary    = "#5fa7d4",
        secondary  = "#9fbf00",
        muted      = "#93a1a1",
        marker     = "#dc322f",
    }
end

require("y9nika.core").apply(theme)
