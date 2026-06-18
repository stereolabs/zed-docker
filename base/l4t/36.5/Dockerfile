# JetPack 6.2.2 / L4T 36.5 base image for Jetson Orin.
# Built from scratch (vs reusing nvcr.io/nvidia/l4t-jetpack:r36.4.0) to keep
# a consistent recipe with the 38.4 base.
# Adapted from https://gitlab.com/nvidia/container-images/l4t-jetpack.

FROM ubuntu:22.04

# Use "nvidia-jetpack-runtime" for a slimmer base (runtime libs only, no dev headers),
# or "nvidia-jetpack" to match the full upstream l4t-jetpack image (runtime + dev + samples).
ARG JETPACK_META=nvidia-jetpack

ENV DEBIAN_FRONTEND=noninteractive

# Prevent the l4t apt postinst scripts from attempting a boot-firmware update
# (only meaningful on a real Jetson host).
RUN mkdir -p /opt/nvidia/l4t-packages && \
    touch /opt/nvidia/l4t-packages/.nv-l4t-disable-boot-fw-update-in-preinstall

# Pin NVIDIA's Jetson repo above Ubuntu's own nvidia-* packages to avoid version conflicts
# on metapackage deps like nvidia-cuda-dev / nvidia-cudnn.
RUN printf 'Package: *\nPin: origin repo.download.nvidia.com\nPin-Priority: 1001\n' \
      > /etc/apt/preferences.d/nvidia-l4t

# Register the NVIDIA Jetson apt repositories and install the full JetPack stack
# (CUDA 12.x, cuDNN, TensorRT, VPI, Multimedia API, Argus, nvenc/nvdec userspace, ...).
# L4T 36.x uses the per-SoC "t234" pool (Orin) alongside "common".
# Retries help on transient DNS/connection blips during the multi-GB nvidia-jetpack fetch.
RUN echo 'Acquire::Retries "10"; Acquire::http::Timeout "60";' > /etc/apt/apt.conf.d/99retries && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg && \
    curl -fsSL --retry 5 --retry-delay 3 https://repo.download.nvidia.com/jetson/jetson-ota-public.asc \
      -o /etc/apt/trusted.gpg.d/nvidia-l4t.asc && \
    echo "deb https://repo.download.nvidia.com/jetson/common r36.5 main"  > /etc/apt/sources.list.d/nvidia-l4t.list && \
    echo "deb https://repo.download.nvidia.com/jetson/t234   r36.5 main" >> /etc/apt/sources.list.d/nvidia-l4t.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ${JETPACK_META} && \
    rm -rf /var/lib/apt/lists/*

# Match upstream nvcr.io/nvidia/l4t-jetpack env so:
#  - downstream variants (devel/runtime/...) inherit CUDA on PATH/LD_LIBRARY_PATH
#  - nvidia-container-runtime injects /dev/nv* via NVIDIA_VISIBLE_DEVICES / NVIDIA_DRIVER_CAPABILITIES
ENV CUDA_HOME=/usr/local/cuda \
    PATH=/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/usr/local/cuda/lib64: \
    NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=all
