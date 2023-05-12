local hsl2rgb = require("nova.utils").hsl2rgb
local option = require("nova.option").option

-- stylua: ignore
local colors = {
    light = {
        foreground    = hsl2rgb(200, 0.15, 0.30),
        comment       = hsl2rgb(200, 0.15, 0.55),
        inconspicuous = hsl2rgb(200, 0.15, 0.70),
        splitline     = hsl2rgb(200, 0.15, 0.80),
        selection     = hsl2rgb(200, 0.15, 0.85),
        popupmenu     = hsl2rgb(200, 0.15, 0.90),
        stripline     = hsl2rgb(200, 0.15, 0.95),
        background    = hsl2rgb(200, 0.15, 0.99),

        red           = hsl2rgb(350, 0.66, 0.47),
        brown         = hsl2rgb(015, 0.25, 0.50),
        yellow        = hsl2rgb(045, 0.75, 0.40),
        lime          = hsl2rgb(066, 0.50, 0.35),
        green         = hsl2rgb(123, 0.46, 0.34),
        teal          = hsl2rgb(173, 1.00, 0.25),
        cyan          = hsl2rgb(187, 0.80, 0.40),
        blue          = hsl2rgb(212, 0.80, 0.42),
        violet        = hsl2rgb(240, 0.50, 0.60),
        purple        = hsl2rgb(280, 0.60, 0.50),
    },

    dark = {
        foreground    = hsl2rgb(211, 0.15, 0.75),
        comment       = hsl2rgb(211, 0.15, 0.50),
        inconspicuous = hsl2rgb(211, 0.15, 0.41),
        splitline     = hsl2rgb(211, 0.43, 0.27),
        selection     = hsl2rgb(211, 0.43, 0.24),
        popupmenu     = hsl2rgb(211, 0.43, 0.21),
        stripline     = hsl2rgb(211, 0.43, 0.18),
        background    = hsl2rgb(211, 0.43, 0.15),

        red           = hsl2rgb(350, 0.63, 0.63),
        brown         = hsl2rgb(016, 0.60, 0.63),
        yellow        = hsl2rgb(037, 0.60, 0.60),
        lime          = hsl2rgb(067, 0.50, 0.50),
        green         = hsl2rgb(123, 0.38, 0.57),
        teal          = hsl2rgb(160, 0.50, 0.50),
        cyan          = hsl2rgb(190, 0.71, 0.50),
        blue          = hsl2rgb(220, 0.80, 0.65),
        violet        = hsl2rgb(262, 0.50, 0.65),
        purple        = hsl2rgb(291, 0.65, 0.65),
    }
}

if option.theme == "light" then
    return colors.light
end

return colors.dark
