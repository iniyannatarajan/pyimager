# Install script for directory: /scratch/software/src/pyimager/CEP/LMWCommon/share

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share" TYPE FILE FILES
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/cep2.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/development.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/full.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/imaging.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/production.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/pulsar.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub1.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub2.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub3.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub4.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub5.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub6.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub7.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/sub8.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/local.clusterdesc"
    "/scratch/software/src/pyimager/CEP/LMWCommon/share/cep1_test.clusterdesc"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

