FROM nvidia/cudagl:10.2-devel-ubuntu16.04

ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}compute,video,utility,graphics

# Setup the ZED SDK
RUN apt-get update -y && apt-get install --no-install-recommends lsb-release wget less udev sudo build-essential cmake -y && \
    wget -O ZED_SDK_Linux_Ubuntu16.run https://download.stereolabs.com/zedsdk/3.0/cu102/ubuntu16 && \
    chmod +x ZED_SDK_Linux_Ubuntu16.run ; ./ZED_SDK_Linux_Ubuntu16.run silent && \
    rm ZED_SDK_Linux_Ubuntu16.run && \
    rm -rf /var/lib/apt/lists/*
    
# ZED Python API
RUN apt-get update -y && apt-get install --no-install-recommends python3 python3-pip -y && \ 
    wget download.stereolabs.com/zedsdk/pyzed -O /usr/local/zed/get_python_api.py && \
    python3 /usr/local/zed/get_python_api.py && \
    python3 -m pip install numpy opencv-python pyopengl *.whl && \
    rm *.whl ; rm -rf /var/lib/apt/lists/*

# Make some tools happy
RUN mkdir -p /root/Documents/ZED/

WORKDIR /usr/local/zed/