
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


```bash
$ sudo apt install \
  ros-humble-ros2-control \
  ros-humble-moveit* \
  ros-humble-gazebo-ros2-control \
  ros-humble-ros2-controllers \
  ros-humble-controller-manager \
  ros-humble-position-controllers \
  ros-humble-joint-state-broadcaster \
  ros-humble-joint-trajectory-controller \
  ros-humble-gripper-controllers \
  ros-humble-hardware-interface \
  ros-humble-xacro
```

```bash
$ mkdir -p ~/colcon_ws/src
$ cd ~/colcon_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone -b humble https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone -b humble https://github.com/ROBOTIS-GIT/dynamixel_hardware_interface.git
$ git clone -b humble https://github.com/ROBOTIS-GIT/dynamixel_interfaces.git
$ cd ~/colcon_ws && colcon build --symlink-install
```

Set the ROS environment for PC

```bash
$ echo 'source /usr/share/gazebo/setup.sh' >> ~/.bashrc
$ echo 'source ~/colcon_ws/install/local_setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```
