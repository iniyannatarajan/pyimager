# - Template for a CMake script to update LOFAR package version information.
#
# Template file for the UpdatePackageVersion.cmake macro that is used to
# create or update the files Package__Version.h, Package__Version.cc and
# version<package>.cc, which provide detailed information about the version of
# a LOFAR package and its dependent packages.
#
# This file will be configured by LofarPackageVersion.cmake. The configured
# file will then be used as a CMake script in a custom target (also created by
# LofarPackageVersion.cmake) that's considered to be always out-of-date, thus
# triggering an update of the version information with each 'make'.
#
# See also LofarPackageVersion.cmake

#  $Id: UpdatePackageVersion.cmake 14806 2010-01-15 11:26:13Z loose $
#
#  Copyright (C) 2010
#  ASTRON (Netherlands Foundation for Research in Astronomy)
#  P.O.Box 2, 7990 AA Dwingeloo, The Netherlands, seg@astron.nl
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# Canonicalize a package name: replace every non-alpha character with an
# underscore.
macro(pkg_canonicalize _in _out)
  string(REGEX REPLACE "[^A-Za-z]" "_" "${_out}" "${_in}")
endmacro(pkg_canonicalize _in _out)

# Initialize variables
set(_cvers "Unknown")
set(_rvers "Unknown")
set(_grev "Unknown")
set(_lrev "Unknown")
set(_nrch "Unknown")
if("0.1" MATCHES ".+")
  set(_cvers 0.1)
endif("0.1" MATCHES ".+")
pkg_canonicalize("LMWCommon" _pkg)
string(TOLOWER "LMWCommon" _lpkg)
string(TOUPPER ${_pkg} _upkg)
site_name(_hostname)

# Set the locale to C to avoid translated output from svn.
set(ENV{LC_ALL} C)

# Retrieve version and revision information from the repository, using
# 'svn info' and 'svn status'
set(_svn_tmp "/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/version.svn.tmp")
execute_process(COMMAND /usr/bin/svn info /scratch/software/src/pyimager/CEP/LMWCommon
  RESULT_VARIABLE _result
  OUTPUT_FILE "${_svn_tmp}"
  OUTPUT_STRIP_TRAILING_WHITESPACE
  ERROR_VARIABLE _error)
