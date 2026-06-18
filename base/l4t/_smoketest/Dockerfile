# Layered smoke-test image: base + ZED SDK (devel) + compiled svo_smoke.
# Built locally after `base-l4t-r${L4T}:local`. Not published.

ARG BASE_IMAGE
ARG L4T_MAJOR
ARG L4T_MINOR
ARG ZED_SDK_VERSION

FROM ${BASE_IMAGE}

ARG L4T_MAJOR
ARG L4T_MINOR
ARG ZED_SDK_VERSION

ENV DEBIAN_FRONTEND=noninteractive \
    LOGNAME=root

# ZED_SDK.run is a makeself archive using bash-specific syntax; dash (default sh) fails.
SHELL ["/bin/bash", "-c"]

# Same pattern as zed-docker/5.X/l4t/devel: stamp nv_tegra_release for the SDK
# installer's host-check, then install SDK with dev headers.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates wget less zstd udev sudo apt-transport-https \
        build-essential cmake libssl-dev && \
    rm -rf /var/lib/apt/lists/*

RUN echo "# R${L4T_MAJOR} (release), REVISION: ${L4T_MINOR}.0" > /etc/nv_tegra_release && \
    wget -q --no-check-certificate \
        "https://download.stereolabs.com/zedsdk/${ZED_SDK_VERSION}/l4t${L4T_MAJOR}.${L4T_MINOR}/jetsons" \
        -O /tmp/ZED_SDK.run && \
    chmod +x /tmp/ZED_SDK.run && \
    /tmp/ZED_SDK.run silent skip_tools skip_drivers && \
    rm -rf /tmp/ZED_SDK.run /usr/local/zed/resources/*

# Same workaround zed-docker variants use for streaming on Jetson inside a container
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

COPY CMakeLists.txt svo_smoke.cpp /build/
RUN cd /build && cmake . && make -j$(nproc)

ENTRYPOINT ["/build/svo_smoke"]
