return function(t)
    local colors = require("nova.colors")

    local function opts(overrides, variant)
        return { colors = overrides or {}, variant = variant or "default" }
    end

    t.test("dark palette exposes required primitives", function()
        local palette = colors.setup(opts(), "dark")
        for _, name in ipairs({
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
            "current_match",
            "target",
            "diff_add_bg",
            "diff_change_bg",
            "diff_delete_bg",
            "diff_text_bg",
        }) do
            t.truthy(palette[name], "missing palette key: " .. name)
        end
    end)

    t.test("light and dark palettes are independent", function()
        local dark = colors.setup(opts(), "dark")
        local light = colors.setup(opts(), "light")
        t.ne(dark.background, light.background)
        t.ne(dark.foreground, light.foreground)
    end)

    t.test("soft palette differs from default palette", function()
        local default_dark = colors.setup(opts(nil, "default"), "dark")
        local soft_dark = colors.setup(opts(nil, "soft"), "dark")
        local default_light = colors.setup(opts(nil, "default"), "light")
        local soft_light = colors.setup(opts(nil, "soft"), "light")

        t.ne(default_dark.background, soft_dark.background)
        t.ne(default_dark.blue, soft_dark.blue)
        t.ne(default_light.background, soft_light.background)
        t.ne(default_light.blue, soft_light.blue)
    end)

    t.test("source color overrides recompute derived diff colors", function()
        local base = colors.setup(opts(), "dark")
        local custom = colors.setup(opts({ green = "#000000" }), "dark")
        t.eq(custom.green, "#000000")
        t.ne(custom.diff_add_bg, base.diff_add_bg)
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
        local seen_background
        local soft = colors.setup(
            opts(function(base)
                seen_background = base.background
                return {}
            end, "soft"),
            "dark"
        )

        t.eq(seen_background, soft.background)
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
