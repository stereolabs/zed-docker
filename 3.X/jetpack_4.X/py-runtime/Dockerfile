#https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
ARG L4T_MINOR_VERSION
ARG ZED_SDK_MAJOR
ARG ZED_SDK_MINOR
ARG JETPACK_MAJOR
ARG JETPACK_MINOR

FROM nvcr.io/nvidia/l4t-base:r32.${L4T_MINOR_VERSION}

#This environment variable is needed to use the streaming features on Jetson inside a container
ENV LOGNAME root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https -y && \
    wget -O ZED_SDK_Linux_JP.run https://download.stereolabs.com/zedsdk/${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}/jp${JETPACK_MAJOR}${JETPACK_MINOR}/jetsons && \
    chmod +x ZED_SDK_Linux_JP.run ; ./ZED_SDK_Linux_JP.run silent runtime_only && \
    rm -rf /usr/local/zed/resources/* \
    rm -rf ZED_SDK_Linux_JP.run && \
    rm -rf /var/lib/apt/lists/* && \
    echo "# R32 (release), REVISION: ${L4T_MINOR_VERSION}" > /etc/nv_tegra_release # Needed to select the python version

# ZED Python API
RUN apt-get update -y && apt-get install --no-install-recommends python3 python3-pip python3-dev python3-setuptools build-essential -y && \ 
    wget download.stereolabs.com/zedsdk/pyzed -O /usr/local/zed/get_python_api.py && \
    python3 /usr/local/zed/get_python_api.py && \
    python3 -m pip install cython wheel && \
    python3 -m pip install numpy *.whl && \
    apt-get remove --purge build-essential python3-dev -y && apt-get autoremove -y && \
    rm *.whl ; rm -rf /var/lib/apt/lists/*

#This symbolic link is needed to use the streaming features on Jetson inside a container
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

WORKDIR /usr/local/zed
