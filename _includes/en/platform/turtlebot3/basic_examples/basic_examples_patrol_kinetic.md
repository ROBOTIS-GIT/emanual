The TurtleBot3 can be moved by custom routes. There are three routes(rectangle, triangle and circle). This example uses action topic. Action client translates patrol data(mode, area, count) to action server. And then action server translates `cmd_vel` to TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.

**[Remote PC]** Launch the patrol server file.

```bash
$ rosrun turtlebot3_example turtlebot3_server
```

**[Remote PC]** Launch the patrol client file.

```bash
$ roslaunch turtlebot3_example turtlebot3_client.launch
```
