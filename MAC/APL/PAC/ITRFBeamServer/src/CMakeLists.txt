# $Id: CMakeLists.txt 19146 2011-11-02 11:16:48Z schoenmakers $

include(LofarPackageVersion)

# Create symbolic link in binary include directory to current directory.
execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_BINARY_DIR}/include/${PACKAGE_NAME})

# Add the directory where the generated C++ headers are stored to the -I path.
#include_directories(${CMAKE_BINARY_DIR}/include/MAC)

lofar_add_bin_program(versionitrfbeamserver versionitrfbeamserver.cc Package__Version.cc)
lofar_add_bin_program(BeamServer BeamServerMain.cc BeamServer.cc Beam.cc DigitalBeam.cc AnalogueBeam.cc AnaBeamMgr.cc StatCal.cc Package__Version.cc)
lofar_add_bin_program(beamctl beamctl.cc)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/iBeamServer.conf.in
  ${CMAKE_CURRENT_BINARY_DIR}/BeamServer.conf)
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/ibeamctl.conf.in
  ${CMAKE_CURRENT_BINARY_DIR}/beamctl.conf)
  
install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/BeamServer.conf
  ${CMAKE_CURRENT_BINARY_DIR}/beamctl.conf
  DESTINATION etc)
