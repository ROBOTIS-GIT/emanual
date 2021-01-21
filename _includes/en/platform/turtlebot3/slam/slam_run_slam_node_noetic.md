
1. Run roscore from Remote PC.
  ```bash
$ roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **turtlebot**.  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and launch the SLAM node. The Gmapping is used as a default SLAM method.
  Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_slam turtlebot3_slam.launch
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **How to save the TURTLEBOT3_MODEL parameter?**
{: .notice--success}
</summary>
The `$ export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in the `.bashrc` file.  
The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example of defining `TurtlBot3 Burger` as a default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example of defining `TurtlBot3 Waffle Pi` as a default model.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **other SLAM methods**
{: .notice--success}
</summary>
- **Gmapping** ([ROS WIKI](http://wiki.ros.org/gmapping), [Github](https://github.com/ros-perception/slam_gmapping))
  1. Install dependent packages on PC.  
    Packages related to Gmapping have already been installed on [PC Setup](/docs/en/platform/turtlebot3/quick-start) section.
  2. Launch the Gmapping SLAM node.
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
  ```
- **Cartographer** ([ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer))
  1. Download and build packages on PC.  
  The Cartographer currently does not provide the binary installation method for ROS1 Noetic. Please download and build the source code as follows. Please refer to [official wiki page](https://google-cartographer-ros.readthedocs.io/en/latest/#building-installation) for more details.
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
  ```bash
  $ source ~/catkin_ws/install_isolated/setup.bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
- **Karto** ([ROS WIKI](http://wiki.ros.org/slam_karto), [Github](https://github.com/ros-perception/slam_karto))
  1. Install dependent packages on PC.
  ```bash
  $ sudo apt install ros-noetic-slam-karto
  ```
  2. Launch the Karto SLAM node.
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto
  ```
</details>
