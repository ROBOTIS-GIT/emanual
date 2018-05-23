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

**NOTE** : Turtlebot3 has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

`Tip` The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
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

**NOTE** : The follower demo was implemented only using a 360 Laser Distance Sensor LDS-01. a classification algorithm is used based on previous fitting with samples of person and obstacles positions to take actions. It follows someone in front of the robot within a 50 centimeter range and 140 degrees.
{: .notice--info}

**NOTE** : Running the follower demo in an area with obstacles may not work well. Therefore, it is recommended to run the demo in an open area without obstacles.
{: .notice--info}

**[TurtleBot]** In order to run the demo, parameter in LIDAR launch file has to be modified. In the below example, Pluma is used to edit the launch file. In the param tag with frame_id as a name, replace `base_scan` to `odom` and save the file as shown in the below images.

``` bash
$ pluma ~/catkin_ws/src/turtlebot3/turtlebot3_bringup/launch/turtlebot3_lidar.launch
```

![](/assets/images/platform/turtlebot3/application/base_scan.png)


![](/assets/images/platform/turtlebot3/application/odom.png)

**NOTE** : Turtlebot Follower Demo requires scikit-learn, NumPy and ScyPy packages.
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

**NOTE** : The turtlebot3_panorama demo uses pano_ros for taking snapshots and stitching them together to create panoramic image.
{: .notice--info}

**NOTE** : Panorama demo requires to install Raspicam package. Instructions for installing this package can be found at [Gihub Link](https://github.com/UbiquityRobotics/raspicam_node)
{: .notice--info}

**NOTE** : Panorama demo requires to install OpenCV and cvbridge packages. Instructions for installing OpenCV can be found at [OpenCV Tutorial Link](http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
{: .notice--info}

**[TurtleBot]** Launch the Raspberry Pi cam V2

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
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

## [Automatic Parking](#automatic-parking)
**NOTE** : The turtlebot3_automatic_parking demo was using a 360 laser Distance Sensor LDS-01 and a reflective tape. The LaserScan topic has intensity and distance data from LDS. The turtlebot3 uses this to locate the reflective tape.
{: .notice--info}

**NOTE** : The turtlebot3_automatic_parking demo requires NumPy package.
{: .notice--info}

**[Remote PC]** Install NumPy package with below commands.

``` bash
$ sudo apt-get install python-pip
$ sudo pip install numpy
$ sudo pip install --upgrade pip
```


**[Remote PC]** Move to turtlebot3_automatic_parking source directory.
```bash
$ cd ~/catkin_ws/src/turtlebot3_applications/turtlebot3_automatic_parking/scripts
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

/images/platform/turtlebot3/application/panorama_view.png)

## [Automatic Parking Vision](#automatic-parking-vision)
**NOTE** : The turtlebot3_automatic_parking_vision uses raspberry pi camera and so the robot which is a default platform used for this demo is TurtleBot3 Waffle Pi. Since it parks from finding out AR marker on some wall, printed AR marker should be prepared. Whole process uses the image get from the camera, so if the process is not well being done, configure the parameters, such as brightness, contrast, etc.
{: .notice--info}

**NOTE** : The turtlebot3_automatic_parking_vision uses rectified image based on image_proc nodes. To get rectified image, the robot should get optic calibration data for raspberry pi camera. (Every downloaded turtlebot3 packages already have the camera calibration data as raspberry pi camera v2 default.)
{: .notice--info}

**NOTE** : The turtlebot3_automatic_parking_vision package requires ar_track_alvar package.
{: .notice--info}

**[Remote PC]** Install ar_track_alvar package by following commands.

``` bash
$ sudo apt-get install ros-kinetic-ar-track-alvar
$ sudo apt-get install ros-kinetic-ar-track-alvar-msgs
```

**[Remote PC]** Move to turtlebot3_automatic_parking source directory.
```bash
$ cd ~/catkin_ws/src/turtlebot3_applications/turtlebot3_automatic_parking_vision/nodes
```

**[Remote PC]** To make it executable.
```bash
$ sudo chmod +x automatic_parking_vision.py
```

**[Remote PC]** Run roscore.

```bash
$ roscore
```

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**[TurtleBot]** Start the raspberry pi camera nodes.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```



**[Remote PC]** Raspberry pi package will publish compressed type image for fast communication. However, what will be needed in image rectification in image_proc node is raw type image. Hence, compressed image should be transform to raw image.

```bash
$ rosrun image_transport republish compressed in:=raspicam_node/image raw out:=raspicam_node/image
```

**[Remote PC]** Then, the image rectification should be carried out.

```bash
$ ROS_NAMESPACE=raspicam_node rosrun image_proc image_proc image_raw:=image _approximate_s=true _queue_size:=20
```

**[Remote PC]** Now should start the AR marker detection. Before running related launch file, the model of what will be used by this example code should be exported. After running the launch file, RViz will be automatically run under preset environments.

```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_automatic_parking_vision turtlebot3_automatic_parking_vision.launch
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/dvpWdrD3bVs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
