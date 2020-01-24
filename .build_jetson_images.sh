cd 2.8/l4t/jetpack_4.2/devel
docker build -t stereolabs/zed:2.8-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:2.8-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:2.8-devel-jetson-jp4.2 .

docker push stereolabs/zed:2.8-devel-jetson-jp4.2.1
docker push stereolabs/zed:2.8-devel-jetson-jp4.2
docker push stereolabs/zed:2.8-devel-l4t-r32.2.1

cd ../../jetpack_4.3/devel
docker build -t stereolabs/zed:2.8-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:2.8-devel-l4t-r32.3.1 . 

docker push stereolabs/zed:2.8-devel-jetson-jp4.3
docker push stereolabs/zed:2.8-devel-l4t-r32.3.1
cd ../../../../

cd 3.0/l4t/jetpack_4.2/devel
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.2.1 .
# aliases
docker build -t stereolabs/zed:3.0-devel-l4t-r32.2.1 . 
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.2 .

docker push stereolabs/zed:3.0-devel-jetson-jp4.2.1
docker push stereolabs/zed:3.0-devel-jetson-jp4.2
docker push stereolabs/zed:3.0-devel-l4t-r32.2.1

cd ../../jetpack_4.3/devel
docker build -t stereolabs/zed:3.0-devel-jetson-jp4.3 .
# aliases
docker build -t stereolabs/zed:3.0-devel-l4t-r32.3.1 . 

docker push stereolabs/zed:3.0-devel-jetson-jp4.3
docker push stereolabs/zed:3.0-devel-l4t-r32.3.1
cd ../../../../