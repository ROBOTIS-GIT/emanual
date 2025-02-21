
1. Run roscore on the Remote PC.  
**[Remote PC]**  
  ```bash
$ roscore
  ```

2. If `Bringup` is not running on the TurtleBot3 SBC, launch Bringup.
**Skip this step if bringup is already running**.  
  - Open a new terminal on the Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **turtlebot**. Specify your TurtleBot3 model (`burger`, `waffle`, `waffle_pi`) using the `TURTLEBOT3_MODEL` parameter.
**[Remote PC]**  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Open a new terminal on the Remote PC with `Ctrl` + `Alt` + `T` and launch the SLAM node. The Gmapping is used as the default SLAM method.
Specify your TurtleBot3 model (`burger`, `waffle`, `waffle_pi`) using the `TURTLEBOT3_MODEL` parameter.
**[Remote PC]**  
  ```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_slam turtlebot3_slam.launch
  ```

<details>
<summary>
![](/assets/images/icon_unfold.png) **How to save the TURTLEBOT3_MODEL parameter?**
</summary>
The `$ export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in your system's `.bashrc` file.  
The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example defining `TurtlBot3 Burger` as the default model.  
**[Remote PC]**  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example defining `TurtlBot3 Waffle Pi` as the default model.  
**[Remote PC]**  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **other SLAM methods**
</summary>
- **Gmapping** ([ROS WIKI](http://wiki.ros.org/gmapping), [Github](https://github.com/ros-perception/slam_gmapping))
  1. Install required packages on the remote PC.  
    Packages related to Gmapping have already been installed on [PC Setup](/docs/en/platform/turtlebot3/quick-start) section.
  2. Launch the Gmapping SLAM node.  
 **[Remote PC]**  
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
  ```
- **Cartographer** ([ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer))
  1. Download and build required packages on the remote PC.  
  The Cartographer currently does not provide a binary installation method for ROS1 Noetic. Please download and build the source code as follows. Please refer to the [official wiki page](https://google-cartographer-ros.readthedocs.io/en/latest/#building-installation) for more details.  

  **[Remote PC]**  
  ```bash
  $ sudo apt update
  $ sudo apt install -y python3-wstool python3-rosdep ninja-build stow
  $ cd ~/catkin_ws/src
  $ wstool init src
  $ wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
  $ wstool update -t src
  $ sudo rosdep init
  $ rosdep update
  $ rosdep install --from-paths src --ignore-src --rosdistro=noetic -y
  $ src/cartographer/scripts/install_abseil.sh
  $ sudo apt remove ros-noetic-abseil-cpp
  $ catkin_make_isolated --install --use-ninja
  ```
  2. Launch the Cartographer SLAM node.  
**[Remote PC]**  
  ```bash
  $ source ~/catkin_ws/install_isolated/setup.bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
- **Karto** ([ROS WIKI](http://wiki.ros.org/slam_karto), [Github](https://github.com/ros-perception/slam_karto))
  1. Install dependent packages on PC.  
**[Remote PC]**   
  ```bash
  $ sudo apt install ros-noetic-slam-karto
  ```
  2. Launch the Karto SLAM node.  
**[Remote PC]**  
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto
  ```
</details>
