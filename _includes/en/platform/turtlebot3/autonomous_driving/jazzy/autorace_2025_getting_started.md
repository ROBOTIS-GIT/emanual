### [Prerequisites](#prerequisites)
The Autorace package was developed for `Ubuntu 24.04` running `ROS 2 Jazzy JALISCO`.  
`Remote PC`/`TurtleBot3 SBC`
- Ubuntu 24.04 installed  
- ROS 2 Jazzy installed  

### [Install Autorace Packages](#install-autorace-packages)

1. Clone the AutoRace repository.  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
$ rosdep install --from-paths . --ignore-src -r -y
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

2. Install additional dependent packages.  
```bash
$ sudo apt install ros-jazzy-image-transport ros-jazzy-cv-bridge ros-jazzy-vision-opencv python3-opencv libopencv-dev ros-jazzy-image-pipeline
```
