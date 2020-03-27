push_images=true
build_latest_only_images=false


######### 3.1

### 4.2
cd 3.1/l4t/jetpack_4.2/devel
cd ../ros-devel

### 4.3
cd ../../jetpack_4.3/devel
cd ../ros-devel
docker build -t stereolabs/zed:3.1-ros-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.1-ros-devel-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.1-ros-devel-jetson-jp4.3
    docker push stereolabs/zed:3.1-ros-devel-l4t-r32.3.1
fi

cd ../../../../
