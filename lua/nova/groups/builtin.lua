local colors = require("nova").colors

-- stylua: ignore
return {
    ColorColumn    = { bg = colors.stripline },
    Conceal        = { bg = colors.inconspicuous },
    Cursor         = { fg = colors.red },
    lCursor        = { fg = colors.red },
    CursorIM       = { fg = colors.red },
    CursorColumn   = { bg = colors.stripline },
    CursorLine     = { bg = colors.stripline },
    Directory      = { fg = colors.blue },
    DiffAdd        = { fg = colors.background, bg = colors.green },
    DiffChange     = { fg = colors.background, bg = colors.blue },
    DiffDelete     = { fg = colors.background, bg = colors.red },
    DiffText       = { fg = colors.background, bg = colors.red },
    EndOfBuffer    = { fg = colors.inconspicuous },
    TermCursor     = { fg = colors.red },
    TermCursorNC   = { fg = colors.inconspicuous },
    ErrorMsg       = { fg = colors.red },
    VertSplit      = { fg = colors.splitline },
    WinSeparator   = { fg = colors.splitline },
    FloatBorder    = { fg = colors.splitline },
    Folded         = { fg = colors.selection },
    FoldColumn     = { fg = colors.selection },
    SignColumn     = { fg = colors.blue },
    IncSearch      = { fg = colors.background, bg = colors.brown },
    Substitute     = { fg = colors.background, bg = colors.brown },
    LineNr         = { fg = colors.inconspicuous },
    LineNrAbove    = { fg = colors.inconspicuous },
    LineNrBelow    = { fg = colors.inconspicuous },
    CursorLineNr   = { fg = colors.yellow, bold = true },
    CursorLineSign = { fg = colors.inconspicuous, bold = true },
    CursorLineFold = { fg = colors.inconspicuous, bold = true },
    MatchParen     = { fg = colors.background, bg = colors.brown },
    ModeMsg        = { fg = colors.green },
    MsgArea        = { bg = colors.background },
    MsgSeparator   = { fg = colors.splitline },
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
    QuickFixLine   = { bg = colors.splitline },
    Search         = { fg = colors.background, bg = colors.brown },
    SpecialKey     = { fg = colors.brown },
    SpellBad       = { fg = colors.red, undercurl = true },
    SpellCap       = { fg = colors.green, undercurl = true },
    SpellLocal     = { fg = colors.red, undercurl = true },
    SpellRare      = { fg = colors.blue, undercurl = true },
    StatusLine     = { fg = colors.yellow, bg = colors.stripline },
    StatusLineNC   = { fg = colors.foreground, bg = colors.stripline },
    TabLine        = { fg = colors.foreground, bg = colors.stripline },
    TabLineFill    = { bg = colors.stripline },
    TabLineSel     = { fg = colors.yellow, bg = colors.stripline },
    Title          = { fg = colors.red, bold = true },
    Visual         = { bg = colors.selection },
    VisualNOS      = { bg = colors.red },
    WarningMsg     = { fg = colors.red },
    Whitespace     = { fg = colors.inconspicuous },
    WildMenu       = { fg = colors.green, bg = colors.stripline, bold = true },
}
