"""Python-only full-pipeline smoke test. Mirrors svo_smoke.cpp but uses pyzed,
so it works on a runtime-only base (no CUDA dev headers required).

Usage: svo_smoke.py <svo_path> [num_frames=10]
"""
import sys
import pyzed.sl as sl

if len(sys.argv) < 2:
    print("Usage: svo_smoke.py <svo_path> [num_frames=10]", file=sys.stderr)
    sys.exit(2)

svo_path   = sys.argv[1]
num_frames = int(sys.argv[2]) if len(sys.argv) > 2 else 10

init = sl.InitParameters()
init.camera_resolution  = sl.RESOLUTION.AUTO
init.depth_mode         = sl.DEPTH_MODE.NEURAL_LIGHT
init.svo_real_time_mode = False
init.sdk_verbose        = 1
init.set_from_svo_file(svo_path)

zed = sl.Camera()
err = zed.open(init)
if err != sl.ERROR_CODE.SUCCESS:
    print(f"open failed: {err}", file=sys.stderr)
    sys.exit(4)

info = zed.get_camera_information()
cfg  = info.camera_configuration
print(f"opened: model={info.camera_model} serial={info.serial_number} "
      f"res={cfg.resolution.width}x{cfg.resolution.height} fw={cfg.firmware_version}")

depth  = sl.Mat()
grabbed = 0
for i in range(num_frames):
    ge = zed.grab()
    if ge == sl.ERROR_CODE.END_OF_SVOFILE_REACHED:
        break
    if ge != sl.ERROR_CODE.SUCCESS:
        print(f"grab {i} failed: {ge}", file=sys.stderr)
        zed.close()
        sys.exit(5)
    if zed.retrieve_measure(depth, sl.MEASURE.DEPTH) != sl.ERROR_CODE.SUCCESS:
        print(f"retrieve_measure DEPTH failed on frame {i}", file=sys.stderr)
        zed.close()
        sys.exit(6)
    grabbed += 1

print(f"grabbed={grabbed} depth={depth.get_width()}x{depth.get_height()}")
zed.close()
if grabbed == 0:
    print("no frames grabbed", file=sys.stderr)
    sys.exit(7)
print("SMOKE_OK")
