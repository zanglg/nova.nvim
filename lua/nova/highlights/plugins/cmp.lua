local kinds = require("nova.highlights.plugins.completion_kinds")

return function(colors)
    local groups = {
        CmpItemAbbr = { fg = colors.foreground },
        CmpItemAbbrDeprecated = { link = "Ignore" },
        CmpItemAbbrMatch = { fg = colors.match },
        CmpItemAbbrMatchFuzzy = { fg = colors.match },
        CmpItemKind = { fg = colors.comment },
        CmpItemKindIcon = { link = "CmpItemKind" },
        CmpItemMenu = { fg = colors.comment },

        CmpItemKindDefault = { link = "CmpItemKind" },
        CmpItemKindDecorator = { link = "@lsp.type.decorator" },
        CmpItemKindMacro = { link = "@lsp.type.macro" },
        CmpItemKindNamespace = { link = "@lsp.type.namespace" },
        CmpItemKindType = { link = "@lsp.type.type" },
    }

    groups = vim.tbl_extend("force", groups, kinds.groups("CmpItemKind"))
    return vim.tbl_extend("force", groups, kinds.icons("CmpItemKind"))
end
