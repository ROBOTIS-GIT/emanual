
<!-- #### [Intersection](#intersection) -->

Intersection is the second mission of AutoRace. TurtleBot3 must detect the directional sign at the intersection, and proceed to the directed path.

<iframe width="560" height="315" src="https://www.youtube.com/embed/F101PDx20nc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

##### [How to Run Intersection Mission](#how-to-run-intersection-mission)

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the keyboard teleoperation node.  
Drive the TurtleBot3 along the lane and stop before the intersection traffic sign.
```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

5. Open a new terminal and launch the autorace core node with a specific mission name.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch mission:=intersection
```

6. Open a new terminal and launch the Gazebo mission node.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

7. Open a new terminal and enter the command below. This will prepare to run the intersection mission by setting the `decided_mode` to `2`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
