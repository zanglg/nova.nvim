local hsl2rgb = require("nova.utils").hsl2rgb
local option = require("nova.option").option

-- stylua: ignore
local colors = {
    nova = {
        foreground    = hsl2rgb(225, 0.15, 0.75),
        comment       = hsl2rgb(225, 0.15, 0.50),
        inconspicuous = hsl2rgb(225, 0.15, 0.41),
        splitline     = hsl2rgb(225, 0.27, 0.27),
        selection     = hsl2rgb(225, 0.27, 0.24),
        popupmenu     = hsl2rgb(225, 0.27, 0.21),
        stripline     = hsl2rgb(225, 0.27, 0.18),
        background    = hsl2rgb(225, 0.27, 0.15),

        red           = hsl2rgb(345, 0.63, 0.63),
        brown         = hsl2rgb(015, 0.20, 0.50),
        yellow        = hsl2rgb(037, 0.60, 0.60),
        lime          = hsl2rgb(067, 0.50, 0.50),
        green         = hsl2rgb(123, 0.38, 0.57),
        teal          = hsl2rgb(181, 0.40, 0.41),
        cyan          = hsl2rgb(190, 0.71, 0.50),
        blue          = hsl2rgb(220, 0.80, 0.65),
        violet        = hsl2rgb(255, 0.50, 0.65),
        purple        = hsl2rgb(291, 0.65, 0.65),
    },
    light = {
        foreground    = hsl2rgb(200, 0.05, 0.40),
        comment       = hsl2rgb(200, 0.05, 0.65),
        inconspicuous = hsl2rgb(200, 0.05, 0.70),
        splitline     = hsl2rgb(200, 0.15, 0.80),
        selection     = hsl2rgb(200, 0.15, 0.85),
        popupmenu     = hsl2rgb(200, 0.15, 0.90),
        stripline     = hsl2rgb(200, 0.15, 0.95),
        background    = hsl2rgb(200, 0.15, 0.99),

        red           = hsl2rgb(350, 0.66, 0.47),
        brown         = hsl2rgb(015, 0.20, 0.50),
        yellow        = hsl2rgb(045, 0.75, 0.40),
        lime          = hsl2rgb(066, 0.50, 0.40),
        green         = hsl2rgb(123, 0.46, 0.34),
        teal          = hsl2rgb(155, 0.65, 0.35),
        cyan          = hsl2rgb(187, 0.90, 0.30),
        blue          = hsl2rgb(212, 0.80, 0.42),
        violet        = hsl2rgb(240, 0.50, 0.60),
        purple        = hsl2rgb(280, 0.60, 0.50),
    },
    dark = {
        foreground    = hsl2rgb(235, 0.17, 0.75),
        comment       = hsl2rgb(235, 0.17, 0.50),
        inconspicuous = hsl2rgb(235, 0.17, 0.41),
        splitline     = hsl2rgb(235, 0.17, 0.24),
        selection     = hsl2rgb(235, 0.17, 0.21),
        popupmenu     = hsl2rgb(235, 0.17, 0.18),
        stripline     = hsl2rgb(235, 0.17, 0.15),
        background    = hsl2rgb(235, 0.17, 0.12),

        red           = hsl2rgb(345, 0.63, 0.63),
        brown         = hsl2rgb(015, 0.20, 0.50),
        yellow        = hsl2rgb(037, 0.60, 0.60),
        lime          = hsl2rgb(067, 0.50, 0.50),
        green         = hsl2rgb(136, 0.37, 0.49),
        teal          = hsl2rgb(181, 0.40, 0.38),
        cyan          = hsl2rgb(190, 0.71, 0.50),
        blue          = hsl2rgb(220, 0.80, 0.65),
        violet        = hsl2rgb(255, 0.50, 0.65),
        purple        = hsl2rgb(291, 0.65, 0.65),
    }
}

if colors[option.theme] == nil then
    return colors.nova
end

return colors[option.theme]
