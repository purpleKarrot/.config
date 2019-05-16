#!/usr/bin/fish

function fish_prompt
  set -l status_color blue
  set -l git_branch

  if git status -s >/dev/null ^/dev/null
    set -l ref (git symbolic-ref HEAD ^/dev/null)
    if [ $ref ]
      set git_branch (echo $ref | sed -e 's|^refs/heads/| |')
    else
      set git_branch '➦ '(git rev-parse --short HEAD ^/dev/null)
    end
    set git_branch ' '$git_branch' '
    set -l dirty (git status -s --untracked-files=no --ignore-submodules=dirty --porcelain ^/dev/null | wc -l)
    if test $dirty -ne 0
      set status_color red
    else
      set status_color green
    end
  end

  set_color -o f0f0f1 -b 696c77
  echo -n -s ' '(string replace -r "(-|\.).*" "" -- $hostname)' '
  set_color 696c77 -b $status_color
  echo -n -s ''

  if [ $PWD = ~ ]
    set_color e5e5e6 -b $status_color
    echo -n -s '   '
  else
    set_color -o e5e5e6 -b $status_color
    echo -n -s ' '(basename $PWD)' '
  end

  set_color -o $status_color -b e5e5e6
  echo -n -s "$git_branch"
  set_color -o e5e5e6 -b normal
  echo -n -s ''
  set_color normal
  echo -n -s ' '
end
