# start docker container using ros-noetic-desktop-full image and run the image_view command on the /detected_aruco_frames topic, also run xhost local:root prior to running docker container

xhost local:root
sudo docker run -it     --env="DISPLAY"     --env="QT_X11_NO_MITSHM=1"   --volume="/home/bassam/projects/IBVS-mavros-controller-node:/test"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --net=host     osrf/ros:noetic-desktop-full  rosrun image_view image_view image:=/video_frames
