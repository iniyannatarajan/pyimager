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
include LCS/Common/src/CMakeFiles/versioncommon.dir/depend.make

# Include the progress variables for this target.
include LCS/Common/src/CMakeFiles/versioncommon.dir/progress.make

# Include the compile flags for this target's objects.
include LCS/Common/src/CMakeFiles/versioncommon.dir/flags.make

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o: LCS/Common/src/CMakeFiles/versioncommon.dir/flags.make
LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o: LCS/Common/src/versioncommon.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/versioncommon.dir/versioncommon.cc.o -c /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src/versioncommon.cc

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/versioncommon.dir/versioncommon.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src/versioncommon.cc > CMakeFiles/versioncommon.dir/versioncommon.cc.i

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/versioncommon.dir/versioncommon.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src/versioncommon.cc -o CMakeFiles/versioncommon.dir/versioncommon.cc.s

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.requires:
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.requires

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.provides: LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.requires
	$(MAKE) -f LCS/Common/src/CMakeFiles/versioncommon.dir/build.make LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.provides.build
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.provides

LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.provides.build: LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o

# Object files for target versioncommon
versioncommon_OBJECTS = \
"CMakeFiles/versioncommon.dir/versioncommon.cc.o"

# External object files for target versioncommon
versioncommon_EXTERNAL_OBJECTS =

LCS/Common/src/versioncommon: LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o
LCS/Common/src/versioncommon: LCS/Common/src/CMakeFiles/versioncommon.dir/build.make
LCS/Common/src/versioncommon: LCS/Common/src/libcommon.so
LCS/Common/src/versioncommon: /usr/lib/liblog4cplus.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/src/versioncommon: /usr/lib/libcasa_casa.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libhdf5.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libz.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libdl.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libhdf5.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libz.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libdl.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/src/versioncommon: /usr/lib/libcasa_casa.so
LCS/Common/src/versioncommon: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
LCS/Common/src/versioncommon: LCS/Common/src/CMakeFiles/versioncommon.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable versioncommon"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/versioncommon.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
LCS/Common/src/CMakeFiles/versioncommon.dir/build: LCS/Common/src/versioncommon
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/build

LCS/Common/src/CMakeFiles/versioncommon.dir/requires: LCS/Common/src/CMakeFiles/versioncommon.dir/versioncommon.cc.o.requires
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/requires

LCS/Common/src/CMakeFiles/versioncommon.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src && $(CMAKE_COMMAND) -P CMakeFiles/versioncommon.dir/cmake_clean.cmake
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/clean

LCS/Common/src/CMakeFiles/versioncommon.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/LCS/Common/src /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/src/CMakeFiles/versioncommon.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : LCS/Common/src/CMakeFiles/versioncommon.dir/depend

