local M = {}

-- =========================
-- Color space primitives
-- =========================

local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
    return string.format(
        "#%02x%02x%02x",
        math.min(255, math.max(0, r)),
        math.min(255, math.max(0, g)),
        math.min(255, math.max(0, b))
    )
end

local function rgb_to_hsl(r, g, b)
    r, g, b = r / 255, g / 255, b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local l = (max + min) / 2

    if max == min then
        return 0, 0, l
    end

    local d = max - min
    local s = l > 0.5 and d / (2 - max - min) or d / (max + min)

    local h
    if max == r then
        h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
        h = (b - r) / d + 2
    else
        h = (r - g) / d + 4
    end

    return h / 6, s, l
end

local function hsl_to_rgb(h, s, l)
    if s == 0 then
        local v = math.floor(l * 255)
        return v, v, v
    end

    local function f(p, q, t)
        if t < 0 then t = t + 1 end
        if t > 1 then t = t - 1 end
        if t < 1 / 6 then return p + (q - p) * 6 * t end
        if t < 1 / 2 then return q end
        if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
        return p
    end

    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q

    return
        math.floor(f(p, q, h + 1 / 3) * 255),
        math.floor(f(p, q, h) * 255),
        math.floor(f(p, q, h - 1 / 3) * 255)
end

-- =========================
-- Generic color operations
-- =========================

local function adjust_hsl(hex, dh, ds, dl)
    local h, s, l = rgb_to_hsl(hex_to_rgb(hex))
    return rgb_to_hex(
        hsl_to_rgb(
            (h + (dh or 0)) % 1,
            math.min(1, math.max(0, s + (ds or 0))),
            math.min(1, math.max(0, l + (dl or 0)))
        )
    )
end

-- Blend two colors in RGB space (semantic → background-safe)
local function mix(hex_a, hex_b, t)
    local ar, ag, ab = hex_to_rgb(hex_a)
    local br, bg, bb = hex_to_rgb(hex_b)
    return rgb_to_hex(
        math.floor(ar + (br - ar) * t),
        math.floor(ag + (bg - ag) * t),
        math.floor(ab + (bb - ab) * t)
    )
end

M.mix = mix

