#https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
FROM stereolabs/zed:3.1-devel-jetson-jp4.3

ENV LOGNAME root
ENV ROS_DISTRO melodic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Setup ROS
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install ros-$ROS_DISTRO-ros-base python-rosinstall python-rosdep python-rosinstall-generator python-wstool build-essential nano \
        cmake usbutils git -y --allow-unauthenticated && \
    rm -rf /var/lib/apt/lists/*

# setup ros env
ENV ROS_WS /opt/ros_ws

RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO && \
  mkdir -p $ROS_WS/src

WORKDIR $ROS_WS

COPY ./src/subscriber_pkg /$ROS_WS/src/subscriber_pkg
 
RUN cd src ; git clone https://github.com/stereolabs/zed-ros-wrapper.git && \
    git clone https://github.com/stereolabs/zed-ros-examples.git && \
    cd .. ; apt-get update -y && \
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    rosdep install --from-paths $ROS_WS/src --ignore-src -r -y && \ 
    rm -rf /var/lib/apt/lists/* && \
    catkin_make -DCMAKE_BUILD_TYPE=Release -DCMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs -DCUDA_CUDART_LIBRARY=/usr/local/cuda/lib64/stubs -DCMAKE_CXX_FLAGS="-Wl,--allow-shlib-undefined"


# setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

