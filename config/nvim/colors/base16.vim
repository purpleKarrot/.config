" Terminal color definitions
let s:base00 = "00"  " #ffffff - Default Background
let s:base01 = "18"  " #e0e0e0 - Lighter Background (Used for status bars)
let s:base02 = "19"  " #d6d6d6 - Selection Background
let s:base03 = "08"  " #8e908c - Comments, Invisibles, Line Highlighting
let s:base04 = "20"  " #969896 - Dark Foreground (Used for status bars)
let s:base05 = "07"  " #4d4d4c - Default Foreground, Caret, Delimiters, Operators
let s:base06 = "21"  " #282a2e - Light Foreground (Not often used)
let s:base07 = "15"  " #1d1f21 - Light Background (Not often used)
let s:base08 = "01"  " #c82829 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
let s:base09 = "16"  " #f5871f - Integers, Boolean, Constants, XML Attributes, Markup Link Url
let s:base0A = "03"  " #eab700 - Classes, Markup Bold, Search Text Background
let s:base0B = "02"  " #718c00 - Strings, Inherited Class, Markup Code, Diff Inserted
let s:base0C = "06"  " #3e999f - Support, Regular Expressions, Escape Characters, Markup Quotes
let s:base0D = "04"  " #4271ae - Functions, Methods, Attribute IDs, Headings
let s:base0E = "05"  " #8959a8 - Keywords, Storage, Selector, Markup Italic, Diff Changed
let s:base0F = "17"  " #a3685a - Deprecated, Opening/Closing Embedded Language Tags e.g. <?php ?>

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16"

" Highlighting function
fun! s:HL(group, fg, bg, attr)
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
call s:HL("Bold",          "", "", "bold")
call s:HL("Debug",         s:base08, "", "")
call s:HL("Directory",     s:base0D, "", "")
call s:HL("Error",         s:base00, s:base08, "")
call s:HL("ErrorMsg",      s:base08, s:base00, "")
call s:HL("Exception",     s:base08, "", "")
call s:HL("FoldColumn",    s:base0C, s:base01, "")
call s:HL("Folded",        s:base03, s:base01, "")
call s:HL("IncSearch",     s:base01, s:base09, "none")
call s:HL("Italic",        "", "", "none")
call s:HL("Macro",         s:base08, "", "")
call s:HL("MatchParen",    "", s:base03, "")
call s:HL("ModeMsg",       s:base0B, "", "")
call s:HL("MoreMsg",       s:base0B, "", "")
call s:HL("Question",      s:base0D, "", "")
call s:HL("Search",        s:base03, s:base0A, "")
call s:HL("SpecialKey",    s:base03, "", "")
call s:HL("TooLong",       s:base08, "", "")
call s:HL("Underlined",    s:base08, "", "")
call s:HL("Visual",        "", s:base02, "")
call s:HL("VisualNOS",     s:base08, "", "")
call s:HL("WarningMsg",    s:base08, "", "")
call s:HL("WildMenu",      s:base08, "", "")
call s:HL("Title",         s:base0D, "", "none")
call s:HL("Conceal",       s:base0D, s:base00, "")
call s:HL("Cursor",        s:base00, s:base05, "")
call s:HL("NonText",       s:base03, "", "")
call s:HL("Normal",        s:base05, s:base00, "")
call s:HL("LineNr",        s:base03, s:base01, "")
call s:HL("SignColumn",    s:base03, s:base01, "")
call s:HL("StatusLine",    s:base04, s:base02, "none")
call s:HL("StatusLineNC",  s:base03, s:base01, "none")
call s:HL("VertSplit",     s:base02, s:base02, "none")
call s:HL("ColorColumn",   "", s:base01, "none")
call s:HL("CursorColumn",  "", s:base01, "none")
call s:HL("CursorLine",    "", s:base01, "none")
call s:HL("CursorLineNr",  s:base04, s:base01, "")
call s:HL("PMenu",         s:base04, s:base01, "none")
call s:HL("PMenuSel",      s:base01, s:base04, "")
call s:HL("TabLine",       s:base03, s:base01, "none")
call s:HL("TabLineFill",   s:base03, s:base01, "none")
call s:HL("TabLineSel",    s:base0B, s:base01, "none")

" Standard syntax highlighting
call s:HL("Boolean",      s:base09, "", "bold")
call s:HL("Character",    s:base08, "", "")
call s:HL("Comment",      s:base03, "", "")
call s:HL("Conditional",  s:base0E, "", "bold")
call s:HL("Constant",     s:base09, "", "bold")
call s:HL("Define",       s:base0E, "", "none")
call s:HL("Delimiter",    s:base0F, "", "")
call s:HL("Float",        s:base09, "", "bold")
call s:HL("Function",     s:base0D, "", "")
call s:HL("Identifier",   s:base08, "", "none")
call s:HL("Include",      s:base0D, "", "")
call s:HL("Keyword",      s:base0E, "", "bold")
call s:HL("Label",        s:base0A, "", "")
call s:HL("Number",       s:base09, "", "bold")
call s:HL("Operator",     s:base05, "", "none")
call s:HL("PreProc",      s:base0A, "", "")
call s:HL("Repeat",       s:base0E, "", "bold")
call s:HL("Special",      s:base0C, "", "")
call s:HL("SpecialChar",  s:base0F, "", "")
call s:HL("Statement",    s:base08, "", "")
call s:HL("StorageClass", s:base0E, "", "bold,italic")
call s:HL("String",       s:base0B, "", "")
call s:HL("Structure",    s:base0E, "", "bold")
call s:HL("Tag",          s:base0A, "", "")
call s:HL("Todo",         s:base0A, s:base01, "")
call s:HL("Type",         s:base0A, "", "bold")
call s:HL("Typedef",      s:base0A, "", "")

