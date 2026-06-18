cmake_minimum_required(VERSION 3.10)
project(svo_smoke LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ZED REQUIRED)
find_package(CUDA ${ZED_CUDA_VERSION} REQUIRED)

include_directories(${ZED_INCLUDE_DIRS} ${CUDA_INCLUDE_DIRS})
link_directories(${ZED_LIBRARY_DIR} ${CUDA_LIBRARY_DIRS})

add_executable(svo_smoke svo_smoke.cpp)
target_link_libraries(svo_smoke ${ZED_LIBRARIES} ${CUDA_CUDA_LIBRARY} ${CUDA_CUDART_LIBRARY})
