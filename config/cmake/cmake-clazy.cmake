set(CTEST_SOURCE_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-clazy/source")
set(CTEST_BINARY_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-clazy/binary")

set(ENV{CC} "/usr/bin/clang")
set(ENV{CXX} "/home/daniel/.local/bin/clazy")
set(ENV{CLAZY_CHECKS} "level2,no-non-pod-global-static,no-rule-of-two-soft,no-missing-qobject-macro,no-reserve-candidates")

set(CTEST_SITE "purplekarrot.net")
set(CTEST_BUILD_NAME "clazy")
set(CTEST_CMAKE_GENERATOR "Ninja")

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
BUILD_QtDialog:BOOL=ON
CMAKE_BUILD_TYPE:STRING=Debug
CMAKE_USE_SYSTEM_LIBRARIES:BOOL=ON
CTEST_USE_XMLRPC:BOOL=ON
")

find_program(CTEST_GIT_COMMAND NAMES git)

if(NOT EXISTS "${CTEST_SOURCE_DIRECTORY}")
  file(MAKE_DIRECTORY "${CTEST_SOURCE_DIRECTORY}")
  set(CTEST_CHECKOUT_COMMAND "${CMAKE_CURRENT_LIST_DIR}/cmake-clone.sh ${CTEST_SOURCE_DIRECTORY}")
  set(first_build 1)
endif()

ctest_start("Experimental")

if(NOT first_build)
  ctest_update(RETURN_VALUE files_updated)
  message(STATUS "CMake: ${files_updated} files updated.")
  if(files_updated LESS 1)
    return()
  endif()
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
ctest_submit()
