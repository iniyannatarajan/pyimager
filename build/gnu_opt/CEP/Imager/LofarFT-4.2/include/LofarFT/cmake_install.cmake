# Install script for directory: /scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LofarFT" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/FFTCMatrix.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/VisResampler.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/FTMachine.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/FTMachineSimple.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/Imager.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/ATerm.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/WTerm.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/CFStore.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/CFDefs.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/VBStore.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/VisBuffer.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/VisibilityIterator.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/VisImagingWeight.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/Operation.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/OperationClean.h"
    "/scratch/software/src/pyimager/CEP/Imager/LofarFT-4.2/include/LofarFT/OperationPredict.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

