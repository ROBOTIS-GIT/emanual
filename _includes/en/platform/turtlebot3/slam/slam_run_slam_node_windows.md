
1. If `roscore` is not running, run roscore. **Skip this step if roscore is already running**.
  ```bash
> roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Open a new terminal from Remote PC and launch the SLAM node. The Gmapping is used as a default SLAM method.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **other SLAM methods**
{: .notice--success}
</summary>
- **Cartographer** ([ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer))
  1. Install dependent packages on PC using choco.  
  ```bash
  > choco upgrade ros-melodic-cartographer_ros -y
  ```
  2. Launch the Cartographer SLAM node.
  ```bash
  > c:\ws\turtlebot3\devel\setup.bat
  > set TURTLEBOT3_MODEL=${TB3_MODEL}
  > roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
</details>
