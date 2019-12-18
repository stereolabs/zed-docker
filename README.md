# Docker with the ZED SDK (beta)

This images let you use the ZED SDK with docker, even with the ZED camera connected (or an SVO file)

## Getting started

### Setup Docker

Since we need CUDA, **NVIDIA Container Toolkit must be used** (except for compilation only).

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

Once NVIDIA Container Toolkit is installed, make sure it run fine by launching :

    docker run --runtime nvidia --rm nvidia/cuda nvidia-smi

or 

    docker run --gpus all --rm nvidia/cuda nvidia-smi

### Pull the image from docker hub

All the available images can be found at [docker hub](https://hub.docker.com/r/stereolabs/zed/)

    docker pull stereolabs/zed:ubuntu1604-cuda9.0-zed2.8
    docker run --runtime nvidia -it --privileged stereolabs/zed:ubuntu1604-cuda9.0-zed2.8

`--privileged` option is used to pass through all the device to the docker container, it might not be very safe but provides an easy solution to connect the USB3 camera to the container.

The images are built with [Gitlab CI](https://gitlab.com/bot-stereolabs/docker-zed/pipelines)

### Display support

A container is also available with OpenGL display support (from [nvidia/cudagl container](https://gitlab.com/nvidia/cudagl)). It is mandatory to open the tools from within an image.

    docker pull stereolabs/zed:ubuntu1604-cuda9.0-zed2.8-gl

To run it, we need to add the right to connect to the X server :

    xhost +si:localuser:root

While being simple, please note that this can be a security concern, considering the right given to the container.

Then to run it :

    docker run --runtime nvidia -it --privileged -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:ubuntu1604-cuda9.0-zed2.8-gl

Any OpenGL tools are now able to run, for instance :

    /usr/local/zed/tools/ZED\ Explorer

For more information on the display usage checkout the [ROS documentation about using Docker with X server](http://wiki.ros.org/docker/Tutorials/GUI).

## Rebuilt or modifying the image

### Build the image

The images are based on cuda images from nvidia https://gitlab.com/nvidia/cuda/

The cuda version can easily be change, as the ZED SDK version.

Go to the folder with the version needed and run for instance :

    cd 2.8/ubuntu1604/cuda9.0/devel
    docker build -t zed:ubuntu1604-cuda9.0-zed2.8 .

### Run the local image

    docker run --runtime nvidia -it --privileged zed:ubuntu1604-cuda9.0-zed2.8

The camera connection can be verified using `lsusb`:

    lsusb -d 2b03: -vvv

## Contributing

This is a first version of docker images for the ZED.
Feel free to open an issue if you find a bug, or a pull request for bug fixes, features or other improvements.
