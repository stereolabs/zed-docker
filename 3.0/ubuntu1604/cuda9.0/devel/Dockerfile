FROM nvidia/cuda:9.0-devel-ubuntu16.04

ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}compute,video,utility

# Setup the ZED SDK
RUN apt-get update -y && apt-get install --no-install-recommends lsb-release wget less udev sudo  build-essential cmake -y && \
    wget -O ZED_SDK_Linux_Ubuntu16.run https://download.stereolabs.com/zedsdk/3.0/cu90/ubuntu16 && \
    chmod +x ZED_SDK_Linux_Ubuntu16.run ; ./ZED_SDK_Linux_Ubuntu16.run -- silent skip_tools && \
    rm ZED_SDK_Linux_Ubuntu16.run && \
    rm -rf /var/lib/apt/lists/*

# ZED Python API
RUN apt-get update -y && apt-get install --no-install-recommends python3 python3-pip -y && \ 
    wget download.stereolabs.com/zedsdk/pyzed -O /usr/local/zed/get_python_api.py && \
    python3 /usr/local/zed/get_python_api.py && \
    python3 -m pip install numpy opencv-python *.whl && \
    rm *.whl ; rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/zed/