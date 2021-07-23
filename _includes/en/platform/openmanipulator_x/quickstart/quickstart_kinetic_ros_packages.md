
The following commands will download OpenMANIPULATOR-X package source codes and build them.

1. Install dependent pacakges
```bash
$ source ~/.bashrc
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
$ sudo apt-get install ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench*
$ sudo apt-get install ros-kinetic-robotis-manipulator
```

2. Download and build OpenMANIPULATOR-X packages
```bash
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ cd ~/catkin_ws && catkin_make
```
