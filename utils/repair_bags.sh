#!/bin/bash

# Change to the directory with the .active rosbags
cd /home/root/rosbag

# Loop through all the .active rosbags in the directory and fix them
for file in *.active
do
  # Check if the file exists and is not empty
  if [ -s "$file" ]; then
    # Fix the file using the rosbag fix command in the osrf/ros:noetic-desktop-full Docker image
    docker run --rm -v $(pwd):/data osrf/ros:noetic-desktop-full rosbag fix "/data/$file" "/data/${file%.active}.bag"
    # Remove the original .active file
  else
    echo "Warning: $file is empty or does not exist, skipping..."
  fi
done

