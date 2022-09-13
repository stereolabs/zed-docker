FROM nvidia/cuda:10.2-base-ubuntu18.04

ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

# Setup the ZED SDK
RUN apt-get update -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends wget curl libusb-1.0-0 curl libhidapi-libusb0 libopenblas-base libjpeg-turbo8 libturbojpeg libpng16-16 udev libgomp1 -y && \
    apt-get install --no-install-recommends cuda-npp-10-2 -y && \
    wget -O ZED_SDK_Linux_Ubuntu18.run https://download.stereolabs.com/zedsdk/2.8/cu102/ubuntu18 && \
    chmod +x ZED_SDK_Linux_Ubuntu18.run ; ./ZED_SDK_Linux_Ubuntu18.run  --noexec --target zed_installer && \
    rm ZED_SDK_Linux_Ubuntu18.run && \
    mkdir -p /usr/local/zed/lib ; mkdir -p /usr/local/zed/settings  ; mv zed_installer/lib/*.so /usr/local/zed/lib && \
    mv "zed_installer/99-slabs.rules" "/etc/udev/rules.d/"; chmod 777 "/etc/udev/rules.d/99-slabs.rules" && \
    mv "zed_installer/zed.conf" "/etc/ld.so.conf.d/" ; ldconfig ; usermod -a -G video "$(whoami)" && \
    rm -rf zed_installer && \
    rm -rf /var/lib/apt/lists/*
