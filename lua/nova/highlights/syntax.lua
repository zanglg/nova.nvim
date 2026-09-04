return function(colors)
    return {
        Comment = { fg = colors.comment },

        Constant = { fg = colors.yellow },
        String = { fg = colors.green },
        Character = { fg = colors.green },
        Number = { fg = colors.yellow },
        Boolean = { fg = colors.yellow },
        Float = { fg = colors.yellow },

        Identifier = { fg = colors.foreground },
        Function = { fg = colors.blue },

        Statement = { fg = colors.purple },
        Conditional = { fg = colors.purple },
        Repeat = { fg = colors.purple },
        Label = { fg = colors.purple },
        Operator = { fg = colors.foreground },
        Keyword = { fg = colors.purple },
        Exception = { fg = colors.purple },

        PreProc = { fg = colors.violet },
        Include = { fg = colors.violet },
        Define = { fg = colors.violet },
        Macro = { fg = colors.orange },
        PreCondit = { fg = colors.violet },

        Type = { fg = colors.red },
        StorageClass = { fg = colors.teal },
        Structure = { fg = colors.purple },
        Typedef = { fg = colors.red },

        Special = { fg = colors.orange },
        SpecialChar = { fg = colors.orange },
        Tag = { fg = colors.orange },
        Delimiter = { fg = colors.foreground },
        SpecialComment = { fg = colors.red },
        Debug = { fg = colors.blue },

        Underlined = { underline = true },
        Ignore = { fg = colors.inconspicuous },
        Error = { fg = colors.red },
        Todo = { fg = colors.green },

        -- quickfix
        qfSeparator1 = { link = "Comment" },
        qfSeparator2 = { link = "Comment" },
    }
end
