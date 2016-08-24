set(CTEST_RUN_CURRENT_SCRIPT 0)
ctest_run_script(
  "${CMAKE_CURRENT_LIST_DIR}/cmake-iwyu.cmake"
  "${CMAKE_CURRENT_LIST_DIR}/cmake-tidy.cmake"
  )
