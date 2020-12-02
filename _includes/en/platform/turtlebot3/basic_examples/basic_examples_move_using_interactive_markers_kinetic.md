
The TurtleBot3 can be moved by [Interactive Markers][interactive_markers] on RViz. You can move the TurtleBot3 to rotate or linear using Interactive Markers.

**[Remote PC]** Open a new terminal and launch the remote file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`,` waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
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
