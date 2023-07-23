local colors = require("nova.colors")

local groups = {
    {
        -- highlight-groups
        Normal = { fg = colors.foreground, bg = colors.background },
        NormalFloat = { fg = colors.foreground },
        NormalNC = { fg = colors.foreground },

        ColorColumn = { fg = colors.stripline },
        CursorColumn = { bg = colors.stripline },
        CursorLine = { bg = colors.stripline },
        CursorLineNr = { fg = colors.yellow },
        CursorLineSign = { fg = colors.comment },
        SignColumn = { fg = colors.comment, bg = colors.background },

        CurSearch = { fg = colors.red, reverse = true },
        IncSearch = { fg = colors.lime, reverse = true },
        Search = { fg = colors.lime, reverse = true },
        MatchParen = { fg = colors.lime, reverse = true },
        Substitute = { fg = colors.lime, reverse = true },

        Folded = { fg = colors.inconspicuous },
        FoldColumn = { fg = colors.comment, bg = colors.background },
        CursorLineFold = { fg = colors.comment, bg = colors.stripline },

        Cursor = { fg = colors.red },
        lCursor = { fg = colors.red },
        CursorIM = { fg = colors.red },

        TermCursor = { fg = colors.red },
        TermCursorNC = { fg = colors.inconspicuous },

        DiffAdd = { fg = colors.green },
        DiffChange = { fg = colors.blue },
        DiffDelete = { fg = colors.red },
        DiffText = { fg = colors.red },

        LineNr = { fg = colors.comment },
        LineNrAbove = { fg = colors.comment },
        LineNrBelow = { fg = colors.comment },

        ErrorMsg = { fg = colors.red },
        WarningMsg = { fg = colors.yellow },
        ModeMsg = { fg = colors.foreground },
        MoreMsg = { fg = colors.green },
        MsgArea = { bg = colors.background },
        MsgSeparator = { fg = colors.splitline },

        WinSeparator = { fg = colors.splitline },
        FloatBorder = { fg = colors.splitline },

        Pmenu = { bg = colors.popupmenu },
        PmenuSel = { bg = colors.selection },
        PmenuSbar = { bg = colors.popupmenu },
        PmenuThumb = { bg = colors.selection },

        WildMenu = { bg = colors.selection },
        QuickFixLine = { bg = colors.selection },
        Visual = { bg = colors.selection },
        VisualNOS = { bg = colors.selection },

        SpellBad = { fg = colors.red, underline = true },
        SpellCap = { fg = colors.red, underline = true },
        SpellLocal = { fg = colors.red, underline = true },
        SpellRare = { fg = colors.red, underline = true },

        StatusLine = { fg = colors.blue, bg = colors.background },
        StatusLineNC = { bg = colors.popupmenu },
        TabLine = { bg = colors.popupmenu },
        TabLineFill = { bg = colors.popupmenu },
        TabLineSel = { fg = colors.blue, bg = colors.background },
        WinBar = { bg = colors.popupmenu },
        WinBarNC = { bg = colors.popupmenu },

        Conceal = { fg = colors.brown },
        Directory = { fg = colors.blue },
        Question = { fg = colors.red },
        Title = { fg = colors.red },

        EndOfBuffer = { fg = colors.inconspicuous },
        NonText = { fg = colors.inconspicuous },
        SpecialKey = { fg = colors.inconspicuous },
        Whitespace = { fg = colors.inconspicuous },
    },
    {
        -- syntax-highlighting
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
        Operator = { fg = colors.teal },
        Keyword = { fg = colors.purple },
        Exception = { fg = colors.purple },

        PreProc = { fg = colors.violet },
        Include = { fg = colors.violet },
        Define = { fg = colors.violet },
        Macro = { fg = colors.brown },
        PreCondit = { fg = colors.violet },

        Type = { fg = colors.red },
        StorageClass = { fg = colors.cyan },
        Structure = { fg = colors.purple },
        Typedef = { fg = colors.red },

        Special = { fg = colors.brown },
        SpecialChar = { fg = colors.brown },
        Tag = { fg = colors.brown },
        Delimiter = { fg = colors.foreground },
        SpecialComment = { fg = colors.red },
        Debug = { fg = colors.blue },

        Underlined = { underline = true },
        Ignore = { fg = colors.inconspicuous },
        Error = { fg = colors.red },
        Todo = { fg = colors.green },
    },
    {
        -- lsp-semantic-highlight
        ["@lsp.type.class"] = { fg = colors.red },
        ["@lsp.type.decorator"] = { fg = colors.brown },
        ["@lsp.type.enum"] = { fg = colors.red },
        ["@lsp.type.enumMember"] = { fg = colors.yellow },
        ["@lsp.type.function"] = { fg = colors.blue },
        ["@lsp.type.interface"] = { fg = colors.blue },
        ["@lsp.type.Keyword"] = { fg = colors.purple },
        ["@lsp.type.macro"] = { fg = colors.brown },
        ["@lsp.type.method"] = { fg = colors.blue },
        ["@lsp.type.namespace"] = { fg = colors.violet },
        ["@lsp.type.parameter"] = { fg = colors.foreground },
        ["@lsp.type.property"] = { fg = colors.violet },
        ["@lsp.type.struct"] = { fg = colors.red },
        ["@lsp.type.type"] = { fg = colors.red },
        ["@lsp.type.typeParameter"] = { fg = colors.red },
        ["@lsp.type.variable"] = { fg = colors.foreground },

        -- rust
        ["@lsp.type.lifetime.rust"] = { fg = colors.yellow },
        ["@lsp.type.selfKeyword.rust"] = { fg = colors.cyan },
        ["@lsp.type.selfTypeKeyword.rust"] = { fg = colors.cyan },

        ["@lsp.mod.async.rust"] = { fg = colors.cyan },
        ["@lsp.mod.constant.rust"] = { fg = colors.yellow },
        ["@lsp.mod.static.rust"] = { fg = colors.yellow },
    },

    {
        -- treesitter
        ["@parameter"] = { link = "@lsp.type.parameter" },
        ["@field"] = { link = "@lsp.type.property" },
        ["@property"] = { link = "@lsp.type.property" },
        ["@namespace"] = { link = "@lsp.type.namespace" },

        -- comment
        ["@text.todo"] = { fg = colors.violet, bold = true },
        ["@text.note"] = { fg = colors.green, bold = true },
        ["@text.warning"] = { fg = colors.yellow, bold = true },
        ["@text.danger"] = { fg = colors.red, bold = true },

        -- markdown and plain text
        ["@text.title"] = { fg = colors.blue, bold = true },
        ["@text.literal"] = { fg = colors.violet },
        ["@text.reference"] = { fg = colors.green, bold = true },
        ["@text.uri"] = { fg = colors.teal, underline = true },

        ["@text.emphasis"] = { fg = colors.violet, italic = true },
        ["@text.strike"] = { fg = colors.violet, strikethrough = true },
        ["@text.strong"] = { fg = colors.violet, bold = true },
    },
    {
        -- diagnostics
        DiagnosticError = { link = "ErrorMsg" },
        DiagnosticWarn = { link = "WarningMsg" },
        DiagnosticInfo = { link = "MoreMsg" },
        DiagnosticHint = { link = "MoreMsg" },
    },
    {
        -- gitsigns
        GitSignsAdd = { link = "DiffAdd" },
        GitSignsChange = { link = "DiffChange" },
        GitSignsDelete = { link = "DiffDelete" },
    },
    {
        -- hop
        HopNextKey = { fg = colors.red, bold = true },
        HopNextKey1 = { fg = colors.green, bold = true },
        HopNextKey2 = { fg = colors.blue, bold = true },
        HopUnmatched = { link = "NonText" },
        HopCursor = { link = "Cursor" },
    },
    {
        -- nvim-treehopper
        TSNodeKey = { link = "HopNextKey" },
        TSNodeUnmatched = { link = "HopUnmatched" },
    },
    {
        -- flash.nvim
        FlashBackdrop = { fg = colors.comment, bold = false },
        FlashMatch = { fg = colors.red, bold = true },
        FlashCurrent = { fg = colors.green, bold = true },
        FlashLabel = { fg = colors.blue, bold = true },
    },
    {
        -- telescope
        TelescopeBorder = { link = "FloatBorder" },
    },
    {
        -- nvim-bqf
        BqfPreviewFloat = { link = "NormalFloat" },
        BqfPreviewBorder = { link = "FloatBorder" },
        BqfPreviewCursor = { link = "Cursor" },
        BqfPreviewCursorLine = { link = "CursorLine" },
        BqfPreviewRange = { link = "IncSearch" },
        BqfPreviewBufLabel = { link = "Label" },
    },
    {
        -- nvim-cmp
        CmpItemAbbr = { link = "Normal" },
        CmpItemAbbrDeprecated = { link = "Ignore" },
        CmpItemAbbrMatch = { fg = colors.green },
        CmpItemAbbrMatchFuzzy = { fg = colors.violet },
        CmpItemKind = { fg = colors.lime },

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
    },
    {
        -- which-key.nvim
        WhichKey = { fg = colors.blue },
        WhichKeySeparator = { fg = colors.green },
        WhichKeyDesc = { fg = colors.red },
        WhichKeyGroup = { fg = colors.violet },
        WhichKeyValue = { fg = colors.violet },
    },
}

return groups
