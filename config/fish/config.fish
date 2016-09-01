# no welcome message
set fish_greeting

# highlighting colors
set fish_color_autosuggestion D0D0D0
set fish_color_normal normal
set fish_color_command green --bold
set fish_color_quote yellow
set fish_color_redirection magenta
set fish_color_end cyan
set fish_color_error red
set fish_color_param blue
set fish_color_comment brgrey
set fish_color_match black --background=D0D0D0
set fish_color_search_match --background=D0D0D0
set fish_color_operator grey
set fish_color_escape brcyan

set fish_pager_color_prefix brred
set fish_pager_color_completion normal
set fish_pager_color_description brgrey
set fish_pager_color_progress magenta

# Aliases
alias pdf=zathura
alias news=newsbeuter
# -DCMAKE_CXX_CLANG_TIDY:STRING="clang-tidy;-checks=-*,readability-*;-fix"
# -DCMAKE_CXX_CLANG_TIDY=clang-tidy
# -DCMAKE_CXX_COMPILER=clazy
# -DCMAKE_C_COMPILER=clang
# -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=1
# -DCMAKE_USE_SYSTEM_LIBRARIES:BOOL=1
alias cmake='cmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME/.local'
alias cninja='cmake -GNinja'

alias cp='cp -iv'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod='chmod -c'
alias chown='chown -c'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'

alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
alias msmtp='msmtp -C "$XDG_CONFIG_HOME"/msmtp/msmtprc'
alias mutt='mutt -F "$XDG_CONFIG_HOME"/mutt/muttrc'

if command -v colordiff >/dev/null ^/dev/null
  alias diff="colordiff -Nuar"
else
  alias diff="diff -Nuar"
end

if command -v yaourt >/dev/null ^/dev/null
  alias pacman=yaourt
end

if command -v hub >/dev/null ^/dev/null
  alias git=hub
end

if command -v nvim >/dev/null ^/dev/null
  alias vi=nvim
  alias vim=nvim
end

if command -v thefuck >/dev/null ^/dev/null
  eval (thefuck --alias | tr '\n' ';')
end

# Functions leveraging the cb() function
function cbf -d "Copy contents of a file to a clipboard"
  cat "$argv" | cb
end

function cbssh -d "Copy (default) SSH public key to a clipboard"
  cb ~/.ssh/id_rsa.pub
end

function cbwd -d "Copy current working directory to a clipboard"
  pwd | cb
end

function cbhs -d "Copy most recent command in history to a clipboard"
  history | head -n 1 | cb
end

eval (direnv hook fish)
