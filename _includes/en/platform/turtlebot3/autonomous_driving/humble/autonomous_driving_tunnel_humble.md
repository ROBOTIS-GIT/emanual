
<!-- #### [Tunnel](#tunnel) -->

This section describes how to complete the tunnel mission. The TurtleBot must use maps and navigation to proceed through obstacle areas with no lanes.

<iframe width="640" height="360" src="https://www.youtube.com/embed/pPS3tM90gAc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


##### [How to Run Tunnel Mission](#how-to-run-tunnel-mission)

**NOTE**: Change the navigation parameters in the **turtlebot3/turtlebot3_navigation2/param/buger_cam** file. If you slam and make a new map, Place the new map in the turtlebot3_autorace package at **/turtlebot3_autorace/turtlebot3_autorace_tunnel/map/**.
{: .notice}

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch the Autorace Gazebo simulation.
```bash
$ ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

3. Open a new terminal and launch the tunnel mission node. This node runs the navigation and specifies the initial and target locations.
```bash
$ ros2 launch turtlebot3_autorace_tunnel mission_tunnel.launch.py
```
4. On the Rviz2 screen, you can watch the TurtleBot generate and follow a path in real-time.

<img src='/assets/images/platform/turtlebot3/autonomous_driving/humble_tunnel_rviz.png' width='600'>

##### [Set Initial Position and Goal Position](#set-initial-position-and-goal-position)

You can modify the initial position and goal position to fit your plan.

1. Open the `navigation.yaml` file located at ***turtlebot3_autorace_mission/param/***.
```bash
$ gedit ~/turtlebot3_ws/src/turtlebot3_autorace/turtlebot3_autorace_mission/param/navigation.yaml
```
<img src='/assets/images/platform/turtlebot3/autonomous_driving/humble_tunnel_yaml.png'>
1. Write modified values and save the file.
