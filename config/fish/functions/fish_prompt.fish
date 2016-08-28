#!/usr/bin/fish

function fish_prompt
  set -l status_color brblue
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
      set status_color brred
    else
      set status_color brgreen
    end
  end

  if [ $PWD = ~ ]
    set_color D0D0D0 -b $status_color
    echo -n -s '   '
  else
    set_color -o D0D0D0 -b $status_color
    echo -n -s ' '(basename $PWD)' '
  end

  set_color -o $status_color -b D0D0D0
  echo -n -s "$git_branch"
  set_color -o D0D0D0 -b normal
  echo -n -s ''
  set_color normal
  echo -n -s ' '
end
