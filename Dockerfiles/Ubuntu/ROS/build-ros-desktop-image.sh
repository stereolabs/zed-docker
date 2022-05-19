#!/bin/bash
set -e

# This is a shell script that configures the build arguements to the Dockefile
# and builds a Docker image with a default tag.    
#              			  
# Available versions to configure the arguements:
# UBUNTU_RELEASE_YEAR = 18 and 20 
# ZED SDK Versions  = 3.0 to 3.7 (ZED SDK version <3 are too old and outdated)
# CUDA Versions = 10.0, 10.2, 11.0, 11.1, 11.4, 11.5
# ROS2_FLAG takes either 1 or 0 
#    1 sets the ROS_DISTRO_ARG to ROS2 Foxy Fitzroy
#    0 sets the ROS_DISTRO_ARG to ROS1 versions based on Ubuntu Release year 

UBUNTU_RELEASE_YEAR=20 	#Specify the Ubunutu release year
ZED_SDK_MAJOR=3 		# ZED SDK major version 
ZED_SDK_MINOR=7 		# ZED SDK minor version
CUDA_MAJOR=11 			# CUDA major version
CUDA_MINOR=4 			# CUDA minor version 
ROS2_FLAG=0			    # Change it to 1 to setup ROS 2

#Check for the version compatibilities

if [ ${UBUNTU_RELEASE_YEAR} == "18" ] ; then
	echo "Ubuntu 18.04"
	ROS_DISTRO_ARG="melodic"
	# Not compatible with CUDA <= 9
	if [ ${CUDA_MAJOR} -le "9" ] ; then
		echo "Ubunutu 18.04 Not compatible with CUDA <= 9"
		exit
	fi
elif [ ${UBUNTU_RELEASE_YEAR} == "20" ] ; then
	if [ ${ROS2_FLAG} == 1 ] ; then 
		ROS_DISTRO_ARG="foxy"
	else 
		ROS_DISTRO_ARG="noetic"
	fi
	# Not compatible with CUDA <= 10
	if [ ${CUDA_MAJOR} -le "10" ] ; then
   		echo "Ubunutu 20.04 is not compatible with CUDA <= 10 "
   		exit
	fi
else
	echo "UBUNTU_RELEASE_YEAR! Allowed values are 18 or 20 "
	exit
fi 

if [ ${CUDA_MAJOR} -ge "11" ] ; then
	if [ ${ZED_SDK_MINOR} -lt "2" ] ; then # CUDA 11.0 was introduced with 3.2
		echo "CUDA 11.0 was introduced with 3.2"
		exit
	fi
	if [ ${CUDA_MINOR} -ge "1" ] ; then
		if [ ${ZED_SDK_MINOR} -lt "3" ] ; then # CUDA 11.1 was introduced with 3.3
			echo "CUDA 11.1 was introduced with 3.3"
		exit
		fi
	fi
	if [ ${CUDA_MINOR} == "2" ] || [ ${CUDA_MINOR} == "3" ]  || [ ${CUDA_MINOR} -ge "6" ] ; then 
		#invalid CUDA versions
   		echo "Invalid CUDA_MINOR! Allowed values : 0,1,4,5"
   		exit
	fi
elif [ ${CUDA_MAJOR} == "10" ] ; then
	if [ ${CUDA_MINOR} != "0" ] || [ ${CUDA_MINOR} != "2" ] ; then 
	   echo "Invalid CUDA_MINOR! Allowed values are 0 or 2"
	   exit
	fi
else
	echo "Invalid CUDA_MAJOR! Allowed values are 10 or 11" 
fi	
	

# Default Tag based on the selected versions
if [ ${ROS2_FLAG} == 1 ] ; then
	echo "ROS2 flag == 1 " 
	TAG="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-ros2-gl-devel-cuda${CUDA_MAJOR}.${CUDA_MINOR}-ubuntu${UBUNTU_RELEASE_YEAR}.04"
	DOCKERFILE="Dockerfile.ros2"
else
	TAG="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-ros-gl-devel-cuda${CUDA_MAJOR}.${CUDA_MINOR}-ubuntu${UBUNTU_RELEASE_YEAR}.04"
	DOCKERFILE="Dockerfile.ros"
fi
           

echo "Building '${TAG}'" 

docker build --build-arg UBUNTU_RELEASE_YEAR=${UBUNTU_RELEASE_YEAR} \
--build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
--build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
--build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
--build-arg CUDA_MAJOR=${CUDA_MAJOR} \
--build-arg CUDA_MINOR=${CUDA_MINOR} \
-t "${TAG}" -f "${DOCKERFILE}" .

                    