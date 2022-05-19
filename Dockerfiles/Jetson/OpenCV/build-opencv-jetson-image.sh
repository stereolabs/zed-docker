#!/bin/bash
set -e

# This is a shell script that configures the build arguements to the Dockefile
# and builds a Docker image for Jetson  with a default tag. 

#Build Arguments
ZED_SDK_MAJOR=3 		# ZED SDK major version 
ZED_SDK_MINOR=7			# ZED SDK minor version
L4T_MINOR_VERSION=7 	#L4T Minor version
OPENCV_VERSION=4.5.3	#OpenCV Version


# Default Tag based on the selected versions
TAG="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-opencv-tools-devel-l4t-r32.${L4T_MINOR_VERSION}" 
           
           
echo "Building '${TAG}'" 

docker build --build-arg 4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
		     --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
			 --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
			 --build-arg OPENCV_VERSION=${OPENCV_VERSION} \
			 -t "${TAG}" -f Dockerilfe.opencvjetson .

 
