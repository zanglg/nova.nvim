" 'nova.vim' -- A color scheme, only supports 24bit true color
" Maintainer: Zang Leigang (zang.lg@outlook.com)
" Thanks http://materialuicolors.co, great colors

hi clear
if exists("syntax_on")
	syntax reset
endif
let colors_name = 'nova'

" Default Color Definitions
if &background == "light"
	" Grey 800/600/300/200/50
	let s:foreground    = "#424242"
	let s:inconspicuous = "#757575"
	let s:selection     = "#E0E0E0"
	let s:line          = "#EEEEEE"
	let s:background    = "#fafafa"

	let s:red           = "#D32F2F"
	let s:pink          = "#C2185B"
	let s:purple        = "#7B1FA2"
	let s:deep_purple   = "#512DA8"
	let s:indigo        = "#303F9F"
	let s:blue          = "#1976D2"
	let s:light_blue    = "#0288D1"
	let s:cyan          = "#0097A7"
	let s:teal          = "#00796B"
	let s:green         = "#388E3C"
	let s:light_green   = "#689F38"
	let s:lime          = "#AFB42B"
	let s:yellow        = "#FBC02D"
	let s:amber         = "#FFA000"
	let s:orange        = "#F57C00"
	let s:deep_orange   = "#E64A19"
else
	" Blue Grey 50/200/700/800/900
	let s:foreground    = "#ECEFF1"
	let s:inconspicuous = "#B0BEC5"
	let s:selection     = "#455A64"
	let s:line          = "#37474F"
	let s:background    = "#263238"

	let s:red           = "#EF5350"
	let s:pink          = "#EC407A"
	let s:purple        = "#AB47BC"
	let s:deep_purple   = "#7E57C2"
	let s:indigo        = "#5C6BC0"
	let s:blue          = "#42A5F5"
	let s:light_blue    = "#29B6F6"
	let s:cyan          = "#26C6DA"
	let s:teal          = "#26A69A"
	let s:green         = "#66BB6A"
	let s:light_green   = "#9CCC65"
	let s:lime          = "#D4E157"
	let s:yellow        = "#FFEE58"
	let s:amber         = "#FFCA28"
	let s:orange        = "#FFA726"
	let s:deep_orange   = "#FF7043"
endif

	let s:bold          = "bold"
	let s:none          = "none"
	let s:reverse       = "reverse"
	let s:undercurl     = "undercurl"
	let s:underline     = "underline"

fun! s:HL(group, guifg, guibg, gui)
	let histring = "hi " . a:group

	if a:guifg != ''
		let histring .= " guifg= " . a:guifg
	endif

	if a:guibg != ''
		let histring .= " guibg= " . a:guibg
	endif

	if a:gui != ''
		let histring .= " gui= " . a:gui
	endif

	execute histring
endfun

" General highlight group
call s:HL("Normal"         , s:foreground    , s:background    , '')