" C++ highlighting
hi def link cppCast       Keyword
hi def link cppAccess     Keyword
call s:HL("cOperator",    s:base0C, "", "")
call s:HL("cPreCondit",   s:base0E, "", "")
call s:HL("Member",       s:base0D, "", "")
call s:HL("Variable",     s:base0C, "", "")
call s:HL("Namespace",    s:base0F, "", "bold")
call s:HL("EnumConstant", s:base0D, "", "italic")

" CSS highlighting
call s:HL("cssBraces",      s:base05, "", "")
call s:HL("cssClassName",   s:base0E, "", "")
call s:HL("cssColor",       s:base0C, "", "")

" Diff highlighting
call s:HL("DiffAdd",      s:base0B, s:base01, "")
call s:HL("DiffChange",   s:base03, s:base01, "")
call s:HL("DiffDelete",   s:base08, s:base01, "")
call s:HL("DiffText",     s:base0D, s:base01, "")
call s:HL("DiffAdded",    s:base0B, s:base00, "")
call s:HL("DiffFile",     s:base08, s:base00, "")
call s:HL("DiffNewFile",  s:base0B, s:base00, "")
call s:HL("DiffLine",     s:base0D, s:base00, "")
call s:HL("DiffRemoved",  s:base08, s:base00, "")

" Git highlighting
call s:HL("gitCommitOverflow",  s:base08, "", "")
call s:HL("gitCommitSummary",   s:base0B, "", "")

" GitGutter highlighting
call s:HL("GitGutterAdd",     s:base0B, s:base01, "")
call s:HL("GitGutterChange",  s:base0D, s:base01, "")
call s:HL("GitGutterDelete",  s:base08, s:base01, "")
call s:HL("GitGutterChangeDelete",  s:base0E, s:base01, "")

" Go highlighting
hi def link goBuiltins     Function
hi def link goStruct       Type
hi def link goStructDef    Type
hi def link goInterface    Type
hi def link goInterfaceDef Type
hi def link goMethod       Member

" HTML highlighting
call s:HL("htmlBold",    s:base0A, "", "")
call s:HL("htmlItalic",  s:base0E, "", "")
call s:HL("htmlEndTag",  s:base05, "", "")
call s:HL("htmlTag",     s:base05, "", "")

" JavaScript highlighting
call s:HL("javaScript",        s:base05, "", "")
call s:HL("javaScriptBraces",  s:base05, "", "")
call s:HL("javaScriptNumber",  s:base09, "", "")

" Markdown highlighting
call s:HL("markdownCode",              s:base0B, "", "")
call s:HL("markdownError",             s:base05, s:base00, "")
call s:HL("markdownCodeBlock",         s:base0B, "", "")
call s:HL("markdownHeadingDelimiter",  s:base0D, "", "")

" NERDTree highlighting
"call s:HL("NERDTreeDirSlash",  s:base0D, "", "")
"call s:HL("NERDTreeExecFile",  s:base05, "", "")

" PHP highlighting
call s:HL("phpMemberSelector",  s:base05, "", "")
call s:HL("phpComparison",      s:base05, "", "")
call s:HL("phpParent",          s:base05, "", "")

" Python highlighting
call s:HL("pythonOperator",  s:base0E, "", "")
call s:HL("pythonRepeat",    s:base0E, "", "")

" Ruby highlighting
call s:HL("rubyAttribute",               s:base0D, "", "")
call s:HL("rubyConstant",                s:base0A, "", "")
call s:HL("rubyInterpolation",           s:base0B, "", "")
call s:HL("rubyInterpolationDelimiter",  s:base0F, "", "")
call s:HL("rubyRegexp",                  s:base0C, "", "")
call s:HL("rubySymbol",                  s:base0B, "", "")
call s:HL("rubyStringDelimiter",         s:base0B, "", "")

" SASS highlighting
call s:HL("sassidChar",     s:base08, "", "")
call s:HL("sassClassChar",  s:base09, "", "")
call s:HL("sassInclude",    s:base0E, "", "")
call s:HL("sassMixing",     s:base0E, "", "")
call s:HL("sassMixinName",  s:base0D, "", "")

" Signify highlighting
call s:HL("SignifySignAdd",     s:base0B, s:base01, "")
call s:HL("SignifySignChange",  s:base0D, s:base01, "")
call s:HL("SignifySignDelete",  s:base08, s:base01, "")

" Spelling highlighting
call s:HL("SpellBad",     "", s:base00, "undercurl")
call s:HL("SpellLocal",   "", s:base00, "undercurl")
call s:HL("SpellCap",     "", s:base00, "undercurl")
call s:HL("SpellRare",    "", s:base00, "undercurl")

" Plugin: Startify
call s:HL("StartifyFile",    s:base08, "", "bold")
call s:HL("StartifyNumber",  s:base09, "", "")
call s:HL("StartifyHeader",  s:base03, "", "")
call s:HL("StartifySection", s:base0D, "", "bold")
call s:HL("StartifyPath",    s:base05, "", "")
call s:HL("StartifySlash",   s:base04, "", "")
call s:HL("StartifyBracket", s:base04, "", "")
call s:HL("StartifySpecial", s:base0E, "", "")
