# Need nvidia-docker to run https://github.com/NVIDIA/nvidia-docker
# Image from https://gitlab.com/nvidia/cuda/
FROM nvidia/cuda:10.0-devel-ubuntu18.04

# The runtime image might be enough, depending on the need

# Setup the ZED SDK
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https -y && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \ 
    wget -O ZED_SDK_Linux_Ubuntu18.run https://download.stereolabs.com/zedsdk/2.8/ubuntu18 && \
    chmod +x ZED_SDK_Linux_Ubuntu18.run ; ./ZED_SDK_Linux_Ubuntu18.run silent && \
    rm ZED_SDK_Linux_Ubuntu18.run && \
    rm -rf /var/lib/apt/lists/*

# Setup ROS
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update -y && \
    apt-get install ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool build-essential nano cmake usbutils git -y --allow-unauthenticated && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --gecos "ROS User" --home /home/ros --disabled-password ros && \
    usermod -a -G dialout ros && \
    echo "ros ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99_aptget && \
    chown ros /usr/local/zed/ -R

# switch to user ros, but the HOME is still /, not /home/ros
USER ros

# setup ros env
RUN sudo rosdep init && rosdep update && echo "source \"/opt/ros/melodic/setup.bash\"" >> /home/ros/.bashrc && \
    mkdir /home/ros/src

# cd /home/ros default
WORKDIR /home/ros

CMD ["bash"]
