#https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
ARG L4T_MAJOR_VERSION
ARG L4T_MINOR_VERSION
ARG L4T_PATCH_VERSION
ARG L4T_BASE_IMAGE
# BASE_IMAGE may be overridden (e.g. for our self-hosted base-l4t-r36.5 / r38.4 images);
# default keeps the legacy nvcr.io/nvidia/l4t-jetpack:r36.4.0-style ref.
ARG BASE_IMAGE=nvcr.io/nvidia/${L4T_BASE_IMAGE}:r${L4T_MAJOR_VERSION}.${L4T_MINOR_VERSION}.${L4T_PATCH_VERSION}

FROM ${BASE_IMAGE}

ARG L4T_MAJOR_VERSION
ARG L4T_MINOR_VERSION
ARG L4T_PATCH_VERSION
ARG ZED_SDK_MAJOR
ARG ZED_SDK_MINOR
ARG ZED_SDK_PATCH

#This environment variable is needed to use the streaming features on Jetson inside a container
ENV LOGNAME root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y || true ; apt-get install --no-install-recommends lsb-release wget less zstd udev sudo apt-transport-https -y && \
    echo "# R${L4T_MAJOR_VERSION} (release), REVISION: ${L4T_MINOR_VERSION}.${L4T_PATCH_VERSION}" > /etc/nv_tegra_release ; \
    wget -q --no-check-certificate -O ZED_SDK_Linux.run https://download.stereolabs.com/zedsdk/${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}.${ZED_SDK_PATCH}/l4t${L4T_MAJOR_VERSION}.${L4T_MINOR_VERSION}/jetsons && \
    chmod +x ZED_SDK_Linux.run ; ./ZED_SDK_Linux.run silent runtime_only skip_drivers && \
    rm -rf /usr/local/zed/resources/* && \
    rm -rf ZED_SDK_Linux.run && \
    rm -rf /var/lib/apt/lists/*

# ZED Python API
# `rm EXTERNALLY-MANAGED`: bypasses PEP 668 on Ubuntu 24.04 / Python 3.12 (Jetson Thor / r38.4),
# where system-pip otherwise refuses to install. No-op on U22 (file not present).
RUN apt-get update -y || true ; apt-get install --no-install-recommends python3 python3-pip python3-dev python3-setuptools build-essential -y && \
    rm -f /usr/lib/python3.*/EXTERNALLY-MANAGED && \
    wget download.stereolabs.com/zedsdk/pyzed -O /usr/local/zed/get_python_api.py && \
    python3 -m pip install requests && \
    python3 /usr/local/zed/get_python_api.py && \
    python3 -m pip install cython wheel && \
    python3 -m pip install numpy *.whl

#This symbolic link is needed to use the streaming features on Jetson inside a container
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

WORKDIR /usr/local/zed
