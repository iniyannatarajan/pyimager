# Install script for directory: /scratch/software/src/pyimager/CEP/Imager/casaimwrap/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/scratch/software/pyimager")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "OPT")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so"
         RPATH "/scratch/software/pyimager/lib64")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE SHARED_LIBRARY FILES "/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/casaimwrap/src/libcasaimwrapcpp.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so"
         OLD_RPATH "/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/LofarFT-4.2/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Blob/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/StationResponse/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/ElementResponse/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src:"
         NEW_RPATH "/scratch/software/pyimager/lib64")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/libcasaimwrapcpp.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so"
         RPATH "/scratch/software/pyimager/lib64")
  ENDIF()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE MODULE FILES "/scratch/software/src/pyimager/build/gnu_opt/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so"
         OLD_RPATH "/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/LofarFT-4.2/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/casaimwrap/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Blob/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/StationResponse/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/ElementResponse/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src:"
         NEW_RPATH "/scratch/software/pyimager/lib64")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib64/_casaimwrap.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF(EXISTS "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
    FILE(RPATH_CHECK
         FILE "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so"
         RPATH "/scratch/software/pyimager/lib64")
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap" TYPE MODULE FILES "/scratch/software/src/pyimager/build/gnu_opt/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
  IF(EXISTS "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
    FILE(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so"
         OLD_RPATH "/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/LofarFT-4.2/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Imager/casaimwrap/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Blob/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/StationResponse/src:/scratch/software/src/pyimager/build/gnu_opt/CEP/Calibration/ElementResponse/src:/scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src:"
         NEW_RPATH "/scratch/software/pyimager/lib64")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/_casaimwrap.so")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/__init__.py")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap" TYPE FILE FILES "/scratch/software/src/pyimager/CEP/Imager/casaimwrap/src/__init__.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/python -c "import py_compile;print('-- Byte-compiling: /scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/__init__.py');py_compile.compile('/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/__init__.py', doraise=True)"
                       RESULT_VARIABLE _result)
       if(NOT _result EQUAL 0)
         message(FATAL_ERROR "Byte-compilation FAILED: /scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/__init__.py")
       endif(NOT _result EQUAL 0)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/cmake -E touch 
        "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/__init__.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND /usr/bin/cmake -E touch 
        "/scratch/software/pyimager/lib/python2.7/dist-packages/lofar/casaimwrap/__init__.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

