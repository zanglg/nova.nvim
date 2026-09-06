local kinds = require("nova.highlights.plugins.completion_kinds")

return function(colors)
    local groups = {
        BlinkCmpDocBorder = { link = "FloatBorder" },
        BlinkCmpLabelDeprecated = { fg = colors.inconspicuous, strikethrough = true },
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
        BlinkCmpKindCopilot = { fg = colors.teal },
        BlinkCmpKindCodeium = { fg = colors.teal },
        BlinkCmpKindSupermaven = { fg = colors.teal },
        BlinkCmpKindTabNine = { fg = colors.teal },
    }

    return vim.tbl_extend("force", groups, kinds.groups("BlinkCmpKind"))
end
