
Install dependent packages for OpenMANIPULATOR-X. Run the following commands in a terminal window.


```bash
$ sudo apt install ros-humble-dynamixel-sdk ros-humble-ros2-control ros-humble-ros2-controllers ros-humble-gripper-controllers ros-humble-moveit
```

```bash
$ cd ~/colcon_ws/src/
$ git clone -b humble-devel https://github.com/ROBOTIS-GIT/open_manipulator.git
$ cd ~/colcon_ws && colcon build --symlink-install
```
