" Terminal color definitions
let s:base00 = "00"
let s:base01 = "18"
let s:base02 = "19"
let s:base03 = "08"
let s:base04 = "20"
let s:base05 = "07"
let s:base06 = "21"
let s:base07 = "15"
let s:base08 = "01"
let s:base09 = "16"
let s:base0A = "03"
let s:base0B = "02"
let s:base0C = "06"
let s:base0D = "04"
let s:base0E = "05"
let s:base0F = "17"

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16"

" Highlighting function
fun <sid>hi(group, fg, bg, attr)
  if a:fg != ""
    exec "hi " . a:group . " ctermfg=" . a:fg
  endif
  if a:bg != ""
    exec "hi " . a:group . " ctermbg=" . a:bg
  endif
  if a:attr != ""
    exec "hi " . a:group . " cterm=" . a:attr
  endif
endfun

" Vim editor colors
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Debug",         s:base08, "", "")
call <sid>hi("Directory",     s:base0D, "", "")
call <sid>hi("ErrorMsg",      s:base08, s:base00, "")
call <sid>hi("Exception",     s:base08, "", "")
call <sid>hi("FoldColumn",    "", s:base01, "")
call <sid>hi("Folded",        s:base03, s:base01, "")
call <sid>hi("IncSearch",     s:base01, s:base09, "none")
call <sid>hi("Italic",        "", "", "none")
call <sid>hi("Macro",         s:base08, "", "")
call <sid>hi("MatchParen",    s:base09, "none",  "bold")
call <sid>hi("ModeMsg",       s:base0B, "", "")
call <sid>hi("MoreMsg",       s:base0B, "", "")
call <sid>hi("Question",      s:base0D, "", "")
call <sid>hi("Search",        s:base03, s:base0A,  "")
call <sid>hi("SpecialKey",    s:base03, "", "")
call <sid>hi("TooLong",       s:base08, "", "")
call <sid>hi("Underlined",    s:base08, "", "")
call <sid>hi("Visual",        "", s:base02, "")
call <sid>hi("VisualNOS",     s:base08, "", "")
call <sid>hi("WarningMsg",    s:base08, "", "")
call <sid>hi("WildMenu",      s:base08, "", "")
call <sid>hi("Title",         s:base0D, "", "none")
call <sid>hi("Conceal",       s:base0D, s:base00, "")
call <sid>hi("Cursor",        s:base00, s:base03, "")
call <sid>hi("NonText",       s:base02, "", "")
call <sid>hi("Normal",        s:base07, "", "")
call <sid>hi("LineNr",        s:base04, s:base01, "")
call <sid>hi("SignColumn",    s:base03, s:base01, "")
call <sid>hi("SpecialKey",    s:base03, "", "")
call <sid>hi("StatusLine",    s:base04, s:base02, "none")
call <sid>hi("StatusLineNC",  s:base03, s:base01, "none")
call <sid>hi("VertSplit",     s:base02, s:base02, "none")
call <sid>hi("ColorColumn",   "", s:base01, "none")
call <sid>hi("CursorColumn",  "", s:base01, "none")
call <sid>hi("CursorLine",    "", "none", "none")
call <sid>hi("CursorLineNr",  s:base07, s:base02, "")
call <sid>hi("PMenu",         s:base04, s:base01, "none")
call <sid>hi("PMenuSel",      s:base01, s:base04, "")
call <sid>hi("TabLine",       s:base03, s:base01, "none")
call <sid>hi("TabLineFill",   s:base03, s:base01, "none")
call <sid>hi("TabLineSel",    s:base0B, s:base01, "none")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:base0E, "", "")
call <sid>hi("Character",    s:base0A, "", "")
call <sid>hi("Comment",      s:base03, "", "")
call <sid>hi("Conditional",  s:base08, "", "")
call <sid>hi("Constant",     s:base0E, "", "")
call <sid>hi("Define",       s:base0E, "", "none")
call <sid>hi("Delimiter",    s:base04, "", "")
call <sid>hi("Float",        s:base0E, "", "")
call <sid>hi("Function",     s:base0B, "", "")
call <sid>hi("Identifier",   s:base07, "", "none")
call <sid>hi("Include",      s:base0D, "", "")
call <sid>hi("Keyword",      s:base08, "", "bold")
call <sid>hi("Label",        s:base0A, "", "")
call <sid>hi("Number",       s:base0E, "", "")
call <sid>hi("Operator",     s:base08, "", "none")
call <sid>hi("PreProc",      s:base0A, "", "")
call <sid>hi("Repeat",       s:base08, "", "")
call <sid>hi("Special",      s:base0E, "", "")
call <sid>hi("SpecialChar",  s:base0F, "", "")
call <sid>hi("Statement",    s:base08, "", "")
call <sid>hi("StorageClass", s:base08, "", "italic")
call <sid>hi("String",       s:base0A, "", "")
call <sid>hi("Structure",    s:base08, "", "")
call <sid>hi("Tag",          s:base09, "", "")
call <sid>hi("Todo",         s:base0A, s:base01, "")
call <sid>hi("Type",         s:base0D, "", "italic")
call <sid>hi("Typedef",      s:base0A, "", "")

