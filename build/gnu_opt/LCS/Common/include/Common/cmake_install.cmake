# Install script for directory: /scratch/software/src/pyimager/LCS/Common/include/Common

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Common" TYPE FILE FILES
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Allocator.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Backtrace.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/CasaLogSink.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/CheckConfig.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/compiler.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ComplexBuiltinFP.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ComplexBuiltinInt.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ComplexC99.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ComplexStdFP.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ComplexStdInt.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/DataConvert.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/DataFormat.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Exception.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Exceptions.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/FileLocator.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/hexdump.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/InputParSet.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/i4complex.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/KVpair.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_algorithm.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_bitset.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarBitModeInfo.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarConstants.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_complex.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_deque.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_fstream.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_iomanip.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_iosfwd.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_iostream.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_list.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarLocators.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarLog4Cplus.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarLog4Cxx.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarLogCout.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarLogger.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_map.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_math.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_numeric.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_set.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_smartptr.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_sstream.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_stack.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_string.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_thread.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_tribool.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_typeinfo.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarTypedefs.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/LofarTypes.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/lofar_vector.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Mmap.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Numeric.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/NsTimestamp.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ObjectFactory.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/OpenMP.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ParameterRecord.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ParameterSet.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ParameterSetImpl.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ParameterValue.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/PrettyUnits.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Process.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/ReadLine.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/RunOnNode.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Singleton.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Stopwatch.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/StreamUtil.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/StringUtil.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/SystemCallException.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/SystemUtil.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Timer.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/TypeNames.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/TypeNames.tcc"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Version.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Common/Net" TYPE FILE FILES
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Net/FdSet.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Net/Socket.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Common/shmem" TYPE FILE FILES
    "/scratch/software/src/pyimager/LCS/Common/include/Common/shmem/segbasemap.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/shmem/dlmalloc.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/shmem/shmem_alloc.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Common/Thread" TYPE FILE FILES
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Cancellation.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Condition.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Mutex.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Queue.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Semaphore.h"
    "/scratch/software/src/pyimager/LCS/Common/include/Common/Thread/Thread.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

