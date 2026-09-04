return function(colors)
    return {
        -- gitsigns.nvim
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.blue },
        GitSignsDelete = { fg = colors.red },

        -- flash.nvim
        FlashBackdrop = { fg = colors.comment, bold = false },
        FlashMatch = { bg = colors.attention_bg },
        FlashCurrent = { bg = colors.attention_current_bg },
        FlashLabel = { fg = colors.attention, bold = true },

        -- telescope.nvim
        TelescopeBorder = { link = "FloatBorder" },

        -- nvim-bqf
        BqfPreviewFloat = { link = "NormalFloat" },
        BqfPreviewBorder = { link = "FloatBorder" },
        BqfPreviewCursor = { link = "Cursor" },
        BqfPreviewCursorLine = { link = "CursorLine" },
        BqfPreviewRange = { link = "IncSearch" },
        BqfPreviewBufLabel = { link = "Label" },

        -- nvim-cmp
        CmpItemAbbr = { link = "Normal" },
        CmpItemAbbrDeprecated = { link = "Ignore" },
        CmpItemAbbrMatch = { fg = colors.green },
        CmpItemAbbrMatchFuzzy = { fg = colors.violet },
        CmpItemKind = { link = "Normal" },

        CmpItemKindDefault = { link = "Normal" },
        CmpItemKindKeyword = { link = "Keyword" },
        CmpItemKindClass = { link = "@lsp.type.class" },
        CmpItemKindDecorator = { link = "@lsp.type.decorator" },
        CmpItemKindEnum = { link = "@lsp.type.enum" },
        CmpItemKindEnumMember = { link = "@lsp.type.enumMember" },
        CmpItemKindFunction = { link = "@lsp.type.function" },
        CmpItemKindInterface = { link = "@lsp.type.interface" },
        CmpItemKindMacro = { link = "@lsp.type.macro" },
        CmpItemKindMethod = { link = "@lsp.type.method" },
        CmpItemKindNamespace = { link = "@lsp.type.namespace" },
        CmpItemKindProperty = { link = "@lsp.type.property" },
        CmpItemKindStruct = { link = "@lsp.type.struct" },
        CmpItemKindType = { link = "@lsp.type.type" },
        CmpItemKindVariable = { link = "@lsp.type.variable" },
        CmpItemKindField = { link = "@lsp.type.property" },
        CmpItemKindSnippet = { link = "@lsp.type.macro" },

        -- which-key.nvim
        WhichKey = { fg = colors.blue },
        WhichKeySeparator = { fg = colors.green },
        WhichKeyDesc = { fg = colors.red },
        WhichKeyGroup = { fg = colors.violet },
        WhichKeyValue = { fg = colors.violet },

        -- nvim-treehopper
        TSNodeKey = { fg = colors.red, bold = true },
        TSNodeUnmatched = { link = "NonText" },

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
