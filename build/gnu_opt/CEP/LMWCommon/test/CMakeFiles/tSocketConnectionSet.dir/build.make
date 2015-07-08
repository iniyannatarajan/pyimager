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
include CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/depend.make

# Include the progress variables for this target.
include CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/progress.make

# Include the compile flags for this target's objects.
include CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/flags.make

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/flags.make
CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o: ../../CEP/LMWCommon/test/tSocketConnectionSet.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o -c /scratch/software/src/pyimager/CEP/LMWCommon/test/tSocketConnectionSet.cc

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/CEP/LMWCommon/test/tSocketConnectionSet.cc > CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.i

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/CEP/LMWCommon/test/tSocketConnectionSet.cc -o CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.s

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.requires:
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.requires

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.provides: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.requires
	$(MAKE) -f CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/build.make CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.provides.build
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.provides

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.provides.build: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o

# Object files for target tSocketConnectionSet
tSocketConnectionSet_OBJECTS = \
"CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o"

# External object files for target tSocketConnectionSet
tSocketConnectionSet_EXTERNAL_OBJECTS =

CEP/LMWCommon/test/tSocketConnectionSet: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o
CEP/LMWCommon/test/tSocketConnectionSet: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/build.make
CEP/LMWCommon/test/tSocketConnectionSet: CEP/LMWCommon/src/liblmwcommon.so
CEP/LMWCommon/test/tSocketConnectionSet: LCS/Common/src/libcommon.so
CEP/LMWCommon/test/tSocketConnectionSet: LCS/Blob/src/libblob.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/liblog4cplus.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/libcasa_casa.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libz.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libm.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libhdf5.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libpthread.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libz.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libdl.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libm.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libm.so
CEP/LMWCommon/test/tSocketConnectionSet: LCS/Common/src/libcommon.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/libcasa_casa.so
CEP/LMWCommon/test/tSocketConnectionSet: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
CEP/LMWCommon/test/tSocketConnectionSet: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable tSocketConnectionSet"
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tSocketConnectionSet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/build: CEP/LMWCommon/test/tSocketConnectionSet
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/build

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/requires: CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/tSocketConnectionSet.cc.o.requires
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/requires

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test && $(CMAKE_COMMAND) -P CMakeFiles/tSocketConnectionSet.dir/cmake_clean.cmake
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/clean

CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/CEP/LMWCommon/test /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test /scratch/software/src/pyimager/build/gnu_opt/CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CEP/LMWCommon/test/CMakeFiles/tSocketConnectionSet.dir/depend
