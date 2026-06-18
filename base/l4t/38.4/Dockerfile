# JetPack 7.1 / L4T 38.4 base image for Jetson Thor.
# Built from scratch because NVIDIA has not published nvcr.io/nvidia/l4t-jetpack:r38.x.
# Adapted from https://gitlab.com/nvidia/container-images/l4t-jetpack.

FROM ubuntu:24.04

# Use "nvidia-jetpack-runtime" for a slimmer base (runtime libs only, no dev headers),
# or "nvidia-jetpack" to match the full upstream l4t-jetpack image (runtime + dev + samples).
# For a "runtime" variant downstream, override with --build-arg JETPACK_META=nvidia-jetpack-runtime.
ARG JETPACK_META=nvidia-jetpack

ENV DEBIAN_FRONTEND=noninteractive

# Prevent the l4t apt postinst scripts from attempting a boot-firmware update
# (only meaningful on a real Jetson host).
RUN mkdir -p /opt/nvidia/l4t-packages && \
    touch /opt/nvidia/l4t-packages/.nv-l4t-disable-boot-fw-update-in-preinstall

# Pin NVIDIA's Jetson repo above Ubuntu's own nvidia-* packages — Ubuntu 24.04 ships
# conflicting nvidia-cuda-dev / nvidia-cudnn versions that otherwise satisfy the
# metapackage deps with the wrong upstream.
RUN printf 'Package: *\nPin: origin repo.download.nvidia.com\nPin-Priority: 1001\n' \
      > /etc/apt/preferences.d/nvidia-l4t

# Register the NVIDIA Jetson apt repositories and install the full JetPack stack
# (CUDA 13, cuDNN, TensorRT, VPI, Multimedia API, Argus, nvenc/nvdec userspace, ...).
# JetPack 7 uses the unified "som" pool alongside "common".
# Retries help on transient DNS/connection blips during the multi-GB nvidia-jetpack fetch.
RUN echo 'Acquire::Retries "10"; Acquire::http::Timeout "60";' > /etc/apt/apt.conf.d/99retries && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg && \
    curl -fsSL --retry 5 --retry-delay 3 https://repo.download.nvidia.com/jetson/jetson-ota-public.asc \
      -o /etc/apt/trusted.gpg.d/nvidia-l4t.asc && \
    echo "deb https://repo.download.nvidia.com/jetson/common r38.4 main"  > /etc/apt/sources.list.d/nvidia-l4t.list && \
    echo "deb https://repo.download.nvidia.com/jetson/som    r38.4 main" >> /etc/apt/sources.list.d/nvidia-l4t.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ${JETPACK_META} && \
    rm -rf /var/lib/apt/lists/*
# NOTE: JETPACK_META=nvidia-jetpack-runtime (a ~20 GB smaller option) is NOT a working
# drop-in for the ZED SDK as of r38.4. Even with cuda-libraries-13-0, cuda-nvrtc-13-0,
# cuda-cupti-13-0, cuda-crt-13-0, cuda-nvtx-13-0, cuda-libraries-dev-13-0, nvidia-cudnn-dev
# all added on top, the SDK still fails at dlopen with
#   "symbol lookup error: undefined symbol: InitializeInjectionCaskEnhanced"
# producing "NEURAL TRT NOT FOUND / CORRUPTED SDK INSTALLATION".
# LD_PRELOAD=libnvinfer.so.10 fixes standalone ctypes dlopen but not the SDK's own loader
# path, which suggests RTLD_LOCAL scoping or a missing package we haven't bisected yet.
# Until identified, leave JETPACK_META=nvidia-jetpack for 38.4.

# Match upstream nvcr.io/nvidia/l4t-jetpack env so:
#  - downstream variants (devel/runtime/...) inherit CUDA on PATH/LD_LIBRARY_PATH
#  - nvidia-container-runtime injects /dev/nv* via NVIDIA_VISIBLE_DEVICES / NVIDIA_DRIVER_CAPABILITIES
ENV CUDA_HOME=/usr/local/cuda \
    PATH=/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/usr/local/cuda/lib64: \
    NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=all
