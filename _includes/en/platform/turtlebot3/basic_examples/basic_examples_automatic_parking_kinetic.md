
<iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

{% capture notice_04 %}
**NOTE**:

- The `turtlebot3_automatic_parking` demo was using a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The TurtleBot3 uses this to locate the reflective tape.
- The `turtlebot3_automatic_parking` demo requires `NumPy` package.
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

1. **[Remote PC]** Install `NumPy` package with below commands. If you already installed numpy, you can **skip** below commands.
```bash
$ sudo apt-get install python-pip
$ sudo pip install -U numpy
$ sudo pip install --upgrade pip
```

2. **[Remote PC]** Run roscore.
```bash
$ roscore
```

3. **[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

4. **[Remote PC]** If you use TurtleBot3 Burger, set the model of TurtleBot3 like command below.
```bash
$ export TURTLEBOT3_MODEL=burger
```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

5. **[Remote PC]** Run RViz.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_automatic_parking`/rviz/turtlebot3_automatic_parking.rviz
```

6. **[Remote PC]** Launch the automatic parking file.
```bash
$ roslaunch turtlebot3_automatic_parking turtlebot3_automatic_parking.launch
```
    - You can select LaserScan topic in RViz.

    - `/scan`

    ![](/assets/images/platform/turtlebot3/application/scan.png)

    - `/scan_spot`

    ![](/assets/images/platform/turtlebot3/application/scan_spot.png)
