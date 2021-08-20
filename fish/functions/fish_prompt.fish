#!/usr/bin/fish

if type --query lsb_release
  set __fish_prompt_host ' '(lsb_release -is)' '
else
  set __fish_prompt_host ' '(uname -s)' '
end

function fish_prompt
  # if test "$status" -ne 0
  #   set_color -o f0f0f1 -b 696c77
  #   echo -n -s ''
  # end

  set -l status_color blue
  set -l git_branch

  if git status -s >/dev/null 2>/dev/null
    set -l ref (git symbolic-ref HEAD 2>/dev/null)
    if [ $ref ]
      set git_branch (echo $ref | sed -e 's|^refs/heads/| |')
    else
      set git_branch '➦ '(git rev-parse --short HEAD 2>/dev/null)
    end
    set git_branch ' '$git_branch' '
    set -l dirty (git status -s --untracked-files=no --ignore-submodules=dirty --porcelain 2>/dev/null | wc -l)
    if test $dirty -ne 0
      set status_color red
    else
      set status_color green
    end
  end

  if set -q SSH_TTY
    set_color -o f0f0f1 -b 696c77
    echo -n -s $__fish_prompt_host
    set_color 696c77 -b $status_color
    echo -n -s ''
  end

  set_color -o e5e5e6 -b $status_color
  if [ $PWD = ~ ]
    echo -n -s ' ~ '
  else
    echo -n -s ' '(basename $PWD)' '
  end

  set_color -o $status_color -b e5e5e6
  echo -n -s "$git_branch"
  set_color -o e5e5e6 -b normal
  echo -n -s ''
  set_color normal
  echo -n -s ' '
end
