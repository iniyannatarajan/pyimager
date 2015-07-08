# Install script for directory: /scratch/software/src/pyimager/LCS/Blob/include/Blob

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Blob" TYPE FILE FILES
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobAipsIO.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobArray.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobArray.tcc"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobArrayHeader.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobException.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobField.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobField.tcc"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobFieldSet.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobHeader.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIBufChar.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIBuffer.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIBufStream.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIBufString.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIBufVector.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobIStream.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBufChar.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBuffer.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBufNull.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBufStream.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBufString.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOBufVector.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobOStream.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobSTL.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobSTL.tcc"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobStreamable.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobString.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobStringTraits.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/BlobStringType.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/KeyParser.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/KeyValue.h"
    "/scratch/software/src/pyimager/LCS/Blob/include/Blob/KeyValueMap.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

