return function(t)
    local config = require("nova.config")

    t.test("config uses stable defaults", function()
        local opts = config.setup()
        t.eq(opts.theme, "auto")
        t.eq(opts.variant, "default")
        t.eq(opts.transparent, false)
        t.eq(opts.colors, {})
        t.eq(opts.overrides, {})
    end)

    t.test("config accepts supported themes", function()
        for _, theme in ipairs({ "auto", "dark", "light" }) do
            local opts = config.setup({ theme = theme })
            t.eq(opts.theme, theme)
        end
    end)

    t.test("config accepts supported variants", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            local opts = config.setup({ variant = variant })
            t.eq(opts.variant, variant)
        end
    end)

    t.test("config rejects unknown options", function()
        t.raises(function()
            config.setup({ popup_style = "bordered" })
        end, "unknown option")
    end)

    t.test("config rejects invalid theme", function()
        t.raises(function()
            config.setup({ theme = "sepia" })
        end, "invalid theme")
    end)

    t.test("config rejects invalid variant", function()
        t.raises(function()
            config.setup({ variant = "muted" })
        end, "invalid variant")
    end)

    t.test("config validates option types", function()
        t.raises(function()
            config.setup("dark")
        end, "setup options must be a table")

        t.raises(function()
            config.setup({ transparent = "yes" })
        end, "transparent must be a boolean")

        t.raises(function()
            config.setup({ colors = true })
        end, "colors must be a table or function")

        t.raises(function()
            config.setup({ overrides = true })
        end, "overrides must be a table or function")
    end)

    t.test("config accepts color and highlight override functions", function()
        local color_override = function()
            return {}
        end
        local highlight_override = function()
            return {}
        end
        local opts = config.setup({
            colors = color_override,
            overrides = highlight_override,
        })
        t.eq(opts.colors, color_override)
        t.eq(opts.overrides, highlight_override)
    end)

    t.test("auto theme follows background", function()
        config.setup({ theme = "auto" })

        vim.o.background = "dark"
        t.eq(config.resolve_theme(), "dark")

        vim.o.background = "light"
        t.eq(config.resolve_theme(), "light")
    end)

    config.setup()
end
