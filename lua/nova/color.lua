local M = {}

M.generate = function()
    local colors = {}
    local hsl2rgb = require("nova.utils").hsl2rgb

    -- stylua: ignore start
    if vim.g.background == "light" then
        colors.foreground    = hsl2rgb(200, 0.15, 0.35)
        colors.inconspicuous = hsl2rgb(200, 0.15, 0.55)
        colors.selection     = hsl2rgb(200, 0.15, 0.90)
        colors.line          = hsl2rgb(200, 0.15, 0.95)
        colors.background    = hsl2rgb(200, 0.15, 0.99)

        colors.red           = hsl2rgb(000, 0.66, 0.47)
        colors.brown         = hsl2rgb(011, 0.26, 0.24)
        colors.yellow        = hsl2rgb(045, 0.75, 0.40)
        colors.lime          = hsl2rgb(060, 0.63, 0.38)
        colors.green         = hsl2rgb(123, 0.46, 0.34)
        colors.teal          = hsl2rgb(173, 1.00, 0.21)
        colors.cyan          = hsl2rgb(185, 1.00, 0.28)
        colors.blue          = hsl2rgb(212, 0.80, 0.42)
        colors.indigo        = hsl2rgb(233, 0.57, 0.37)
        colors.violet        = hsl2rgb(240, 0.50, 0.60)
        colors.purple        = hsl2rgb(301, 0.63, 0.40)
        colors.pink          = hsl2rgb(334, 0.79, 0.38)
    else
        colors.foreground    = hsl2rgb(220, 0.13, 0.71)
        colors.inconspicuous = hsl2rgb(220, 0.13, 0.50)
        colors.selection     = hsl2rgb(220, 0.13, 0.28)
        colors.line          = hsl2rgb(220, 0.13, 0.23)
        colors.background    = hsl2rgb(220, 0.13, 0.18)

        colors.red           = hsl2rgb(355, 0.65, 0.65)
        colors.brown         = hsl2rgb(016, 0.65, 0.65)
        colors.yellow        = hsl2rgb(039, 0.67, 0.69)
        colors.lime          = hsl2rgb(066, 0.65, 0.65)
        colors.green         = hsl2rgb(095, 0.38, 0.62)
        colors.teal          = hsl2rgb(174, 0.65, 0.65)
        colors.cyan          = hsl2rgb(187, 0.47, 0.55)
        colors.blue          = hsl2rgb(207, 0.82, 0.66)
        colors.indigo        = hsl2rgb(231, 0.65, 0.65)
        colors.violet        = hsl2rgb(255, 0.65, 0.65)
        colors.purple        = hsl2rgb(286, 0.60, 0.67)
        colors.pink          = hsl2rgb(340, 0.65, 0.65)
    end
    -- stylua: ignore end

    return colors
end

return M
