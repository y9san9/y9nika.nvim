---
--- Stolen from tsoding: https://github.com/rexim/gruber-darker-theme
---

vim.cmd("hi clear")

-- This colorscheme relies on treesitter highlighting only
-- I may inlcude the support 'vim highlighting' if someone wants to become a
-- contributor. I can't test or find bugs and I turned off 'vim highlighting'
-- in my config.
vim.cmd("syntax off")

vim.o.background = "dark"
vim.g.colors_name = "y9nika-gruber"

require("y9nika.core").apply {
    background = "#181818",
    foreground = "#e4e4ef",
    primary    = "#96a6c8",
    secondary  = "#73c936",
    muted      = "#ffdd33",
	marker     = "#ff9000",
}
