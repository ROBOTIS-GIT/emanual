### 1. Overview
`manipulator_manager` is a package to apply ROBOTIS Framework to ROBOTIS Manipulator.   
If you want to create new manager, please refer the link as below.
> Ref. : [[Creating new robot manager]]

### 2. ROS API
#### 2.1. Parameters
launch parameters

`gazebo` (bool, default: false)  
&emsp;&emsp; Select using simulation (gazebo) mode or real robot mode.  
  
`gazebo_robot_name` (string, default: "")  
&emsp;&emsp; robot name for joint_states topic name using gazebo mode.  
&emsp;&emsp; ex) If the `gazebo_robot_name` is `robotis_manipulator`, subscribing topic is  
&emsp;&emsp;&emsp; `/robotis_manipulator/joint_states`.

`offset_file_path` (string, default: "")  
&emsp;&emsp; The file path that includes joint offset information and initial pose of tuning offset.

`robot_file_path` (string, default: "")  
&emsp;&emsp; The file `.robot` 's path that includes robot information.

<br>
[&lt;&lt; Back](ROBOTIS MANIPULATOR Module)