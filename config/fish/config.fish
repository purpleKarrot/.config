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
set fish_color_comment grey
set fish_color_match black --background=D0D0D0
set fish_color_search_match --background=D0D0D0
set fish_color_operator grey
set fish_color_escape cyan

set fish_pager_color_prefix red
set fish_pager_color_completion normal
set fish_pager_color_description grey
set fish_pager_color_progress magenta

set fish_user_paths ~/.local/bin

# alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
# alias msmtp='msmtp -C "$XDG_CONFIG_HOME"/msmtp/msmtprc'

if type colordiff >/dev/null ^/dev/null
  alias diff="colordiff -Nuar"
else
  alias diff="diff -Nuar"
end

if type hub >/dev/null ^/dev/null
  alias git=hub
end

if type direnv >/dev/null ^/dev/null
  eval (direnv hook fish)
end

# coreutils
if type brew >/dev/null ^/dev/null
  set fish_user_paths $fish_user_paths /usr/local/opt/coreutils/libexec/gnubin
end

# Editor
set -x VISUAL kak
set -x EDITOR kak

# fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--color=light --height 40% --layout=reverse --border'

# Go
set -x GOBIN ~/.local/bin
set -x GOPATH ~/go/ext ~/go/local

# Node
set -x NPM_CONFIG_PREFIX ~/.local
