local M = {}

M.setup = function()
    local nova = require("nova")
    local hsl2rgb = require("nova.utils").hsl2rgb

    -- stylua: ignore
    if nova.options.background == "light" then
        return {
            foreground    = hsl2rgb(200, 0.15, 0.35),
            inconspicuous = hsl2rgb(200, 0.15, 0.55),
            selection     = hsl2rgb(200, 0.15, 0.90),
            line          = hsl2rgb(200, 0.15, 0.95),
            background    = hsl2rgb(200, 0.15, 0.99),

            red           = hsl2rgb(000, 0.66, 0.47),
            brown         = hsl2rgb(011, 0.26, 0.24),
            yellow        = hsl2rgb(045, 0.75, 0.40),
            lime          = hsl2rgb(060, 0.63, 0.38),
            green         = hsl2rgb(123, 0.46, 0.34),
            teal          = hsl2rgb(173, 1.00, 0.21),
            cyan          = hsl2rgb(185, 1.00, 0.28),
            blue          = hsl2rgb(212, 0.80, 0.42),
            indigo        = hsl2rgb(233, 0.57, 0.37),
            violet        = hsl2rgb(240, 0.50, 0.60),
            purple        = hsl2rgb(301, 0.63, 0.40),
            pink          = hsl2rgb(334, 0.79, 0.38),
        }
    else
        return {
            foreground    = hsl2rgb(220, 0.13, 0.71),
            inconspicuous = hsl2rgb(220, 0.13, 0.50),
            selection     = hsl2rgb(220, 0.13, 0.28),
            line          = hsl2rgb(220, 0.13, 0.23),
            background    = hsl2rgb(220, 0.13, 0.18),

            red           = hsl2rgb(355, 0.65, 0.65),
            brown         = hsl2rgb(016, 0.65, 0.65),
            yellow        = hsl2rgb(039, 0.67, 0.69),
            lime          = hsl2rgb(066, 0.65, 0.65),
            green         = hsl2rgb(095, 0.38, 0.62),
            teal          = hsl2rgb(174, 0.65, 0.65),
            cyan          = hsl2rgb(187, 0.47, 0.55),
            blue          = hsl2rgb(207, 0.82, 0.66),
            indigo        = hsl2rgb(231, 0.65, 0.65),
            violet        = hsl2rgb(255, 0.65, 0.65),
            purple        = hsl2rgb(286, 0.60, 0.67),
            pink          = hsl2rgb(340, 0.65, 0.65),
        }
    end
end

return M
