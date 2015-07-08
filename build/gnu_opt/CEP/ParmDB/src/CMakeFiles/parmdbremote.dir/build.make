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
include CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/depend.make

# Include the progress variables for this target.
include CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/progress.make

# Include the compile flags for this target's objects.
include CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/flags.make

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/flags.make
CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o: ../../CEP/ParmDB/src/parmdbremote.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/parmdbremote.dir/parmdbremote.cc.o -c /scratch/software/src/pyimager/CEP/ParmDB/src/parmdbremote.cc

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/parmdbremote.dir/parmdbremote.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/CEP/ParmDB/src/parmdbremote.cc > CMakeFiles/parmdbremote.dir/parmdbremote.cc.i

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/parmdbremote.dir/parmdbremote.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/CEP/ParmDB/src/parmdbremote.cc -o CMakeFiles/parmdbremote.dir/parmdbremote.cc.s

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.requires:
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.requires

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.provides: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.requires
	$(MAKE) -f CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/build.make CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.provides.build
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.provides

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.provides.build: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o

# Object files for target parmdbremote
parmdbremote_OBJECTS = \
"CMakeFiles/parmdbremote.dir/parmdbremote.cc.o"

# External object files for target parmdbremote
parmdbremote_EXTERNAL_OBJECTS =

CEP/ParmDB/src/parmdbremote: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o
CEP/ParmDB/src/parmdbremote: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/build.make
CEP/ParmDB/src/parmdbremote: CEP/ParmDB/src/libparmdb.so
CEP/ParmDB/src/parmdbremote: LCS/Common/src/libcommon.so
CEP/ParmDB/src/parmdbremote: LCS/Blob/src/libblob.so
CEP/ParmDB/src/parmdbremote: CEP/LMWCommon/src/liblmwcommon.so
CEP/ParmDB/src/parmdbremote: /usr/lib/liblog4cplus.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmdbremote: /usr/lib/libcasa_tables.so
CEP/ParmDB/src/parmdbremote: /usr/lib/libcasa_casa.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libz.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libz.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libm.so
CEP/ParmDB/src/parmdbremote: LCS/Blob/src/libblob.so
CEP/ParmDB/src/parmdbremote: LCS/Common/src/libcommon.so
CEP/ParmDB/src/parmdbremote: /usr/lib/libcasa_tables.so
CEP/ParmDB/src/parmdbremote: /usr/lib/libcasa_casa.so
CEP/ParmDB/src/parmdbremote: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/ParmDB/src/parmdbremote: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable parmdbremote"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parmdbremote.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/build: CEP/ParmDB/src/parmdbremote
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/build

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/requires: CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/parmdbremote.cc.o.requires
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/requires

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src && $(CMAKE_COMMAND) -P CMakeFiles/parmdbremote.dir/cmake_clean.cmake
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/clean

CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/CEP/ParmDB/src /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src /scratch/software/src/pyimager/build/gnu_opt/CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CEP/ParmDB/src/CMakeFiles/parmdbremote.dir/depend

