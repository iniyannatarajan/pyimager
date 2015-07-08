#!/bin/sh

# runctest.sh: CTest wrapper script for runtest.sh
#
#  Copyright (C) 2009
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
#
#  $Id: runctest.sh 13275 2009-05-15 15:42:36Z loose $

# runtest.sh uses this variable to find test input files and the like.
srcdir="/scratch/software/src/pyimager/LCS/pyparameterset/test"; export srcdir

# Add the bin directory in the build tree to PATH
PATH="/scratch/software/src/pyimager/build/gnu_opt/bin:$PATH"; export PATH

# Add the Python build directory to PYTHONPATH.
PYTHONPATH="/scratch/software/src/pyimager/build/gnu_opt/lib/python2.7/dist-packages"; export PYTHONPATH

# Start CMake/testscripts/runtest.sh
"/scratch/software/src/pyimager/CMake/testscripts/runtest.sh" "$@"

# The Autotools use the magic return value 77 for skipped tests. CMake can
# only handle zero and non-zero return values. To avoid that CMake will flag a
# skipped test as failed, we will silently change the return value 77 to 0.
STATUS=$?
if [ $STATUS -eq 77 ]; then
  STATUS=0
fi
exit $STATUS
