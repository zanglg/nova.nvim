local colors = require("nova").colors

-- stylua: ignore
return {
    ColorColumn    = { bg = colors.line },
    Conceal        = { bg = colors.line },
    Cursor         = { fg = colors.red },
    lCursor        = { fg = colors.red },
    CursorIM       = { fg = colors.red },
    CursorColumn   = { bg = colors.line },
    CursorLine     = { bg = colors.line },
    Directory      = { fg = colors.blue },
    DiffAdd        = { bg = colors.green },
    DiffChange     = { bg = colors.blue },
    DiffDelete     = { bg = colors.red },
    DiffText       = { bg = colors.blue },
    EndOfBuffer    = { fg = colors.inconspicuous },
    TermCursor     = { fg = colors.red },
    TermCursorNC   = { fg = colors.inconspicuous },
    ErrorMsg       = { fg = colors.red },
    VertSplit      = { fg = colors.selection },
    WinSeparator   = { fg = colors.selection },
    Folded         = { fg = colors.selection },
    FoldColumn     = { fg = colors.selection },
    SignColumn     = { fg = colors.blue },
    IncSearch      = { fg = colors.background, bg = colors.orange },
    Substitute     = { fg = colors.background, bg = colors.orange },
    LineNr         = { fg = colors.inconspicuous },
    LineNrAbove    = { fg = colors.inconspicuous },
    LineNrBelow    = { fg = colors.inconspicuous },
    CursorLineNr   = { fg = colors.yellow, bold = true },
    CursorLineSign = { fg = colors.inconspicuous, bold = true },
    CursorLineFold = { fg = colors.inconspicuous, bold = true },
    MatchParen     = { fg = colors.background, bg = colors.orange },
    ModeMsg        = { fg = colors.green },
    MsgArea        = { bg = colors.background },
    MsgSeparator   = { fg = colors.line },
    MoreMsg        = { fg = colors.green },
    NonText        = { fg = colors.inconspicuous },
    Normal         = { fg = colors.foreground, bg = colors.background },
    NormalFloat    = { fg = colors.foreground, bg = colors.background },
    NormalNC       = { fg = colors.foreground, bg = colors.background },
    Pmenu          = { fg = colors.foreground, bg = colors.selection },
    PmenuSbar      = { bg = colors.inconspicuous },
    PmenuSel       = { fg = colors.selection, bg = colors.blue },
    PmenuThumb     = { bg = colors.inconspicuous },
    Question       = { fg = colors.green },
    QuickFixLine   = { bg = colors.line },
    Search         = { fg = colors.background, bg = colors.orange },
    SpecialKey     = { fg = colors.orange },
    SpellBad       = { fg = colors.red, undercurl = true },
    SpellCap       = { fg = colors.green, undercurl = true },
    SpellLocal     = { fg = colors.red, undercurl = true },
    SpellRare      = { fg = colors.blue, undercurl = true },
    StatusLine     = { fg = colors.yellow, bg = colors.line },
    StatusLineNC   = { fg = colors.foreground, bg = colors.line },
    TabLine        = { fg = colors.foreground, bg = colors.line },
    TabLineFill    = { bg = colors.line },
    TabLineSel     = { fg = colors.yellow, bg = colors.line },
    Title          = { fg = colors.red, bold = true },
    Visual         = { bg = colors.selection },
    VisualNOS      = { bg = colors.red },
    WarningMsg     = { fg = colors.red },
    Whitespace     = { fg = colors.inconspicuous },
    WildMenu       = { fg = colors.green, bg = colors.line, bold = true },
}
