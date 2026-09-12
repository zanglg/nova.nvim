return function(t)
    local colors = require("nova.colors")

    local function opts(overrides, variant)
        return { colors = overrides or {}, variant = variant or "default" }
    end

    local function relative_luminance(color)
        local value = color:gsub("#", "")
        local channels = {
            tonumber(value:sub(1, 2), 16) / 255,
            tonumber(value:sub(3, 4), 16) / 255,
            tonumber(value:sub(5, 6), 16) / 255,
        }

        for index, channel in ipairs(channels) do
            channels[index] = channel <= 0.04045 and channel / 12.92 or ((channel + 0.055) / 1.055) ^ 2.4
        end

        return channels[1] * 0.2126 + channels[2] * 0.7152 + channels[3] * 0.0722
    end

    local function contrast_ratio(foreground, background)
        local foreground_luminance = relative_luminance(foreground)
        local background_luminance = relative_luminance(background)
        local lighter = math.max(foreground_luminance, background_luminance)
        local darker = math.min(foreground_luminance, background_luminance)
        return (lighter + 0.05) / (darker + 0.05)
    end

    local required = {
        "foreground",
        "background",
        "comment",
        "inconspicuous",
        "splitline",
        "selection",
        "popupmenu",
        "stripline",
        "red",
        "orange",
        "yellow",
        "green",
        "teal",
        "blue",
        "violet",
        "purple",
        "match",
        "cursor",
        "current_match",
        "target",
        "diff_add_bg",
        "diff_change_bg",
        "diff_delete_bg",
        "diff_text_bg",
    }

    t.test("all palettes expose required primitives", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            for _, theme in ipairs({ "dark", "light" }) do
                local palette = colors.setup(opts(nil, variant), theme)
                for _, name in ipairs(required) do
                    t.truthy(palette[name], string.format("missing palette key: %s/%s/%s", variant, theme, name))
                end
            end
        end
    end)

    t.test("muted palette hierarchy keeps comments above inconspicuous text", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            for _, theme in ipairs({ "dark", "light" }) do
                local palette = colors.setup(opts(nil, variant), theme)
                local comment_contrast = contrast_ratio(palette.comment, palette.background)
                local inconspicuous_contrast = contrast_ratio(palette.inconspicuous, palette.background)

                t.truthy(
                    comment_contrast > inconspicuous_contrast,
                    string.format(
                        "expected comment contrast to exceed inconspicuous contrast: %s/%s (%.2f <= %.2f)",
                        variant,
                        theme,
                        comment_contrast,
                        inconspicuous_contrast
                    )
                )
            end
        end
    end)

    t.test("light and dark palettes are independent", function()
        local dark = colors.setup(opts(), "dark")
        local light = colors.setup(opts(), "light")
        t.ne(dark.background, light.background)
        t.ne(dark.foreground, light.foreground)
    end)

    t.test("variants provide distinct palettes", function()
        for _, theme in ipairs({ "dark", "light" }) do
            local default = colors.setup(opts(nil, "default"), theme)
            local dim = colors.setup(opts(nil, "dim"), theme)
            local soft = colors.setup(opts(nil, "soft"), theme)

            t.ne(default.background, dim.background)
            t.ne(dim.background, soft.background)
            t.ne(default.blue, dim.blue)
            t.ne(dim.blue, soft.blue)
        end
    end)

    t.test("source color overrides recompute derived diff colors", function()
        local base = colors.setup(opts(), "dark")
        local custom = colors.setup(opts({ green = "#000000" }), "dark")
        t.eq(custom.green, "#000000")
        t.ne(custom.diff_add_bg, base.diff_add_bg)
    end)

    t.test("cursor follows match unless explicitly overridden", function()
        local matched = colors.setup(opts({ match = "#123456" }), "dark")
        local explicit = colors.setup(opts({ match = "#123456", cursor = "#abcdef" }), "dark")

        t.eq(matched.cursor, "#123456")
        t.eq(explicit.cursor, "#abcdef")
    end)

    t.test("derived color overrides are preserved", function()
        local custom = colors.setup(opts({ diff_add_bg = "#123456" }), "dark")
        t.eq(custom.diff_add_bg, "#123456")
    end)

    t.test("color override functions receive palette and theme", function()
        local seen_theme
        local seen_background
        local custom = colors.setup(
            opts(function(base, theme)
                seen_theme = theme
                seen_background = base.background
                return { blue = "#123456" }
            end),
            "light"
        )

        t.eq(seen_theme, "light")
        t.truthy(seen_background)
        t.eq(custom.blue, "#123456")
    end)

    t.test("color override functions receive the selected variant palette", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            local seen_background
            local selected = colors.setup(
                opts(function(base)
                    seen_background = base.background
                    return {}
                end, variant),
                "dark"
            )

            t.eq(seen_background, selected.background)
        end
    end)

    t.test("color override functions recompute derived colors", function()
        local base = colors.setup(opts(), "dark")
        local custom = colors.setup(
            opts(function()
                return { green = "#000000" }
            end),
            "dark"
        )
        t.ne(custom.diff_add_bg, base.diff_add_bg)
    end)

    t.test("color override functions validate their return value", function()
        t.raises(function()
            colors.setup(
                opts(function()
                    return true
                end),
                "dark"
            )
        end, "colors function must return a table or nil")
    end)

    t.test("palette setup does not mutate source palettes", function()
        local first = colors.setup(opts(), "dark")
        first.foreground = "#000000"
        local second = colors.setup(opts(), "dark")
        t.ne(second.foreground, "#000000")
    end)
end
