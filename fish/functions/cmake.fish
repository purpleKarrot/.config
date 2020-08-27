# -DCMAKE_CXX_CLANG_TIDY:STRING="clang-tidy;-checks=-*,readability-*;-fix"
# -DCMAKE_CXX_CLANG_TIDY=clang-tidy
# -DCMAKE_CXX_COMPILER=clazy
# -DCMAKE_C_COMPILER=clang
# -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=1
# -DCMAKE_USE_SYSTEM_LIBRARIES:BOOL=1

function cmake
  if contains -- $argv[1] -E -P --build --find-package
    command cmake $argv
  else
    set -x CMAKE_C_COMPILER_LAUNCHER (which ccache)
    set -x DCMAKE_CXX_COMPILER_LAUNCHER (which ccache)

    command cmake \
      -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON \
      -DCMAKE_INSTALL_PREFIX:PATH=$HOME/.local \
      $argv
  end
end
