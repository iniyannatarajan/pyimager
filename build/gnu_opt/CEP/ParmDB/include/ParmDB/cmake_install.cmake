# Install script for directory: /scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ParmDB" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/Axis.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/AxisMapping.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/Box.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/Grid.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmValue.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmSet.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmMap.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmCache.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmDBMeta.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmDB.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmDBBlob.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmDBCasa.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmDBLocker.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/Parm.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmFacadeRep.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmFacadeLocal.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmFacadeDistr.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/ParmFacade.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/PatchInfo.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/SourceData.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/SourceDB.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/SourceDBBlob.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/SourceDBCasa.h"
    "/scratch/software/src/pyimager/CEP/ParmDB/include/ParmDB/SourceInfo.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

