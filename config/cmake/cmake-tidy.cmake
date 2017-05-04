set(CTEST_SOURCE_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-tidy/source")
set(CTEST_BINARY_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-tidy/binary")

set(ENV{CC} "/usr/bin/clang")
set(ENV{CXX} "/usr/bin/clang++")

set(CTEST_SITE "purplekarrot.net")
set(CTEST_BUILD_NAME "clang-tidy")
set(CTEST_CMAKE_GENERATOR "Ninja")

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
BUILD_QtDialog:BOOL=ON
CMAKE_BUILD_TYPE:STRING=Debug
CMake_RUN_CLANG_TIDY:BOOL=ON
CMAKE_USE_SYSTEM_LIBRARIES:BOOL=ON
CTEST_USE_XMLRPC:BOOL=ON
")

find_program(CTEST_GIT_COMMAND NAMES git)

if(NOT EXISTS "${CTEST_SOURCE_DIRECTORY}")
  file(MAKE_DIRECTORY "${CTEST_SOURCE_DIRECTORY}")
  set(CTEST_CHECKOUT_COMMAND "${CMAKE_CURRENT_LIST_DIR}/cmake-clone.sh ${CTEST_SOURCE_DIRECTORY}")
  set(first_build 1)
endif()

ctest_start("Continuous")

if(NOT first_build)
  ctest_update(RETURN_VALUE files_updated)
  message(STATUS "CMake: ${files_updated} files updated.")
  if(files_updated LESS 1)
    return()
  endif()
endif()

ctest_configure()
ctest_build()
ctest_submit()
