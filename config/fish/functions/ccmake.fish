function ccmake
  nccmake -DCMAKE_INSTALL_PREFIX:PATH=$HOME/.local $argv
end
