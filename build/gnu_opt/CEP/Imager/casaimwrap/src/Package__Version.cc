//# Get revision info for package casaimwrap; generated by CMake

#include <casaimwrap/Package__Version.h>
#include <Common/Version.h>
#include <LofarFT/Package__Version.h>

namespace LOFAR {
  Version casaimwrapVersion::getInfo()
  {
    return Version ("casaimwrap",
                    getVersion(), getConfVersion(),
                    getRevision(), getPackageRevision(),
                    getNrChangedFiles(),
                    getBuildTime(), getBuildUser(), getBuildMachine());
  }

  std::string casaimwrapVersion::getVersion()
    { return "CEP-Imager-Task5206"; }
  std::string casaimwrapVersion::getConfVersion()
    { return "0.1"; }
  std::string casaimwrapVersion::getRevision()
    { return "31269"; }
  std::string casaimwrapVersion::getPackageRevision()
    { return "29883"; }
  std::string casaimwrapVersion::getNrChangedFiles()
    { return "0"; }
  std::string casaimwrapVersion::getBuildTime()
  { return std::string(__DATE__) + " " + std::string(__TIME__); }
  std::string casaimwrapVersion::getBuildUser()
  { return "iniyan"; }
  std::string casaimwrapVersion::getBuildMachine()
  { return "pyimager.c.meerkat-7-gazing.internal"; }
  void casaimwrapVersion::fillInfo
    (int level, std::vector<Version::PkgInfo>& vec)
  {
    // Add info of this package if needed.
    vec.push_back (Version::PkgInfo(level, &getInfo));
    // Add info of packages being used.
    LofarFTVersion::fillInfo (level+1, vec);
  }
}
