---
layout: popup
---

# How to set smoothing filter into joint trajectory

## Download the **ROS-INDUSTRIAL CORE** package  

```
$ git clone https://github.com/ros-industrial/industrial_core.git
```

## Check ‘industrial_trajectory_filters’ in downloaded ros-industrial package  

```
$ cd ~/catkin_ws/src/industrial_core/industrial_trajectory_filters/
```

## Copy ***planning_request_adapters_plugin_description.xml***, ***src*** and ***include*** folders in the ***industrial_trajectory_filters*** folder and paste it into the moveit package you created earlier  

```
$ cp -r planning_request_adapters_plugin_description.xml src include ~/catkin_ws/src/$(YOUR_MOVEIT_CONFIGURATION_PACKAGE)/
```

## Create ‘smoothing_filter_params.yaml’ in the config folder and specify the coefficient  

```
$ cd ~/catkin_ws/src/$(YOUR_MOVEIT_CONFIGURATION_PACKAGE)/config
$ gedit smoothing_filter_params.yaml
```

Copy and Paste below texts

```
smoothing_filter_name: /move_group/smoothing_5_coef  
smoothing_5_coef:  
- 0.25  
- 0.50  
- 1.00  
- 0.50  
- 0.25  
```


## Open ***ompl_planning_pipeline.launch.xml*** in the launch folder and add the following filter  to planning_adapters    

```
$ cd ~/catkin_ws/src/$(YOUR_MOVEIT_CONFIGURATION_PACKAGE)/launch
$ gedit ompl_planning_pipeline.launch.xml
```

Copy and Paste below texts

```
industrial_trajectory_filters/UniformSampleFilter   
industrial_trajectory_filters/AddSmoothingFilter   
```
        

## Add the following parameters to the same file.   

```
<param name="sample_duration" value="0.030" />  
<rosparam command="load" file="$(YOUR_MOVEIT_CONFIGURATION_PACKAGE)veit)/config/smoothing_filter_params.yaml"/>  
```

## The contents of the launch file when you insert contents 5 and 6 are shown in the following example.

```
<launch>
<!-- OMPL Plugin for MoveIt! -->
<arg name="planning_plugin" value="ompl_interface/OMPLPlanner" />
<!-- The request adapters (plugins) used when planning with OMPL.
ORDER MATTERS -->
<arg name="planning_adapters" value="
industrial_trajectory_filters/UniformSampleFilter
industrial_trajectory_filters/AddSmoothingFilter
default_planner_request_adapters/AddTimeParameterization
default_planner_request_adapters/FixWorkspaceBounds
default_planner_request_adapters/FixStartStateBounds
default_planner_request_adapters/FixStartStateCollision
default_planner_request_adapters/FixStartStatePathConstraints" />

<arg name="start_state_max_bounds_error" value="0.1" />

<param name="planning_plugin" value="$(arg planning_plugin)" />
<param name="request_adapters" value="$(arg planning_adapters)" />
<param name="start_state_max_bounds_error" value="$(arg start_state_max_bounds_error)" />

<param name="sample_duration" value="0.030" />

<rosparam command="load" file="$($(YOUR_MOVEIT_CONFIGURATION_PACKAGE))/config/ompl_planning.yaml"/>
<rosparam command="load" file="$($(YOUR_MOVEIT_CONFIGURATION_PACKAGE))/config/smoothing_filter_params.yaml"/>

</launch>    
```   
