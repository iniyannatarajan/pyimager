# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /scratch/software/src/pyimager

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /scratch/software/src/pyimager/build/gnu_opt

# Include any dependencies generated for this target.
include CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/depend.make

# Include the progress variables for this target.
include CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/progress.make

# Include the compile flags for this target's objects.
include CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/flags.make

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/flags.make
CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o: ../../CEP/ParmDB/src/parmexportcal.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/parmexportcal.dir/parmexportcal.cc.o -c /scratch/software/src/pyimager/CEP/ParmDB/src/parmexportcal.cc

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/parmexportcal.dir/parmexportcal.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/CEP/ParmDB/src/parmexportcal.cc > CMakeFiles/parmexportcal.dir/parmexportcal.cc.i

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/parmexportcal.dir/parmexportcal.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/CEP/ParmDB/src/parmexportcal.cc -o CMakeFiles/parmexportcal.dir/parmexportcal.cc.s

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.requires:
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.requires

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.provides: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.requires
	$(MAKE) -f CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/build.make CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.provides.build
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.provides

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.provides.build: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o

# Object files for target parmexportcal
parmexportcal_OBJECTS = \
"CMakeFiles/parmexportcal.dir/parmexportcal.cc.o"

# External object files for target parmexportcal
parmexportcal_EXTERNAL_OBJECTS =

CEP/ParmDB/src/parmexportcal: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o
CEP/ParmDB/src/parmexportcal: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/build.make
CEP/ParmDB/src/parmexportcal: CEP/ParmDB/src/libparmdb.so
CEP/ParmDB/src/parmexportcal: LCS/Common/src/libcommon.so
CEP/ParmDB/src/parmexportcal: LCS/Blob/src/libblob.so
CEP/ParmDB/src/parmexportcal: CEP/LMWCommon/src/liblmwcommon.so
CEP/ParmDB/src/parmexportcal: /usr/lib/liblog4cplus.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmexportcal: /usr/lib/libcasa_tables.so
CEP/ParmDB/src/parmexportcal: /usr/lib/libcasa_casa.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libz.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libz.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmexportcal: LCS/Blob/src/libblob.so
CEP/ParmDB/src/parmexportcal: LCS/Common/src/libcommon.so
CEP/ParmDB/src/parmexportcal: /usr/lib/libcasa_tables.so
CEP/ParmDB/src/parmexportcal: /usr/lib/libcasa_casa.so
CEP/ParmDB/src/parmexportcal: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/ParmDB/src/parmexportcal: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable parmexportcal"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parmexportcal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/build: CEP/ParmDB/src/parmexportcal
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/build

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/requires: CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/parmexportcal.cc.o.requires
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/requires

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && $(CMAKE_COMMAND) -P CMakeFiles/parmexportcal.dir/cmake_clean.cmake
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/clean

CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/CEP/ParmDB/src /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CEP/ParmDB/src/CMakeFiles/parmexportcal.dir/depend

