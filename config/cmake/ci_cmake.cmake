set(CTEST_SOURCE_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake/source")
set(CTEST_BINARY_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake/binary")

set(ENV{CC} "clang")
set(ENV{CXX} "clang++")

set(CTEST_SITE "purplekarrot.net")
set(CTEST_BUILD_NAME "clang-tidy")

set(CTEST_USE_LAUNCHERS ON)
set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS 300)
set(CTEST_CMAKE_GENERATOR "Ninja")

file(WRITE "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake/.clang-tidy" "
---
Checks: '-*,misc-*,performance-*,readability-*,-readability-implicit-bool-cast'
HeaderFilterRegex: 'Source/.*(?<!Lexer|Parser)\\.h$'
CheckOptions:
  - key:    readability-identifier-naming.MemberCase
    value:  CamelCase
  - key:    readability-identifier-naming.MethodCase
    value:  CamelCase
...
")

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
CMAKE_BUILD_TYPE:STRING=Debug
CMAKE_CXX_CLANG_TIDY:STRING=clang-tidy
CMAKE_CXX_INCLUDE_WHAT_YOU_USE:STRING=include-what-you-use;-Xiwyu;--mapping_file=${CMAKE_CURRENT_LIST_DIR}/ci_cmake.imp
CMAKE_CXX_STANDARD:STRING=98
CMAKE_LINK_WHAT_YOU_USE:BOOL=ON
CMAKE_USE_SYSTEM_LIBRARIES:BOOL=ON
CTEST_USE_LAUNCHERS:BOOL=ON
CTEST_USE_XMLRPC:BOOL=ON
")

find_program(CTEST_GIT_COMMAND NAMES git)
#find_program(CTEST_COVERAGE_COMMAND NAMES gcov)
#find_program(CTEST_MEMORYCHECK_COMMAND NAMES valgrind)

if(NOT EXISTS "${CTEST_SOURCE_DIRECTORY}")
  file(MAKE_DIRECTORY "${CTEST_SOURCE_DIRECTORY}")
  set(CTEST_CHECKOUT_COMMAND "${CTEST_GIT_COMMAND} clone --branch=next git://cmake.org/cmake.git ${CTEST_SOURCE_DIRECTORY}")
endif()

set(CTEST_CONFIGURE_COMMAND
  "${CMAKE_COMMAND} \"-G${CTEST_CMAKE_GENERATOR}\" \"${CTEST_SOURCE_DIRECTORY}\""
  )

ctest_start("Experimental")

ctest_update(RETURN_VALUE files_updated)
message(STATUS "CMake: ${files_updated} files updated.")
if(files_updated LESS 1)
  return()
endif()

ctest_configure()
ctest_build(TARGET kwiml_test)
ctest_build(TARGET cmsysTestsCxx)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmCommandArgumentLexer.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmCommandArgumentParser.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmDependsJavaLexer.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmDependsJavaParser.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmExprLexer.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmExprParser.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmFortranParser.cxx.o)
ctest_build(TARGET Source/CMakeFiles/CMakeLib.dir/cmFortranLexer.cxx.o)
ctest_build()
#ctest_test()
#ctest_coverage()
#ctest_memcheck()
ctest_submit()
