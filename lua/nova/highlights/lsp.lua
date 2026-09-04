return function(colors)
    return {
        -- LSP UI
        LspInfoBorder = { link = "FloatBorder" },
        LspReferenceText = { link = "Visual" },
        LspReferenceRead = { link = "Visual" },
        LspReferenceWrite = { link = "Visual" },
        LspCodeLens = { link = "Comment" },
        LspCodeLensSeparator = { link = "Comment" },
        LspInlayHint = { link = "Comment" },

        -- Diagnostics. Derived groups inherit the existing Nova diagnostic semantics.
        DiagnosticError = { link = "ErrorMsg" },
        DiagnosticWarn = { link = "WarningMsg" },
        DiagnosticInfo = { link = "MoreMsg" },
        DiagnosticHint = { link = "MoreMsg" },

        DiagnosticVirtualTextError = { link = "DiagnosticError" },
        DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
        DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
        DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
        DiagnosticFloatingError = { link = "DiagnosticError" },
        DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
        DiagnosticFloatingHint = { link = "DiagnosticHint" },
        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignWarn = { link = "DiagnosticWarn" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticUnderlineError = { fg = colors.red, underline = true },
        DiagnosticUnderlineWarn = { fg = colors.yellow, underline = true },
        DiagnosticUnderlineInfo = { fg = colors.green, underline = true },
        DiagnosticUnderlineHint = { fg = colors.green, underline = true },

        -- Standard semantic token types. Existing color assignments are retained.
        ["@lsp.type.class"] = { fg = colors.red },
        ["@lsp.type.decorator"] = { fg = colors.brown },
        ["@lsp.type.enum"] = { fg = colors.red },
        ["@lsp.type.enumMember"] = { fg = colors.yellow },
        ["@lsp.type.event"] = { link = "Identifier" },
        ["@lsp.type.function"] = { fg = colors.blue },
        ["@lsp.type.interface"] = { fg = colors.blue },
        ["@lsp.type.keyword"] = { fg = colors.purple },
        ["@lsp.type.macro"] = { fg = colors.brown },
        ["@lsp.type.method"] = { fg = colors.blue },
        ["@lsp.type.modifier"] = { link = "StorageClass" },
        ["@lsp.type.namespace"] = { fg = colors.violet },
        ["@lsp.type.number"] = { link = "Number" },
        ["@lsp.type.operator"] = { link = "Operator" },
        ["@lsp.type.parameter"] = { fg = colors.foreground },
        ["@lsp.type.property"] = { fg = colors.violet },
        ["@lsp.type.regexp"] = { link = "String" },
        ["@lsp.type.string"] = { link = "String" },
        ["@lsp.type.struct"] = { fg = colors.red },
        ["@lsp.type.type"] = { fg = colors.red },
        ["@lsp.type.typeParameter"] = { fg = colors.red },
        ["@lsp.type.variable"] = { fg = colors.foreground },

        -- Keep modifiers style-only unless Nova already had a language-specific color.
        ["@lsp.mod.deprecated"] = { strikethrough = true },
        ["@lsp.mod.readonly"] = {},
        ["@lsp.mod.defaultLibrary"] = {},
        ["@lsp.mod.async"] = {},
        ["@lsp.mod.static"] = {},
        ["@lsp.mod.declaration"] = {},
        ["@lsp.mod.definition"] = {},

        -- clang
        ["@lsp.type.macro.c"] = { fg = colors.yellow },

        -- rust
        ["@lsp.type.lifetime.rust"] = { fg = colors.yellow },
        ["@lsp.type.selfKeyword.rust"] = { fg = colors.cyan },
        ["@lsp.type.selfTypeKeyword.rust"] = { fg = colors.cyan },
        ["@lsp.mod.async.rust"] = { fg = colors.cyan },
        ["@lsp.mod.constant.rust"] = { fg = colors.yellow },
        ["@lsp.mod.static.rust"] = { fg = colors.yellow },
    }
end