if(_result EQUAL 0)
  # Get version.
  # It should look like trunk/package or tags/package-version/package
  file(STRINGS "${_svn_tmp}" _url REGEX "^URL:")
  string(REGEX REPLACE "^URL: *(.*)$" "\\1" _url "${_url}")
  file(STRINGS "${_svn_tmp}" _root REGEX "^Repository Root:")
  string(REGEX REPLACE "^Repository Root: *(.*)$" "\\1" _root "${_root}")
  # Some buggy svn clients succeed without producing the expected output,
  # causing ${_root} to be empty.
  if(_root MATCHES ".+")
    string(REGEX REPLACE "${_root}" "" _rvers "${_url}")
  endif(_root MATCHES ".+")
  if(_rvers MATCHES "^/trunk/")
    set(_rvers "trunk")
  elseif(_rvers MATCHES "^/tags/" OR _rvers MATCHES "^/branches/")
    # We have a task branch (for a bug) or a release branch.
    # Remove all but version and replace _ in version by .
    string(REGEX REPLACE "^/[^/]*/([^/]*)/.*$" "\\1" _rvers "${_rvers}")
    if(_rvers MATCHES "-Bug[0-9]+-")    # This is a task tag/branch
      string(REGEX REPLACE "^.*-(Bug[0-9]+)-.*$" "\\1" _rvers "${_rvers}")
    else(_rvers MATCHES "-Bug[0-9]+-")  # This is a release tag/branch
      string(REGEX REPLACE "^.*-([0-9]+)_([0-9]+[^-]*).*$" "\\1.\\2" 
        _rvers "${_rvers}")
    endif(_rvers MATCHES "-Bug[0-9]+-")
  endif(_rvers MATCHES "^/trunk/")
  # Get revision.
  file(STRINGS "${_svn_tmp}" _grev REGEX "^Revision:")
  string(REGEX REPLACE "^Revision: *(.*)$" "\\1" _grev "${_grev}")
  file(STRINGS "${_svn_tmp}" _lrev REGEX "^Last Changed Rev:")
  string(REGEX REPLACE "^Last Changed Rev: *(.*)$" "\\1" _lrev "${_lrev}")
  # Count the number of locally added/deleted/modified/replaced files.
  execute_process(COMMAND /usr/bin/svn status -q /scratch/software/src/pyimager/CEP/LMWCommon
    COMMAND grep -c "^[ADMR]"
    OUTPUT_VARIABLE _nrch
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  # Removed temporary file
  file(REMOVE "${_svn_tmp}")
endif(_result EQUAL 0)

# Create/update Package__Version.h. Avoid unnecessary recompilations:
# first create a temporary file; only copy it if files are different.
set(_file "/scratch/software/src/pyimager/build/gnu_opt/include/Package__Version/LMWCommon/Package__Version.h")
file(WRITE "${_file}.tmp"
  "//# Get revision info for package LMWCommon; generated by CMake\n"
  "\n"
  "#ifndef LOFAR_${_upkg}_PACKAGE__VERSION_H\n"
  "#define LOFAR_${_upkg}_PACKAGE__VERSION_H\n"
  "\n"
  "#include <Common/Version.h>\n"
  "\n"
  "// Class to get the version (revision) of the package and the packages it uses.\n"
  "namespace LOFAR {\n"
  "  class ${_pkg}Version\n"
  "  {\n"
  "  public:\n"
  "    // Get the info for this package.\n"
  "    static Version getInfo();\n"
  "\n"
  "    // Get the version number of the package (as given in repository).\n"
  "    static std::string getVersion();\n"
  "    // Get the svn version number of the package according to CMakeLists.txt.\n"
  "    static std::string getConfVersion();\n"
  "    // Get the global revision number of the package.\n"
  "    static std::string getRevision();\n"
  "    // Get the local revision number of the package.\n"
  "    static std::string getPackageRevision();\n"
  "    // Get the number of files differing from repository.\n"
  "    // Usually this is blank, but it can tell the nr of changed files.\n"
  "    static std::string getNrChangedFiles();\n"
  "    // Get the date/time the package was built (in fact, configured).\n"
  "    static std::string getBuildTime();\n"
  "    // Get the name of the user who built the package.\n"
  "    static std::string getBuildUser();\n"
  "    // Get the machine the package was built on.\n"
  "    static std::string getBuildMachine();\n"
  "\n"
  "    // Append the vector with the vinfo of this package and used packages.\n"
  "    static void fillInfo (int level,\n"
  "                          std::vector<Version::PkgInfo>& vec);\n"
  "  };\n"
  "}\n"
  "\n"
  "#endif\n")
execute_process(COMMAND "/usr/bin/cmake" -E 
  copy_if_different "${_file}.tmp" "${_file}")
file(REMOVE "${_file}.tmp")

# Create/update Package__Version.cc. Avoid unnecessary recompilations:
# first create a temporary file; only copy it if files are different.
set(_file "/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/src/Package__Version.cc")
file(WRITE "${_file}.tmp"
  "//# Get revision info for package LMWCommon; generated by CMake\n"
  "\n"
  "#include <LMWCommon/Package__Version.h>\n"
  "#include <Common/Version.h>\n")
foreach(_dep Common;Blob)
  file(APPEND "${_file}.tmp"
    "#include <${_dep}/Package__Version.h>\n")
endforeach(_dep Common;Blob)
file(APPEND "${_file}.tmp"
  "\n"
  "namespace LOFAR {\n"
  "  Version ${_pkg}Version::getInfo()\n"
  "  {\n"
  "    return Version (\"LMWCommon\",\n"
  "                    getVersion(), getConfVersion(),\n"
  "                    getRevision(), getPackageRevision(),\n"
  "                    getNrChangedFiles(),\n"
  "                    getBuildTime(), getBuildUser(), getBuildMachine());\n"
  "  }\n"
  "\n"
  "  std::string ${_pkg}Version::getVersion()\n"
  "    { return \"${_rvers}\"; }\n"
  "  std::string ${_pkg}Version::getConfVersion()\n"
  "    { return \"${_cvers}\"; }\n"
  "  std::string ${_pkg}Version::getRevision()\n"
  "    { return \"${_grev}\"; }\n"
  "  std::string ${_pkg}Version::getPackageRevision()\n"
  "    { return \"${_lrev}\"; }\n"
  "  std::string ${_pkg}Version::getNrChangedFiles()\n"
  "    { return \"${_nrch}\"; }\n"
  "  std::string ${_pkg}Version::getBuildTime()\n"
  "  { return std::string(__DATE__) + \" \" + std::string(__TIME__); }\n"
  "  std::string ${_pkg}Version::getBuildUser()\n"
  "  { return \"$ENV{USER}\"; }\n"
  "  std::string ${_pkg}Version::getBuildMachine()\n"
  "  { return \"${_hostname}\"; }\n"
  "  void ${_pkg}Version::fillInfo\n"
  "    (int level, std::vector<Version::PkgInfo>& vec)\n"
  "  {\n"
  "    // Add info of this package if needed.\n"
  "    vec.push_back (Version::PkgInfo(level, &getInfo));\n"
  "    // Add info of packages being used.\n")
foreach(_dep Common;Blob)
  pkg_canonicalize("${_dep}" _dep)
  file(APPEND "${_file}.tmp"
    "    ${_dep}Version::fillInfo (level+1, vec);\n")
endforeach(_dep Common;Blob)
file(APPEND "${_file}.tmp"
  "  }\n"
  "}\n")
execute_process(COMMAND "/usr/bin/cmake" -E 
  copy_if_different "${_file}.tmp" "${_file}")
file(REMOVE "${_file}.tmp")

# Create/update version<pkg>.cc. Avoid unnecessary recompilations:
# first create a temporary file; only copy it if files are different.
set(_file "/scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/src/version${_lpkg}.cc")
file(WRITE "${_file}.tmp"
  "//# Print revision info for package LMWCommon; generated by CMake\n"
  "\n"
  "#include <LMWCommon/Package__Version.h>\n"
  "#include <Common/Version.h>\n"
  "#include <iostream>\n"
  "\n"
  "using namespace LOFAR;\n"
  "\n"
  "int main (int argc, const char* argv[])\n"
  "{\n"
  "  std::string type = \"brief\";\n"
  "  if (argc > 1) {\n"
  "    type = argv[1];\n"
  "  }\n"
  "  Version::show<${_pkg}Version> (std::cout, \"LMWCommon\", type);\n"
  "  return 0;\n"
  "}\n")
execute_process(COMMAND "/usr/bin/cmake" -E 
  copy_if_different "${_file}.tmp" "${_file}")
file(REMOVE "${_file}.tmp")