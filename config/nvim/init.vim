"""""""""""""""""""""""""""""""""""""""""""""""""""""'""""""""""""""""""""""""""
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('$XDG_CONFIG_HOME/nvim/autoload/plug.vim'))
  silent !curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('$XDG_CACHE_HOME/vim-plug')
Plug 'rking/ag.vim',                { 'as': 'ag' }
Plug 'jiangmiao/auto-pairs',        { 'as': 'auto-pairs' }
Plug 'bbchung/Clamp',               { 'as': 'clamp' }
Plug 'vhdirk/vim-cmake',            { 'as': 'cmake' }
Plug 'kien/ctrlp.vim',              { 'as': 'ctrlp' }
Plug 'dag/vim-fish',                { 'as': 'fish' }
Plug 'tpope/vim-fugitive',          { 'as': 'fugitive' }
Plug 'tpope/vim-git',               { 'as': 'git' }
Plug 'airblade/vim-gitgutter',      { 'as': 'gitgutter' }
Plug 'gregsexton/gitv',             { 'as': 'gitv' }
Plug 'digitaltoad/vim-jade',        { 'as': 'jade' }
Plug 'itchyny/lightline.vim',       { 'as': 'lightline' }
Plug 'scrooloose/nerdtree',         { 'as': 'nerdtree' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'as': 'nerdtree-git' }
Plug 'benekastah/neomake',          { 'as': 'neomake' }
Plug 'airblade/vim-rooter',         { 'as': 'rooter' }
Plug 'tpope/vim-sensible',          { 'as': 'sensible' }
Plug 'mhinz/vim-startify',          { 'as': 'startify' }
Plug 'tpope/vim-surround',          { 'as': 'surround' }
Plug 'tomtom/tcomment_vim',         { 'as': 'tcomment' }
Plug 'tpope/vim-unimpaired',        { 'as': 'unimpaired' }
Plug 'Valloric/YouCompleteMe',      { 'as': 'ycm',
  \ 'do': 'python2 install.py --clang-completer --gocode-completer --system-libclang'
  \ }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Options                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show whitespace (unfortunately 'lead:·' is not possible)
"set list lcs=eol:¬,tab:»\ ,space:·,nbsp:¤
set list lcs=eol:¬,tab:»\ ,trail:·,nbsp:¤

set expandtab
set shiftwidth=2
set softtabstop=2

colorscheme base16

" highlight past the 80th column
execute "set colorcolumn=" . join(range(81, 335), ',')

set cursorline     " highlight the current line
set number         " show absolute line number of the current line
set noshowmode     " mode is visible in airline
set nowrap

" middle-click paste
noremap! <s-insert> <middlemouse>

"""""""""""""""""""""""""""""""""""""""""""""""""""""'""""""""""""""""""""""""""
"                                  Lightline                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
  \ 'colorscheme': 'base16',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      Go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rooter_patterns = ['.git/', '.svn/']
let g:startify_change_to_vcs_root = 1

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd User Startified setlocal buftype=

let g:clamp_libclang_file = '/usr/lib/libclang.so'

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>

" NERDTree
map <C-n> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fugitive shortcuts
noremap \gs :Gstatus<cr>
noremap \gc :Gcommit<cr>
noremap \ga :Gwrite<cr>
noremap \gl :Glog<cr>
noremap \gd :Gdiff<cr>
noremap \gb :Gblame<cr>

" Apply YCM FixIt
map <C-F> :YcmCompleter FixIt<cr>

map <F3> :YcmCompleter GoTo<cr>
map <F4> :call Configure()<cr>
map <F5> :make<cr>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \. '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! Configure()
  let s:build_dir = finddir('build', '.;')
  exec 'cd' s:build_dir
  if !empty(glob("../CMakeLists.txt"))
    set makeprg=cmake\ -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON\ -GNinja\ ..
    make
    set makeprg=ninja\ -C\ build
  else
    set makeprg=qmake\ -spec\ linux-clang\ QMAKE_CXX=clazy\ QMAKE_CXXFLAGS+=-Werror\ ..
    make
    set makeprg=bear\ --append\ --cdb=build/compile_commands.json\ make\ -C\ build\ -j5
  endif
  exec 'cd - '
endfunction
