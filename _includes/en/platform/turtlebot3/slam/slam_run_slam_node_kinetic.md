
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
<summary>
![](/assets/images/icon_unfold.png) **How to save the TURTLEBOT3_MODEL parameter?**
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
<summary>
![](/assets/images/icon_unfold.png) Read more about **other SLAM methods**
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
  The Cartographer package developed by Google supports ROS1 Kinetic with 0.2.0 version. So if you need to use Cartogrpher on Kinetic, you should download and build the source code as follows instead of installing with the binary packages. Please refer to [official wiki page](https://google-cartographer-ros.readthedocs.io/en/latest/#building-installation) for more detailed installation instructions.
  ```bash
  $ sudo apt-get install ninja-build libceres-dev libprotobuf-dev protobuf-compiler libprotoc-dev
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/googlecartographer/cartographer.git
  $ git clone https://github.com/googlecartographer/cartographer_ros.git
  $ cd ~/catkin_ws
  $ src/cartographer/scripts/install_proto3.sh
  $ rm -rf protobuf/
  $ rosdep install --from-paths src --ignore-src -r -y --os=ubuntu:xenial
  $ catkin_make_isolated --install --use-ninja
  ```
  2. Launch the Cartographer SLAM node.
  ```bash
  $ source ~/catkin_ws/install_isolated/setup.bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
- **Hector** ([ROS WIKI](http://wiki.ros.org/hector_slam), [Github](https://github.com/tu-darmstadt-ros-pkg/hector_slam))
  1. Install dependent packages on PC.
  ```bash
  $ sudo apt-get install ros-kinetic-hector-mapping
  ```
  2. Launch the Hector SLAM node.
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=hector
  ```
- **Karto** ([ROS WIKI](http://wiki.ros.org/slam_karto), [Github](https://github.com/ros-perception/slam_karto))
  1. Install dependent packages on PC.
  ```bash
  $ sudo apt-get install ros-kinetic-slam-karto
  ```
  2. Launch the Karto SLAM node.
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto
  ```
- **Frontier Exploration** ([ROS WIKI](http://wiki.ros.org/frontier_exploration), [Github](https://github.com/paulbovbel/frontier_exploration))  
  Frontier Exploration uses gmapping, and the following packages should be installed.  
  1. Install dependent packages on PC.
  ```bash
  $ sudo apt-get install ros-kinetic-frontier-exploration ros-kinetic-navigation-stage
  ```
  2. Launch the Frontier Exploration SLAM node.
  ```bash
  $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=frontier_exploration
  ```  
</details>
