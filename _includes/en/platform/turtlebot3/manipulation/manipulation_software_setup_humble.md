
**NOTE**: TurtleBot3 Manipulation for ROS2 Humble requires `turtlebot3_manipulation` package.  
Follow the instructions below to install the required package and its dependencies.
{: .notice--info}

{% capture notice_02 %}  
**The TurtleBot3 Simulation Package requires turtlebot3 and turtlebot3_msgs packages as prerequisite. Without these prerequisite packages, the TurtleBot3 Manipulator cannot be launched. Please follow [Quick Start Guide](/docs/en/platform/turtlebot3/quick-start) instructions if you did not install required packages and dependent packages.**  
{% endcapture %}
<div class="notice--danger">{{ notice_02 | markdownify }}</div>

1. Connect to the **TurtleBot3 SBC** using ssh command below.   
**[Remote PC]**  
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_TURTLEBOT3}
  ```
2. Install packages for TurtleBot3 Manipulation.  
**[TurtleBot3 SBC]**  
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```


1. Open a terminal on **Remote PC**. 
2. Install dependent packages using the following commands.  
**[Remote PC]**  
  ```bash
  $ sudo apt install ros-humble-dynamixel-sdk ros-humble-ros2-control ros-humble-ros2-controllers ros-humble-gripper-controllers ros-humble-moveit ros-humble-moveit-servo
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```
