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
if [ (uname -s) = "Darwin" ]
  set -a fish_user_paths \
    (python3 -m site --user-base)/bin \
    (ruby -e 'puts Gem.user_dir')/bin \
    /opt/homebrew/bin /opt/homebrew/sbin \
    /opt/homebrew/opt/coreutils/libexec/gnubin
end

# XDG Base Directories
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache
set -x XDG_DATA_HOME ~/.local/share

# workaround xdg violations
set -x CCACHE_DIR $XDG_CACHE_HOME/ccache
set -x NOTMUCH_CONFIG $XDG_CONFIG_HOME/notmuch/notmuchrc
set -x NMBGIT $XDG_DATA_HOME/notmuch/nmbug
set -x WEECHAT_HOME $XDG_CONFIG_HOME/weechat

# alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
# alias msmtp='msmtp -C "$XDG_CONFIG_HOME"/msmtp/msmtprc'

if type --query direnv
  direnv hook fish | source
end

if type --query kitty
  alias ssh="kitty +kitten ssh"
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

# Make
set -x MAKEFLAGS -j(echo (nproc) + 1 | bc) -l(nproc)

# Node
set -x NPM_CONFIG_PREFIX ~/.local

# SSH key agent
if not set -q SSH_AUTH_SOCK
  set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end

if status is-login
  if type --query systemctl
    systemctl --user import-environment XDG_CONFIG_HOME
    systemctl --user import-environment XDG_CACHE_HOME
    systemctl --user import-environment XDG_DATA_HOME
  end

  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    if test -e ~/.xinitrc
      exec startx -- -keeptty
    else
      exec sway
    end
  end
end
