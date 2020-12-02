
{% capture warning_01 %}
In order to try examples in the below, you have to install the [turtlebot3_applications][turtlebot3_applications] package.

Go to `robotis workspace` directory (/home/(user_name)/robotis_ws/src) and clone the turtlebot3_applications. Then run the `colcon build` to build the new packages.

1. Open a terminal on **Remote PC**.
2. Run the following commands.
``` bash
$ cd ~/robotis_ws/src
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/robotis_ws && colcon build --symlink-install
```
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

{% capture notice_04 %}
**NOTE**:
- The `turtlebot3_automatic_parking` demo uses a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The TurtleBot3 uses this to locate the reflective tape.
- The `turtlebot3_automatic_parking` demo requires `NumPy` package.
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

**[Remote PC]** 

1. Open a terminal on **Remote PC**.
2. Install `NumPy` package using the following commands. Skip this step if `NumPy` package is already installed.
``` bash
$ sudo apt-get install python-pip3
$ sudo pip3 install -U numpy
$ sudo pip3 install --upgrade pip
```

**[TurtleBot]** 

1. Open a terminal on **TurtleBot3**.
2. Bring up basic packages to start TurtleBot3 applications using the following command.
```bash
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]** 

1. Open a terminal on **Remote PC**.
2. Launch the automatic parking file using the following commands.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_automatic_parking turtlebot3_automatic_parking.launch.py
```
  
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    <iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
