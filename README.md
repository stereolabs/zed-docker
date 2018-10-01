# Docker with the ZED SDK (beta)

This images let you use the ZED SDK with docker, even with the ZED camera connected (or an SVO file)

## Getting started

### Setup Docker

Since we need CUDA, **nvidia-docker must be used** (except for compilation only).

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

Once nvidia-docker is installed, make sure it run fine by launching :

    nvidia-docker run --rm nvidia/cuda nvidia-smi

### Pull the image from docker hub

All the available images can be found at [docker hub](https://hub.docker.com/r/stereolabs/zed/)

    docker pull stereolabs/zed:ubuntu1604-cuda9.0-zed2.6
    nvidia-docker run -it --privileged stereolabs/zed:ubuntu1604-cuda9.0-zed2.6

`--privileged` option is used to pass through all the device to the docker container, it might not be very safe but provides an easy solution to connect the USB3 camera to the container.

The images are built with [Gitlab CI](https://gitlab.com/bot-stereolabs/docker-zed/pipelines)

## Rebuilt or modifying the image

### Build the image

The images are based on cuda images from nvidia https://gitlab.com/nvidia/cuda/

The cuda version can easily be change, as the ZED SDK version.

Go to the folder with the version needed and run for instance :

    cd 2.6/ubuntu1604/cuda9.0/devel
    docker build -t zed:ubuntu1604-cuda9.0-zed2.6 .

### Run the local image

    nvidia-docker run -it --privileged zed:ubuntu1604-cuda9.0-zed2.6

The camera connection can be verified using `lsusb`:

    lsusb -d 2b03: -vvv

### Limitations

- There is currently no display on this containers

## Contributing

This is a first version of docker images for the ZED.
Feel free to open an issue if you find a bug, or a pull request for bug fixes, features or other improvements.