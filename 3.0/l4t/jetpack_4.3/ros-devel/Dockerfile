#https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
FROM nvcr.io/nvidia/l4t-base:r32.3.1

#This environment variable is needed to use the streaming features on Jetson inside a container
ENV LOGNAME root
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends \
        lsb-release wget less udev sudo apt-transport-https -y && \
    wget -O ZED_SDK_Linux_JP.run https://download.stereolabs.com/zedsdk/3.0/jp43/jetsons && \
    chmod +x ZED_SDK_Linux_JP.run ; ./ZED_SDK_Linux_JP.run silent skip_tools && \
    rm -rf /usr/local/zed/resources/* \
    rm -rf ZED_SDK_Linux_JP.run && \
    rm -rf /var/lib/apt/lists/*

#This symbolic link is needed to use the streaming features on Jetson inside a container
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libv4l2.so.0 /usr/lib/aarch64-linux-gnu/libv4l2.so

# Setup ROS
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install ros-melodic-desktop-full python-rosinstall python-rosinstall-generator python-wstool build-essential nano \
        cmake usbutils git python-rosdep -y --allow-unauthenticated && \
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