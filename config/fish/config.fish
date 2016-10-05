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

# alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
# alias msmtp='msmtp -C "$XDG_CONFIG_HOME"/msmtp/msmtprc'

if command -v colordiff >/dev/null ^/dev/null
  alias diff="colordiff -Nuar"
else
  alias diff="diff -Nuar"
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
