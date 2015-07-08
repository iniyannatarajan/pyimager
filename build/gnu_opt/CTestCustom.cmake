# - CTest custom settings.
# See http://www.cmake.org/Wiki/CMake_Testing_With_CTest for details.
#
# This file will be configured by LofarConfig.cmake; its output will be stored
# in the top-level build directory. Any of the variables below can be set by
# the user, either on the command line or in the variants file(s).

# $Id: CTestCustom.cmake.in 27477 2013-11-21 13:08:20Z loose $

# Assign contents of <val> to <var> if <val> is set. 
macro(set_if_set var val)
  if(NOT "${val}" MATCHES "^$")
    set("${var}" "${val}")
  endif(NOT "${val}" MATCHES "^$")
endmacro(set_if_set)

# Regular expression for errors during build process
set_if_set(CTEST_CUSTOM_ERROR_MATCH "")

# Regular expression for error exceptions during build process
set_if_set(CTEST_CUSTOM_ERROR_EXCEPTION "")

# Regular expression for warnings during build process
set_if_set(CTEST_CUSTOM_WARNING_MATCH "")

# Regular expression for warning exception during build process
set_if_set(CTEST_CUSTOM_WARNING_EXCEPTION "")

# Maximum number of errors to display
set_if_set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_ERRORS "")

# Maximum number of warnings to display
set_if_set(CTEST_CUSTOM_MAXIMUM_NUMBER_OF_WARNINGS "500")

# List of tests to ignore during the Test stage
set_if_set(CTEST_CUSTOM_TESTS_IGNORE "")

# List of tests to ignore during the MemCheck stage
set_if_set(CTEST_CUSTOM_MEMCHECK_IGNORE "")

# Command to execute before any tests are run during Test stage
set_if_set(CTEST_CUSTOM_PRE_TEST "")

# Command to execute after any tests are run during Test stage
set_if_set(CTEST_CUSTOM_POST_TEST "")

# Maximum size of passed test output
set_if_set(CTEST_CUSTOM_MAXIMUM_PASSED_TEST_OUTPUT_SIZE "")

# Maximum size of failed test output
set_if_set(CTEST_CUSTOM_MAXIMUM_FAILED_TEST_OUTPUT_SIZE "")

# Command to execute before any tests are run during MemCheck stage
set_if_set(CTEST_CUSTOM_PRE_MEMCHECK "")

# Command to execute after any tests are run during MemCheck stage
set_if_set(CTEST_CUSTOM_POST_MEMCHECK "")

# Regular expression for excluding files from coverage testing
set_if_set(CTEST_CUSTOM_COVERAGE_EXCLUDE "")