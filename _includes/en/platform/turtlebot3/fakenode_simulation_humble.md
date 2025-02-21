
<iframe width="640" height="360" src="https://www.youtube.com/embed/iHXZSLBJHMg" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual are subject to change without prior notice. Video content may differ from the content in the e-Manual.
{: .notice--warning}

To use a virtual TurtleBot3, execute `turtlebot3_fake_node.launch.py` in a `turtlebot3_fake_node` package that is simple simulation node.
Follow the instructions to bring TurtleBot3 into the virtual world using Fake Node.

1. Execute `turtlebot3_fake_node.launch.py` file.  
Specify your TurtleBot3 model (`burger`, `waffle`, `waffle_pi`) using the `TURTLEBOT3_MODEL` parameter.
  ``` bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_fake_node turtlebot3_fake_node.launch.py
  ```

2. You can control the virtual TurtleBot3 by using [Teleoperation](/docs/en/platform/turtlebot3/basic_operation/#teleoperation)
  ``` bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 run turtlebot3_teleop teleop_keyboard
  ```
