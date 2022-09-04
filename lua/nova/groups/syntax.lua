local colors = require("nova").colors

-- stylua: ignore
return {
    Comment        = { fg = colors.inconspicuous },

    Constant       = { fg = colors.yellow },
    String         = { fg = colors.green },
    Character      = { fg = colors.green },
    Number         = { fg = colors.yellow },
    Boolean        = { fg = colors.yellow },
    Float          = { fg = colors.yellow },

    Identifier     = { fg = colors.foreground },
    Function       = { fg = colors.blue },

    Statement      = { fg = colors.purple },
    Conditional    = { fg = colors.pink },
    Repeat         = { fg = colors.pink },
    Label          = { fg = colors.pink },
    Operator       = { fg = colors.cyan },
    Keyword        = { fg = colors.purple },
    Exception      = { fg = colors.purple },

    PreProc        = { fg = colors.blue },
    Include        = { fg = colors.violet },
    Define         = { fg = colors.cyan },
    Macro          = { fg = colors.brown },
    PreCondit      = { fg = colors.yellow },

    Type           = { fg = colors.red },
    StorageClass   = { fg = colors.purple },
    Structure      = { fg = colors.purple },
    Typedef        = { fg = colors.red },

    Special        = { fg = colors.lime },
    SpecialChar    = { fg = colors.lime },
    Tag            = { fg = colors.red, bold = true },
    Delimiter      = { fg = colors.cyan },
    SpecialComment = { fg = colors.inconspicuous },
    Debug          = { fg = colors.red },

    Underlined     = { fg = colors.blue, underline = true },
    Ignore         = { fg = colors.inconspicuous },
    Error          = { fg = colors.red },
    Todo           = { fg = colors.red, bold = true },
}
