### 1. Overview
Basic demonstrations of OP3 are playing soccer, vision and sequence of various actions.  
Playing soccer and action sequence are originated from OP2.  
Face detection and tracking will be demonstrated for vision.  


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  

#### 2.2 Run
- Execute `.launch` file to initiate demonstration  
  ```
  $ roslaunch op3_demo demo.launch
  ```
- With a successful launch of the program, OP3 will announce that it is ready for the demonstration.  

#### 2.3 Usage
 > Reference : [How to execute Default Demo](OP3_How_to_execute_Default_Demo.md)  

- Button Functions  
From the left, each button is assigned for Mode, Start, User and Reset.  
  - Mode button  
    - short press : In Ready Mode, mode button switches to the next demo(soccer → vision → action)  
    - long press : While playing a specific demo, press and hold the mode button to return to demo Ready Mode.  

  - Start button  
    - short press : Play selected demo from Ready Mode. If demo is running, start button will pause or resume demo.    

  - User button  

  - Reset button  
    - Reset button will cut off the power to all Dynamixel.  

### 3. ROS API
ROS APIs used in each demo will be explained in corresponding wiki pages.  

#### 3.1 Subscribed Topics
`/robotis/open_cr/button"`([std_msgs/String])  
&emsp;&emsp; The message in this topic is used to process button control.

#### 3.2 Published Topics
`/robotis/base/ini_pose`([std_msgs/String])  
&emsp;&emsp; The message in this topic is used for initial posture of ROBOTIS-OP3.

`/robotis/sync_write_item`([std_msgs/String])  
&emsp;&emsp; This topic has a message to sync write data on ROBOTIS-OP3   
&emsp;&emsp; ex) LED controls

`/play_sound_file`([std_msgs/String])  
&emsp;&emsp; The message in this topic contains path of the voice file for verbal announcement.


### 4. Demo
The followings are the list of available demonstration.  
Buttons on the back of ROBOTIS-OP3 can be used to select and play demo.  
#### 4.1 [Soccer Demo](op3_soccer_demo.md)
  OP3 will search for a colored ball selected by the user and play with it.

#### 4.2 [Vision Demo](op3_vision_demo.md)
  OP3 will detect face and trace it.

#### 4.3 [Action Demo](op3_action_demo.md)
  OP3 will play sequence of pre-defined actions while speaking.



<br>[&lt;&lt; Back](ROBOTIS-OP3-Demo.md)

[std_msgs/String]:(http://docs.ros.org/api/std_msgs/html/msg/String.html)
