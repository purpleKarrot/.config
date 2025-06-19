function ctest
  set -x CTEST_USE_INSTRUMENTATION 1
  set -x CTEST_USE_VERBOSE_INSTRUMENTATION 1
  set -x CTEST_EXPERIMENTAL_INSTRUMENTATION "a37d1069-1972-4901-b9c9-f194aaf2b6e0"
  set -x CTEST_PARALLEL_LEVEL (nproc)
  set -x CMAKE_C_COMPILER_LAUNCHER (which ccache)
  set -x CMAKE_CXX_COMPILER_LAUNCHER (which ccache)
  command ctest $argv
end
