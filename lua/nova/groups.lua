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

        Folded = { fg = colors.cyan },
        FoldColumn = { fg = colors.comment, bg = colors.background },
        CursorLineFold = { fg = colors.comment, bg = colors.stripline },

        Cursor = { fg = colors.red },
        lCursor = { fg = colors.red },
        CursorIM = { fg = colors.red },

        TermCursor = { fg = colors.red },
        TermCursorNC = { fg = colors.inconspicuous },

        DiffAdd = { fg = colors.green, reverse = true },
        DiffChange = { fg = colors.blue, reverse = true },
        DiffDelete = { fg = colors.red, reverse = true },
        DiffText = { fg = colors.red },

        LineNr = { fg = colors.comment },
        LineNrAbove = { fg = colors.comment },
        LineNrBelow = { fg = colors.comment },

        ErrorMsg = { fg = colors.red },
        WarningMsg = { fg = colors.yellow },
        ModeMsg = { fg = colors.foreground },
        MoreMsg = { fg = colors.green },
        MsgArea = { bg = colors.background },
        MsgSeparator = { fg = colors.stripline },

        WinSeparator = { fg = colors.stripline },
        FloatBorder = { fg = colors.stripline },

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

        Conceal = { fg = colors.red },
        Directory = { fg = colors.red },
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
        Operator = { fg = colors.cyan },
        Keyword = { fg = colors.purple },
        Exception = { fg = colors.purple },

        PreProc = { fg = colors.violet },
        Include = { fg = colors.violet },
        Define = { fg = colors.violet },
        Macro = { fg = colors.brown },
        PreCondit = { fg = colors.violet },

        Type = { fg = colors.red },
        StorageClass = { fg = colors.purple },
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
        ["@lsp.type.decorator"] = { fg = colors.blue },
        ["@lsp.type.enum"] = { fg = colors.red },
        ["@lsp.type.enumMember"] = { fg = colors.yellow },
        ["@lsp.type.function"] = { fg = colors.blue },
        ["@lsp.type.interface"] = { fg = colors.lime },
        ["@lsp.type.macro"] = { fg = colors.brown },
        ["@lsp.type.method"] = { fg = colors.blue },
        ["@lsp.type.namespace"] = { fg = colors.violet },
        ["@lsp.type.parameter"] = { fg = colors.teal },
        ["@lsp.type.property"] = { fg = colors.violet },
        ["@lsp.type.struct"] = { fg = colors.red },
        ["@lsp.type.type"] = { fg = colors.red },
        ["@lsp.type.typeParameter"] = { fg = colors.lime },
        ["@lsp.type.variable"] = { fg = colors.foreground },
    },

    {
        -- diagnostics
        DiagnosticError = { link = "ErrorMsg" },
        DiagnosticWarn = { link = "WarningMsg" },
        DiagnosticInfo = { link = "MoreMsg" },
        DiagnosticHint = { link = "MoreMsg" },
    },

    -- treesitter
    {
        ["@parameter"] = { link = "@lsp.type.parameter" },
        ["@field"] = { link = "@lsp.type.property" },
        ["@property"] = { link = "@lsp.type.property" },
        ["@namespace"] = { link = "@lsp.type.namespace" },
        ["@text.title"] = { link = "Title" },
        ["@text.literal"] = { link = "Title" },
    },

    {
        -- gitsigns
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.blue },
        GitSignsDelete = { fg = colors.red },
    },

    {
        -- Hop
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
}

for _, group in ipairs(groups) do
    for hl, col in pairs(group) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end
