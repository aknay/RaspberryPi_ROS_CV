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
CMAKE_SOURCE_DIR = /home/pi/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/catkin_ws/build

# Include any dependencies generated for this target.
include beginner_tutorials/CMakeFiles/add_two_ints_client.dir/depend.make

# Include the progress variables for this target.
include beginner_tutorials/CMakeFiles/add_two_ints_client.dir/progress.make

# Include the compile flags for this target's objects.
include beginner_tutorials/CMakeFiles/add_two_ints_client.dir/flags.make

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/flags.make
beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o: /home/pi/catkin_ws/src/beginner_tutorials/src/add_two_ints_client.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pi/catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o"
	cd /home/pi/catkin_ws/build/beginner_tutorials && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o -c /home/pi/catkin_ws/src/beginner_tutorials/src/add_two_ints_client.cpp

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i"
	cd /home/pi/catkin_ws/build/beginner_tutorials && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pi/catkin_ws/src/beginner_tutorials/src/add_two_ints_client.cpp > CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.i

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s"
	cd /home/pi/catkin_ws/build/beginner_tutorials && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pi/catkin_ws/src/beginner_tutorials/src/add_two_ints_client.cpp -o CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.s

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires:
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires
	$(MAKE) -f beginner_tutorials/CMakeFiles/add_two_ints_client.dir/build.make beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides.build
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.provides.build: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o

# Object files for target add_two_ints_client
add_two_ints_client_OBJECTS = \
"CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o"

# External object files for target add_two_ints_client
add_two_ints_client_EXTERNAL_OBJECTS =

/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/build.make
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libroscpp.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_signals-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_filesystem-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/liblog4cxx.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_regex-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/librostime.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_date_time-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /opt/ros/indigo/lib/libcpp_common.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_system-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/libboost_thread-mt.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so
/home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client"
	cd /home/pi/catkin_ws/build/beginner_tutorials && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/add_two_ints_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
beginner_tutorials/CMakeFiles/add_two_ints_client.dir/build: /home/pi/catkin_ws/devel/lib/beginner_tutorials/add_two_ints_client
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/build

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/requires: beginner_tutorials/CMakeFiles/add_two_ints_client.dir/src/add_two_ints_client.cpp.o.requires
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/requires

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/clean:
	cd /home/pi/catkin_ws/build/beginner_tutorials && $(CMAKE_COMMAND) -P CMakeFiles/add_two_ints_client.dir/cmake_clean.cmake
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/clean

beginner_tutorials/CMakeFiles/add_two_ints_client.dir/depend:
	cd /home/pi/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/catkin_ws/src /home/pi/catkin_ws/src/beginner_tutorials /home/pi/catkin_ws/build /home/pi/catkin_ws/build/beginner_tutorials /home/pi/catkin_ws/build/beginner_tutorials/CMakeFiles/add_two_ints_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : beginner_tutorials/CMakeFiles/add_two_ints_client.dir/depend

