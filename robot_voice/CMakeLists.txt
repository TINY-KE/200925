cmake_minimum_required(VERSION 2.8.3)
project(robot_voice)

## Add support for C++11, supported in ROS Kinetic and newer
add_definitions(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
        actionlib
        geometry_msgs
        move_base_msgs
        tf
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot_voice
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
  include
)


add_executable(tts_subscribe src/tts_subscribe.cpp)
target_link_libraries(
   tts_subscribe
   ${catkin_LIBRARIES} 
   libmsc.so -ldl -pthread
 )

add_executable(iat_publish 
  src/iat_publish.cpp 
  src/speech_recognizer.c 
  src/linuxrec.c)
target_link_libraries(
   iat_publish
   ${catkin_LIBRARIES} 
   libmsc.so -ldl -lpthread -lm -lrt -lasound
 )
add_executable(voice_goal
        src/voice_goal.cpp
        src/speech_recognizer.c
        src/linuxrec.c)
target_link_libraries(
        voice_goal
        ${catkin_LIBRARIES}
        libmsc.so -ldl -lpthread -lm -lrt -lasound
)

add_executable(voice_assistant src/voice_assistant.cpp)
target_link_libraries(
   voice_assistant
   ${catkin_LIBRARIES}
   libmsc.so -ldl -pthread
 )
add_executable(goal_move src/goal_move.cpp)
target_link_libraries(goal_move ${catkin_LIBRARIES} )