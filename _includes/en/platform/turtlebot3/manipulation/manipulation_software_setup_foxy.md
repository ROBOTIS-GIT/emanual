
**NOTE**: TurtleBot3 Manipulation for ROS2 Foxy requires `turtlebot3_manipulation` package.  
Follow the instructions below to install the required package and its dependencies.
{: .notice--info}

**[TurtleBot3]**

1. Connect to the Raspberry Pi of the **TurtleBot3** using ssh command below. 
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_TURTLEBOT3}
  ```
2. Install packages for TurtleBot3 Manipulation.
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```

**[Remote PC]**

1. Open a terminal on **Remote PC**. 
2. Install dependent packages using the following commands.
  ```bash
  $ sudo apt install ros-foxy-dynamixel-sdk ros-foxy-ros2-control ros-foxy-ros2-controllers ros-foxy-gripper-controllers ros-foxy-moveit
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```
