#!/usr/bin/env bash
set -e
VERSION1_FULL="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}.${ZED_SDK_PATCH}-${IMAGE_VARIANT}-jetson-jp${JETPACK_MAJOR}.${JETPACK_MINOR}"
VERSION2_FULL="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}.${ZED_SDK_PATCH}-${IMAGE_VARIANT}-l4t-r${L4T_MAJOR_VERSION}.${L4T_MINOR_VERSION}"

VERSION1="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-jetson-jp${JETPACK_MAJOR}.${JETPACK_MINOR}"
VERSION2="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-l4t-r${L4T_MAJOR_VERSION}.${L4T_MINOR_VERSION}"

#IMAGE_PATH="zed-docker/${ZED_SDK_MAJOR}.X/l4t_${L4T_MAJOR_VERSION}.X/${IMAGE_VARIANT}"
IMAGE_PATH="zed-docker/${ZED_SDK_MAJOR}.X/l4t/${IMAGE_VARIANT}"
docker info
docker login -u "${REGISTRY_USER}" -p "${REGISTRY_TOKEN}"

# BASE_IMAGE override: when set (e.g. for our self-hosted base-l4t-r36.5 / r38.4 images),
# it replaces the constructed nvcr.io ref in the variant Dockerfile FROM. Empty = use the
# Dockerfile default (nvcr.io/nvidia/${L4T_BASE_IMAGE}:r${MAJ}.${MIN}.${PATCH}).
BASE_IMAGE_ARG=()
if [ -n "${BASE_IMAGE}" ]; then
    BASE_IMAGE_ARG=(--build-arg "BASE_IMAGE=${BASE_IMAGE}")
    echo "Using overridden BASE_IMAGE=${BASE_IMAGE}"
fi

docker build --no-cache "${BASE_IMAGE_ARG[@]}" --build-arg L4T_MAJOR_VERSION=${L4T_MAJOR_VERSION} --build-arg L4T_MINOR_VERSION=${L4T_MINOR_VERSION} --build-arg L4T_PATCH_VERSION=${L4T_PATCH_VERSION} --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} --build-arg ZED_SDK_PATCH=${ZED_SDK_PATCH} --build-arg L4T_BASE_IMAGE=${L4T_BASE_IMAGE} -t "${CI_REGISTRY_IMAGE}:${VERSION1_FULL}" "${IMAGE_PATH}"

# All tags point to the same image
docker tag "${CI_REGISTRY_IMAGE}:${VERSION1_FULL}" "${CI_REGISTRY_IMAGE}:${VERSION2_FULL}";
docker tag "${CI_REGISTRY_IMAGE}:${VERSION1_FULL}" "${CI_REGISTRY_IMAGE}:${VERSION2}";
docker tag "${CI_REGISTRY_IMAGE}:${VERSION1_FULL}" "${CI_REGISTRY_IMAGE}:${VERSION1}";

docker push "${CI_REGISTRY_IMAGE}:${VERSION1_FULL}"
docker push "${CI_REGISTRY_IMAGE}:${VERSION2_FULL}"
docker push "${CI_REGISTRY_IMAGE}:${VERSION1}"
docker push "${CI_REGISTRY_IMAGE}:${VERSION2}"