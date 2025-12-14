vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "y9nika-high-contrast"

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
