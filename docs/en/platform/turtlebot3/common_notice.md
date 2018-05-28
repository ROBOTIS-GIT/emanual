**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

**TIP**: It is recommended to use a joystick pad instead of the keyboard for easier control. For more information on remote control, Please refer to [Teleoperation][teleoperation] page.
{: .notice--success}

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}


[Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup}

[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/#teleoperation
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
