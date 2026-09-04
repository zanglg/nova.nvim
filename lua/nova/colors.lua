local hsl2rgb = require("nova.utils").hsl2rgb
local option = require("nova.option").option

-- stylua: ignore
local colors = {
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
        brown         = hsl2rgb(020, 0.35, 0.52),
        yellow        = hsl2rgb(037, 0.60, 0.60),
        lime          = hsl2rgb(067, 0.50, 0.50),
        green         = hsl2rgb(123, 0.38, 0.57),
        teal          = hsl2rgb(174, 0.63, 0.41),
        blue          = hsl2rgb(220, 0.80, 0.65),
        violet        = hsl2rgb(255, 0.50, 0.65),
        purple        = hsl2rgb(291, 0.65, 0.65),
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
        brown         = hsl2rgb(020, 0.40, 0.45),
        yellow        = hsl2rgb(045, 0.75, 0.40),
        lime          = hsl2rgb(066, 0.50, 0.40),
        green         = hsl2rgb(123, 0.46, 0.34),
        teal          = hsl2rgb(173, 0.95, 0.25),
        blue          = hsl2rgb(212, 0.80, 0.42),
        violet        = hsl2rgb(240, 0.50, 0.60),
        purple        = hsl2rgb(301, 0.63, 0.43),
    }
}

if colors[option.theme] == nil then
    return colors.dark
end

return colors[option.theme]
