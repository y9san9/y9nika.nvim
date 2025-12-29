---
--- Stolen from tsoding: https://github.com/rexim/gruber-darker-theme
---

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "y9nika-gruber"

require("y9nika.core").apply {
    background = "#181818",
    foreground = "#e4e4ef",
    primary    = "#96a6c8",
    secondary  = "#73c936",
    muted      = "#ffdd33",
    marker     = "#f43841",
}
