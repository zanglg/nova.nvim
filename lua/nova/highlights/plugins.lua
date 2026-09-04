return function(colors)
    return {
        -- gitsigns.nvim
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.blue },
        GitSignsDelete = { fg = colors.red },

        -- flash.nvim
        FlashBackdrop = { fg = colors.comment, bold = false },
        FlashMatch = { fg = colors.teal, bold = true },
        FlashCurrent = { fg = colors.orange, bold = true },
        FlashLabel = { fg = colors.attention, bold = true },

        -- telescope.nvim
        TelescopeBorder = { link = "FloatBorder" },
        TelescopeMatching = { fg = colors.attention },

        -- nvim-bqf
        BqfPreviewFloat = { link = "Normal" },
        BqfPreviewBorder = { link = "FloatBorder" },
        BqfPreviewCursor = { link = "Cursor" },
        BqfPreviewCursorLine = { link = "CursorLine" },
        BqfPreviewRange = { link = "IncSearch" },
        BqfPreviewBufLabel = { link = "Comment" },
        BqfSign = { fg = colors.attention },

        -- nvim-cmp
        CmpItemAbbr = { fg = colors.foreground },
        CmpItemAbbrDeprecated = { link = "Ignore" },
        CmpItemAbbrMatch = { fg = colors.attention },
        CmpItemAbbrMatchFuzzy = { fg = colors.attention },
        CmpItemKind = { fg = colors.comment },
        CmpItemKindIcon = { link = "CmpItemKind" },
        CmpItemMenu = { fg = colors.comment },

        CmpItemKindDefault = { link = "CmpItemKind" },
        CmpItemKindText = { link = "Identifier" },
        CmpItemKindMethod = { link = "@lsp.type.method" },
        CmpItemKindFunction = { link = "@lsp.type.function" },
        CmpItemKindConstructor = { link = "@lsp.type.function" },
        CmpItemKindField = { link = "@lsp.type.property" },
        CmpItemKindVariable = { link = "@lsp.type.variable" },
        CmpItemKindClass = { link = "@lsp.type.class" },
        CmpItemKindInterface = { link = "@lsp.type.interface" },
        CmpItemKindModule = { link = "@lsp.type.namespace" },
        CmpItemKindProperty = { link = "@lsp.type.property" },
        CmpItemKindUnit = { link = "Constant" },
        CmpItemKindValue = { link = "Constant" },
        CmpItemKindEnum = { link = "@lsp.type.enum" },
        CmpItemKindKeyword = { link = "Keyword" },
        CmpItemKindSnippet = { link = "@lsp.type.macro" },
        CmpItemKindColor = { link = "Constant" },
        CmpItemKindFile = { link = "Directory" },
        CmpItemKindReference = { link = "Identifier" },
        CmpItemKindFolder = { link = "Directory" },
        CmpItemKindEnumMember = { link = "@lsp.type.enumMember" },
        CmpItemKindConstant = { link = "Constant" },
        CmpItemKindStruct = { link = "@lsp.type.struct" },
        CmpItemKindEvent = { link = "@lsp.type.event" },
        CmpItemKindOperator = { link = "Operator" },
        CmpItemKindTypeParameter = { link = "@lsp.type.typeParameter" },

        -- Compatibility with completion sources that expose non-standard kinds.
        CmpItemKindDecorator = { link = "@lsp.type.decorator" },
        CmpItemKindMacro = { link = "@lsp.type.macro" },
        CmpItemKindNamespace = { link = "@lsp.type.namespace" },
        CmpItemKindType = { link = "@lsp.type.type" },

        CmpItemKindTextIcon = { link = "CmpItemKindText" },
        CmpItemKindMethodIcon = { link = "CmpItemKindMethod" },
        CmpItemKindFunctionIcon = { link = "CmpItemKindFunction" },
        CmpItemKindConstructorIcon = { link = "CmpItemKindConstructor" },
        CmpItemKindFieldIcon = { link = "CmpItemKindField" },
        CmpItemKindVariableIcon = { link = "CmpItemKindVariable" },
        CmpItemKindClassIcon = { link = "CmpItemKindClass" },
        CmpItemKindInterfaceIcon = { link = "CmpItemKindInterface" },
        CmpItemKindModuleIcon = { link = "CmpItemKindModule" },
        CmpItemKindPropertyIcon = { link = "CmpItemKindProperty" },
        CmpItemKindUnitIcon = { link = "CmpItemKindUnit" },
        CmpItemKindValueIcon = { link = "CmpItemKindValue" },
        CmpItemKindEnumIcon = { link = "CmpItemKindEnum" },
        CmpItemKindKeywordIcon = { link = "CmpItemKindKeyword" },
        CmpItemKindSnippetIcon = { link = "CmpItemKindSnippet" },
        CmpItemKindColorIcon = { link = "CmpItemKindColor" },
        CmpItemKindFileIcon = { link = "CmpItemKindFile" },
        CmpItemKindReferenceIcon = { link = "CmpItemKindReference" },
        CmpItemKindFolderIcon = { link = "CmpItemKindFolder" },
        CmpItemKindEnumMemberIcon = { link = "CmpItemKindEnumMember" },
        CmpItemKindConstantIcon = { link = "CmpItemKindConstant" },
        CmpItemKindStructIcon = { link = "CmpItemKindStruct" },
        CmpItemKindEventIcon = { link = "CmpItemKindEvent" },
        CmpItemKindOperatorIcon = { link = "CmpItemKindOperator" },
        CmpItemKindTypeParameterIcon = { link = "CmpItemKindTypeParameter" },

        -- which-key.nvim
        WhichKey = { link = "Function" },
        WhichKeySeparator = { link = "Comment" },
        WhichKeyDesc = { link = "Identifier" },
        WhichKeyGroup = { link = "Keyword" },
        WhichKeyValue = { link = "Comment" },

        -- nvim-treehopper
        TSNodeKey = { fg = colors.attention, bold = true },
        TSNodeUnmatched = { link = "Comment" },

        -- rainbow-delimiters.nvim
        RainbowDelimiterRed = { fg = colors.red },
        RainbowDelimiterYellow = { fg = colors.yellow },
        RainbowDelimiterBlue = { fg = colors.blue },
        RainbowDelimiterOrange = { fg = colors.orange },
        RainbowDelimiterGreen = { fg = colors.green },
        RainbowDelimiterViolet = { fg = colors.violet },
        RainbowDelimiterCyan = { fg = colors.teal },
    }
end
