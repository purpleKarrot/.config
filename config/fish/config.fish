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

if type nvim >/dev/null ^/dev/null
  alias vi=nvim
  alias vim=nvim
end

if type direnv >/dev/null ^/dev/null
  eval (direnv hook fish)
end

if [ $COLORTERM = "gnome-terminal" ]
  printf "\033]4;%d;rgb:%s\033\\" 16 "d7/5f/00" # Base 09
  printf "\033]4;%d;rgb:%s\033\\" 17 "98/68/01" # Base 0F
  printf "\033]4;%d;rgb:%s\033\\" 18 "f0/f0/f1" # Base 01
  printf "\033]4;%d;rgb:%s\033\\" 19 "e5/e5/e6" # Base 02
  printf "\033]4;%d;rgb:%s\033\\" 20 "69/6c/77" # Base 04
  printf "\033]4;%d;rgb:%s\033\\" 21 "20/22/27" # Base 06
end
