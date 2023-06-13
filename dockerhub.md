# ZED SDK Docker Images

These images let you use the ZED SDK with docker, even with the ZED camera connected (or an SVO file).
https://github.com/stereolabs/zed-docker

## Base Image Tags

All images are based on Nvidia CUDA. You need nvidia-docker to run them, see below.
Please note that these images **can't** run graphical programs, including the tools. It requires openGL support (see `gl-devel` tags). **All desktop images now include the ZED Python API.**

- `runtime` images are the lightest and comes with every dependency installed. It's only meant to run applications linked with the ZED SDK.

- `devel` images contains all development tools to compile application including the cuda toolchain, static libraries, and headers of CUDA and the ZED SDK.

- `gl-devel` images include openGL support to be able to run the tools and sample. It also contains the development tools similarly to `devel` image. Please note that some images variants are not available since Nvidia didn't release image for recent version of CUDA and Ubuntu https://gitlab.com/nvidia/container-images/cuda/-/issues/147

## Jetson specific tags

This the jetsons are usually much more limited in storage, more variants are available to limit the disk space usage. Unlike the desktop images, the OpenGL support is included from the base image provided by Nvidia, and therefore available on all images.

- `py-devel` images contains all development tools to develop applications that uses ZED Python API.

- `py-runtime` images are the lightest and comes with every dependency installed. It's only meant to run applications that uses the ZED Python API.

- `tools-devel` images include the tools and sample and the development tools similarly to `devel` image. It is the most complete and biggest image.
  
## LATEST ZED SDK 4.0 tags

### Ubuntu 22.04

CUDA 12.1

- [`4.0-runtime-cuda12.1-ubuntu22.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda12.1-ubuntu22.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)

CUDA 11.8

- [`4.0-runtime-cuda11.8-ubuntu22.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda11.8-ubuntu22.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)

### Ubuntu 20.04

CUDA 12.1

- [`4.0-runtime-cuda12.1-ubuntu20.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda12.1-ubuntu20.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)

CUDA 11.8

- [`4.0-runtime-cuda11.8-ubuntu20.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda11.8-ubuntu20.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)
- [`4.0-gl-devel-cuda11.4-ubuntu20.04` (*4.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel-gl/Dockerfile)

### Ubuntu 18.04 (deprecated)

CUDA 11.8

- [`4.0-runtime-cuda11.8-ubuntu18.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda11.8-ubuntu18.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)
- [`4.0-gl-devel-cuda11.4-ubuntu18.04` (*4.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel-gl/Dockerfile)

CUDA 10.2

- [`4.0-runtime-cuda10.2-ubuntu18.04` (*4.X/ubuntu/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/runtime/Dockerfile)
- [`4.0-devel-cuda10.2-ubuntu18.04` (*4.X/ubuntu/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel/Dockerfile)
- [`4.0-gl-devel-cuda10.2-ubuntu18.04` (*4.X/ubuntu/devel-gl/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/ubuntu/devel-gl/Dockerfile)

### Jetson L4T 35 (JetPack 5)

L4T 35.3 (JP 5.1.1)

- [`4.0-devel-jetson-jp5.1.1`, `4.0-devel-l4t-r35.3` (*4.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/devel/Dockerfile)
- [`4.0-runtime-jetson-jp5.1.1`, `4.0-runtime-l4t-r35.3` (*4.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/runtime/Dockerfile)
- [`4.0-py-devel-jetson-jp5.1.1`, `4.0-py-devel-l4t-r35.3` (*4.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-devel/Dockerfile)
- [`4.0-py-runtime-jetson-jp5.1.1`, `4.0-py-runtime-l4t-r35.3` (*4.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-runtime/Dockerfile)
- [`4.0-tools-devel-jetson-jp5.1.1`, `4.0-tools-devel-l4t-r35.3` (*4.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/tools-devel/Dockerfile)

L4T 35.2 (JP 5.1.0)

- [`4.0-devel-jetson-jp5.1.0`, `4.0-devel-l4t-r35.2` (*4.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/devel/Dockerfile)
- [`4.0-runtime-jetson-jp5.1.0`, `4.0-runtime-l4t-r35.2` (*4.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/runtime/Dockerfile)
- [`4.0-py-devel-jetson-jp5.1.0`, `4.0-py-devel-l4t-r35.2` (*4.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-devel/Dockerfile)
- [`4.0-py-runtime-jetson-jp5.1.0`, `4.0-py-runtime-l4t-r35.2` (*4.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-runtime/Dockerfile)
- [`4.0-tools-devel-jetson-jp5.1.0`, `4.0-tools-devel-l4t-r35.2` (*4.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/tools-devel/Dockerfile)


L4T 35.1 (JP 5.0.2)

- [`4.0-devel-jetson-jp5.0.2`, `4.0-devel-l4t-r35.1` (*4.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/devel/Dockerfile)
- [`4.0-runtime-jetson-jp5.0.2`, `4.0-runtime-l4t-r35.1` (*4.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/runtime/Dockerfile)
- [`4.0-py-devel-jetson-jp5.0.2`, `4.0-py-devel-l4t-r35.1` (*4.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-devel/Dockerfile)
- [`4.0-py-runtime-jetson-jp5.0.2`, `4.0-py-runtime-l4t-r35.1` (*4.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-runtime/Dockerfile)
- [`4.0-tools-devel-jetson-jp5.0.2`, `4.0-tools-devel-l4t-r35.1` (*4.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/tools-devel/Dockerfile)

### Jetson L4T 32 (JetPack 4)

L4T 32.7 (JP 4.6.X)

- [`4.0-devel-jetson-jp4.6.1`, `4.0-devel-l4t-r32.7` (*4.X/l4t/devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/devel/Dockerfile)
- [`4.0-runtime-jetson-jp4.6.1`, `4.0-runtime-l4t-r32.7` (*4.X/l4t/runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/runtime/Dockerfile)
- [`4.0-py-devel-jetson-jp4.6.1`, `4.0-py-devel-l4t-r32.7` (*4.X/l4t/py-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-devel/Dockerfile)
- [`4.0-py-runtime-jetson-jp4.6.1`, `4.0-py-runtime-l4t-r32.7` (*4.X/l4t/py-runtime/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/py-runtime/Dockerfile)
- [`4.0-tools-devel-jetson-jp4.6.1`, `4.0-tools-devel-l4t-r32.7` (*4.X/l4t/tools-devel/Dockerfile*)](https://github.com/stereolabs/zed-docker/blob/master/4.X/l4t/tools-devel/Dockerfile)

## Running Containers

```bash
docker run --gpus all -it --privileged stereolabs/zed:4.0-runtime-cuda11.8-ubuntu18.04
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
docker run --gpus all -it --privileged -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:4.0-gl-devel-cuda11.4-ubuntu18.04
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
docker pull stereolabs/zed:4.0-devel-l4t-r35.1
```

The image is based on the [NVIDIA L4T image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base).

## More information

[Check out the README on Github](https://github.com/stereolabs/zed-docker)