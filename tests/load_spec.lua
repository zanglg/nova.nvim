return function(t)
    local nova = require("nova")
    local config = require("nova.config")

    t.test("load applies dark theme and returns build artifacts", function()
        nova.setup({ theme = "dark" })
        local colors, groups, opts = nova.load()

        t.eq(vim.o.background, "dark")
        t.eq(vim.g.colors_name, "nova")
        t.eq(vim.o.termguicolors, true)
        t.eq(opts.theme, "dark")
        t.eq(type(colors), "table")
        t.eq(type(groups), "table")
        t.truthy(vim.api.nvim_get_hl(0, { name = "Normal" }).fg)
    end)

    t.test("load synchronizes explicit light theme", function()
        vim.o.background = "dark"
        nova.setup({ theme = "light" })
        local colors = nova.load()
        t.eq(vim.o.background, "light")
        t.eq(colors.background, require("nova.colors").setup(config.options, "light").background)
    end)

    t.test("auto load follows existing background", function()
        nova.setup({ theme = "auto" })

        vim.o.background = "dark"
        local dark = nova.load()

        vim.o.background = "light"
        local light = nova.load()

        t.ne(dark.background, light.background)
    end)

    t.test("colorscheme command can be repeated", function()
        nova.setup({ theme = "dark" })
        vim.cmd.colorscheme("nova")
        vim.cmd.colorscheme("nova")
        t.eq(vim.g.colors_name, "nova")
    end)

    t.test("lualine theme builds from current Nova config", function()
        nova.setup({ theme = "dark" })
        package.loaded["lualine.themes.nova"] = nil
        local theme = require("lualine.themes.nova")
        t.truthy(theme.normal)
        t.truthy(theme.insert)
        t.truthy(theme.inactive)
    end)

    config.setup()
end
