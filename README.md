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

    docker pull stereolabs/zed:4.0-runtime-cuda11.8-ubuntu20.04
    docker run --gpus all -it --privileged stereolabs/zed:4.0-runtime-cuda11.8-ubuntu20.04

`--privileged` option is used to pass through all the device to the docker container, it might not be very safe but provides an easy solution to connect the USB3 camera to the container.


---

When using the **object detection module**, a volume should be used to store the model and optimized model to avoid re-downloading it and re-optimizing it every time.

    docker run --gpus all -it --privileged -v /usr/local/zed/resources:/usr/local/zed/resources stereolabs/zed:4.0-runtime-cuda11.8-ubuntu20.04

Note : On the host it can point to an other folder than `/usr/local/zed/resources` (for instance `-v /mnt/SSD/zed_data:/usr/local/zed/resources`)

### Network support

By default the host networks are not accessible from a docker container, they're isolated while keeping an external connection (like internet access), it's a bridge. To remove network isolation, for instance, to use the ZED streaming sample, the `network` option needs to be set to `host` :

```
docker run --gpus all -it --privileged --network=host stereolabs/zed:4.0-runtime-cuda11.8-ubuntu20.04
```

There are other network options, refer to [the docker network documentation](https://docs.docker.com/network/) for more information.

### Display support

A container is also available with OpenGL display support (from [nvidia/cudagl container](https://gitlab.com/nvidia/cudagl)). It is mandatory to open the tools from within an image.

    docker pull stereolabs/zed:4.0-gl-devel-cuda11.4-ubuntu20.04

To run it, we need to add the right to connect to the X server :

    xhost +si:localuser:root

While being simple, please note that this can be a security concern, considering the right given to the container.

Then to run it :

    docker run --gpus all -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix stereolabs/zed:4.0-gl-devel-cuda11.4-ubuntu20.04

Any OpenGL tools are now able to run, for instance :

    /usr/local/zed/tools/ZED\ Explorer

For more information on the display usage checkout the [ROS documentation about using Docker with X server](http://wiki.ros.org/docker/Tutorials/GUI).

### USB connection

The camera connection can be verified using `lsusb`:

    lsusb -d 2b03: -vvv

## Jetson images

### Using docker on Tegra

With the [recently added support](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson) of nvidia docker, it is now possible to run the ZED SDK inside docker on Jetson. We now provide a compatible image :

```bash
docker pull stereolabs/zed:5.0-devel-l4t-r36.4
```

One exemple of DockerFile can be found [here](4.X/l4t/devel/Dockerfile). The image is based on the [NVIDIA L4T image](https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base).

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
cd 4.X/l4t/devel
docker build --build-arg L4T_MAJOR_VERSION=35 \
             --build-arg L4T_MINOR_VERSION=2 \
             --build-arg L4T_PATCH_VERSION=1 \
             --build-arg ZED_SDK_MAJOR=4 \
             --build-arg ZED_SDK_MINOR=0 \
             --build-arg JETPACK_MAJOR=5 \
             --build-arg JETPACK_MINOR=1.0 \
             --build-arg L4T_BASE_IMAGE="l4t-jetpack" \
             -t zed:4.0-devel-l4t-r35.2 .
```

Unfortunately it is not possible to emulate CUDA accelerated program with QEMU.

## Running the image on Jetson natively

A typical full command for ZED2i/ZEDX would be:

```bash
sudo docker run --runtime=nvidia -v /tmp/argus_socket:/tmp/argus_socket -v /var/nvidia/nvcam/settings/:/var/nvidia/nvcam/settings/ -v /etc/systemd/system:/etc/systemd/system  -v /usr/local/zed/settings/:/usr/local/zed/settings/ -v /usr/local/zed/resources/:/usr/local/zed/resources/ -v /etc/systemd/system/zed_x_daemon.service:/etc/systemd/system/zed_x_daemon.service -v /dev:/dev -v /tmp:/tmp --ipc=host --pid=host -e NVIDIA_DRIVER_CAPABILITIES=all -e DISPLAY=$DISPLAY -it --privileged --network=host stereolabs/zed:5.0-tools-devel-l4t-r36.4
```

This will mount all the necessary folders for GMSL communication, display and calibration, and AI model. The tools are also available.

## Troubleshooting

### Nvidia driver libraries missing in the container

- "`libcuda.so.1` is not found" : make sure to run the image with `--gpus all` (or specify the GPU ID). It allows docker to mount the host driver into the image.

- "`libnvcuvid.so.1` is not found" : make sure to run the image with `--gpus 'all,"capabilities=compute,video"'` or `-e NVIDIA_DRIVER_CAPABILITIES=all --gpus all`. It allows docker to mount the host driver, including the hardware decoding library into the image.

### Compiling issues

- `CUDA_CUDA_LIBRARY` not found when running cmake configuration
```
CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
CUDA_CUDA_LIBRARY (ADVANCED)
```
- Missing `libnvcuvid.so.1`
```
/usr/bin/ld: warning: libnvcuvid.so.1, needed by /usr/local/zed/lib/libsl_zed.so, not found (try using -rpath or -rpath-link)
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidDestroyDecoder'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidUnmapVideoFrame64'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidDestroyVideoParser'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidMapVideoFrame64'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidCtxLockCreate'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidGetDecoderCaps'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidParseVideoData'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidDecodePicture'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidCreateDecoder'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidCtxLockDestroy'
/usr/local/zed/lib/libsl_zed.so: undefined reference to `cuvidCreateVideoParser'
collect2: error: ld returned 1 exit status
```

Both problem can be fixed using the following cmake options :

```
cmake -DCMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs -DCMAKE_CXX_FLAGS="-Wl,--allow-shlib-undefined" ..
```
The link path need to point to the CUDA stub folder, and since `nvcuvid` can be unavailable at compile time, we tell the compiler to ignore undefined symbols.


### USB replug/hot plug

ZED-M and ZED2/ZED2i contains a udev device for the IMU and sensors data.
On Linux, udev/serial device path are often ephemeral (will change if the device is unplugged and replugged).

If you unplug/plug them back in, it’s technically a different mapped file for the device than what was mounted in, so Docker won’t see it. For this reason, a solution is to mount the entire /dev folder from the host to the container. You can do this by adding the following volume command to your Docker run command `-v /dev:/dev`

For example :

```
docker run --gpus all -it -v /dev:/dev --privileged stereolabs/zed:4.0-runtime-cuda11.8-ubuntu20.04
```

When not running the container in root (not using --privileged), the udev rules should be installed on the host, for instance by running the ZED SDK installer to be able to open the cameras, it may segfault otherwise. Alternatively [this script](https://gist.github.com/adujardin/2d5ce8f000fc6a7bd40bee2709749ff8) can be run.

### ZED X / GMSL2

For the ZED X, more folders should be added as volume:

```
-v /tmp/argus_socket:/tmp/argus_socket -v /var/nvidia/nvcam/settings/:/var/nvidia/nvcam/settings/ -v /etc/systemd/system:/etc/systemd/system -v /etc/systemd/system/zed_x_daemon.service:/etc/systemd/system/zed_x_daemon.service -v /dev:/dev -v /tmp:/tmp
```

### Using the tools

The tools are using OpenGL libraries. The "`gl`" images are therefore required to use them (see [display support section](#display-support)).

## Contributing

Feel free to open an issue if you find a bug, or a pull request for bug fixes, features or other improvements.

## Support

If you need assistance, go to our Community site at https://community.stereolabs.com/
