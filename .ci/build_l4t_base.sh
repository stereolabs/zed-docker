#!/usr/bin/env bash
# Build and push an SDK-independent JetPack base image.
# Used when NVIDIA has not published a matching nvcr.io/nvidia/l4t-jetpack:r${L4T} tag,
# or when we want a consistent in-house recipe across L4T versions.
#
# Required env: L4T_VERSION  (e.g. "36.5", "38.4") — must match a folder under zed-docker/base/l4t/
# Required env: REGISTRY_USER, REGISTRY_TOKEN, CI_REGISTRY_IMAGE
set -e

if [ -z "${L4T_VERSION}" ]; then
    echo "L4T_VERSION must be set (e.g. 36.5, 38.4)" >&2
    exit 1
fi

TAG="base-l4t-r${L4T_VERSION}"
IMAGE_PATH="zed-docker/base/l4t/${L4T_VERSION}"

if [ ! -f "${IMAGE_PATH}/Dockerfile" ]; then
    echo "No Dockerfile at ${IMAGE_PATH}/Dockerfile" >&2
    exit 1
fi

docker info
docker login -u "${REGISTRY_USER}" -p "${REGISTRY_TOKEN}"

docker build --no-cache -t "${CI_REGISTRY_IMAGE}:${TAG}" "${IMAGE_PATH}"
docker push "${CI_REGISTRY_IMAGE}:${TAG}"
