
## [Basic Operation](#basic-operation)

### [Teleoperation](#teleoperation)

**WARNING**: Make sure to run the [Bringup][bringup] from the TurtleBot3 SBC before teleoperation. Teleoperate the robot, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

The TurtleBot3 can be teleoperated by various devices. It is tested with several wireless devices such as PS3, XBOX 360, ROBOTIS RC100 and etc. This examples shown here(except the LEAP Motion) can be launched by ROS on Ubuntu mate 16.04 with Raspberry Pi 3 and OpenCR which controls DYNAMIXEL.

<iframe width="640" height="360" src="https://www.youtube.com/embed/Z4s18hlazb4" frameborder="0" allowfullscreen></iframe>

#### [Keyboard](#keyboard)

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

1. Launch `turtlebot3_teleop_key` node from Remote PC for the teleoperation using a keyboard. Replace the `${TB3_MODEL}` parameter with your model name such as `burger`, `waffle`, `waffle_pi`.  

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Read more about How to predefine the TURTLEBOT3_MODEL**
{: .notice--success}
</summary>
The `export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in the `.bashrc` file. The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example of defining TurtlBot3 Burger as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example of defining TurtlBot3 Waffle Pi as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

### [Topic Monitor](#topic-monitor)

- [Topic Monitor][topic_monitor]: Display all the topics of TurtleBot3 using Topic Monitor plugin of RQT.



### [Basic Examples](#basic-examples)

- [Basic Examples][basic_examples]: It contains various basic examples such as the following.
  - Move using Interative Marker on RViz
  - Move and Stop using LDS
  - Move to goal position
  - Move to custom routes

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

### [Additional Sensors](#additional-sensors)

- [Additional Sensors][additional_sensors]: Let's use IR sensor, ultrasonic sensor, switch, etc. in OpenCR of TurtleBot3.

[topic_monitor]: /docs/en/platform/turtlebot3/topic_monitor/
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/
[basic_examples]: /docs/en/platform/turtlebot3/basic_examples/
[additional_sensors]: /docs/en/platform/turtlebot3/additional_sensors/
