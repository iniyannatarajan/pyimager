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
include LCS/Common/test/CMakeFiles/tParameterRecord.dir/depend.make

# Include the progress variables for this target.
include LCS/Common/test/CMakeFiles/tParameterRecord.dir/progress.make

# Include the compile flags for this target's objects.
include LCS/Common/test/CMakeFiles/tParameterRecord.dir/flags.make

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o: LCS/Common/test/CMakeFiles/tParameterRecord.dir/flags.make
LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o: ../../LCS/Common/test/tParameterRecord.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o -c /scratch/software/src/pyimager/LCS/Common/test/tParameterRecord.cc

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/LCS/Common/test/tParameterRecord.cc > CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.i

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/LCS/Common/test/tParameterRecord.cc -o CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.s

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.requires:
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.requires

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.provides: LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.requires
	$(MAKE) -f LCS/Common/test/CMakeFiles/tParameterRecord.dir/build.make LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.provides.build
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.provides

LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.provides.build: LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o

# Object files for target tParameterRecord
tParameterRecord_OBJECTS = \
"CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o"

# External object files for target tParameterRecord
tParameterRecord_EXTERNAL_OBJECTS =

LCS/Common/test/tParameterRecord: LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o
LCS/Common/test/tParameterRecord: LCS/Common/test/CMakeFiles/tParameterRecord.dir/build.make
LCS/Common/test/tParameterRecord: LCS/Common/src/libcommon.so
LCS/Common/test/tParameterRecord: /usr/lib/liblog4cplus.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/test/tParameterRecord: /usr/lib/libcasa_casa.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libhdf5.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libz.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libdl.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libhdf5.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libz.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libdl.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libm.so
LCS/Common/test/tParameterRecord: /usr/lib/libcasa_casa.so
LCS/Common/test/tParameterRecord: /usr/lib/x86_64-linux-gnu/libhdf5_hl.so
LCS/Common/test/tParameterRecord: LCS/Common/test/CMakeFiles/tParameterRecord.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable tParameterRecord"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tParameterRecord.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
LCS/Common/test/CMakeFiles/tParameterRecord.dir/build: LCS/Common/test/tParameterRecord
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/build

LCS/Common/test/CMakeFiles/tParameterRecord.dir/requires: LCS/Common/test/CMakeFiles/tParameterRecord.dir/tParameterRecord.cc.o.requires
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/requires

LCS/Common/test/CMakeFiles/tParameterRecord.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test && $(CMAKE_COMMAND) -P CMakeFiles/tParameterRecord.dir/cmake_clean.cmake
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/clean

LCS/Common/test/CMakeFiles/tParameterRecord.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/LCS/Common/test /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test /scratch/software/src/pyimager/build/gnu_opt/LCS/Common/test/CMakeFiles/tParameterRecord.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : LCS/Common/test/CMakeFiles/tParameterRecord.dir/depend

