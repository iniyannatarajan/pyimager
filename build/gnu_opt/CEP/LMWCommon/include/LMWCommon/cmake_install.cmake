# Install script for directory: /scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/LMWCommon" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/ClusterDesc.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/ControllerBase.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/Controller.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/DomainShape.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MPIConnection.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MPIConnectionSet.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWBlobIO.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWConnection.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWConnectionSet.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWError.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWGlobalStep.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWIos.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWLocalStep.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWMultiStep.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWStep.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWStepFactory.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MWStepVisitor.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MasterControl.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MemConnection.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/MemConnectionSet.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/NodeDesc.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/ObsDomain.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/ParameterHandler.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/SocketConnection.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/SocketConnectionSet.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/SocketListener.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/VdsDesc.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/VdsPartDesc.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkDomainSpec.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkerControl.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkerFactory.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkerInfo.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkerProxy.h"
    "/scratch/software/src/pyimager/CEP/LMWCommon/include/LMWCommon/WorkersDesc.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

