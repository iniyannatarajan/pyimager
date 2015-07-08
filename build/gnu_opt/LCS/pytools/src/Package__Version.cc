//# Get revision info for package pytools; generated by CMake

#include <pytools/Package__Version.h>
#include <Common/Version.h>
#include <Common/Package__Version.h>

namespace LOFAR {
  Version pytoolsVersion::getInfo()
  {
    return Version ("pytools",
                    getVersion(), getConfVersion(),
                    getRevision(), getPackageRevision(),
                    getNrChangedFiles(),
                    getBuildTime(), getBuildUser(), getBuildMachine());
  }

  std::string pytoolsVersion::getVersion()
    { return "CEP-Imager-Task5206"; }
  std::string pytoolsVersion::getConfVersion()
    { return "1.0"; }
  std::string pytoolsVersion::getRevision()
    { return "31269"; }
  std::string pytoolsVersion::getPackageRevision()
    { return "27477"; }
  std::string pytoolsVersion::getNrChangedFiles()
    { return "0"; }
  std::string pytoolsVersion::getBuildTime()
  { return std::string(__DATE__) + " " + std::string(__TIME__); }
  std::string pytoolsVersion::getBuildUser()
  { return "iniyan"; }
  std::string pytoolsVersion::getBuildMachine()
  { return "pyimager.c.meerkat-7-gazing.internal"; }
  void pytoolsVersion::fillInfo
    (int level, std::vector<Version::PkgInfo>& vec)
  {
    // Add info of this package if needed.
    vec.push_back (Version::PkgInfo(level, &getInfo));
    // Add info of packages being used.
    CommonVersion::fillInfo (level+1, vec);
  }
}