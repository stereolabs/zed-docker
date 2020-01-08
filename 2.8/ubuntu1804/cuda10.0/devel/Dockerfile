# Need nvidia-docker to run https://github.com/NVIDIA/nvidia-docker
# Image from https://gitlab.com/nvidia/cuda/
FROM nvidia/cuda:10.0-devel-ubuntu18.04

# The runtime image might be enough, depending on the need

# Setup the ZED SDK
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https -y && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \ 
    wget -O ZED_SDK_Linux_Ubuntu18.run https://download.stereolabs.com/zedsdk/2.8/cu100/ubuntu18 && \
    chmod +x ZED_SDK_Linux_Ubuntu18.run ; ./ZED_SDK_Linux_Ubuntu18.run silent && \
    rm ZED_SDK_Linux_Ubuntu18.run && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/zed/