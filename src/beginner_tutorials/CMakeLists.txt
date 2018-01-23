cmake_minimum_required(VERSION 2.8.3)
project(beginner_tutorials)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(Eigen REQUIRED)
include_directories(${Eigen_INCLUDE_DIRS})

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS
        roscpp
        rospy
        std_msgs
        genmsg
        geometry_msgs
)

## Declare ROS messages and services
add_message_files(
        DIRECTORY msg
        FILES
        DataToAssociate.msg
        Point2D.msg
)

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs geometry_msgs)

## Declare a catkin package
catkin_package(
        CATKIN_DEPENDS message_runtime
)

## Build talker and listener
include_directories(include ${catkin_INCLUDE_DIRS})
include_directories(include /home/daniel/catkin_ws/devel/include)

add_executable(talker src/talker.cpp)
target_link_libraries(talker ${catkin_LIBRARIES})
add_dependencies(talker beginner_tutorials_generate_messages_cpp)

add_executable(listener src/listener.cpp)
target_link_libraries(listener ${catkin_LIBRARIES})
add_dependencies(listener beginner_tutorials_generate_messages_cpp)

add_executable(da src/da.cpp)
target_link_libraries(da ${catkin_LIBRARIES})
add_dependencies(da beginner_tutorials_generate_messages_cpp)

add_executable(data_generator src/data_generator.cpp)
target_link_libraries(data_generator ${catkin_LIBRARIES})
add_dependencies(data_generator beginner_tutorials_generate_messages_cpp)


