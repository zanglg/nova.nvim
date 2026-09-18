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
            t.eq(#files, 92)

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
            "tmux",
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

    t.test("tmux themes preserve status bar and semantic interaction colors", function()
        for _, variant in ipairs({ "default", "dim", "soft" }) do
            for _, appearance in ipairs({ "dark", "light" }) do
                local c = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                local suffix = variant == "default" and "" or "-" .. variant
                local content = read("tmux/nova-" .. appearance .. suffix .. ".conf")
                local function contains(value)
                    t.truthy(content:find(value, 1, true), "missing tmux mapping: " .. value)
                end

                contains('set -g status-style "bg=' .. c.selection .. ",fg=" .. c.foreground .. '"')
                contains("#[fg=" .. c.selection .. ",bg=" .. c.blue .. ",bold] #S ")
                contains("#[fg=" .. c.selection .. ",bg=" .. c.blue .. ",bold] %Y-%m-%d %H:%M ")
                contains('setw -g window-status-current-style "fg=' .. c.blue .. ",bg=" .. c.stripline .. ',none"')
                contains('setw -g window-status-style "fg=' .. c.foreground .. ",bg=" .. c.selection .. ',none"')
                contains('setw -g window-status-format " #I #W "')
                contains("#[fg=" .. c.selection .. ",bg=" .. c.stripline .. "] ")
                contains("#[fg=" .. c.stripline .. ",bg=" .. c.selection .. "]")
                contains('setw -g mode-style "fg=' .. c.foreground .. ",bg=" .. c.selection .. '"')
                contains("fg=" .. c.foreground .. ",bg=" .. c.popupmenu .. ",fill=" .. c.popupmenu)
                for option, color in pairs({ match = c.match, ["current-match"] = c.current_match, mark = c.target }) do
                    contains("setw -g copy-mode-" .. option .. '-style "fg=' .. c.background .. ",bg=" .. color .. '"')
                end
                contains(
                    "#{?synchronize-panes,fg="
                        .. c.red
                        .. ",#{?pane_in_mode,fg="
                        .. c.yellow
                        .. ",fg="
                        .. c.blue
                        .. "}}"
                )
                contains('setw -g pane-border-style "fg=' .. c.splitline .. '"')
                contains('set -g menu-selected-style "fg=' .. c.blue .. ",bg=" .. c.selection .. '"')
                contains('set -g popup-style "fg=' .. c.foreground .. ",bg=" .. c.popupmenu .. '"')
                for _, option in ipairs({
                    "status",
                    "status-position",
                    "status-justify",
                    "status-left-length",
                    "status-right-length",
                }) do
                    t.eq(content:find("set -g " .. option .. " ", 1, true), nil, "theme must not set " .. option)
                end
                t.eq(content:find("${", 1, true), nil, "unresolved tmux palette placeholder")
                t.eq(content:find("bind ", 1, true), nil, "theme must not change key bindings")
                t.eq(content:find("default-terminal", 1, true), nil, "theme must not change terminal capabilities")
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