call s:HL("ColorColumn"    , ''              , s:line          , '')
call s:HL("Conceal"        , s:line          , s:selection     , '')
call s:HL("CursorColumn"   , ''              , s:line          , '')
call s:HL("CursorLine"     , ''              , s:line          , '')
call s:HL("CursorLineNr"   , s:deep_orange   , ''              , s:bold)
call s:HL("DiffAdd"        , s:light_green   , s:line          , '')
call s:HL("DiffChange"     , ''              , s:line          , '')
call s:HL("DiffDelete"     , s:red           , s:line          , '')
call s:HL("DiffText"       , s:red           , s:line          , s:bold)
call s:HL("Directory"      , s:blue          , ''              , '')
call s:HL("ErrorMsg"       , s:foreground    , s:red           , '')
call s:HL("FoldColumn"     , s:selection     , s:background    , '')
call s:HL("Folded"         , s:selection     , s:background    , '')
call s:HL("IncSearch"      , ''              , s:orange        , s:none)
call s:HL("LineNr"         , s:inconspicuous , ''              , '')
call s:HL("MatchParen"     , ''              , s:selection     , '')
call s:HL("ModeMsg"        , s:light_green   , ''              , s:bold)
call s:HL("MoreMsg"        , s:light_green   , ''              , s:bold)
call s:HL("NonText"        , s:selection     , ''              , s:bold)
call s:HL("Pmenu"          , s:foreground    , s:selection     , '')
call s:HL("PmenuSbar"      , ''              , s:inconspicuous , '')
call s:HL("PmenuSel"       , s:blue          , s:selection     , s:reverse)
call s:HL("PmenuThumb"     , ''              , s:inconspicuous , '')
call s:HL("Question"       , s:light_green   , ''              , s:bold)
call s:HL("Search"         , s:foreground    , s:orange        , '')
call s:HL("SignColumn"     , s:blue          , s:background    , '')
call s:HL("SpecialKey"     , s:selection     , ''              , '')
call s:HL("SpellBad"       , ''              , ''              , s:undercurl)
call s:HL("SpellCap"       , ''              , ''              , s:undercurl)
call s:HL("SpellLocal"     , ''              , ''              , s:undercurl)
call s:HL("SpellRare"      , ''              , ''              , s:undercurl)
call s:HL("StatusLine"     , s:lime          , s:line          , s:bold)
call s:HL("StatusLineNC"   , s:foreground    , s:line          , s:none)
call s:HL("TabLine"        , s:foreground    , s:line          , s:none)
call s:HL("TabLineFill"    , ''              , s:line          , s:none)
call s:HL("TabLineSel"     , s:lime          , s:line          , s:bold)
call s:HL("TermCursor"     , ''              , ''              , s:reverse)
call s:HL("Title"          , s:foreground    , ''              , s:bold)
call s:HL("VertSplit"      , s:line          , s:line          , '')
call s:HL("Visual"         , ''              , s:selection     , '')
call s:HL("WarningMsg"     , s:red           , ''              , '')
call s:HL("WildMenu"       , s:red           , s:line          , s:bold)

" Standard syntax highlight group
call s:HL("Boolean"        , s:amber         , ''              , '')
call s:HL("Character"      , s:amber         , ''              , '')
call s:HL("Comment"        , s:inconspicuous , ''              , '')
call s:HL("Conditional"    , s:deep_orange   , ''              , '')
call s:HL("Constant"       , s:amber         , ''              , '')
call s:HL("Debug"          , s:foreground    , ''              , '')
call s:HL("Define"         , s:purple        , ''              , '')
call s:HL("Delimiter"      , s:foreground    , ''              , '')
call s:HL("EndOfBuffer"    , s:selection     , ''              , s:bold)
call s:HL("Error"          , s:foreground    , s:red           , '')
call s:HL("Exception"      , s:light_green   , ''              , s:bold)
call s:HL("Float"          , s:amber         , ''              , '')
call s:HL("Function"       , s:blue          , ''              , '')
call s:HL("Identifier"     , s:red           , ''              , '')
call s:HL("Ignore"         , s:inconspicuous , ''              , '')
call s:HL("Include"        , s:blue          , ''              , '')
call s:HL("Keyword"        , s:light_green   , ''              , s:bold)
call s:HL("Label"          , s:light_green   , ''              , s:bold)
call s:HL("Macro"          , s:cyan          , ''              , '')
call s:HL("Number"         , s:amber         , ''              , '')
call s:HL("Operator"       , s:teal          , ''              , s:bold)
call s:HL("PreCondit"      , s:cyan          , ''              , '')
call s:HL("PreProc"        , s:cyan          , ''              , '')
call s:HL("Repeat"         , s:purple        , ''              , '')
call s:HL("Special"        , s:foreground    , ''              , '')
call s:HL("SpecialChar"    , s:foreground    , ''              , '')
call s:HL("SpecialComment" , s:foreground    , ''              , '')
call s:HL("Statement"      , s:light_green   , ''              , s:bold)
call s:HL("StorageClass"   , s:cyan          , ''              , s:none)
call s:HL("String"         , s:light_green   , ''              , '')
call s:HL("Structure"      , s:purple        , ''              , '')
call s:HL("Tag"            , s:foreground    , ''              , '')
call s:HL("Todo"           , s:pink          , s:background    , s:bold)
call s:HL("Type"           , s:pink          , ''              , s:none)
call s:HL("Typedef"        , s:pink          , ''              , s:none)
call s:HL("Underlined"     , s:blue          , ''              , s:underline)

" diff
call s:HL("diffAdded"      , s:light_green   , s:line          , '')
call s:HL("diffChanged"    , ''              , s:line          , '')
call s:HL("diffRemoved"    , s:red           , s:line          , '')
