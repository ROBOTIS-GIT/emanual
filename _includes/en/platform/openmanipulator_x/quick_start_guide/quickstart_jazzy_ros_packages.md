**Supported ROS Version**: ROS 2 Jazzy  
This package is compatible only with ROS 2 Jazzy. Ensure that ROS 2 Jazzy is properly installed.

#### USB Port Permissions
To enable communication with the hardware, add your user to the dialout group:

```bash
$ sudo usermod -aG dialout $USER
```
A login and logout are required.

<!-- #### (Optional) Install Intel RealSense ROS Wrapper

If you plan to use Intel RealSense cameras with OpenMANIPULATOR-X, please follow the official instructions for installing and using the [RealSense ROS wrapper](https://github.com/IntelRealSense/realsense-ros).

This will ensure you have the latest and most compatible version for your system and camera. -->

#### Clone the Repository

```bash
$ mkdir -p ~/ros2_ws/src
$ cd ~/ros2_ws/src
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/DynamixelSDK.git && \
  git clone -b jazzy https://github.com/ROBOTIS-GIT/dynamixel_interfaces.git && \
  git clone -b jazzy https://github.com/ROBOTIS-GIT/dynamixel_hardware_interface.git && \
  git clone -b jazzy https://github.com/ROBOTIS-GIT/open_manipulator.git
```

#### Install ROS 2 Dependencies

```bash
$ cd ~/ros2_ws
$ sudo rosdep init
$ rosdep update
$ rosdep install --from-paths src -y --ignore-src
```

#### Build the Package

```bash
$ colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
```

#### Source the Workspace

```bash
$ source ~/ros2_ws/install/setup.bash
```

#### bashrc setting 
Add the following to your ~/.bashrc for a convenient build alias:

```bash
$ echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc && \
  echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc && \
  echo "alias cb='colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release'" >> ~/.bashrc
$ source ~/.bashrc
```

#### Create and apply udev rules

```bash
$ ros2 run open_manipulator_bringup om_create_udev_rules
```