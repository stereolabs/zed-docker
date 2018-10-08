# Need nvidia-docker to run https://github.com/NVIDIA/nvidia-docker
# Image from https://gitlab.com/nvidia/cuda/
FROM nvidia/cuda:9.0-devel-ubuntu16.04

# The runtime image might be enough, depending on the need

# Setup the ZED SDK
RUN apt-get update
RUN apt-get install lsb-release wget less udev sudo apt-transport-https -y
RUN wget -O ZED_SDK_Linux_Ubuntu16.run https://download.stereolabs.com/zedsdk/2.2/ubuntu
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
RUN chmod +x ZED_SDK_Linux_Ubuntu16.run ; ./ZED_SDK_Linux_Ubuntu16.run silent

# Install some other packages
RUN apt-get install nano cmake usbutils git -y
