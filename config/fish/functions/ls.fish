switch (uname)
  case 'Darwin'
    function ls
      command ls -FGh $argv
    end
  case 'Linux'
    function ls
      command ls --classify --color=auto --human-readable --group-directories-first $argv
    end
end