" C++ highlighting
call <sid>hi("cOperator",    s:base0C, "", "")
call <sid>hi("cPreCondit",   s:base0E, "", "")
call <sid>hi("Member",       s:base0D, "", "")
call <sid>hi("Variable",     s:base0C, "", "")
call <sid>hi("Namespace",    s:base0F, "", "bold")
call <sid>hi("EnumConstant", s:base0D, "", "italic")

" CSS highlighting
call <sid>hi("cssBraces",      s:base05, "", "")
call <sid>hi("cssClassName",   s:base0E, "", "")
call <sid>hi("cssColor",       s:base0C, "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:base0B, s:base01, "")
call <sid>hi("DiffChange",   s:base03, s:base01, "")
call <sid>hi("DiffDelete",   s:base08, s:base01, "")
call <sid>hi("DiffText",     s:base0D, s:base01, "")
call <sid>hi("DiffAdded",    s:base0B, s:base00, "")
call <sid>hi("DiffFile",     s:base08, s:base00, "")
call <sid>hi("DiffNewFile",  s:base0B, s:base00, "")
call <sid>hi("DiffLine",     s:base0D, s:base00, "")
call <sid>hi("DiffRemoved",  s:base08, s:base00, "")

" Git highlighting
call <sid>hi("gitCommitOverflow",  s:base08, "", "")
call <sid>hi("gitCommitSummary",   s:base0B, "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:base0B, s:base01, "")
call <sid>hi("GitGutterChange",  s:base0D, s:base01, "")
call <sid>hi("GitGutterDelete",  s:base08, s:base01, "")
call <sid>hi("GitGutterChangeDelete",  s:base0E, s:base01, "")

" Go highlighting
hi def link goBuiltins     Function
hi def link goStruct       Type
hi def link goStructDef    Type
hi def link goInterface    Type
hi def link goInterfaceDef Type
hi def link goMethod       Member

" HTML highlighting
call <sid>hi("htmlBold",    s:base0A, "", "")
call <sid>hi("htmlItalic",  s:base0E, "", "")
call <sid>hi("htmlEndTag",  s:base05, "", "")
call <sid>hi("htmlTag",     s:base05, "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:base05, "", "")
call <sid>hi("javaScriptBraces",  s:base05, "", "")
call <sid>hi("javaScriptNumber",  s:base09, "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:base0B, "", "")
call <sid>hi("markdownError",             s:base05, s:base00, "")
call <sid>hi("markdownCodeBlock",         s:base0B, "", "")
call <sid>hi("markdownHeadingDelimiter",  s:base0D, "", "")

" NERDTree highlighting
"call <sid>hi("NERDTreeDirSlash",  s:base0D, "", "")
"call <sid>hi("NERDTreeExecFile",  s:base05, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:base05, "", "")
call <sid>hi("phpComparison",      s:base05, "", "")
call <sid>hi("phpParent",          s:base05, "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:base0E, "", "")
call <sid>hi("pythonRepeat",    s:base0E, "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:base0D, "", "")
call <sid>hi("rubyConstant",                s:base0A, "", "")
call <sid>hi("rubyInterpolation",           s:base0B, "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:base0F, "", "")
call <sid>hi("rubyRegexp",                  s:base0C, "", "")
call <sid>hi("rubySymbol",                  s:base0B, "", "")
call <sid>hi("rubyStringDelimiter",         s:base0B, "", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:base08, "", "")
call <sid>hi("sassClassChar",  s:base09, "", "")
call <sid>hi("sassInclude",    s:base0E, "", "")
call <sid>hi("sassMixing",     s:base0E, "", "")
call <sid>hi("sassMixinName",  s:base0D, "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:base0B, s:base01, "")
call <sid>hi("SignifySignChange",  s:base0D, s:base01, "")
call <sid>hi("SignifySignDelete",  s:base08, s:base01, "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:base00, "undercurl")
call <sid>hi("SpellLocal",   "", s:base00, "undercurl")
call <sid>hi("SpellCap",     "", s:base00, "undercurl")
call <sid>hi("SpellRare",    "", s:base00, "undercurl")

" cleanup
delf <sid>hi
unlet s:base00 s:base01 s:base02 s:base03 s:base04 s:base05 s:base06 s:base07 s:base08 s:base09 s:base0A s:base0B s:base0C s:base0D s:base0E s:base0F
