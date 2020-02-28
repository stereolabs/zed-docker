push_images=true
build_latest_only_images=true

######### 3.0

### 4.2
cd 3.0/l4t/jetpack_4.2/devel
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-devel-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-devel-jetson-jp4.2
    docker push stereolabs/zed:3.0-devel-l4t-r32.2.1
fi

cd ../py-devel
docker build -t stereolabs/zed:3.0-py-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-py-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-py-devel-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-py-devel-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-py-devel-jetson-jp4.2
    docker push stereolabs/zed:3.0-py-devel-l4t-r32.2.1
fi

cd ../py-runtime
docker build -t stereolabs/zed:3.0-py-runtime-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-py-runtime-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-py-runtime-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-py-runtime-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-py-runtime-jetson-jp4.2
    docker push stereolabs/zed:3.0-py-runtime-l4t-r32.2.1
fi

cd ../runtime
docker build -t stereolabs/zed:3.0-runtime-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-runtime-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-runtime-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-runtime-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-runtime-jetson-jp4.2
    docker push stereolabs/zed:3.0-runtime-l4t-r32.2.1
fi

cd ../ros-devel
docker build -t stereolabs/zed:3.0-ros-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-ros-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-ros-devel-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-ros-devel-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-ros-devel-jetson-jp4.2
    docker push stereolabs/zed:3.0-ros-devel-l4t-r32.2.1
fi

cd ../tools-devel
docker build -t stereolabs/zed:3.0-tools-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-tools-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-tools-devel-jetson-jp4.2 .
if $push_images; then
    docker push stereolabs/zed:3.0-tools-devel-jetson-jp4.2.1
    docker push stereolabs/zed:3.0-tools-devel-jetson-jp4.2
    docker push stereolabs/zed:3.0-tools-devel-l4t-r32.2.1
fi


### 4.3
cd ../../jetpack_4.3/devel
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-devel-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-devel-jetson-jp4.3
    docker push stereolabs/zed:3.0-devel-l4t-r32.3.1
fi

cd ../py-devel
docker build -t stereolabs/zed:3.0-py-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-py-devel-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-py-devel-jetson-jp4.3
    docker push stereolabs/zed:3.0-py-devel-l4t-r32.3.1
fi

cd ../py-runtime
docker build -t stereolabs/zed:3.0-py-runtime-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-py-runtime-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-py-runtime-jetson-jp4.3
    docker push stereolabs/zed:3.0-py-runtime-l4t-r32.3.1
fi

cd ../runtime
docker build -t stereolabs/zed:3.0-runtime-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-runtime-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-runtime-jetson-jp4.3
    docker push stereolabs/zed:3.0-runtime-l4t-r32.3.1
fi

cd ../ros-devel
docker build -t stereolabs/zed:3.0-ros-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-ros-devel-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-ros-devel-jetson-jp4.3
    docker push stereolabs/zed:3.0-ros-devel-l4t-r32.3.1
fi

cd ../tools-devel
docker build -t stereolabs/zed:3.0-tools-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-tools-devel-l4t-r32.3.1 . 
if $push_images; then
    docker push stereolabs/zed:3.0-tools-devel-jetson-jp4.3
    docker push stereolabs/zed:3.0-tools-devel-l4t-r32.3.1
fi
cd ../../../../




######### 2.8
if ! $build_latest_only_images; then
    cd 2.8/l4t/jetpack_4.2/devel
    docker build -t stereolabs/zed:2.8-devel-jetson-jp4.2.1 .
    # aliases
    docker build -t stereolabs/zed:2.8-devel-l4t-r32.2.1 . 
    docker build -t stereolabs/zed:2.8-devel-jetson-jp4.2 .

    if $push_images; then
        docker push stereolabs/zed:2.8-devel-jetson-jp4.2.1
        docker push stereolabs/zed:2.8-devel-jetson-jp4.2
        docker push stereolabs/zed:2.8-devel-l4t-r32.2.1
    fi

    cd ../../jetpack_4.3/devel
    docker build -t stereolabs/zed:2.8-devel-jetson-jp4.3 .
    # aliases
    docker build -t stereolabs/zed:2.8-devel-l4t-r32.3.1 . 

    if $push_images; then
        docker push stereolabs/zed:2.8-devel-jetson-jp4.3
        docker push stereolabs/zed:2.8-devel-l4t-r32.3.1
    fi
    cd ../../../../
fi
