### 1. Overview   
This chapter explains how to run the `op3_manager` that controls ROBOTIS-OP3.  
Several modules are controlling ROBOTIS-OP3 and various topics and services transmit commands and report status.  
The `op3_manager` cooperates with other programs such as `op3_demo` and `op3_gui_demo`.  

> Reference : [op3_manager](op3_manager)

#### 1.1 Diagram
[diagram image]  



### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages)  


#### 2.2 Run
Acquire root permission and execute the launch file.  
Type below commands in the terminal window.  
_(password : 111111)_  
```
$ sudo bash
[sudo] password for robotis: 111111
# roslaunch op3_manager op3_manager.launch
```  

#### 2.3 Execution result
When `op3_manager` runs, robot moves to initial posture.  

1. execution result screen  
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_manager_01.png?raw=true" width="100%" />  

2. execution result of ROBOTIS-OP3  
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_manager_02.png?raw=true" width="50%" />  



### 3. Description
This section explains configuration files used in `op3_manager`.  

#### 3.1 Robot file(`.robot`)  
Information of the robot to operate.  
Control frequency, communication interface, baud rate, available devices and their properties are defined.  

- Default path of Robot File : `op3_manager/config/OP3.robot`

- Contents
  ```
  [ control info ]
   control_cycle = 8   # milliseconds

   [ port info ]
   # PORT NAME  | BAUDRATE  | DEFAULT JOINT
   /dev/U2D2    | 2000000   | r_sho_pitch

   [ device info ]
   # TYPE    | PORT NAME    | ID  | MODEL          | PROTOCOL | DEV NAME       | BULK READ ITEMS
   dynamixel | /dev/U2D2    | 1   | XM-430         | 2.0      | r_sho_pitch    | present_position
   dynamixel | /dev/U2D2    | 2   | XM-430         | 2.0      | l_sho_pitch    | present_position
   dynamixel | /dev/U2D2    | 3   | XM-430         | 2.0      | r_sho_roll     | present_position
   dynamixel | /dev/U2D2    | 4   | XM-430         | 2.0      | l_sho_roll     | present_position
   dynamixel | /dev/U2D2    | 5   | XM-430         | 2.0      | r_el           | present_position
   dynamixel | /dev/U2D2    | 6   | XM-430         | 2.0      | l_el           | present_position
   dynamixel | /dev/U2D2    | 7   | XM-430         | 2.0      | r_hip_yaw      | present_position
   dynamixel | /dev/U2D2    | 8   | XM-430         | 2.0      | l_hip_yaw      | present_position
   dynamixel | /dev/U2D2    | 9   | XM-430         | 2.0      | r_hip_roll     | present_position
   dynamixel | /dev/U2D2    | 10  | XM-430         | 2.0      | l_hip_roll     | present_position
   dynamixel | /dev/U2D2    | 11  | XM-430         | 2.0      | r_hip_pitch    | present_position
   dynamixel | /dev/U2D2    | 12  | XM-430         | 2.0      | l_hip_pitch    | present_position
   dynamixel | /dev/U2D2    | 13  | XM-430         | 2.0      | r_knee         | present_position
   dynamixel | /dev/U2D2    | 14  | XM-430         | 2.0      | l_knee         | present_position
   dynamixel | /dev/U2D2    | 15  | XM-430         | 2.0      | r_ank_pitch    | present_position
   dynamixel | /dev/U2D2    | 16  | XM-430         | 2.0      | l_ank_pitch    | present_position
   dynamixel | /dev/U2D2    | 17  | XM-430         | 2.0      | r_ank_roll     | present_position
   dynamixel | /dev/U2D2    | 18  | XM-430         | 2.0      | l_ank_roll     | present_position
   dynamixel | /dev/U2D2    | 19  | XM-430         | 2.0      | head_pan       | present_position
   dynamixel | /dev/U2D2    | 20  | XM-430         | 2.0      | head_tilt      | present_position
   sensor    | /dev/U2D2    | 200 | OPEN-CR        | 2.0      | open-cr        | button, present_voltage, gyro_x, gyro_y, gyro_z, acc_x, acc_y, acc_z, roll, pitch, yaw
   ```

> Reference : [Robot Information file(.robot)](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/Creating-new-robot-manager#41-robot-information-file-robot)  


#### 3.2 Joint Initialize File (`.yaml`)
Set initialization values for properties of Dynamixel or sensor.  

- Default path of Initialization file : `op3_manager/config/dxl_init_OP3.yaml`  

- Contents  

  ```
  r_sho_pitch :   # XM-430
     return_delay_time        : 1    # item name : value
     min_position_limit       : 0
     max_position_limit       : 4095

  r_sho_pitch :   # XM-430
     return_delay_time        : 1    # item name : value
     min_position_limit       : 0
     max_position_limit       : 4095

  ...
  ```

> Reference : [Joint initialize file(.yaml)](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/Creating-new-robot-manager#42-joint-initialize-file-yaml)  


#### 3.3 Offset file(`.yaml`)
If the robot is mechanically distorted due to assembly tolerance and other reasons, adjusting offset can help to correct the error.  
Offset file contains offset angles of each joint(radian) to correct distortion and initial posture joint angles for Offset Tuner.  

- Default path of Offset file : `op3_manager/config/offset.yaml`  

- Contents  

  ```
  offset:
    head_pan: 0
    head_tilt: 0
    l_ank_pitch: 0.0174532925199433
    l_ank_roll: 0
    l_el: 0
    l_hip_pitch: 0.01221730476396031
    l_hip_roll: -0.01570796326794897
    l_hip_yaw: 0.004363323129985824
    l_knee: 0.006981317007977318
    l_sho_pitch: 0
    l_sho_roll: 0
    r_ank_pitch: 0.008726646259971646
    r_ank_roll: 0
    r_el: 0
    r_hip_pitch: 0.01658062789394613
    r_hip_roll: 0.0148352986419518
    r_hip_yaw: 0.008726646259971646
    r_knee: 0.008726646259971646
    r_sho_pitch: 0
    r_sho_roll: 0
  init_pose_for_offset_tuner:
    head_pan: 0
    head_tilt: 0
    l_ank_pitch: 0
    l_ank_roll: 0
    l_el: 0
    l_hip_pitch: 0
    l_hip_roll: 0
    l_hip_yaw: 0
    l_knee: 0
    l_sho_pitch: 0
    l_sho_roll: 0
    r_ank_pitch: 0
    r_ank_roll: 0
    r_el: 0
    r_hip_pitch: 0
    r_hip_roll: 0
    r_hip_yaw: 0
    r_knee: 0
    r_sho_pitch: 0
    r_sho_roll: 0
  ```

> Reference : [How to use offset tuner](OP3-How-to-use-offset-tuner)  


[&lt;&lt; Back](OP3 User's Guide)
