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
  
## LATEST ZED SDK 3.7 tags

### Ubuntu 20.04

CUDA 11.4/11.5

- [`3.7-runtime-cuda11.5-ubuntu20.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.7-devel-cuda11.5-ubuntu20.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.7-gl-devel-cuda11.4-ubuntu20.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

### Ubuntu 18.04

CUDA 11.4/11.5

- [`3.7-runtime-cuda11.5-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.7-devel-cuda11.5-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.7-gl-devel-cuda11.4-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

CUDA 10.2

- [`3.7-runtime-cuda10.2-ubuntu18.04` (*3.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/runtime/Dockerfile)
- [`3.7-devel-cuda10.2-ubuntu18.04` (*3.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel/Dockerfile)
- [`3.7-gl-devel-cuda10.2-ubuntu18.04` (*3.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/ubuntu/devel-gl/Dockerfile)

### Jetson L4T 35 (JetPack 5)

L4T 35.1 (JP 5.0.2)

- [`3.7-devel-jetson-jp5.0.2`, `3.7-devel-l4t-r35.1` (*3.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/devel/Dockerfile)
- [`3.7-runtime-jetson-jp5.0.2`, `3.7-runtime-l4t-r35.1` (*3.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/runtime/Dockerfile)
- [`3.7-py-devel-jetson-jp5.0.2`, `3.7-py-devel-l4t-r35.1` (*3.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-devel/Dockerfile)
- [`3.7-py-runtime-jetson-jp5.0.2`, `3.7-py-runtime-l4t-r35.1` (*3.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-runtime/Dockerfile)
- [`3.7-tools-devel-jetson-jp5.0.2`, `3.7-tools-devel-l4t-r35.1` (*3.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/tools-devel/Dockerfile)

### Jetson L4T 32 (JetPack 4)

L4T 32.7 (JP 4.6.1)

- [`3.7-devel-jetson-jp4.6.1`, `3.7-devel-l4t-r32.7` (*3.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/devel/Dockerfile)
- [`3.7-runtime-jetson-jp4.6.1`, `3.7-runtime-l4t-r32.7` (*3.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/runtime/Dockerfile)
- [`3.7-py-devel-jetson-jp4.6.1`, `3.7-py-devel-l4t-r32.7` (*3.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-devel/Dockerfile)
- [`3.7-py-runtime-jetson-jp4.6.1`, `3.7-py-runtime-l4t-r32.7` (*3.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-runtime/Dockerfile)
- [`3.7-tools-devel-jetson-jp4.6.1`, `3.7-tools-devel-l4t-r32.7` (*3.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/tools-devel/Dockerfile)

L4T 32.6 (JP 4.6)

- [`3.7-devel-jetson-jp4.6`, `3.7-devel-l4t-r32.6` (*3.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/devel/Dockerfile)
- [`3.7-runtime-jetson-jp4.6`, `3.7-runtime-l4t-r32.6` (*3.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/runtime/Dockerfile)
- [`3.7-py-devel-jetson-jp4.6`, `3.7-py-devel-l4t-r32.6` (*3.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-devel/Dockerfile)
- [`3.7-py-runtime-jetson-jp4.6`, `3.7-py-runtime-l4t-r32.6` (*3.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-runtime/Dockerfile)
- [`3.7-tools-devel-jetson-jp4.6`, `3.7-tools-devel-l4t-r32.6` (*3.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/tools-devel/Dockerfile)


L4T 32.5 (JP 4.5)

- [`3.7-devel-jetson-jp4.5`, `3.7-devel-l4t-r32.5` (*3.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/devel/Dockerfile)
- [`3.7-runtime-jetson-jp4.5`, `3.7-runtime-l4t-r32.5` (*3.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/runtime/Dockerfile)
- [`3.7-py-devel-jetson-jp4.5`, `3.7-py-devel-l4t-r32.5` (*3.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-devel/Dockerfile)
- [`3.7-py-runtime-jetson-jp4.5`, `3.7-py-runtime-l4t-r32.5` (*3.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-runtime/Dockerfile)
- [`3.7-tools-devel-jetson-jp4.5`, `3.7-tools-devel-l4t-r32.5` (*3.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/tools-devel/Dockerfile)


L4T 32.4 (JP 4.4)

- [`3.7-devel-jetson-jp4.4`, `3.7-devel-l4t-r32.4` (*3.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/devel/Dockerfile)
- [`3.7-runtime-jetson-jp4.4`, `3.7-runtime-l4t-r32.4` (*3.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/runtime/Dockerfile)
- [`3.7-py-devel-jetson-jp4.4`, `3.7-py-devel-l4t-r32.4` (*3.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-devel/Dockerfile)
- [`3.7-py-runtime-jetson-jp4.4`, `3.7-py-runtime-l4t-r32.4` (*3.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/py-runtime/Dockerfile)
- [`3.7-tools-devel-jetson-jp4.4`, `3.7-tools-devel-l4t-r32.4` (*3.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/3.X/l4t/tools-devel/Dockerfile)

## Running Containers

```bash
docker run --gpus all -it --privileged stereolabs/zed:3.7-runtime-cuda11.4-ubuntu18.04
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
docker run --gpus all -it --privileged -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:3.7-gl-devel-cuda11.4-ubuntu18.04
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
docker pull stereolabs/zed:3.7-devel-jetson-jp4.6
```

The image is based on the [NVIDIA L4T image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base).

## More information

[Check out the README on Github](https://github.com/stereolabs/zed-docker)