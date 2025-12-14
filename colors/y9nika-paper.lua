vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "y9nika-paper"

local theme
if vim.o.background == "light" then
    theme = {
        background = "#fafafa",
        foreground = "#1a1a1a",
        primary    = "#2f5faf",
        secondary  = "#4a7a3c",
        muted      = "#7a7a7a",
        marker     = "#8b2e2e",
    }
else
    theme = {
        background = "#121212",
        foreground = "#e2e2e2",
        primary    = "#7aa2f7",
        secondary  = "#8fbf7f",
        muted      = "#9a9a9a",
        marker     = "#c97a7a",
    }
end

require("y9nika.core").apply(theme)
