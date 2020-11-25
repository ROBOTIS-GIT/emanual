
{% capture notice_01 %}
**NOTE**:
- This instruction was tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- This instruction is supposed to be run on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**CAUTION**: Place the robot on a level surface to ensure that it can not fall down from a table.
{: .notice--warning}

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples.
{: .notice--warning}

## [Move using Interactive Markers](#move-using-interactive-markers)

Not available yet
{: .notice}

## [Obstacle Detection](#obstacle-detection)

TurtleBot3 can moves with receiving a certain topic: **/cmd_vel_raw** from obstacle detection node. Using LDS data and detecting obstacles, the robot can stop moving.  

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Run the teleoperation keyboard.
  ``` bash
  $ ros2 run turtlebot3_teleop teleop_keyboard /cmd_vel:=/cmd_vel_raw
  ```

3. Launch the obstacle detection.
  ``` bash
  $ ros2 launch turtlebot3_example turtlebot3_obstacle_detection
  ```

## [Position Control](#position-control)

TurtleBot3 can be position controlled using this package.

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the pointop file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_position_control
  ```

3. Type input values and press enter for `x`, `y` and `theta` respectively. TurtleBot3 will move to a pose (`x`, `y`, `theta`) from the current pose.

    ``` bash
    TurtleBot3 Position Control
    ------------------------------------------------------
    From the current pose,
    x: goal position x (unit: m)
    y: goal position y (unit: m)
    theta: goal orientation (range: -180 ~ 180, unit: deg)
    ------------------------------------------------------

    Input x: 1  (input a value and press enter)
    Input y: 1  (input a value and press enter)
    Input theta: 10  (input a value and press enter)
    ```

## [Patrol](#patrol)

This example uses action topic. The action client translates patrol data(radius) to action server. Then, the action server translates `cmd_vel` to TurtleBot3. 

**[Remote PC]**

1. Open a terminal on **Remote PC**.

2. Launch the patrol server file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_server
  ```
  
3. Launch the patrol client file.
  ``` bash
  $ ros2 run turtlebot3_example turtlebot3_patrol_client
  ```

4. Type a input value and press enter. TurtleBot3 will draw a circle of the typed radius.

    ``` bash
    TurtleBot3 Circle Patrol
    ------------------------------------------------------
    radius: circle radius (unit: m)
    ------------------------------------------------------

    Input radius: 1  (input a value and press enter)
    ```

## TurtleBot Follower Demo

Not available yet
{: .notice}

## TurtleBot Panorama Demo

Not available yet
{: .notice}

## [Automatic Parking](#automatic-parking)

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

## [Automatic Parking Vision](#automatic-parking-vision)

Not available yet
{: .notice}

## [Load Multiple TurtleBot3s](#load-multiple-turtlebot3s)

Not available yet
{: .notice}
