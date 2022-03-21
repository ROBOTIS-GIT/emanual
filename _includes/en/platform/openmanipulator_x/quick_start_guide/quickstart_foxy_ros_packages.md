
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


```bash
$ sudo apt install ros-foxy-rqt* ros-foxy-joint-state-publisher
```

```bash
$ cd ~/colcon_ws/src/
$ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/colcon_ws && colcon build --symlink-install
```
