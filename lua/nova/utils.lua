local M = {}

local function round(value)
    return math.floor(value + 0.5)
end

local function hex_to_rgb(color)
    local value = color:gsub("#", "")
    return tonumber(value:sub(1, 2), 16), tonumber(value:sub(3, 4), 16), tonumber(value:sub(5, 6), 16)
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

function M.blend(foreground, background, alpha)
    local fr, fg, fb = hex_to_rgb(foreground)
    local br, bg, bb = hex_to_rgb(background)

    local r = round(fr * alpha + br * (1 - alpha))
    local g = round(fg * alpha + bg * (1 - alpha))
    local b = round(fb * alpha + bb * (1 - alpha))

    return string.format("#%02x%02x%02x", r, g, b)
end

return M
