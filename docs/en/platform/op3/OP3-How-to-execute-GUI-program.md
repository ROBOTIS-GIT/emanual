### 1. Overview   
The GUI program provides various functions for ROBOTIS-OP3.
- Take OP3 to the initial posture
- Configure various modules in the OP3  
- Save and edit walking parameters  
- Control the head joint of the OP3  
- Play action files in the OP3  

> Reference : [op3_gui_demo]

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_diagram.png?raw=true" align="bottom" width="70%"/>

### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  

#### 2.2 Run the program
There are three options to run the GUI program.
1. Connect input devices and display device directly to ROBOTIS-OP3 and run the GUI program on the robot.  
2. Use VNC from a remote PC to obtain control over the OP3 SBC(Intel NUC) and initiate the GUI program remotely.  
3. Run the GUI program on a remote PC in the same ROS network with ROBOTIS-OP3.  
Open the terminal window and enter the following command.
`op3_manager` should be running before executing GUI demo program.

```
$ roslaunch op3_gui_demo op3_demo.launch
```  
  > Reference : [How to run op3_mamager]

#### 2.3 Execution result
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui.png?raw=true" align="bottom"/>




### 3. Description
#### 3.1 How to take the initial pose of ROBOTIS-OP3
Clicking the button surrounded by the red dashed rectangle will let the `base_module` control each joint of ROBOTIS-OP3 and take the initial posture.

<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_initial_pose.png?raw=true" align="bottom"/>

#### 3.2 How to set the Module
- Follow the below procedure to configure modules that control corresponding joint of ROBOTIS-OP3.  
  1. Click the module button to configure.  
    - `none`  
    - `head_control_module`  
    - `action_module`  
    - `walking_module`  

  2. Confirm from the joint status table below the module buttons that corresponding joints are set correctly.  

    <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_set_module.png?raw=true" align="bottom"/>  

- `Get Mode` button will report which module is assigned for each joint.  

  <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_get_module.png?raw=true" align="bottom"/>  

#### 3.3 [How to use the Walking Tuner]
This section explains how to configure and tune walking parameters.
Saved parameters are used in the basic demo.  


#### 3.4 [How to control head joints]
This section explains how to control the head joint of ROBOTIS-OP3.  



#### 3.5 [How to play the motions]
This section explains how to play pre-defined actions.  

#### 3.6 [How to control upgraded walking(online walking)]
This section explains how to control upgraded walking(download/run/test).


[&lt;&lt; Back](OP3-User's-Guide.md)

[op3_gui_demo]:[op3_gui_demo.md]
[How to run op3_mamager]:[OP3-How-to-run-OP3's-program.md]
[How to use the Walking Tuner]:[OP3-How-to-use-walking-tuner.md]
[How to control head joints]:[OP3-How-to-control-the-head-joints.md]
[How to play the motions]:[OP3-How-to-play-the-motions.md]
[How to control upgraded walking(online walking)]:[OP3-How-to-control-upgraded-walking.md]
