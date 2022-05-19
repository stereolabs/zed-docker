#!/bin/bash
set -e

# This is a shell script that configures the build arguements to the Dockefile
# and builds a Docker image for Jetson  with a default tag. 


ZED_SDK_MAJOR=3 		 # ZED SDK major version 
ZED_SDK_MINOR=7			 # ZED SDK minor version
L4T_MINOR_VERSION=7 	 #L4T Minor version
ROS_DISTRO_ARG="melodic" # ROS DISTRO 



# Default Tag based on the selected versions

TAG="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-ros-tools-devel-l4t-r32.${L4T_MINOR_VERSION}" 
                   

echo "Building '${TAG}'" 

docker build --build-arg 4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
		     --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
			 --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
			 --build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
			 -t "${TAG}" -f Dockerilfe.rosjetson .
