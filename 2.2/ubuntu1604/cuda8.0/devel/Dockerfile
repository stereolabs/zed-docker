FROM nvidia/cuda:8.0-devel-ubuntu16.04

RUN apt-get update
RUN apt-get install lsb-release wget less udev sudo apt-transport-https -y
RUN wget -O ZED_SDK_Linux_Ubuntu16.run https://download.stereolabs.com/zedsdk/2.2/ubuntu_cuda8
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
RUN chmod +x ZED_SDK_Linux_Ubuntu16.run ; ./ZED_SDK_Linux_Ubuntu16.run silent
