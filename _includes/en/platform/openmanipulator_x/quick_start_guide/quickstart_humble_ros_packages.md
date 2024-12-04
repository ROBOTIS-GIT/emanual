
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


```bash
$ sudo apt install \
  ros-humble-dynamixel-sdk \
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
  ros-humble-xacro \
  ros-humble-warehouse-ros-mongo
```

```bash
$ cd ~/colcon_ws/src/
$ git clone -b humble-devel https://github.com/ROBOTIS-GIT/open_manipulator.git
# $ git clone -b humble-devel https://github.com/ROBOTIS-GIT/dynamixel_hardware_interface.git
$ cd ~/colcon_ws && colcon build --symlink-install
```
