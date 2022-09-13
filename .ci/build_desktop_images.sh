#!/usr/bin/env bash

VERSION="${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-cuda${CUDA_MAJOR}.${CUDA_MINOR_NO_PATCH}-ubuntu${UBUNTU_RELEASE_YEAR}.04"
IMAGE_PATH="zed-docker/${ZED_SDK_MAJOR}.X/ubuntu/${IMAGE_VARIANT}"
docker info
docker login -u "${REGISTRY_USER}" -p "${REGISTRY_TOKEN}"
docker build --no-cache --build-arg UBUNTU_RELEASE_YEAR=${UBUNTU_RELEASE_YEAR} --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} --build-arg CUDA_MAJOR=${CUDA_MAJOR} --build-arg CUDA_MINOR=${CUDA_MINOR} -t "${CI_REGISTRY_IMAGE}:${VERSION}" "${IMAGE_PATH}"
docker tag "${CI_REGISTRY_IMAGE}:${VERSION}" "${CI_REGISTRY_IMAGE}:${VERSION}";
docker push "${CI_REGISTRY_IMAGE}:${VERSION}"