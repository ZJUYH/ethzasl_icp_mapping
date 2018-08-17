# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ethzasl_icp_mapper: 0 messages, 6 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ethzasl_icp_mapper_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv" "geometry_msgs/Point:sensor_msgs/PointField:sensor_msgs/PointCloud2:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header"
)

get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv" ""
)

get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv" "geometry_msgs/Point:geometry_msgs/PoseWithCovariance:geometry_msgs/TwistWithCovariance:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Twist:nav_msgs/Odometry:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv" "sensor_msgs/PointField:geometry_msgs/Vector3:sensor_msgs/PointCloud2:geometry_msgs/Quaternion:geometry_msgs/Transform:std_msgs/Header"
)

get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv" "std_msgs/String"
)

get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv" NAME_WE)
add_custom_target(_ethzasl_icp_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ethzasl_icp_mapper" "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_cpp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
)

### Generating Module File
_generate_module_cpp(ethzasl_icp_mapper
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ethzasl_icp_mapper_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ethzasl_icp_mapper_generate_messages ethzasl_icp_mapper_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_cpp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ethzasl_icp_mapper_gencpp)
add_dependencies(ethzasl_icp_mapper_gencpp ethzasl_icp_mapper_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ethzasl_icp_mapper_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_lisp(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
)

### Generating Module File
_generate_module_lisp(ethzasl_icp_mapper
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ethzasl_icp_mapper_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ethzasl_icp_mapper_generate_messages ethzasl_icp_mapper_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_lisp _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ethzasl_icp_mapper_genlisp)
add_dependencies(ethzasl_icp_mapper_genlisp ethzasl_icp_mapper_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ethzasl_icp_mapper_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/indigo/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)
_generate_srv_py(ethzasl_icp_mapper
  "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
)

### Generating Module File
_generate_module_py(ethzasl_icp_mapper
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ethzasl_icp_mapper_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ethzasl_icp_mapper_generate_messages ethzasl_icp_mapper_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetBoundedMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/SetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/CorrectPose.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/MatchClouds.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/LoadMap.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/yh/mine_ws/src/ethzasl_icp_mapping/ethzasl_icp_mapper/srv/GetMode.srv" NAME_WE)
add_dependencies(ethzasl_icp_mapper_generate_messages_py _ethzasl_icp_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ethzasl_icp_mapper_genpy)
add_dependencies(ethzasl_icp_mapper_genpy ethzasl_icp_mapper_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ethzasl_icp_mapper_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ethzasl_icp_mapper
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ethzasl_icp_mapper
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(ethzasl_icp_mapper_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ethzasl_icp_mapper
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ethzasl_icp_mapper_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(ethzasl_icp_mapper_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ethzasl_icp_mapper_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ethzasl_icp_mapper_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(ethzasl_icp_mapper_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
