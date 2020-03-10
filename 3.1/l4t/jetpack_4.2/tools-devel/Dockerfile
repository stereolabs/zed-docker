#https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
FROM nvcr.io/nvidia/l4t-base:r32.2.1

#This environment variable is needed to use the streaming features on Jetson inside a container
ENV LOGNAME root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https -y && \
    wget -O ZED_SDK_Linux_JP.run https://download.stereolabs.com/zedsdk/3.1/jp42/jetsons && \
    chmod +x ZED_SDK_Linux_JP.run ; ./ZED_SDK_Linux_JP.run silent && \
    rm -rf /usr/local/zed/resources/* \
    rm -rf ZED_SDK_Linux_JP.run && \
    rm -rf /var/lib/apt/lists/*

#This symbolic link is needed to use the streaming features on Jetson inside a container
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

WORKDIR /usr/local/zed
