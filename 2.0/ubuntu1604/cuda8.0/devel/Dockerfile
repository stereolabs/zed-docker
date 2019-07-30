FROM nvidia/cuda:8.0-devel-ubuntu16.04

RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get install --no-install-recommends lsb-release wget less udev sudo apt-transport-https unzip  -y && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections && \
    rm -rf /var/lib/apt/lists/*

# OpenCV 3.1 dependency
RUN apt-get update -y && \
    apt-get install --no-install-recommends build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y && \
    wget https://github.com/opencv/opencv/archive/3.1.0.zip && \
    unzip 3.1.0.zip && \
    rm 3.1.0.zip && \
    cd opencv-3.1.0 ; mkdir build ; cd build ; cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_DOCS=OFF -DBUILD_PERF_TESTS=OFF \
        -DBUILD_TESTS=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DBUILD_opencv_apps=OFF -DBUILD_OPENCV_PYTHON2=OFF -DBUILD_OPENCV_PYTHON3=OFF \
        -DBUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j8 install && \
    cd ../.. ; rm -rf opencv-3.1.0 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \ 
    wget -O ZED_SDK_Linux_Ubuntu16.run https://download.stereolabs.com/zedsdk/2.0/ubuntu && \
    chmod +x ZED_SDK_Linux_Ubuntu16.run ; ./ZED_SDK_Linux_Ubuntu16.run silent && \
    rm ZED_SDK_Linux_Ubuntu16.run && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/zed/


