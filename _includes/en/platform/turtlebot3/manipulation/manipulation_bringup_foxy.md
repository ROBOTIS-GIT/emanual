**[TurtleBot3]** 

In order to run a TurtleBot3 Manipulation simulation using Gazebo, please skip to [Simulation](#simulation) section.
{: .notice--warning}

The following command will bringup the actual TurtleBot3 hardware with OpenMANIPULATOR-X on it.

1. Open a terminal from the **TurtleBot3 SBC**. 
2. Bring up the TurtleBot3 Manipulation using the following command.
  ```bash
  $ ros2 launch turtlebot3_manipulation_bringup hardware.launch.py
  ```

{% capture notice_01 %}
**DANGER**

**Please be aware of pinching your body between the robot joints!!!**

When the Turtlebot3 Manipulation bringup launches, **the OpenMANIPULATOR-X will move to the initial pose**.  
It is recommended to set the OpenMANIPULATOR-X as a similar pose as shown below image to avoid any physical damage during the initial pose.

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)
{% endcapture %}

<div class="notice--danger">{{ notice_01 | markdownify }}</div>