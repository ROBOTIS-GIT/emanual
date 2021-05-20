
1. If the `Bringup` is not running on the TurtleBot3, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

2. Open a new terminal from Remote PC and launch the SLAM node. The Gmapping is used as a default SLAM method.
  Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```bash
> set TURTLEBOT3_MODEL=waffle
> roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
  ```

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **other SLAM methods**
</summary>
- **Cartographer** ([ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer))
  1. Install dependent packages on PC using choco.  
  ```bash
  > choco upgrade ros-melodic-cartographer_ros -y
  ```
  2. Launch the Cartographer SLAM node.  
  Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  
  ```
  > c:\ws\turtlebot3\devel\setup.bat
  > set TURTLEBOT3_MODEL=waffle
  > roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
</details>