M.apply = function(theme)
    local is_dark = vim.o.background == "dark"

    -- =========================
    -- Background shading
    -- =========================

    theme.background_alt =
        adjust_hsl(theme.background, 0, 0, is_dark and 0.04 or -0.04)

    theme.background_dim =
        adjust_hsl(theme.background, 0, 0, is_dark and 0.08 or -0.08)

    -- =========================
    -- Semantic surfaces
    -- =========================
    -- Accent colors are *pulled toward background*, not crushed in lightness

    theme.highlight_background =
        mix(theme.marker, theme.background, is_dark and 0.75 or 0.80)

    theme.positive_background =
        mix(theme.secondary, theme.background, is_dark and 0.75 or 0.80)

    theme.negative_background =
        mix(theme.muted, theme.background, is_dark and 0.75 or 0.80)

    -- =========================
    -- Diagnostics
    -- =========================

    theme.error = theme.marker
    theme.warning = theme.marker
    theme.information = theme.muted
    theme.hint = theme.muted

    -- =========================
    -- Terminal colors
    -- =========================

    -- The console palette needs true red, yellow and cyan, and the six code
    -- keys carry none of those hues: hue-shifting secondary — the previous
    -- derivation for red and yellow — lands on green and olive. Command-line
    -- programs paint solid backgrounds on these slots (composer's
    -- black-on-yellow warnings, phpunit's white-on-red failure and error
    -- summaries), so an off-hue slot renders those pairings off-colour, and
    -- with red as pale as the foreground as white-on-pale, unreadable. The
    -- off-palette hues are therefore fixed per ground; black, white, green,
    -- blue and magenta stay derived from the theme, bright steps lighten
    -- their base hue, and a flavour that wants exact hues can pass hex
    -- values per ground through `theme.ansi`.
    local ansi = (theme.ansi or {})[is_dark and "dark" or "light"]
    local base = {
        [0] = adjust_hsl(theme.background, 0, 0, is_dark and -0.35 or -0.25),
        [1] = is_dark and "#d15454" or "#c33123",
        [2] = theme.secondary,
        [3] = is_dark and "#dfdf8e" or "#8a5300",
        [4] = theme.primary,
        [5] = adjust_hsl(theme.primary, 0.15, 0, 0),
        [6] = is_dark and "#70c0c8" or "#005e8b",
        [7] = theme.foreground,
        [8] = mix(theme.foreground, theme.background, 0.55),
    }

    for index = 0, 8 do
        local value = base[index]

        if ansi and ansi[index] then
            value = ansi[index]
        end

        vim.g["terminal_color_" .. index] = value
    end

    for index = 9, 15 do
        local value = adjust_hsl(base[index - 8], 0, 0, is_dark and 0.12 or -0.12)

        if ansi and ansi[index] then
            value = ansi[index]
        end

        vim.g["terminal_color_" .. index] = value
    end

    -- =========================
    -- Disable LSP semantic tokens
    -- =========================

    local augroup = vim.api.nvim_create_augroup("Y9nikaLSP", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if client then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end,
    })

    -- =========================
    -- Highlights
    -- =========================

    local highlights = {
        ["@y9nika.base"]        = { fg = theme.foreground },
        ["@y9nika.declaration"] = { fg = theme.primary },
        ["@y9nika.variable"]    = { fg = theme.secondary },
        ["@y9nika.marker"]      = { fg = theme.marker },
        ["@y9nika.muted"]       = { fg = theme.muted },

        ["@y9nika.highlight"] = { fg = theme.marker, bg = theme.highlight_background },
        ["@y9nika.highlight.foreground"] = { fg = theme.marker },
        ["@y9nika.highlight.background"] = { bg = theme.highlight_background },

        ["@y9nika.positive"] = { fg = theme.secondary, bg = theme.positive_background },
        ["@y9nika.positive.foreground"] = { fg = theme.secondary },
        ["@y9nika.positive.background"] = { bg = theme.positive_background },

        ["@y9nika.negative"] = { fg = theme.muted, bg = theme.negative_background },
        ["@y9nika.negative.foreground"] = { fg = theme.muted },
        ["@y9nika.negative.background"] = { bg = theme.negative_background },

        ["@variable"] = { link = "@y9nika.base" },
        ["@variable.parameter"] = { link = "@y9nika.base" },
        ["@variable.builtin"] = { link = "@y9nika.base" },
        ["@property"] = { link = "@y9nika.base" },
        ["@field"] = { link = "@y9nika.base" },

        ["@punctuation.delimiter"] = { link = "@y9nika.muted" },
        ["@punctuation.bracket"]   = { link = "@y9nika.muted" },
        ["@punctuation.special"]   = { link = "@y9nika.muted" },

        Delimiter   = { link = "@y9nika.muted" },
        SpecialChar = { link = "@y9nika.muted" },
        Operator    = { link = "@y9nika.muted" },

        Added       = { link = "@y9nika.positive.background" },
        Removed     = { link = "@y9nika.negative.background" },
        DiffAdd     = { link = "@y9nika.positive.background" },
        DiffDelete  = { link = "@y9nika.negative.background" },
        DiffChange  = { link = "@y9nika.positive.background" },
        DiffText    = { link = "@y9nika.highlight" },

        DiagnosticInfo  = { fg = theme.foreground },
        DiagnosticWarn  = { fg = theme.warning },
        DiagnosticError = { fg = theme.error },
        DiagnosticHint  = { fg = theme.hint },

        Normal        = { fg = theme.foreground, bg = theme.background },
        CursorLine    = { bg = theme.background_alt },
        CursorColumn  = { bg = theme.background_alt },
        ColorColumn   = { bg = theme.background_alt },

        Title               = { fg = theme.primary },
        Comment             = { link = "@y9nika.marker" },
        ["@keyword.return"] = { link = "@y9nika.marker" },
        String              = { link = "@y9nika.variable" },
        Number              = { link = "@y9nika.variable" },
        Boolean             = { link = "@y9nika.variable" },
        Keyword             = { link = "@y9nika.muted" },

        Function     = { link = "@y9nika.base" },
        Type         = { link = "@y9nika.base" },
        PreProc      = { link = "@y9nika.base" },
        Identifier   = { link = "@y9nika.base" },
        Constant     = { link = "@y9nika.base" },
        Special      = { link = "@y9nika.base" },
        Underlined   = { link = "@y9nika.base" },

        Directory    = { link = "@y9nika.declaration" },

        Search       = { bg = theme.negative_background },
        IncSearch    = { link = "@y9nika.highlight" },
        CurSearch    = { link = "@y9nika.highlight" },
        Visual       = { bg = theme.highlight_background },

        StatusLine   = { fg = theme.foreground, bg = theme.background_dim },
        StatusLineNC = { fg = theme.muted,      bg = theme.background_dim },

        MsgArea      = { link = "@y9nika.base" },
        ModeMsg      = { link = "@y9nika.base" },
        MoreMsg      = { link = "@y9nika.base" },
        Question     = { link = "@y9nika.base" },
        MsgSeparator = { link = "@y9nika.muted" },

        Pmenu        = { bg = theme.background_alt },
        PmenuSel     = { bg = theme.background_dim },

        WinBar       = { fg = theme.foreground, bg = theme.background },
        WinBarNC     = { fg = theme.muted,      bg = theme.background },
    }

    for group, spec in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, spec)
    end
end

-- While in development, :source for this file works
if vim.o.background == "light" then
    M.apply {
        background = "#f7f7f7",
        foreground = "#222222",
        primary = "#325cc0",
        secondary = "#448c27",
        muted = "#666666",
        marker = "#aa3731",
    }
else
    M.apply {
        background = "#0e1415",
        foreground = "#dddddd",
        primary = "#71ade7",
        secondary = "#95cb82",
        muted = "#aaaaaa",
        marker = "#dfdf8e",
    }
end

return M
