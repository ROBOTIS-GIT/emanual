
The TurtleBot3 can be moved using [Interactive Markers][interactive_markers] in RViz.

**[Remote PC]** Open a new terminal and launch the remote file.

**TIP**: Before executing this command, you have to specify the model name of the TurtleBot3 variant you will be using. The `${TB3_MODEL}` variable must be set to name of the model you are using ( `burger`,` waffle`, or `waffle_pi` ). This can also be permanently set in your ROS environment configuration according to the [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} instructions.
{: .notice--success}

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
```

**[Remote PC]** launch the interactive markers file.

```bash
$ roslaunch turtlebot3_example interactive_markers.launch
```

**[Remote PC]** Visualize the model in 3D with RViz.

```bash
$ rosrun rviz rviz -d `rospack find turtlebot3_example`/rviz/turtlebot3_interactive.rviz
```
