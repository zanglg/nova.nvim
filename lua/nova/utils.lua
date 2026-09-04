local M = {}

local function round(value)
    return math.floor(value + 0.5)
end

function M.hsl2rgb(h, s, l)
    h = h % 360

    local c = (1 - math.abs(2 * l - 1)) * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = l - c / 2
    local r, g, b

    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end

    r = round((r + m) * 255)
    g = round((g + m) * 255)
    b = round((b + m) * 255)

    return string.format("#%02x%02x%02x", r, g, b)
end

return M
