vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only. I may inlcude the
-- support for 'vim highlighting' if someone wants to become a contributor. I
-- can't test or find bugs and I turned off 'vim highlighting' in my config.
vim.cmd("syntax off")

vim.g.colors_name = "y9nika"

function test()
end

local theme
if vim.o.background == "light" then
    theme = {
        background = "#f7f7f7",
        foreground = "#222222",
        primary = "#325cc0",
        secondary = "#448c27",
        muted = "#222222",
        marker = "#222222",
    }
else
    theme = {
        background = "#0e1415",
        foreground = "#dddddd",
        primary = "#71ade7",
        secondary = "#95cb82",
        muted = "#dddddd",
        marker = "#dddddd",
    }
end

require("y9nika.core").apply(theme)
