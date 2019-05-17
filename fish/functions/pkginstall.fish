function pkginstall
  set -l search_term (command yay -Slq | fzf)
  if test -n "$search_term"
    command yay --color auto -S $search_term
  end
end
