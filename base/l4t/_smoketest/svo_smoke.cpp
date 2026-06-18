// Headless full-pipeline smoke test for the L4T base images.
//   - Opens an SVO (exercises disk IO + SDK init + CUDA context)
//   - DEPTH_MODE::NEURAL_LIGHT (exercises cuDNN + TensorRT inference path)
//   - Grabs a handful of frames and retrieves depth (exercises full runtime)
//   - Prints "SMOKE_OK" on success, non-zero exit on any failure
//
// Usage: svo_smoke <svo_path> [num_frames=10] [open_timeout_s=60]

#include <sl/Camera.hpp>
#include <chrono>
#include <future>
#include <iostream>
#include <string>

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <svo_path> [num_frames=10] [open_timeout_s=60]\n";
        return 2;
    }
    std::string svo = argv[1];
    int num_frames    = (argc > 2) ? std::stoi(argv[2]) : 10;
    int open_timeout  = (argc > 3) ? std::stoi(argv[3]) : 60;

    sl::InitParameters ip;
    ip.camera_resolution = sl::RESOLUTION::AUTO;
    ip.depth_mode        = sl::DEPTH_MODE::NEURAL_LIGHT;
    ip.input.setFromSVOFile(svo.c_str());
    ip.svo_real_time_mode = false;
    ip.sdk_verbose        = 1;

    sl::Camera zed;
    auto fut = std::async(std::launch::async, [&]{ return zed.open(ip); });
    if (fut.wait_for(std::chrono::seconds(open_timeout)) == std::future_status::timeout) {
        std::cerr << "TIMEOUT: zed.open() > " << open_timeout << "s\n";
        return 3;
    }
    auto err = fut.get();
    if (err != sl::ERROR_CODE::SUCCESS) {
        std::cerr << "open failed: " << err << "\n";
        return 4;
    }

    auto info = zed.getCameraInformation();
    std::cout << "opened: model=" << info.camera_model
              << " serial=" << info.serial_number
              << " res=" << info.camera_configuration.resolution.width
              << "x" << info.camera_configuration.resolution.height
              << " fw=" << info.camera_configuration.firmware_version
              << "\n";

    sl::Mat depth;
    int grabbed = 0;
    for (int i = 0; i < num_frames; ++i) {
        auto ge = zed.grab();
        if (ge == sl::ERROR_CODE::END_OF_SVOFILE_REACHED) break;
        if (ge != sl::ERROR_CODE::SUCCESS) {
            std::cerr << "grab " << i << " failed: " << ge << "\n";
            zed.close();
            return 5;
        }
        if (zed.retrieveMeasure(depth, sl::MEASURE::DEPTH) != sl::ERROR_CODE::SUCCESS) {
            std::cerr << "retrieveMeasure DEPTH failed on frame " << i << "\n";
            zed.close();
            return 6;
        }
        ++grabbed;
    }

    std::cout << "grabbed=" << grabbed
              << " depth=" << depth.getWidth() << "x" << depth.getHeight() << "\n";
    zed.close();

    if (grabbed == 0) {
        std::cerr << "no frames grabbed\n";
        return 7;
    }
    std::cout << "SMOKE_OK\n";
    return 0;
}
