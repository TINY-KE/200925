# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/zhjd/catkin_ws/src/robot_voice

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/voice_goal.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/voice_goal.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/voice_goal.dir/flags.make

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o: CMakeFiles/voice_goal.dir/flags.make
CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o: ../src/voice_goal.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o -c /home/zhjd/catkin_ws/src/robot_voice/src/voice_goal.cpp

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/voice_goal.dir/src/voice_goal.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhjd/catkin_ws/src/robot_voice/src/voice_goal.cpp > CMakeFiles/voice_goal.dir/src/voice_goal.cpp.i

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/voice_goal.dir/src/voice_goal.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhjd/catkin_ws/src/robot_voice/src/voice_goal.cpp -o CMakeFiles/voice_goal.dir/src/voice_goal.cpp.s

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.requires:

.PHONY : CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.requires

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.provides: CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.requires
	$(MAKE) -f CMakeFiles/voice_goal.dir/build.make CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.provides.build
.PHONY : CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.provides

CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.provides.build: CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o


CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o: CMakeFiles/voice_goal.dir/flags.make
CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o: ../src/speech_recognizer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o   -c /home/zhjd/catkin_ws/src/robot_voice/src/speech_recognizer.c

CMakeFiles/voice_goal.dir/src/speech_recognizer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/voice_goal.dir/src/speech_recognizer.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zhjd/catkin_ws/src/robot_voice/src/speech_recognizer.c > CMakeFiles/voice_goal.dir/src/speech_recognizer.c.i

CMakeFiles/voice_goal.dir/src/speech_recognizer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/voice_goal.dir/src/speech_recognizer.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zhjd/catkin_ws/src/robot_voice/src/speech_recognizer.c -o CMakeFiles/voice_goal.dir/src/speech_recognizer.c.s

CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.requires:

.PHONY : CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.requires

CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.provides: CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.requires
	$(MAKE) -f CMakeFiles/voice_goal.dir/build.make CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.provides.build
.PHONY : CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.provides

CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.provides.build: CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o


CMakeFiles/voice_goal.dir/src/linuxrec.c.o: CMakeFiles/voice_goal.dir/flags.make
CMakeFiles/voice_goal.dir/src/linuxrec.c.o: ../src/linuxrec.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/voice_goal.dir/src/linuxrec.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/voice_goal.dir/src/linuxrec.c.o   -c /home/zhjd/catkin_ws/src/robot_voice/src/linuxrec.c

CMakeFiles/voice_goal.dir/src/linuxrec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/voice_goal.dir/src/linuxrec.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zhjd/catkin_ws/src/robot_voice/src/linuxrec.c > CMakeFiles/voice_goal.dir/src/linuxrec.c.i

CMakeFiles/voice_goal.dir/src/linuxrec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/voice_goal.dir/src/linuxrec.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zhjd/catkin_ws/src/robot_voice/src/linuxrec.c -o CMakeFiles/voice_goal.dir/src/linuxrec.c.s

CMakeFiles/voice_goal.dir/src/linuxrec.c.o.requires:

.PHONY : CMakeFiles/voice_goal.dir/src/linuxrec.c.o.requires

CMakeFiles/voice_goal.dir/src/linuxrec.c.o.provides: CMakeFiles/voice_goal.dir/src/linuxrec.c.o.requires
	$(MAKE) -f CMakeFiles/voice_goal.dir/build.make CMakeFiles/voice_goal.dir/src/linuxrec.c.o.provides.build
.PHONY : CMakeFiles/voice_goal.dir/src/linuxrec.c.o.provides

CMakeFiles/voice_goal.dir/src/linuxrec.c.o.provides.build: CMakeFiles/voice_goal.dir/src/linuxrec.c.o


# Object files for target voice_goal
voice_goal_OBJECTS = \
"CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o" \
"CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o" \
"CMakeFiles/voice_goal.dir/src/linuxrec.c.o"

# External object files for target voice_goal
voice_goal_EXTERNAL_OBJECTS =

devel/lib/robot_voice/voice_goal: CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o
devel/lib/robot_voice/voice_goal: CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o
devel/lib/robot_voice/voice_goal: CMakeFiles/voice_goal.dir/src/linuxrec.c.o
devel/lib/robot_voice/voice_goal: CMakeFiles/voice_goal.dir/build.make
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libtf.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libtf2_ros.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libactionlib.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libmessage_filters.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libroscpp.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_signals.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libxmlrpcpp.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libtf2.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libroscpp_serialization.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/librosconsole.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_regex.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/librostime.so
devel/lib/robot_voice/voice_goal: /opt/ros/kinetic/lib/libcpp_common.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_system.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_thread.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libpthread.so
devel/lib/robot_voice/voice_goal: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
devel/lib/robot_voice/voice_goal: CMakeFiles/voice_goal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable devel/lib/robot_voice/voice_goal"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/voice_goal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/voice_goal.dir/build: devel/lib/robot_voice/voice_goal

.PHONY : CMakeFiles/voice_goal.dir/build

CMakeFiles/voice_goal.dir/requires: CMakeFiles/voice_goal.dir/src/voice_goal.cpp.o.requires
CMakeFiles/voice_goal.dir/requires: CMakeFiles/voice_goal.dir/src/speech_recognizer.c.o.requires
CMakeFiles/voice_goal.dir/requires: CMakeFiles/voice_goal.dir/src/linuxrec.c.o.requires

.PHONY : CMakeFiles/voice_goal.dir/requires

CMakeFiles/voice_goal.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/voice_goal.dir/cmake_clean.cmake
.PHONY : CMakeFiles/voice_goal.dir/clean

CMakeFiles/voice_goal.dir/depend:
	cd /home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhjd/catkin_ws/src/robot_voice /home/zhjd/catkin_ws/src/robot_voice /home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug /home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug /home/zhjd/catkin_ws/src/robot_voice/cmake-build-debug/CMakeFiles/voice_goal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/voice_goal.dir/depend
