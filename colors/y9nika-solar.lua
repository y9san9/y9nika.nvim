vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

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
