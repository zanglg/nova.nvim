return function(t)
    local root = vim.fn.getcwd()
    package.path = table.concat({ root .. "/scripts/?.lua", package.path }, ";")
    local generator = require("theme_generator")

    t.test("cross-tool themes stay synchronized with the generator", function()
        local output = vim.fn.tempname()
        local ok, err = xpcall(function()
            local files = generator.generate(output)
            t.eq(#files, 80)

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
