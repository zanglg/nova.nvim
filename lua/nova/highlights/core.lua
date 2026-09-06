return function(colors, opts)
    local background = opts.transparent and "NONE" or colors.background

    return {
        Normal = { fg = colors.foreground, bg = background },
        NormalFloat = { fg = colors.foreground, bg = colors.popupmenu },
        NormalNC = { fg = colors.foreground },

        ColorColumn = { bg = colors.stripline },
        CursorColumn = { bg = colors.stripline },
        CursorLine = { bg = colors.stripline },
        CursorLineNr = { fg = colors.yellow },
        CursorLineSign = { fg = colors.comment },
        SignColumn = { fg = colors.comment, bg = background },

        CurSearch = { fg = colors.red, reverse = true },
        IncSearch = { fg = colors.attention, reverse = true },
        Search = { fg = colors.attention, reverse = true },
        MatchParen = { fg = colors.attention, reverse = true },
        Substitute = { fg = colors.attention, reverse = true },

        Folded = { fg = colors.inconspicuous },
        FoldColumn = { fg = colors.comment, bg = background },
        CursorLineFold = { fg = colors.comment, bg = colors.stripline },

        Cursor = { fg = colors.red },
        lCursor = { fg = colors.red },
        CursorIM = { fg = colors.red },

        TermCursor = { fg = colors.red },
        TermCursorNC = { fg = colors.inconspicuous },

        DiffAdd = { bg = colors.diff_add_bg },
        DiffChange = { bg = colors.diff_change_bg },
        DiffDelete = { bg = colors.diff_delete_bg },
        DiffText = { bg = colors.diff_text_bg },
        diffAdded = { fg = colors.green, bg = colors.diff_add_bg },
        diffChanged = { fg = colors.blue, bg = colors.diff_change_bg },
        diffRemoved = { fg = colors.red, bg = colors.diff_delete_bg },
        Added = { fg = colors.green },
        Changed = { fg = colors.blue },
        Removed = { fg = colors.red },

        LineNr = { fg = colors.comment },
        LineNrAbove = { fg = colors.comment },
        LineNrBelow = { fg = colors.comment },

        ErrorMsg = { fg = colors.red },
        WarningMsg = { fg = colors.yellow },
        OkMsg = { fg = colors.green },
        ModeMsg = { fg = colors.foreground },
        MoreMsg = { fg = colors.green },
        MsgArea = { bg = background },
        MsgSeparator = { fg = colors.splitline },

        WinSeparator = { fg = colors.splitline },
        FloatBorder = { fg = colors.splitline },
        FloatTitle = { link = "Title" },
        FloatFooter = { link = "Comment" },

        Pmenu = { bg = colors.popupmenu },
        PmenuSel = { bg = colors.selection },
        PmenuSbar = { bg = colors.popupmenu },
        PmenuThumb = { bg = colors.selection },
        PmenuBorder = { link = "FloatBorder" },
        PmenuKind = { fg = colors.comment, bg = colors.popupmenu },
        PmenuKindSel = { fg = colors.comment, bg = colors.selection },
        PmenuExtra = { fg = colors.comment, bg = colors.popupmenu },
        PmenuExtraSel = { fg = colors.comment, bg = colors.selection },
        PmenuMatch = { fg = colors.teal, bg = colors.popupmenu },
        PmenuMatchSel = { fg = colors.teal, bg = colors.selection },
        PreInsert = { fg = colors.inconspicuous },
        ComplMatchIns = { fg = colors.inconspicuous },
        ComplHint = { fg = colors.inconspicuous },
        ComplHintMore = { fg = colors.inconspicuous },

        WildMenu = { bg = colors.selection },
        QuickFixLine = { bg = colors.selection },
        Visual = { bg = colors.selection },
        VisualNOS = { bg = colors.selection },

        SpellBad = { undercurl = true, sp = colors.red },
        SpellCap = { undercurl = true, sp = colors.yellow },
        SpellLocal = { undercurl = true, sp = colors.green },
        SpellRare = { undercurl = true, sp = colors.teal },

        StatusLine = { fg = colors.blue, bg = background },
        StatusLineNC = { bg = colors.popupmenu },
        TabLine = { bg = colors.popupmenu },
        TabLineFill = { bg = colors.popupmenu },
        TabLineSel = { fg = colors.blue, bg = background },
        WinBar = { bg = colors.popupmenu },
        WinBarNC = { bg = colors.popupmenu },

        Conceal = { fg = colors.orange },
        Directory = { fg = colors.blue },
        Question = { fg = colors.red },
        Title = { fg = colors.red },

        EndOfBuffer = { fg = colors.inconspicuous },
        NonText = { fg = colors.inconspicuous },
        SpecialKey = { fg = colors.inconspicuous },
        Whitespace = { fg = colors.inconspicuous },
    }
end
