set(CTEST_SOURCE_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-iwyu/source")
set(CTEST_BINARY_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-iwyu/binary")

set(ENV{CC} "clang")
set(ENV{CXX} "clang++")

set(CTEST_SITE "purplekarrot.net")
set(CTEST_BUILD_NAME "include-what-you-use")

set(CTEST_USE_LAUNCHERS ON)
set(CTEST_CMAKE_GENERATOR "Ninja")

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
BUILD_QtDialog:BOOL=OFF
CMAKE_BUILD_TYPE:STRING=Debug
CMake_RUN_IWYU:BOOL=ON
CMAKE_CXX_STANDARD:STRING=98
CMAKE_USE_SYSTEM_LIBRARIES:BOOL=ON
CTEST_USE_LAUNCHERS:BOOL=${CTEST_USE_LAUNCHERS}
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
