FROM nvcr.io/nvidia/l4t-base:r32.2.1

#This environment variable is needed to use the streaming features on Jetson inside a container
ENV LOGNAME root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https -y && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \ 
    wget -O ZED_SDK_Linux_JP4.2_v2.8.run https://download.stereolabs.com/zedsdk/2.8/jetson_jp42 && \
    chmod +x ZED_SDK_Linux_JP4.2_v2.8.run ; ./ZED_SDK_Linux_JP4.2_v2.8.run silent && \
    rm -rf ZED_SDK_Linux_JP4.2_v2.8.run && \
    rm -rf /var/lib/apt/lists/*

#This symbolic link is needed to use the streaming features on Jetson inside a container
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

WORKDIR /usr/local/zed
