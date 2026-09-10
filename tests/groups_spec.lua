return function(t)
    local colors = require("nova.colors")
    local build_groups = require("nova.groups")
    local build_plugins = require("nova.highlights.plugins")

    local palette = colors.setup({ colors = {} }, "dark")

    t.test("group builders return core highlight coverage", function()
        local groups = build_groups(palette, { transparent = false, overrides = {} })
        for _, name in ipairs({
            "Normal",
            "NormalFloat",
            "Search",
            "CurSearch",
            "DiagnosticError",
            "@function",
            "@lsp.type.function",
            "GitSignsAdd",
            "FlashMatch",
        }) do
            t.truthy(groups[name], "missing highlight group: " .. name)
        end
    end)

    t.test("special semantic keywords use teal without recoloring generic operators", function()
        local groups = build_groups(palette, { transparent = false, overrides = {} })

        t.eq(groups["@keyword.coroutine"], { fg = palette.teal })
        t.eq(groups["@keyword.operator"], { fg = palette.teal })
        t.eq(groups["@keyword.modifier"], { link = "StorageClass" })
        t.eq(groups["@lsp.mod.async"], { fg = palette.teal })
        t.eq(groups["@operator"], { link = "Operator" })
        t.eq(groups.Operator, { fg = palette.foreground })
    end)

    t.test("plugin builders load without installed plugins", function()
        local groups = build_plugins(palette)
        t.eq(type(groups), "table")
        t.truthy(groups.GitSignsAdd)
        t.truthy(groups.FlashMatch)
    end)

    t.test("table highlight overrides win", function()
        local groups = build_groups(palette, {
            transparent = false,
            overrides = {
                Normal = { fg = "#123456" },
            },
        })
        t.eq(groups.Normal, { fg = "#123456" })
    end)

    t.test("function highlight overrides receive colors", function()
        local seen
        local groups = build_groups(palette, {
            transparent = false,
            overrides = function(current)
                seen = current
                return {
                    NovaTestOverride = { fg = current.red },
                }
            end,
        })
        t.eq(seen, palette)
        t.eq(groups.NovaTestOverride, { fg = palette.red })
    end)
end
