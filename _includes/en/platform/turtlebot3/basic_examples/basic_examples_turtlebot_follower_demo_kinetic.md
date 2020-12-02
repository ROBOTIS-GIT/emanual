
{% capture warning_01 %}
In order to try examples in the below, you have to install the [turtlebot3_applications][turtlebot3_applications] and [turtlebot3_applications_msgs][turtlebot3_applications_msgs] packages.

**[Remote PC]** Go to `catkin workspace` directory (/home/(user_name)/catkin_ws/src) and clone the turtlebot3_applications and turtlebot3_applications_msgs repository. Then run the `catkin_make` to build the new packages.

```bash
$ sudo apt-get install ros-kinetic-ar-track-alvar
$ sudo apt-get install ros-kinetic-ar-track-alvar-msgs
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs.git
$ cd ~/catkin_ws && catkin_make
```
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/w9YTxZVY6yQ" frameborder="0" allowfullscreen></iframe>

{% capture notice_02 %}
**NOTE**:

- The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. A classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
- Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

1. **[Remote PC]** Install `scikit-learn`, `NumPy` and `ScyPy` packages.
```bash
$ sudo apt-get install python-pip
$ sudo pip install -U scikit-learn numpy scipy
$ sudo pip install --upgrade pip
```

2. **[Remote PC]** When installation is completed, run roscore on the remote pc.
```bash
$ roscore
```

3. **[TurtleBot]** Launch the [Bringup][bringup] package.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

4. **[Remote PC]** Set the enviroment variable for the TurtleBot3 Burger and launch `turtlebot3_follow_filter`.
```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_follow_filter turtlebot3_follow_filter.launch
```

5. **[Remote PC]** Launch `turtlebot3_follower`.
```bash
$ roslaunch turtlebot3_follower turtlebot3_follower.launch
```
