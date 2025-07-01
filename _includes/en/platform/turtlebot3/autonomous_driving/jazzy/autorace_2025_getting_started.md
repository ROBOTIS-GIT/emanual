<!-- ## Getting Started -->
The Autorace package was developed for `Ubuntu 24.04` running `ROS 2 Jazzy JALISCO`.  

### [Prerequisites](#prerequisites)

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

<!-- ### [Setting TurtleBot3 Model](#setting-turtlebot3-model)
Add an export line to your `~/.bashrc.` Autorace only supports the *burger_cam* model.
``` bash
$ echo 'export TURTLEBOT3_MODEL=burger_cam' >> ~/.bashrc
```

### [Simulation setup (optional)](#simulation-setup)  
If you want to run Autorace in a simulation environment:  

Launch the Gazebo simulation.  
**[Remote PC]**  
``` bash
$ ros2 launch turtlebot3_gazebo turtlebot3_autorace_2025.launch.py
```
- Instructions for correct simulation setup are available in the [Simulation](/docs/en/platform/turtlebot3/simulation/) section of the manual. -->
