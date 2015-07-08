#!/bin/echo Usage: source
#-----------------------------------------------------------------------------
# lofarinit.csh: Define the LOFAR environment for C-like shells
#-----------------------------------------------------------------------------
#
# Copyright (C) 2005
# ASTRON (Netherlands Institute for Radio Astronomy)
# P.O.Box 2, 7990 AA Dwingeloo, The Netherlands
#
# This file is part of the LOFAR software suite.
# The LOFAR software suite is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The LOFAR software suite is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with the LOFAR software suite. If not, see <http://www.gnu.org/licenses/>.
#
# $Id: lofarinit.csh.in 30029 2014-09-03 13:44:48Z vdtol $

echo
echo "Initializing the Calibration and Imaging Tiger Team Release"
echo "You should not see this message in any other release of the LOFAR software"
echo

# Define root here.
# This is a placeholder, so do NOT change the line.
# The actual value is filled in by make install (see Makefile.am).
set lfr_root=/scratch/software/pyimager
set lfr_libdir=

# CMake does not define libdir, so we need to do things differently
if ("$lfr_libdir" == "") then
  set lfr_libdir=/scratch/software/pyimager/lib64
endif

# Use only the basename of the the lib
set lfr_libdir=`basename $lfr_libdir`

# Get directory for Python extensions
set lfr_pylibdir=`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib(plat_specific=True, prefix='')"`

# Only modify path variables if $lfr_root is an existing directory.
if (! (-d $lfr_root) ) then
    echo "LOFAR root directory $lfr_root does not exist"
else
    # First strip the current LOFARROOT from PATH, LD_LIBRARY_PATH, PYTHONPATH.
    # Take care that a possible . is preceeded by a backslash.
    if ($?LOFARROOT) then
        set lfr_path = `echo $LOFARROOT | sed -e 's/\./\\\./g'`
	if ($?PATH) then
	    foreach lfr_bin (bin sbin)
		set lfr_bin = "$lfr_path/$lfr_bin"
		setenv PATH `echo $PATH | sed -e "s%:${lfr_bin}:%:%g" -e "s%^${lfr_bin}:%%"  -e "s%:${lfr_bin}"'$%%' -e "s%^${lfr_bin}"'$%%'`
	    end
        endif
        if ($?LD_LIBRARY_PATH) then
            set lfr_lib = "$lfr_path/$lfr_libdir"
            setenv LD_LIBRARY_PATH `echo $LD_LIBRARY_PATH | sed -e "s%:${lfr_lib}:%:%g" -e "s%^${lfr_lib}:%%"  -e "s%:${lfr_lib}"'$%%' -e "s%^${lfr_lib}"'$%%'`
        endif
        if ($?PYTHONPATH) then
            set lfr_pyt = "$lfr_path/$lfr_pylibdir"
            setenv PYTHONPATH `echo $PYTHONPATH | sed -e "s%:${lfr_pyt}:%:%g" -e "s%^${lfr_pyt}:%%"  -e "s%:${lfr_pyt}"'$%%' -e "s%^${lfr_pyt}"'$%%'`
        endif
    endif

    # Now define the new LOFARROOT
    # If not needed, do not do cd;pwd because that resolves symlinks.
    if ( $lfr_root =~ /* ) then
        setenv LOFARROOT $lfr_root
    else
        setenv LOFARROOT `cd >/dev/null $lfr_root; pwd`   # make path absolute
    endif

    # Also strip this path from the current paths (in case it is contained in
    # it).
    set lfr_path = `echo $LOFARROOT | sed -e 's/\./\\\./g'`
    if ($?PATH) then
	foreach lfr_bin (bin sbin)
	    set lfr_bin = "$lfr_path/$lfr_bin"
            setenv PATH `echo $PATH | sed -e "s%:${lfr_bin}:%:%g" -e "s%^${lfr_bin}:%%"  -e "s%:${lfr_bin}"'$%%' -e "s%^${lfr_bin}"'$%%'`
	end
    endif
    if ($?LD_LIBRARY_PATH) then
        set lfr_lib = "$lfr_path/$lfr_libdir"
        setenv LD_LIBRARY_PATH `echo $LD_LIBRARY_PATH | sed -e "s%:${lfr_lib}:%:%g" -e "s%^${lfr_lib}:%%"  -e "s%:${lfr_lib}"'$%%' -e "s%^${lfr_lib}"'$%%'`
    endif
    if ($?PYTHONPATH) then
        set lfr_pyt = "$lfr_path/$lfr_pylibdir"
        setenv PYTHONPATH `echo $PYTHONPATH | sed -e "s%:${lfr_pyt}:%:%g" -e "s%^${lfr_pyt}:%%"  -e "s%:${lfr_pyt}"'$%%' -e "s%^${lfr_pyt}"'$%%'`
    endif
    
    if( "${?LD_LIBRARY_PATH}" != 0 ) then
        if( "${LD_LIBRARY_PATH}" != "" ) then
          echo "=== WARNING ==="
            echo "LD_LIBRARY_PATH contains path(s) to other packages"
            echo "LD_LIBRARY_PATH='$LD_LIBRARY_PATH'"
            echo "These might interfere with the citt release, so they will be removed from the path"
            echo
            setenv LD_LIBRARY_PATH ""
        endif
    endif
    

    # Add the path to the standard paths.
    if (! $?PATH) then
        setenv PATH $LOFARROOT/bin:$LOFARROOT/sbin
    else
        setenv PATH $LOFARROOT/bin:$LOFARROOT/sbin:$PATH
    endif
    if (! $?LD_LIBRARY_PATH) then
        setenv LD_LIBRARY_PATH $LOFARROOT/$lfr_libdir
    else
        setenv LD_LIBRARY_PATH $LOFARROOT/${lfr_libdir}:$LD_LIBRARY_PATH
    endif
    set lfr_pyt = "$LOFARROOT/$lfr_pylibdir"
    if (! $?PYTHONPATH) then
        setenv PYTHONPATH $lfr_pyt
    else
        setenv PYTHONPATH ${lfr_pyt}:$PYTHONPATH
    endif

    # Now define the new LOFARDATAROOT (if possible).
    # First try as data directory of the LOFAR install directory.
    set lfr_path = `echo $LOFARROOT | sed -e 's%/installed.*%%'`
    if ( "$lfr_path" != ""  &&  -d $lfr_path/data ) then
        setenv LOFARDATAROOT $lfr_path/data
    else
        # Try it as the LOFARDATA directory (part of the source tree).
        set lfr_path = `echo $LOFARROOT | sed -e 's%/LOFAR/.*%/LOFAR%'`
        if ( "$lfr_path" != ""  &&  -d ${lfr_path}DATA ) then
            setenv LOFARDATAROOT ${lfr_path}DATA
        else
            setenv LOFARDATAROOT /opt/lofar/data
        endif
    endif

endif

unset lfr_root lfr_bin lfr_libdir lfr_lib lfr_pylibdir lfr_pyt lfr_path
