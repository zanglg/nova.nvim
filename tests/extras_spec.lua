return function(t)
    local root = vim.fn.getcwd()
    package.path = table.concat({ root .. "/scripts/?.lua", package.path }, ";")
    local generator = require("theme_generator")

    local function read(relative)
        return table.concat(vim.fn.readfile(root .. "/extras/" .. relative), "\n")
    end

    t.test("cross-tool themes stay synchronized with the generator", function()
        local output = vim.fn.tempname()
        local ok, err = xpcall(function()
            local files = generator.generate(output)
            t.eq(#files, 86)

            for _, relative in ipairs(files) do
                local generated = vim.fn.readfile(output .. "/" .. relative, "b")
                local committed = vim.fn.readfile(root .. "/extras/" .. relative, "b")
                t.eq(committed, generated, "generated theme is stale: extras/" .. relative)
            end
        end, debug.traceback)
        vim.fn.delete(output, "rf")
        if not ok then
            error(err)
        end
    end)

    t.test("requested and supplemental tool renderers are present", function()
        local tools = {
            "windows-terminal",
            "wezterm",
            "alacritty",
            "kitty",
            "ghostty",
            "herdr",
            "fzf",
            "helix",
            "pi",
            "eza",
            "bat",
            "delta",
            "starship",
            "zellij",
            "lazygit",
        }

        for _, tool in ipairs(tools) do
            t.eq(vim.fn.isdirectory(root .. "/extras/" .. tool), 1, "missing renderer output: " .. tool)
        end
    end)

    t.test("cursor renderers use the semantic cursor color", function()
        local schemes = vim.json.decode(read("windows-terminal/nova.json")).schemes
        local windows_by_name = {}
        for _, scheme in ipairs(schemes) do
            windows_by_name[scheme.name] = scheme
        end

        for _, variant in ipairs({ "default", "dim", "soft" }) do
            for _, appearance in ipairs({ "dark", "light" }) do
                local palette = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                local suffix = variant == "default" and "" or "-" .. variant
                local theme_slug = "nova-" .. appearance .. suffix
                local display_name = "Nova " .. appearance:sub(1, 1):upper() .. appearance:sub(2)
                if variant ~= "default" then
                    display_name = display_name .. " " .. variant:sub(1, 1):upper() .. variant:sub(2)
                end

                t.eq(palette.cursor, palette.match)
                t.eq(windows_by_name[display_name].cursorColor, palette.cursor)
                t.truthy(
                    read("wezterm/" .. theme_slug .. ".toml"):find('cursor_bg = "' .. palette.cursor .. '"', 1, true)
                )
                t.truthy(
                    read("alacritty/" .. theme_slug .. ".toml"):find(
                        '[colors.cursor]\ncursor = "' .. palette.cursor .. '"',
                        1,
                        true
                    )
                )
                t.truthy(read("kitty/" .. theme_slug .. ".conf"):find("\ncursor " .. palette.cursor .. "\n", 1, true))
                t.truthy(read("ghostty/" .. theme_slug):find("\ncursor-color = " .. palette.cursor .. "\n", 1, true))
            end
        end
    end)

    t.test("WezTerm themes include the Nova tab hierarchy", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            for _, appearance in ipairs({ "dark", "light" }) do
                local palette = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                local suffix = variant == "default" and "" or "-" .. variant
                local content = read("wezterm/nova-" .. appearance .. suffix .. ".toml")

                t.truthy(
                    content:find(
                        '[colors.tab_bar]\nbackground = "'
                            .. palette.stripline
                            .. '"\ninactive_tab_edge = "'
                            .. palette.splitline
                            .. '"',
                        1,
                        true
                    )
                )
                t.truthy(
                    content:find(
                        '[colors.tab_bar.active_tab]\nbg_color = "'
                            .. palette.blue
                            .. '"\nfg_color = "'
                            .. palette.background
                            .. '"',
                        1,
                        true
                    )
                )
            end
        end
    end)

    t.test("Herdr themes map Nova semantic palettes", function()
        local mappings = {
            accent = "blue",
            panel_bg = "background",
            sidebar_bg = "stripline",
            active_row_bg = "popupmenu",
            selection_bg = "selection",
            surface0 = "popupmenu",
            surface1 = "selection",
            surface_dim = "stripline",
            overlay0 = "inconspicuous",
            overlay1 = "comment",
            text = "foreground",
            subtext0 = "comment",
            mauve = "purple",
            green = "green",
            yellow = "yellow",
            red = "red",
            blue = "blue",
            teal = "teal",
            peach = "orange",
        }

        for _, variant in ipairs({ "default", "dim", "soft" }) do
            local suffix = variant == "default" and "" or "-" .. variant
            for _, appearance in ipairs({ "dark", "light" }) do
                local palette = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                local content = read("herdr/nova-" .. appearance .. suffix .. ".toml")
                t.truthy(content:find("[theme.custom]", 1, true))
                for herdr_name, nova_name in pairs(mappings) do
                    t.truthy(
                        content:find(herdr_name .. ' = "' .. palette[nova_name] .. '"', 1, true),
                        string.format("missing Herdr mapping %s/%s/%s", variant, appearance, herdr_name)
                    )
                end
            end
        end
    end)

    t.test("Pi themes define valid variable references and all required tokens", function()
        local required = {
            "accent",
            "border",
            "borderAccent",
            "borderMuted",
            "success",
            "error",
            "warning",
            "muted",
            "dim",
            "text",
            "thinkingText",
            "selectedBg",
            "userMessageBg",
            "userMessageText",
            "customMessageBg",
            "customMessageText",
            "customMessageLabel",
            "toolPendingBg",
            "toolSuccessBg",
            "toolErrorBg",
            "toolTitle",
            "toolOutput",
            "mdHeading",
            "mdLink",
            "mdLinkUrl",
            "mdCode",
            "mdCodeBlock",
            "mdCodeBlockBorder",
            "mdQuote",
            "mdQuoteBorder",
            "mdHr",
            "mdListBullet",
            "toolDiffAdded",
            "toolDiffRemoved",
            "toolDiffContext",
            "syntaxComment",
            "syntaxKeyword",
            "syntaxFunction",
            "syntaxVariable",
            "syntaxString",
            "syntaxNumber",
            "syntaxType",
            "syntaxOperator",
            "syntaxPunctuation",
            "thinkingOff",
            "thinkingMinimal",
            "thinkingLow",
            "thinkingMedium",
            "thinkingHigh",
            "thinkingXhigh",
            "bashMode",
        }

        for _, path in ipairs(vim.fn.glob(root .. "/extras/pi/*.json", false, true)) do
            local data = vim.json.decode(table.concat(vim.fn.readfile(path), "\n"))
            for _, name in ipairs(required) do
                t.truthy(data.colors[name], string.format("missing Pi token %s in %s", name, path))
            end
            for name, value in pairs(data.colors) do
                local is_hex = type(value) == "string" and value:match("^#%x%x%x%x%x%x$")
                t.truthy(is_hex or data.vars[value], string.format("invalid Pi color reference %s=%s", name, value))
            end
        end
    end)
end
