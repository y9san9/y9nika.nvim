vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only. I may inlcude the
-- support for 'vim highlighting' if someone wants to become a contributor. I
-- can't test or find bugs and I turned off 'vim highlighting' in my config.
vim.cmd("syntax off")

vim.g.colors_name = "y9nika-monoaccent"

local theme
if vim.o.background == "light" then
    theme = {
        background = "#f8f8f8",
        foreground = "#202020",
        primary    = "#3a5ad9",
        secondary  = "#3a5ad9",
        muted      = "#777777",
        marker     = "#3a5ad9",
    }
else
    theme = {
        background = "#111111",
        foreground = "#e5e5e5",
        primary    = "#7aa2f7",
        secondary  = "#7aa2f7",
        muted      = "#8a8a8a",
        marker     = "#7aa2f7",
    }
end

require("y9nika.core").apply(theme)
