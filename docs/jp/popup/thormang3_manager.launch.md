---
layout: popup
---

```c
<?xml version="1.0" ?>

<launch>    
    <arg name="use_imu" default="true"/>
    <arg name="use_lidar" default="true" />  

    <param name="gazebo"                   value="false"    type="bool"/>
    <param name="gazebo_robot_name"        value="thormang3"/>

    <param name="offset_file_path"         value="$(find thormang3_manager)/config/offset.yaml"/>
    <param name="robot_file_path"          value="$(find thormang3_manager)/config/THORMANG3.robot"/>
    <param name="init_file_path"           value="$(find thormang3_manager)/config/dxl_init.yaml"/>

    <param name="ft_data_path"             value="$(find thormang3_manager)/config/ft_data.yaml"/>
    <param name="ft_calibration_data_path" value="$(find thormang3_manager)/config/ft_calibration_data.yaml"/>

    <param name="action_file_path"         value="$(find thormang3_action_module)/data/motion_4096.bin"/>

    <!-- imu sensor package -->
    <include file="$(find thormang3_imu_3dm_gx4)/launch/imu.launch" if="$(arg use_imu)"/>

    <!-- lidar -->    
    <include file="$(find thormang3_description)/launch/thor_laserscan.launch" if="$(arg use_lidar)"/>

    <!-- THORMANG3 Manager -->
    <node name="thormang3_manager" pkg="thormang3_manager" type="thormang3_manager" output="screen"/>

    <!-- Robot Model & TF -->
    <include file="$(find thormang3_description)/launch/thormang3_mpc.launch"/>
</launch>
```
