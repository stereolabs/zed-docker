# Docker with the ZED SDK

These images let you use the ZED SDK with docker, even with the ZED camera connected (or an SVO file)

## Getting started

### Setup Docker

Since we need CUDA, **NVIDIA Container Toolkit must be used** (except for compilation only).

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

Once NVIDIA Container Toolkit is installed, make sure it runs fine by launching :

    docker run --gpus all --rm nvidia/cuda nvidia-smi

### Pull the image from docker hub

All the available images can be found at [docker hub](https://hub.docker.com/r/stereolabs/zed/)

    docker pull stereolabs/zed:3.0-runtime-cuda10.0-ubuntu18.04
    docker run --gpus all -it --privileged stereolabs/zed:3.0-runtime-cuda10.0-ubuntu18.04

`--privileged` option is used to pass through all the device to the docker container, it might not be very safe but provides an easy solution to connect the USB3 camera to the container.

The images are built with [Gitlab CI](https://gitlab.com/bot-stereolabs/docker-zed/pipelines)

### Display support

A container is also available with OpenGL display support (from [nvidia/cudagl container](https://gitlab.com/nvidia/cudagl)). It is mandatory to open the tools from within an image.

    docker pull stereolabs/zed:3.0-gl-devel-cuda10.0-ubuntu18.04

To run it, we need to add the right to connect to the X server :

    xhost +si:localuser:root

While being simple, please note that this can be a security concern, considering the right given to the container.

Then to run it :

    docker run --gpus all -it --privileged -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:3.0-gl-devel-cuda10.0-ubuntu18.04

Any OpenGL tools are now able to run, for instance :

    /usr/local/zed/tools/ZED\ Explorer

For more information on the display usage checkout the [ROS documentation about using Docker with X server](http://wiki.ros.org/docker/Tutorials/GUI).

## Rebuilt or modifying the image

### Build the image

The images are based on cuda images from nvidia https://gitlab.com/nvidia/cuda/

The cuda version can easily be changed, as the ZED SDK version.

Go to the folder with the version needed and run for instance :

    cd 3.0/ubuntu1804/cuda10.0/devel
    docker build -t zed:3.0-devel-cuda10.0-ubuntu18.04 .

### Run the local image

    docker run --gpus all -it --privileged zed:3.0-devel-cuda10.0-ubuntu18.04

The camera connection can be verified using `lsusb`:

    lsusb -d 2b03: -vvv

## Jetson images

### Using docker on Tegra

With the [recently added support](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson) of nvidia docker, it is now possible to run the ZED SDK inside docker on Jetson. We now provide a compatible image :

```bash
docker pull stereolabs/zed:3.0-devel-jetson-jp4.3
```

One exemple of DockerFile can be found [here](3.0/l4t/jetpack_4.2/devel/Dockerfile). The image is based on the [NVIDIA L4T image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base).

### Building the image

The image can either be built on the jetson directly or on Desktop `x86_64` using emulation.

To setup a `x86_64` host to build `aarch64` image, [QEMU](https://www.qemu.org/) needs to be installed and configured by running :


```bash
    sudo apt-get install qemu binfmt-support qemu-user-static # Set up the qemu packages
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes # This step will execute the registering scripts
``` 

Testing the emulation by running a `aarch64` image on desktop :

```bash
    docker run --rm -t arm64v8/ubuntu uname -m

        aarch64 # -> emulation is working
```

The installation was successful, the emulation is working. At this point we can now run `aarch64` programs on the host `x86_64` PC.

```bash
cd 3.0/l4t/jetpack_4.3/devel
docker build -t zed:3.0-devel-jetson-jp4.3 .
```

Unfortunately it is not possible to emulate CUDA accelerated program with QEMU.

## Troubleshooting

### Nvidia driver libraries missing in the container

- "`libcuda.so.1` is not found" : make sure to run the image with `--gpus all` (or specify the GPU ID). It allows docker to mount the host driver into the image.

- "`libnvcuvid.so.1` is not found" : make sure to run the image with `--gpus all,capabilities=video`. It allows docker to mount the host driver, including the hardware decoding library into the image.

### USB replug/hot plug

ZED-M contains a udev device for the IMU and sensors data.
On Linux, udev/serial device path are often ephemeral (will change if the device is unplugged and replugged).

If you unplug/plug them back in, it’s technically a different mapped file for the device than what was mounted in, so Docker won’t see it. For this reason, a solution is to mount the entire /dev folder from the host to the container. You can do this by adding the following volume command to your Docker run command `-v /dev:/dev`

For example :

```
docker run --gpus all -it -v /dev:/dev --privileged stereolabs/zed:3.0-runtime-cuda10.0-ubuntu18.04
```

### Using the tools

The tools are using OpenGL libraries. The "`gl`" images are therefore required to use them (see [display support section](#display-support)).

## Contributing

This is a first version of docker images for the ZED.
Feel free to open an issue if you find a bug, or a pull request for bug fixes, features or other improvements.
