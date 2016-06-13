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

file(WRITE "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake/iwyu.imp" [=[
[
  { include: [ "<assert.h>", public, "<cassert>", public ] },
  { include: [ "<ctype.h>", public, "<cctype>", public ] },
  { include: [ "<float.h>", public, "<cfloat>", public ] },
  { include: [ "<math.h>", public, "<cmath>", public ] },
  { include: [ "<signal.h>", public, "<csignal>", public ] },
  { include: [ "<stddef.h>", public, "<cstddef>", public ] },
  { include: [ "<stdint.h>", public, "<cstdint>", public ] },
  { include: [ "<stdio.h>", public, "<cstdio>", public ] },
  { include: [ "<stdlib.h>", public, "<cstdlib>", public ] },
  { include: [ "<string.h>", public, "<cstring>", public ] },
  { include: [ "<time.h>", public, "<ctime>", public ] },

  # HACK: iwyu suggests those two files each time vector[] is used.
  # https://github.com/include-what-you-use/include-what-you-use/issues/166
  { include: [ "<ext/alloc_traits.h>", private, "<vector>", public ] },
  { include: [ "<memory>", public, "<vector>", public ] },

  { include: [ "@\"KWIML/include/kwiml/(abi|int)\\.h\"", private, "<cm_kwiml.h>", public ] },
  { include: [ "@<archive(_entry)?\\.h>", private, "<cm_libarchive.h>", public ] },
  { include: [ "@<curl/.+\\.h>", private, "<cm_curl.h>", public ] },
  { include: [ "@<expat(_external)?\\.h>", private, "<cm_expat.h>", public ] },
  { include: [ "@<xmlrpc(_client)?\\.h>", private, "<cm_xmlrpc.h>", public ] },
  { include: [ "@<z(conf|lib)\\.h>", private, "<cm_zlib.h>", public ] },
  { include: [ "<json/value.h>", private, "<cm_jsoncpp_value.h>", public ] },
  { include: [ "<json/writer.h>", private, "<cm_jsoncpp_writer.h>", public ] },
  { include: [ "<json/reader.h>", private, "<cm_jsoncpp_reader.h>", public ] },

  { include: [ "\"cmsys/Configure.hxx\"", private, "\"cmConfigure.h\"", public ] },
  { include: [ "\"cmsys/SystemTools.hxx\"", private, "\"cmSystemTools.h\"", public ] },
]
]=])

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
CMAKE_BUILD_TYPE:STRING=Debug
CMAKE_CXX_CLANG_TIDY:STRING=clang-tidy
CMAKE_CXX_INCLUDE_WHAT_YOU_USE:STRING=include-what-you-use;-Xiwyu;--mapping_file=$ENV{XDG_CACHE_HOME}/cmake/ci/cmake/iwyu.imp;-Xiwyu;--no_comments
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

ctest_start("Continuous")

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
