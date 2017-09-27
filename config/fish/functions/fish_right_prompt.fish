#!/usr/bin/fish

function fish_right_prompt
  set -l status_copy $status
  set -l status_color green
  set -l status_text "ok"

  if test "$status_copy" -ne 0
    set status_color red
    set status_text "fail"
  end

  echo (set_color $status_color) "$status_text" (set_color normal)
end
