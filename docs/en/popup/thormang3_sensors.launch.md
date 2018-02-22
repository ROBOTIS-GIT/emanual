---
layout: popup
---
```c
<?xml version="1.0"?>

<launch>
    <arg name="use_realsense" default="true" />
    <arg name="use_lidar" default="true" />
    <arg name="use_web_camera" default="true" />  

    <include file="$(find thormang3_sensors)/launch/thormang3_pointcloud.launch" if="$(arg use_lidar)"/>
    <include file="$(find thormang3_sensors)/launch/thormang3_realsense.launch" if="$(arg use_realsense)"/>
    <include file="$(find thormang3_sensors)/launch/thormang3_web_cam.launch" if="$(arg use_web_camera)"/>

</launch>
```
