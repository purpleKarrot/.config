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

set -a fish_user_paths ~/.local/bin

if type --query python3
  set -a fish_user_paths (python3 -m site --user-base)/bin
end

if type --query ruby
  set -a fish_user_paths (ruby -e 'puts Gem.user_dir')/bin
end

if [ (uname -s) = "Darwin" ]
  set -a fish_user_paths \
    /opt/homebrew/bin /opt/homebrew/sbin \
    /opt/homebrew/opt/coreutils/libexec/gnubin
end

# XDG Base Directories
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.local/share

if command --query cx
  cx completion fish | source
end

if type --query direnv
  direnv hook fish | source
end

if type --query eza
  alias ls="eza"
  alias tree="eza --tree"
end

if type --query kitty
  alias ssh="kitten ssh"
end

# Editor
set -x VISUAL kak
set -x EDITOR kak

# fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--color=light'

# Go
set -x GOBIN ~/.local/bin
set -x GOPATH ~/.cache/go

# Node
set -x NPM_CONFIG_PREFIX ~/.local

if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
    exec ssh-agent sway
end
