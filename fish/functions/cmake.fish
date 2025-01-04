function cmake
  set -x CMAKE_C_COMPILER_LAUNCHER (which ccache)
  set -x CMAKE_CXX_COMPILER_LAUNCHER (which ccache)
  set -x CMAKE_EXPORT_COMPILE_COMMANDS 1
  set -x CMAKE_INSTALL_PREFIX $HOME/.local
  command cmake $argv
end
