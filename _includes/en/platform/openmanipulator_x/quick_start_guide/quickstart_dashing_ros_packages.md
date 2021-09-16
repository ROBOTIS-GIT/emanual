
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


```bash
$ sudo apt install ros-dashing-python* ros-dashing-rqt* ros-dashing-joint-state-publisher
```

```bash
$ cd ~/robotis_ws/src/  
$ git clone -b dashing-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/dynamixel-workbench.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git  
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/robotis_manipulator.git  
$ cd ~/robotis_ws && colcon build --symlink-install  
```
