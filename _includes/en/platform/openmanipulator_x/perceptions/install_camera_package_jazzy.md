
#### **Option 1: Using OM Container**
When using the OM container, run the RealSense camera with the following command after starting the OM container:
```bash
ros2 launch realsense2_camera rs_launch.py
```

#### **Option 2: Local Installation**
##### [Install Realsense Library](#install-realsense-library)
The following commands will install relevant Intel® RealSense™ Depth Camera D435 library.
  ``` bash
  $ sudo apt update
  $ sudo apt install ros-$ROS_DISTRO-librealsense2*
  $ sudo apt install ros-$ROS_DISTRO-realsense2-camera
  ```
  ``` bash
  $ cd ~/ros2_ws/src
  $ git clone https://github.com/IntelRealSense/realsense-ros.git
  $ cd ~/ros2_ws && colcon build --symlink-install
  ```
##### [Run Realsense Launch File](#run-realsense-launch-file)
Run the following command.
  ``` bash
  $ ros2 launch realsense2_camera rs_launch.py
  ```

You can use RViz or image_view to verify driver. You can select data topic name related to Intel® RealSense™ Depth Camera D435 from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

##### Reference
- [Intel® RealSense™ Depth Camera D435](https://www.intelrealsense.com/depth-camera-d435/)    
- [Realsense ROS package](https://github.com/intel-ros/realsense)

