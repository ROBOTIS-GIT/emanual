{% capture notice_01 %}
**NOTE**:
- The `open_manipulator_perceptions` package requires [`ar_track_alvar`](http://wiki.ros.org/ar_track_alvar) package.
- Make sure to run the [Openmanipulator controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

1. If you use the `ar_track_alvar` package to recognize the ar marker, print out the ar marker [here](http://wiki.ros.org/ar_track_alvar).

2. Install AR Marker Packages on Remote PC.
``` bash
$ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs ros-kinetic-image-proc
```

3. Clone the relevant package from Git, and build. 
``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
$ cd ~/catkin_ws && catkin_make
```

#### [Run AR Marker with a Camera in Use](run-ar-marker-with-a-camera-in-use)

In order to use AR Marker properly with your camera, be sure to add the camera model to the launch command when using AR Marker.  

See the following section and use the provided command to enable AR Marker feature with your camera.

##### [AR Marker With Astra Pro](#with-astra-pro)

1. Install [Astra Pro ROS package](#astra-pro).

2. Run AR Marker with the camera model in use, astra_pro.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=astra_pro
```

##### [AR Marker With Realsense D435](with-realsense-d435)

1. Install [Realsense D435 ROS package](#realsense-d435).

2. Run AR Marker with the camera model in use, realsense_d435.
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435
```

##### [AR Marker With Raspberry Pi Camera V2](with-raspberry-pi-camera-v2)

1. Install [Raspberry Pi Camera V2 ROS package](#raspberry-pi-camera-v2).

2. **[Raspberry Pi]** Run a Raspberry Pi camera. 
``` bash
$ roslaunch open_manipulator_camera raspicam.launch
```

3. **[Remote PC]** Run AR Marker with the camera model in use, raspicam
``` bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam
```

#### AR Marker displayed on RViz 
When the camera recognizes the object with the AR marker, the pose of the AR marker will be displated on a RViz screen.  

![](/assets/images/platform/openmanipulator_x/OpenManipulator_AR_Marker.png)