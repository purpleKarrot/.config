function man -d "Color highlighted man pages"
  # start blink, start bold, turn off
  set -x LESS_TERMCAP_mb (set_color -o magenta)
  set -x LESS_TERMCAP_md (set_color -o magenta)
  set -x LESS_TERMCAP_me (set_color normal)

  # start/stop standout
  set -x LESS_TERMCAP_so (set_color 696c77 -b e5e5e6)
  set -x LESS_TERMCAP_se (set_color normal)

  # start/end underline
  set -x LESS_TERMCAP_us (set_color -o cyan)
  set -x LESS_TERMCAP_ue (set_color normal)

  command man $argv
end
