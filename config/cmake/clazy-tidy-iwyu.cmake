set(CTEST_SOURCE_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/clazy-tidy-iwyu/source")
set(CTEST_BINARY_DIRECTORY "$ENV{XDG_CACHE_HOME}/cmake/ci/clazy-tidy-iwyu/binary")

# If iwyu is installed to ~/.local/bin, then the headers for clang's intrinsics
# must be accessible in ~/.local/lib/clang/<version>/include:
# ln -s /usr/lib/clang ~/.local/lib/clang

set(ENV{CC} "/usr/bin/clang")
set(ENV{CXX} "/home/daniel/.local/bin/clazy")
set(ENV{CLAZY_CHECKS} "level2\
,no-base-class-event\
,no-container-inside-loop\
,no-copyable-polymorphic\
,no-ctor-missing-parent-argument\
,no-function-args-by-ref\
,no-missing-qobject-macro\
,no-non-pod-global-static\
,no-old-style-connect\
,no-qstring-allocations\
,no-reserve-candidates\
,no-rule-of-three\
,no-rule-of-two-soft\
,no-strict-iterators\
")

set(CTEST_SITE "purplekarrot.net")
set(CTEST_BUILD_NAME "clazy-tidy-iwyu")
set(CTEST_CMAKE_GENERATOR "Ninja")
set(CTEST_USE_LAUNCHERS ON)

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})
file(WRITE "${CTEST_BINARY_DIRECTORY}/CMakeCache.txt" "
BUILD_QtDialog:BOOL=ON
CMAKE_BUILD_TYPE:STRING=Debug
CMake_RUN_CLANG_TIDY:BOOL=ON
CMake_RUN_IWYU:BOOL=ON
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

set(CTEST_NOTES_FILES
  "${CMAKE_CURRENT_LIST_FILE}"
  "${CMAKE_CURRENT_LIST_DIR}/cmake-clone.sh"
  )

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
