local utils = require("nova.utils")
local hsl2rgb = utils.hsl2rgb
local blend = utils.blend

---@class NovaColors
---@field foreground string
---@field comment string
---@field inconspicuous string
---@field splitline string
---@field selection string
---@field popupmenu string
---@field stripline string
---@field background string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field teal string
---@field blue string
---@field violet string
---@field purple string
---@field match string
---@field current_match string
---@field target string
---@field diff_add_bg string
---@field diff_change_bg string
---@field diff_delete_bg string
---@field diff_text_bg string

-- stylua: ignore
local colors = {
    default = {
        dark = {
            foreground    = hsl2rgb(225, 0.15, 0.75),
            comment       = hsl2rgb(225, 0.15, 0.50),
            inconspicuous = hsl2rgb(225, 0.15, 0.41),
            splitline     = hsl2rgb(225, 0.27, 0.27),
            selection     = hsl2rgb(225, 0.27, 0.24),
            popupmenu     = hsl2rgb(225, 0.27, 0.21),
            stripline     = hsl2rgb(225, 0.27, 0.18),
            background    = hsl2rgb(225, 0.27, 0.15),

            red           = hsl2rgb(345, 0.63, 0.63),
            orange        = hsl2rgb(020, 0.35, 0.52),
            yellow        = hsl2rgb(037, 0.60, 0.60),
            green         = hsl2rgb(123, 0.38, 0.57),
            teal          = hsl2rgb(187, 0.47, 0.55),
            blue          = hsl2rgb(220, 0.80, 0.65),
            violet        = hsl2rgb(255, 0.50, 0.65),
            purple        = hsl2rgb(291, 0.65, 0.65),

            match         = hsl2rgb(076, 0.55, 0.58),
            current_match = hsl2rgb(032, 0.58, 0.60),
            target        = hsl2rgb(188, 0.50, 0.60),
        },
        light = {
            foreground    = hsl2rgb(228, 0.08, 0.24),
            comment       = hsl2rgb(228, 0.04, 0.58),
            inconspicuous = hsl2rgb(000, 0.00, 0.70),
            splitline     = hsl2rgb(000, 0.00, 0.80),
            selection     = hsl2rgb(000, 0.00, 0.85),
            popupmenu     = hsl2rgb(000, 0.00, 0.90),
            stripline     = hsl2rgb(000, 0.00, 0.95),
            background    = hsl2rgb(000, 0.00, 0.98),

            red           = hsl2rgb(350, 0.66, 0.47),
            orange        = hsl2rgb(020, 0.40, 0.45),
            yellow        = hsl2rgb(045, 0.75, 0.40),
            green         = hsl2rgb(123, 0.46, 0.34),
            teal          = hsl2rgb(173, 0.95, 0.25),
            blue          = hsl2rgb(212, 0.80, 0.42),
            violet        = hsl2rgb(240, 0.50, 0.60),
            purple        = hsl2rgb(301, 0.63, 0.43),

            match         = hsl2rgb(076, 0.58, 0.27),
            current_match = hsl2rgb(032, 0.62, 0.35),
            target        = hsl2rgb(188, 0.62, 0.30),
        },
    },
    dim = {
        dark = {
            foreground    = hsl2rgb(225, 0.10, 0.72),
            comment       = hsl2rgb(225, 0.12, 0.49),
            inconspicuous = hsl2rgb(225, 0.11, 0.40),
            splitline     = hsl2rgb(225, 0.20, 0.29),
            selection     = hsl2rgb(225, 0.20, 0.26),
            popupmenu     = hsl2rgb(225, 0.20, 0.22),
            stripline     = hsl2rgb(225, 0.20, 0.19),
            background    = hsl2rgb(225, 0.21, 0.17),

            red           = hsl2rgb(348, 0.48, 0.62),
            orange        = hsl2rgb(020, 0.30, 0.53),
            yellow        = hsl2rgb(039, 0.45, 0.59),
            green         = hsl2rgb(124, 0.32, 0.56),
            teal          = hsl2rgb(186, 0.34, 0.53),
            blue          = hsl2rgb(218, 0.55, 0.64),
            violet        = hsl2rgb(255, 0.38, 0.63),
            purple        = hsl2rgb(291, 0.45, 0.63),

            match         = hsl2rgb(076, 0.42, 0.57),
            current_match = hsl2rgb(032, 0.44, 0.59),
            target        = hsl2rgb(188, 0.40, 0.58),
        },
        light = {
            foreground    = hsl2rgb(228, 0.07, 0.27),
            comment       = hsl2rgb(228, 0.04, 0.56),
            inconspicuous = hsl2rgb(225, 0.02, 0.68),
            splitline     = hsl2rgb(225, 0.04, 0.80),
            selection     = hsl2rgb(225, 0.04, 0.85),
            popupmenu     = hsl2rgb(225, 0.04, 0.90),
            stripline     = hsl2rgb(225, 0.04, 0.94),
            background    = hsl2rgb(225, 0.04, 0.97),

            red           = hsl2rgb(350, 0.50, 0.46),
            orange        = hsl2rgb(020, 0.34, 0.44),
            yellow        = hsl2rgb(044, 0.52, 0.40),
            green         = hsl2rgb(123, 0.36, 0.35),
            teal          = hsl2rgb(178, 0.50, 0.31),
            blue          = hsl2rgb(212, 0.55, 0.43),
            violet        = hsl2rgb(244, 0.38, 0.53),
            purple        = hsl2rgb(299, 0.44, 0.44),

            match         = hsl2rgb(076, 0.44, 0.31),
            current_match = hsl2rgb(032, 0.46, 0.36),
            target        = hsl2rgb(188, 0.46, 0.33),
        },
    },
    soft = {
        dark = {
            foreground    = hsl2rgb(225, 0.10, 0.70),
            comment       = hsl2rgb(225, 0.10, 0.49),
            inconspicuous = hsl2rgb(225, 0.09, 0.40),
            splitline     = hsl2rgb(225, 0.15, 0.30),
            selection     = hsl2rgb(225, 0.15, 0.27),
            popupmenu     = hsl2rgb(225, 0.15, 0.23),
            stripline     = hsl2rgb(225, 0.15, 0.205),
            background    = hsl2rgb(225, 0.16, 0.18),

            red           = hsl2rgb(350, 0.34, 0.63),
            orange        = hsl2rgb(020, 0.24, 0.54),
            yellow        = hsl2rgb(040, 0.32, 0.56),
            green         = hsl2rgb(125, 0.26, 0.53),
            teal          = hsl2rgb(185, 0.26, 0.53),
            blue          = hsl2rgb(215, 0.38, 0.62),
            violet        = hsl2rgb(255, 0.28, 0.62),
            purple        = hsl2rgb(290, 0.30, 0.62),

            match         = hsl2rgb(076, 0.30, 0.55),
            current_match = hsl2rgb(032, 0.32, 0.57),
            target        = hsl2rgb(188, 0.30, 0.57),
        },
        light = {
            foreground    = hsl2rgb(228, 0.05, 0.27),
            comment       = hsl2rgb(228, 0.04, 0.50),
            inconspicuous = hsl2rgb(225, 0.02, 0.64),
            splitline     = hsl2rgb(225, 0.03, 0.80),
            selection     = hsl2rgb(225, 0.03, 0.86),
            popupmenu     = hsl2rgb(225, 0.03, 0.91),
            stripline     = hsl2rgb(225, 0.03, 0.95),
            background    = hsl2rgb(225, 0.03, 0.98),

            red           = hsl2rgb(350, 0.34, 0.44),
            orange        = hsl2rgb(020, 0.26, 0.42),
            yellow        = hsl2rgb(043, 0.34, 0.38),
            green         = hsl2rgb(123, 0.28, 0.36),
            teal          = hsl2rgb(183, 0.31, 0.36),
            blue          = hsl2rgb(212, 0.36, 0.42),
            violet        = hsl2rgb(248, 0.26, 0.46),
            purple        = hsl2rgb(296, 0.29, 0.43),

            match         = hsl2rgb(076, 0.31, 0.34),
            current_match = hsl2rgb(032, 0.33, 0.37),
            target        = hsl2rgb(188, 0.31, 0.35),
        },
    },
}

local M = {}

---@param opts NovaConfig
---@param theme "dark"|"light"
---@return NovaColors
function M.setup(opts, theme)
    local variant = opts.variant or "default"
    local palette = vim.deepcopy(colors[variant][theme])
    local overrides = opts.colors or {}

    if type(overrides) == "function" then
        overrides = overrides(vim.deepcopy(palette), theme) or {}
        if type(overrides) ~= "table" then
            error("nova: colors function must return a table or nil")
        end
    end

    palette = vim.tbl_extend("force", palette, overrides)
    local diff_alpha = theme == "light" and 0.08 or 0.20
    local diff_text_alpha = theme == "light" and 0.14 or 0.35

    if palette.diff_add_bg == nil then
        palette.diff_add_bg = blend(palette.green, palette.background, diff_alpha)
    end
    if palette.diff_change_bg == nil then
        palette.diff_change_bg = blend(palette.blue, palette.background, diff_alpha)
    end
    if palette.diff_delete_bg == nil then
        palette.diff_delete_bg = blend(palette.red, palette.background, diff_alpha)
    end
    if palette.diff_text_bg == nil then
        palette.diff_text_bg = blend(palette.blue, palette.background, diff_text_alpha)
    end

    return palette --[[@as NovaColors]]
end

return M
