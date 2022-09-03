local M = {}

-- stylua: ignore start
M.hsl2rgb = function(h, s, l)
    local c = (1 - math.abs(2 * l - 1)) * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = l - c / 2

    if     (0   <= h and h < 60)  then r, g, b = c, x, 0
    elseif (60  <= h and h < 120) then r, g, b = x, c, 0
    elseif (120 <= h and h < 180) then r, g, b = 0, c, x
    elseif (180 <= h and h < 240) then r, g, b = 0, x, c
    elseif (240 <= h and h < 300) then r, g, b = x, 0, c
    elseif (300 <= h and h < 360) then r, g, b = c, 0, x
    end

    r, g, b = ((r + m) * 255), ((g + m) * 255), ((b + m) * 255)

    function round(float) return math.floor(float + .5) end

    return string.format("#%02x%02x%02x", round(r), round(g), round(b))
end

return M
