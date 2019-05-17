#!/usr/bin/fish

function kak
  set -l server_name (pwd | tr '/.' '_')
  if command kak -l | not grep -x $server_name >/dev/null
    command kak -d -s $server_name
  end
  command kak -c $server_name $argv
end
