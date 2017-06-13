let s:base00 = [ '#ffffff',  0 ]  " Default Background
let s:base01 = [ '#e0e0e0', 18 ]  " Lighter Background (Used for status bars)
let s:base02 = [ '#d6d6d6', 19 ]  " Selection Background
let s:base03 = [ '#8e908c',  8 ]  " Comments, Invisibles, Line Highlighting
let s:base04 = [ '#969896', 20 ]  " Dark Foreground (Used for status bars)
let s:base05 = [ '#4d4d4c',  7 ]  " Default Foreground, Caret, Delimiters, Operators
let s:base06 = [ '#282a2e', 21 ]  " Light Foreground (Not often used)
let s:base07 = [ '#1d1f21', 15 ]  " Light Background (Not often used)
let s:base08 = [ '#c82829',  1 ]  " Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
let s:base09 = [ '#f5871f', 16 ]  " Integers, Boolean, Constants, XML Attributes, Markup Link Url
let s:base0A = [ '#eab700',  3 ]  " Classes, Markup Bold, Search Text Background
let s:base0B = [ '#718c00',  2 ]  " Strings, Inherited Class, Markup Code, Diff Inserted
let s:base0C = [ '#3e999f',  6 ]  " Support, Regular Expressions, Escape Characters, Markup Quotes
let s:base0D = [ '#4271ae',  4 ]  " Functions, Methods, Attribute IDs, Headings
let s:base0E = [ '#8959a8',  5 ]  " Keywords, Storage, Selector, Markup Italic, Diff Changed
let s:base0F = [ '#a3685a', 17 ]  " Deprecated, Opening/Closing Embedded Language Tags e.g. <?php ?>

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left     = [ [ s:base01, s:base0D ], [ s:base0D, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base01, s:base02 ], [ s:base02, s:base01 ] ]
let s:p.insert.left     = [ [ s:base01, s:base0B ], [ s:base0B, s:base02 ] ]
let s:p.replace.left    = [ [ s:base01, s:base08 ], [ s:base08, s:base02 ] ]
let s:p.visual.left     = [ [ s:base01, s:base09 ], [ s:base09, s:base02 ] ]

let s:p.normal.middle   = [ [ s:base03, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base02, s:base00 ] ]

let s:p.normal.right    = copy(s:p.normal.left)
let s:p.inactive.right  = copy(s:p.inactive.left)
let s:p.insert.right    = copy(s:p.insert.left)
let s:p.replace.right   = copy(s:p.replace.left)
let s:p.visual.right    = copy(s:p.visual.left)

" TODO: review
let s:p.normal.error =   [ [ s:base05, s:base08 ] ]
let s:p.normal.warning = [ [ s:base02, s:base0A ] ]
let s:p.tabline.left =   [ [ s:base05, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base05 ] ]
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#base16#palette = lightline#colorscheme#flatten(s:p)
