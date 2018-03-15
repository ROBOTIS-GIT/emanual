---
layout: archive
lang: en
ref: turtlebot3_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/applications/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 16"></div>

# [Applications](#applications)

This chapter shows some demos using Turtlebot3.
In order to implement these demos, you have to install the turtlebot3_applications package.

**Note :** Turtlebot3 has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

**[Remote PC]** Go to ROS source directory (/home/(user_name)/catkin_ws/src) and clone the turtlebot3_applications repository.

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
```

**[Remote PC]** catkin_make to install the new package.

``` bash
$ cd ~/catkin_ws && catkin_make
```

## [TurtleBot Follower Demo](#turtlebot-follower-demo)

**Note :** The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. a classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
{: .notice--info}

**Note :** Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{: .notice--info}

**[TurtleBot]** In order to run the demo, parameter in LIDAR launch file has to be modified. In the below example, Pluma is used to edit the launch file. In the param tag with frame_id as a name, replace `base_scan` to `odom` and save the file as shown in the below images.

``` bash
$ pluma ~/catkin_ws/src/turtlebot3/turtlebot3_bringup/launch/turtlebot3_lidar.launch
```

![](/assets/images/platform/turtlebot3/application/base_scan.png)


![](/assets/images/platform/turtlebot3/application/odom.png)

**Note :** Turtlebot Follower Demo requires scikit-learn, NumPy and ScyPy packages.
{: .notice--info}

**[Remote PC]** Install scikit-learn, NumPy and ScyPy packages with below commands.

``` bash
$ sudo apt-get install python-pip
$ sudo pip install -U scikit-learn numpy scipy
$ sudo pip install --upgrade pip
```

**[Remote PC]** When installation is completed, run roscore on the remote pc with below command.

``` bash
$ roscore
```

**[TurtleBot]** Launch the Turtlebot3_bringup

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**[Remote PC]** Move to turtlebot3_follower source directory

``` bash
$ cd ~/catkin_ws/src/turtlebot3_applications/turtlebot3_follower/scripts
```

**[Remote PC]** Launch turtlebot3_follow_filter with below command.

``` bash
$ roslaunch turtlebot3_follow_filter turtlebot3_follow_filter.launch
```

**[Remote PC]** Launch turtlebot3_follower with below command.

``` bash
$ rosrun turtlebot3_follower follower.py
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/w9YTxZVY6yQ" frameborder="0" allowfullscreen></iframe>


## [TurtleBot Panorama Demo Using Raspberry Pi Camera Module](#turtlebot-panorama-demo-using-raspberry-pi-camera-module)

**Note :** The turtlebot3_panorama demo uses pano_ros for taking snapshots and stitching them together to create panoramic image.
{: .notice--info}

**Note :** Panorama demo requires to install Raspicam package. Instructions for installing this package can be found at [Gihub Link](https://github.com/UbiquityRobotics/raspicam_node)
{: .notice--info}

**Note :** Panorama demo requires to install OpenCV and cvbridge packages. Instructions for installing OpenCV can be found at [OpenCV Tutorial Link](http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
{: .notice--info}

**[TurtleBot]** Launch the Raspberry Pi cam V2

``` bash
$ roslaunch raspicam_node camerav2_1280x960.launch
```

**[Remote PC]** Launch Panorama with below command.

``` bash
$ roslaunch turtlebot3_panorama panorama.launch
```

**[Remote PC]** To start the panorama demo, please enter below command.

``` bash
$ rosservice call turtlebot3_panorama/take_pano 0 360.0 30.0 0.3
```

Parameters that can be sent to the rosservice to get a panoramic image are:

- mode for taking the pictures.

    - 0 : snap&rotate (i.e. rotate, stop, snapshot, rotate, stop, snapshot, ...)  
    - 1 : continuous (i.e. keep rotating while taking snapshots)  
    - 2 : stop taking pictures and create panoramic image  

- total angle of panoramic image, in degrees
- angle interval (in degrees) when creating the panoramic image in snap&rotate mode, time interval (in seconds) otherwise
- rotating velocity (in radians/s)


**[Remote PC]** To view the result image, please enter below command.

``` bash
$ rqt_image_view image:=/turtlebot3_panorama/panorama
```

![](/assets/images/platform/turtlebot3/application/panorama_view.png)

## [Automatic parking](#automatic-parking)
**Note :** The turtlebot3_automatic_parking demo was using a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The turtlebot3 uses this to locate the reflective tape.
{: .notice--info}

**Note :** The turtlebot3_automatic_parking demo requires NumPy package.
{: .notice--info}

**[Remote PC]** Install NumPy package with below commands.

``` bash
$ sudo apt-get install python-pip
$ sudo pip install numpy
$ sudo pip install --upgrade pip
```


**[Remote PC]** Move to turtlebot3_automatic_parking source directory.
```bash
$ cd ~/catkin_ws/src/turtlebot3_applications/turtlebot3_automatic_parking/src
```

**[Remote PC]** To make it executable.
```bash
$ sudo chmod +x automatic_parking.py
```

**[Remote PC]** Run roscore.

```bash
$ roscore
```

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**[Remote PC]** If you have Turtlebot3 Burger,

```bash
$ export TURTLEBOT3_MODEL=burger
```
If you have TurtleBot3 Waffle.

```bash
$ export TURTLEBOT3_MODEL=waffle
```

**[Remote PC]** Run RViz.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
$ rosrun rviz rviz -d `rospack find turtlebot3_automatic_parking`/rviz/turtlebot3_automatic_parking.rviz
```
You can select LaserScan topic in RViz.
- /scan

![](/assets/images/platform/turtlebot3/application/scan.png)

- /scan_spot

![](/assets/images/platform/turtlebot3/application/scan_spot.png)


**[Remote PC]** Run turtlebot3_automatic_parking.py.

``` bash
$ rosrun turtlebot3_automatic_parking automatic_parking.py  
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/IRtdxoPo8Y8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
