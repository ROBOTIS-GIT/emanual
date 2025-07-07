## Option 1: Using Docker

{% capture notice_01 %}
**NOTE**: 
If you are using the Docker environment, make sure you are inside the container before running these commands. Use `./docker/container.sh enter` to enter the container.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Open a terminal and enter below command.  
```bash
$ ros2 run open_manipulator_teleop omx_teleop
```

## Option 2: Host Installation

Open a terminal and enter below command.  
```bash
$ ros2 run open_manipulator_teleop omx_teleop
```

You will see the interface below in the terminal window after a successful launch, and you can now easily control the OMX using the keyboard.

```
[INFO] [1751512149.624709736] [keyboard_controller]: Waiting for /joint_states...
[INFO] [1751512149.625639191] [keyboard_controller]: Waiting for initial joint states...
[INFO] [1751512149.626929914] [keyboard_controller]: Received joint states: [-0.05982525065917969, -0.9157865293212891, 0.8517752421836835, 0.0], Gripper: 0.0
[INFO] [1751512149.627527555] [keyboard_controller]: Ready to receive keyboard input!
[INFO] [1751512149.628048894] [keyboard_controller]: Use 1/q, 2/w, 3/e, 4/r for joints 1-4, o/p for gripper. Press ESC to exit.
``` 