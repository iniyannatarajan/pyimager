# $Id: CMakeLists.txt 18494 2011-07-14 21:39:24Z loose $

include(LofarCTest)

# Add current binary directory to -I path, so that the generated C++ header
# files can be found.
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Tests cannot be run at this stage, because they all need to connect to a
# Service Broker, which has not been built yet. Therefore we will only build
# the test programs.
lofar_add_executable(tLBATracking tLBATracking.cc)
lofar_add_executable(tHBATracking tHBATracking.cc)
lofar_add_executable(tAnaBeamMgr tAnaBeamMgr.cc ../src/AnaBeamMgr.cc ../src/Beam.cc ../src/AnalogueBeam.cc)
lofar_add_executable(tStatCal tStatCal.cc ../src/StatCal.cc) 
lofar_add_executable(tIdealStartTime tIdealStartTime.cc)
