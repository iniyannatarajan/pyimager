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
include LCS/pytools/src/CMakeFiles/lofar_pytools.dir/depend.make

# Include the progress variables for this target.
include LCS/pytools/src/CMakeFiles/lofar_pytools.dir/progress.make

# Include the compile flags for this target's objects.
include LCS/pytools/src/CMakeFiles/lofar_pytools.dir/flags.make

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/flags.make
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o: LCS/pytools/src/Package__Version.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lofar_pytools.dir/Package__Version.cc.o -c /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src/Package__Version.cc

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lofar_pytools.dir/Package__Version.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src/Package__Version.cc > CMakeFiles/lofar_pytools.dir/Package__Version.cc.i

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lofar_pytools.dir/Package__Version.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src/Package__Version.cc -o CMakeFiles/lofar_pytools.dir/Package__Version.cc.s

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.requires:
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.requires

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.provides: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.requires
	$(MAKE) -f LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build.make LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.provides.build
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.provides

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.provides.build: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/flags.make
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o: ../../LCS/pytools/src/PycExcp.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lofar_pytools.dir/PycExcp.cc.o -c /scratch/software/src/pyimager/LCS/pytools/src/PycExcp.cc

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lofar_pytools.dir/PycExcp.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/LCS/pytools/src/PycExcp.cc > CMakeFiles/lofar_pytools.dir/PycExcp.cc.i

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lofar_pytools.dir/PycExcp.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/LCS/pytools/src/PycExcp.cc -o CMakeFiles/lofar_pytools.dir/PycExcp.cc.s

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.requires:
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.requires

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.provides: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.requires
	$(MAKE) -f LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build.make LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.provides.build
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.provides

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.provides.build: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/flags.make
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o: ../../LCS/pytools/src/PycBasicData.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /scratch/software/src/pyimager/build/gnu_opt/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o -c /scratch/software/src/pyimager/LCS/pytools/src/PycBasicData.cc

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lofar_pytools.dir/PycBasicData.cc.i"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /scratch/software/src/pyimager/LCS/pytools/src/PycBasicData.cc > CMakeFiles/lofar_pytools.dir/PycBasicData.cc.i

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lofar_pytools.dir/PycBasicData.cc.s"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /scratch/software/src/pyimager/LCS/pytools/src/PycBasicData.cc -o CMakeFiles/lofar_pytools.dir/PycBasicData.cc.s

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.requires:
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.requires

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.provides: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.requires
	$(MAKE) -f LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build.make LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.provides.build
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.provides

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.provides.build: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o

# Object files for target lofar_pytools
lofar_pytools_OBJECTS = \
"CMakeFiles/lofar_pytools.dir/Package__Version.cc.o" \
"CMakeFiles/lofar_pytools.dir/PycExcp.cc.o" \
"CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o"

# External object files for target lofar_pytools
lofar_pytools_EXTERNAL_OBJECTS =

LCS/pytools/src/liblofar_pytools.so: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o
LCS/pytools/src/liblofar_pytools.so: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o
LCS/pytools/src/liblofar_pytools.so: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o
LCS/pytools/src/liblofar_pytools.so: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build.make
LCS/pytools/src/liblofar_pytools.so: LCS/Common/src/libcommon.so
LCS/pytools/src/liblofar_pytools.so: /usr/lib/liblog4cplus.so
LCS/pytools/src/liblofar_pytools.so: /usr/lib/x86_64-linux-gnu/libpthread.so
LCS/pytools/src/liblofar_pytools.so: /usr/lib/x86_64-linux-gnu/libboost_python.so
LCS/pytools/src/liblofar_pytools.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
LCS/pytools/src/liblofar_pytools.so: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library liblofar_pytools.so"
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lofar_pytools.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build: LCS/pytools/src/liblofar_pytools.so
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/build

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/requires: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/Package__Version.cc.o.requires
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/requires: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycExcp.cc.o.requires
LCS/pytools/src/CMakeFiles/lofar_pytools.dir/requires: LCS/pytools/src/CMakeFiles/lofar_pytools.dir/PycBasicData.cc.o.requires
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/requires

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/clean:
	cd /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src && $(CMAKE_COMMAND) -P CMakeFiles/lofar_pytools.dir/cmake_clean.cmake
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/clean

LCS/pytools/src/CMakeFiles/lofar_pytools.dir/depend:
	cd /scratch/software/src/pyimager/build/gnu_opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /scratch/software/src/pyimager /scratch/software/src/pyimager/LCS/pytools/src /scratch/software/src/pyimager/build/gnu_opt /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src /scratch/software/src/pyimager/build/gnu_opt/LCS/pytools/src/CMakeFiles/lofar_pytools.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : LCS/pytools/src/CMakeFiles/lofar_pytools.dir/depend
