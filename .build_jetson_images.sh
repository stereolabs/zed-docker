set -x

push_images=true
build_latest_only_images=true

JETPACK_MAJOR="4"
ROS_DISTRO_ARG="melodic"

zed_major_versions=(
  3
)

zed_minor_versions=(
  #0
  #1
  #2
  3
  4
)

jetpack_minor_versions=(
  #2
  3
  4
)

docker_image_variant=(
  devel
  py-devel
  py-runtime
  ros-devel
  runtime
  tools-devel  
)

pwd_path=$(pwd)

for ZED_SDK_MAJOR in "${zed_major_versions[@]}" ; do
    for ZED_SDK_MINOR in "${zed_minor_versions[@]}" ; do
        for JETPACK_MINOR in "${jetpack_minor_versions[@]}" ; do
            for IMAGE_VARIANT in "${docker_image_variant[@]}" ; do


                if $build_latest_only_images; then
                    if [ ${ZED_SDK_MINOR} -ne ${zed_minor_versions[-1]} ] ; then
                        continue
                    fi
                fi

                if [ ${JETPACK_MAJOR} == "4" ] ; then
                    if [ ${JETPACK_MINOR} == "2" ] ; then # 42
                        L4T_MINOR_VERSION="2.1"
                    elif [ ${JETPACK_MINOR} == "3" ] ; then # 43
                        L4T_MINOR_VERSION="3.1"
                    elif [ ${JETPACK_MINOR} == "4" ] ; then # 44
                        L4T_MINOR_VERSION="4.4"

                        # ZED 3.2 is the first version to support JP44
                        if [ ${ZED_SDK_MAJOR} -le "3" ] && [ ${ZED_SDK_MINOR} -lt "2" ]; then
                            echo "Skipping ${ZED_SDK_MAJOR}.${ZED_SDK_MINOR} for JP 44"
                            continue
                        fi
                    fi
                fi

                cd "${ZED_SDK_MAJOR}.X/jetpack_${JETPACK_MAJOR}.X/${IMAGE_VARIANT}"
                docker build --build-arg L4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
                    --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
                    --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
                    --build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
                    --build-arg JETPACK_MAJOR=${JETPACK_MAJOR} \
                    --build-arg JETPACK_MINOR=${JETPACK_MINOR} \
                    -t "stereolabs/zed:${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-jetson-jp${JETPACK_MAJOR}.${JETPACK_MINOR}" .

                # aliases
                docker build --build-arg L4T_MINOR_VERSION=${L4T_MINOR_VERSION} \
                    --build-arg ZED_SDK_MAJOR=${ZED_SDK_MAJOR} \
                    --build-arg ZED_SDK_MINOR=${ZED_SDK_MINOR} \
                    --build-arg ROS_DISTRO_ARG=${ROS_DISTRO_ARG} \
                    --build-arg JETPACK_MAJOR=${JETPACK_MAJOR} \
                    --build-arg JETPACK_MINOR=${JETPACK_MINOR} \
                    -t "stereolabs/zed:${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-l4t-r32.${L4T_MINOR_VERSION}" . 
                if $push_images; then
                    docker push "stereolabs/zed:${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-jetson-jp${JETPACK_MAJOR}.${JETPACK_MINOR}"
                    docker push "stereolabs/zed:${ZED_SDK_MAJOR}.${ZED_SDK_MINOR}-${IMAGE_VARIANT}-l4t-r32.${L4T_MINOR_VERSION}"
                fi

                cd "${pwd_path}"
            done
        done
    done
done