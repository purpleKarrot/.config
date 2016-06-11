let s:base00 = [ '#282828',  0 ]
let s:base01 = [ '#323232', 18 ]
let s:base02 = [ '#49483e', 19 ]
let s:base03 = [ '#75715e',  8 ]
let s:base04 = [ '#a59f85', 20 ]
let s:base05 = [ '#c8c8c8',  7 ]
let s:base06 = [ '#e0e0e0', 21 ]
let s:base07 = [ '#f8f8f0', 15 ]
let s:base08 = [ '#f92672',  1 ]
let s:base09 = [ '#fd971f', 16 ]
let s:base0A = [ '#e6db74',  3 ]
let s:base0B = [ '#a6e22e',  2 ]
let s:base0C = [ '#66c03a',  6 ]
let s:base0D = [ '#66d9ef',  4 ]
let s:base0E = [ '#ae81ff',  5 ]
let s:base0F = [ '#cc6633', 17 ]

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
