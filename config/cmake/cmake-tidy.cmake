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
CMAKE_CXX_CLANG_TIDY:STRING=clang-tidy
CMAKE_USE_SYSTEM_LIBRARIES:BOOL=ON
CTEST_USE_XMLRPC:BOOL=ON
")

set(clang_tidy_checks
  misc-argument-comment
  misc-assert-side-effect
  misc-bool-pointer-implicit-conversion
  misc-dangling-handle
  misc-definitions-in-headers
  misc-fold-init-type
  misc-forward-declaration-namespace
  misc-inaccurate-erase
  #misc-incorrect-roundings
  misc-inefficient-algorithm
  #misc-macro-parentheses
  misc-macro-repeated-side-effects
  misc-misplaced-const
  #misc-misplaced-widening-cast
  misc-move-const-arg
  misc-move-constructor-init
  misc-move-forwarding-reference
  misc-multiple-statement-macro
  misc-new-delete-overloads
  misc-noexcept-move-constructor
  misc-non-copyable-objects
  misc-redundant-expression
  misc-sizeof-container
  misc-sizeof-expression
  #misc-static-assert
  misc-string-compare
  misc-string-constructor
  misc-string-integer-assignment
  misc-string-literal-with-embedded-nul
  misc-suspicious-enum-usage
  misc-suspicious-missing-comma
  misc-suspicious-semicolon
  misc-suspicious-string-compare
  misc-swapped-arguments
  misc-throw-by-value-catch-by-reference
  #misc-unconventional-assign-operator
  misc-undelegated-constructor
  misc-uniqueptr-reset-release
  misc-unused-alias-decls
  misc-unused-parameters
  misc-unused-raii
  misc-unused-using-decls
  misc-use-after-move
  misc-virtual-near-miss
  #modernize-avoid-bind
  #modernize-deprecated-headers
  #modernize-loop-convert
  modernize-make-shared
  modernize-make-unique
  #modernize-pass-by-value
  #modernize-raw-string-literal
  modernize-redundant-void-arg
  #modernize-replace-auto-ptr
  #modernize-shrink-to-fit
  #modernize-use-auto
  modernize-use-bool-literals
  #modernize-use-default-member-init
  #modernize-use-emplace
  #modernize-use-equals-default
  #modernize-use-equals-delete
  modernize-use-nullptr
  modernize-use-override
  #modernize-use-transparent-functors
  #modernize-use-using
  #mpi-buffer-deref
  #mpi-type-mismatch
  performance-faster-string-find
  performance-for-range-copy
  performance-implicit-cast-in-loop
  #performance-inefficient-string-concatenation !! decreases readability !!
  performance-type-promotion-in-math-fn
  performance-unnecessary-copy-initialization
  performance-unnecessary-value-param
  readability-avoid-const-params-in-decls
  readability-braces-around-statements
  readability-container-size-empty
  readability-delete-null-pointer
  readability-deleted-default
  readability-else-after-return
  #readability-function-size
  #readability-identifier-naming
  #readability-implicit-bool-cast
  #readability-inconsistent-declaration-parameter-name
  readability-misplaced-array-index
  #readability-named-parameter
  readability-non-const-parameter
  readability-redundant-control-flow
  #readability-redundant-declaration !! broken !!
  readability-redundant-function-ptr-dereference
  #!readability-redundant-member-init
  readability-redundant-smartptr-get
  readability-redundant-string-cstr
  readability-redundant-string-init
  # ! readability-simplify-boolean-expr
  readability-static-definition-in-anonymous-namespace
  readability-uniqueptr-delete-release
  )

string(REPLACE ";" "," clang_tidy_checks "${clang_tidy_checks}")

file(WRITE "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-tidy/.clang-tidy" "
---
Checks: '-*,${clang_tidy_checks}'
HeaderFilterRegex: 'Source/cm[^/]*\\.(h|hxx|cxx)\$'
CheckOptions:
  - key:    modernize-use-nullptr.NullMacros
    value:  'CM_NULLPTR'
...
")

file(WRITE "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-tidy/binary/Source/QtDialog/.clang-tidy" "
---
Checks: '-*,llvm-twine-local'
...
")

file(WRITE "$ENV{XDG_CACHE_HOME}/cmake/ci/cmake-tidy/binary/Tests/CMakeLib/.clang-tidy" "
---
Checks: '-*,llvm-twine-local'
...
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
