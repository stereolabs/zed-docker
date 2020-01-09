FROM nvidia/cuda:9.0-base-ubuntu16.04

ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN apt-get update -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends wget curl libusb-1.0-0 curl libhidapi-libusb0 libopenblas-base \
        libjpeg-turbo8 libturbojpeg libpng12-0 udev libgomp1 -y && \
    apt-get install --no-install-recommends cuda-npp-9-0 -y && \
    wget -O ZED_SDK_Linux_Ubuntu.run https://download.stereolabs.com/zedsdk/2.8/cu90/ubuntu16 && \
    chmod +x ZED_SDK_Linux_Ubuntu.run ; ./ZED_SDK_Linux_Ubuntu.run  --noexec --target zed_installer && \
    rm ZED_SDK_Linux_Ubuntu.run && \
    mkdir -p /usr/local/zed/lib ; mkdir -p /usr/local/zed/settings  ; mv zed_installer/lib/*.so /usr/local/zed/lib && \
    mv "zed_installer/99-slabs.rules" "/etc/udev/rules.d/"; chmod 777 "/etc/udev/rules.d/99-slabs.rules" && \
    mv "zed_installer/zed.conf" "/etc/ld.so.conf.d/" ; ldconfig ; usermod -a -G video "$(whoami)" && \
    rm -rf zed_installer && \
    rm -rf /var/lib/apt/lists/*
