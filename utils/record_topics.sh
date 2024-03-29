# make bash script to start rosbag record using a ros noetic docker container 

IMAGE_NAME=osrf/ros:noetic-desktop-full

rosbag_topics="/tracking_error /mavros/setpoint_velocity/cmd_vel /mavros/local_position/pose /estimated_velocity /mavros/local_position/velocity_local /aruco_coordinates"

entry_command="rosbag record -O /rosbag/$(date +%Y-%m-%d_%H-%M-%S) $rosbag_topics"

docker run -it --rm --name rosbag_recorder --net=host -v /home/$(whoami)/rosbag:/rosbag $IMAGE_NAME $entry_command

