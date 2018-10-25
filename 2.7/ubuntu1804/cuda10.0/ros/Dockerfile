# Need nvidia-docker to run https://github.com/NVIDIA/nvidia-docker
# Image from https://gitlab.com/nvidia/cuda/
FROM nvidia/cuda:10.0-devel-ubuntu18.04

# The runtime image might be enough, depending on the need

# Setup the ZED SDK
RUN apt-get update
RUN apt-get install lsb-release wget less udev sudo apt-transport-https -y
RUN wget -O ZED_SDK_Linux_Ubuntu18.run https://download.stereolabs.com/zedsdk/2.7/ubuntu18
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
RUN chmod +x ZED_SDK_Linux_Ubuntu18.run ; ./ZED_SDK_Linux_Ubuntu18.run silent

# Setup ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get update -y
RUN apt-get install ros-melodic-desktop-full -y

RUN adduser --gecos "ROS User" --home /home/ros --disabled-password ros && \
    usermod -a -G dialout ros && \
    echo "ros ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99_aptget

RUN apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential nano cmake usbutils git -y


# switch to user ros, but the HOME is still /, not /home/ros
RUN chown ros /usr/local/zed/ -R
USER ros

# setup ros env
RUN sudo rosdep init && rosdep update && echo "source \"/opt/ros/melodic/setup.bash\"" >> /home/ros/.bashrc
RUN mkdir /home/ros/src

# cd /home/ros default
WORKDIR /home/ros

CMD ["bash"]
