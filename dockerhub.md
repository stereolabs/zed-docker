# ZED SDK Docker Images

These images let you use the ZED SDK with docker, even with the ZED camera connected (or an SVO file).
https://github.com/stereolabs/zed-docker

## Base Image Tags

All images are based on Nvidia CUDA. You need nvidia-docker to run them, see below.
Please note that these images **can't** run graphical programs, including the tools. It requires openGL support (see `gl-devel` tags). **All desktop images now include the ZED Python API.**

- `runtime` images are the lightest and comes with every dependency installed. It's only meant to run applications linked with the ZED SDK.

- `devel` images contains all development tools to compile application including the cuda toolchain, static libraries, and headers of CUDA and the ZED SDK.

- `gl-devel` images include openGL support to be able to run the tools and sample. It also contains the development tools similarly to `devel` image

## Jetson specific tags

This the jetsons are usually much more limited in storage, more variants are available to limit the disk space usage. Unlike the desktop images, the OpenGL support is included from the base image provided by Nvidia, and therefore available on all images.

- `py-devel` images contains all development tools to develop applications that uses ZED Python API.

- `py-runtime` images are the lightest and comes with every dependency installed. It's only meant to run applications that uses the ZED Python API.

- `tools-devel` images include the tools and sample and the development tools similarly to `devel` image. It is the most complete and biggest image.
  
## Optional Features

- `ros-devel` images come with the LTS version, matching the Ubuntu version, of ROS installed and the development tools.

## LATEST ZED SDK 3.3 tags

### Ubuntu 20.04

CUDA 11.0

- [`3.3-runtime-cuda11.0-ubuntu20.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.0-ubuntu20.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda11.0-ubuntu20.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

CUDA 11.1

- [`3.3-runtime-cuda11.1-ubuntu20.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.1-ubuntu20.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda11.1-ubuntu20.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

### Ubuntu 18.04

CUDA 10.0

- [`3.3-runtime-cuda10.0-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda10.0-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-ros-devel-cuda10.0-ubuntu18.04` (*3.X/ubuntu/devel-ros/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/ros/Dockerfile)
- [`3.3-gl-devel-cuda10.0-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

CUDA 10.2

- [`3.3-runtime-cuda10.2-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda10.2-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda10.2-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

CUDA 11.0

- [`3.3-runtime-cuda11.0-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.0-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-ros-devel-cuda11.0-ubuntu18.04` (*3.X/ubuntu/devel-ros/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/ros/Dockerfile)
- [`3.3-gl-devel-cuda11.0-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

CUDA 11.1

- [`3.3-runtime-cuda11.1-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.1-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-ros-devel-cuda11.1-ubuntu18.04` (*3.X/ubuntu/devel-ros/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/ros/Dockerfile)
- [`3.3-gl-devel-cuda11.1-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)


### Ubuntu 16.04

CUDA 10.0

- [`3.3-runtime-cuda10.0-ubuntu16.04`, (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda10.0-ubuntu16.04`, (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda10.0-ubuntu16.04`, (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)
 
CUDA 10.2

- [`3.3-runtime-cuda10.2-ubuntu16.04`, (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda10.2-ubuntu16.04`, (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda10.2-ubuntu16.04`, (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)
 

 CUDA 11.0

- [`3.3-runtime-cuda11.0-ubuntu16.04`, (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.0-ubuntu16.04`, (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda11.0-ubuntu16.04`, (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)
 
CUDA 11.1

- [`3.3-runtime-cuda11.1-ubuntu16.04`, (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.3-devel-cuda11.1-ubuntu16.04`, (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.3-gl-devel-cuda11.1-ubuntu16.04`, (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)


### Jetson JetPack 4

JP 4.4

- [`3.3-devel-jetson-jp4.4`, `3.3-devel-l4t-r32.4.2` (*3.X/jetpack_4.X/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/devel/Dockerfile)
- [`3.3-runtime-jetson-jp4.4`, `3.3-runtime-l4t-r32.4.2` (*3.X/jetpack_4.X/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/runtime/Dockerfile)
- [`3.3-py-devel-jetson-jp4.4`, `3.3-py-devel-l4t-r32.4.2` (*3.X/jetpack_4.X/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/py-devel/Dockerfile)
- [`3.3-py-runtime-jetson-jp4.4`, `3.3-py-runtime-l4t-r32.4.2` (*3.X/jetpack_4.X/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/py-runtime/Dockerfile)
- [`3.3-tools-devel-jetson-jp4.4`, `3.3-tools-devel-l4t-r32.4.2` (*3.X/jetpack_4.X/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/tools-devel/Dockerfile)
- [`3.3-ros-devel-jetson-jp4.4`, `3.3-ros-devel-l4t-r32.4.2` (*3.X/jetpack_4.X/ros-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/ros-devel/Dockerfile)

JP 4.3

- [`3.3-devel-jetson-jp4.3`, `3.3-devel-l4t-r32.3.3` (*3.X/jetpack_4.X/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/devel/Dockerfile)
- [`3.3-runtime-jetson-jp4.3`, `3.3-runtime-l4t-r32.3.3` (*3.X/jetpack_4.X/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/runtime/Dockerfile)
- [`3.3-py-devel-jetson-jp4.3`, `3.3-py-devel-l4t-r32.3.3` (*3.X/jetpack_4.X/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/py-devel/Dockerfile)
- [`3.3-py-runtime-jetson-jp4.3`, `3.3-py-runtime-l4t-r32.3.3` (*3.X/jetpack_4.X/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/py-runtime/Dockerfile)
- [`3.3-tools-devel-jetson-jp4.3`, `3.3-tools-devel-l4t-r32.3.3` (*3.X/jetpack_4.X/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/tools-devel/Dockerfile)
- [`3.3-ros-devel-jetson-jp4.3`, `3.3-ros-devel-l4t-r32.3.3` (*3.X/jetpack_4.X/ros-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/jetpack_4.X/ros-devel/Dockerfile)


## Running Containers

```bash
docker run --gpus all -it --privileged stereolabs/zed:3.3-runtime-cuda9.0-ubuntu16.04
```

`--privileged` option is used to pass through all the device to the docker container, it might not be very safe but provides an easy solution to connect the USB3 camera to the container.

### Display support

To run it, we need to add the right to connect to the X server :
​
```bash
xhost +si:localuser:root
```
​
Then to run it :
​
```bash
docker run --gpus all -it --privileged -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:3.3-gl-devel-cuda9.0-ubuntu16.04
```
​
Any OpenGL tools are now able to run, for instance :
```
/usr/local/zed/tools/ZED_Explorer
```

## Notes

### Docker Setup

Since we need CUDA, **NVIDIA Container Toolkit must be used** (except for compilation only).

Follow the instructions at https://github.com/NVIDIA/nvidia-docker

### Using docker on Tegra

With the [recently added support](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson) of nvidia docker, it is now possible to run the ZED SDK inside docker on Jetson. We now provide a compatible image :

```bash
docker pull stereolabs/zed:3.3-devel-jetson-jp4.4
```

The image is based on the [NVIDIA L4T image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base).

## More information

[Check out the README on Github](https://github.com/stereolabs/zed-docker)