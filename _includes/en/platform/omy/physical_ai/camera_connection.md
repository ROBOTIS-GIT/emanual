
### Overview

* **Purpose**: Explain how to connect and configure the camera properly.
* **Applicable Models**: (e.g., Realsense D435, ZED2, USB Camera...)
* **System Requirements**:

  * USB Port: USB 3.0 or higher
  * Required Packages: `librealsense`, `ros2_camera_driver`, etc.


### Hardware Setup

**1. Connect the Camera**

* Plug the camera into a USB 2.0 port.
* Ensure the USB cable is properly connected and not loose.


### Software Installation

 **1. Install Required Packages**

```bash
sudo apt update
sudo apt install ros-${ROS_DISTRO}-realsense2-camera
```

**2. Verify Camera Recognition**

```bash
lsusb
# or
rs-enumerate-devices
```


**3. Launching the Camera Node**

```bash
ros2 launch realsense2_camera rs_camera.launch.py
```

**4. Launch File Parameters (Optional)**
* `enable_depth:=true`
* `enable_color:=true`
* `initial_reset:=true`
### Verifying Operation

 **1. Check Topics**

```bash
ros2 topic list
```

### Troubleshooting

| Problem               | Solution                                                      |
| --------------------- | ------------------------------------------------------------- |
| Camera not recognized | Check USB cable, use `lsusb`, reboot                          |
| No image stream       | Check topics, verify node is running                          |
| Permission denied     | Add user to `video` group:<br> `sudo usermod -aG video $USER` |

### Appendix

* Useful Links

  * [Intel RealSense ROS2 Documentation](https://github.com/IntelRealSense/realsense-ros)
  * [ROS 2 Camera Driver Guide (Generic)](https://index.ros.org/p/ros2_camera_driver)
* Launch file templates
* Configuration file samples

