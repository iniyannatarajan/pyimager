//# Print revision info for package StationResponse; generated by CMake

#include <StationResponse/Package__Version.h>
#include <Common/Version.h>
#include <iostream>

using namespace LOFAR;

int main (int argc, const char* argv[])
{
  std::string type = "brief";
  if (argc > 1) {
    type = argv[1];
  }
  Version::show<StationResponseVersion> (std::cout, "StationResponse", type);
  return 0;
}