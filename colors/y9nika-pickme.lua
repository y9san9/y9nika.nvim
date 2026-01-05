vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only. I may inlcude the
-- support for 'vim highlighting' if someone wants to become a contributor. I
-- can't test or find bugs and I turned off 'vim highlighting' in my config.
vim.cmd("syntax off")

vim.g.colors_name = "y9nika-pickme"

local theme
if vim.o.background == "light" then
    vim.o.background = "light"
    theme = {
        background = "#fff0f5",   -- very light pink background
        foreground = "#111111",   -- readable text
        primary    = "#ff33aa",   -- bold pink accent for declarations
        secondary  = "#ff33aa",   -- same accent for locals
        muted      = "#777777",   -- punctuation/keywords
        marker     = "#ff66bb",   -- slightly lighter pink for comments/highlights
    }
else
    vim.o.background = "dark"
    theme = {
        background = "#220022",   -- very dark pinkish/maroon base
        foreground = "#eeeeee",   -- readable text
        primary    = "#ff66cc",   -- bold pink accent for declarations
        secondary  = "#ff66cc",   -- same accent for locals
        muted      = "#888888",   -- punctuation/keywords
        marker     = "#ff99dd",   -- slightly lighter pink for comments/highlights
    }
end

require("y9nika.core").apply(theme)
