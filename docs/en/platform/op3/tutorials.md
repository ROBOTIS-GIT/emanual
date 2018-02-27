---
layout: archive
lang: en
ref: op3_tutorials
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/tutorials/
sidebar:
  title: ROBOTIS-OP3
  nav: "op3"
---

<div style="counter-reset: h1 4"></div>

# [Tutorials](#tutorials)

## [How to run OP3's program](#how-to-run-op3s-program)

### Overview   
This chapter explains how to run the `op3_manager` that controls ROBOTIS-OP3.  
Several modules are controlling ROBOTIS-OP3 and various topics and services transmit commands and report status.  
The `op3_manager` cooperates with other programs such as `op3_demo` and `op3_gui_demo`.  

> Reference : [op3_manager]



### Getting started
#### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]


#### Run
Acquire root permission and execute the launch file.  
Type below commands in the terminal window.  
_(password : 111111)_  
```
$ sudo bash
[sudo] password for robotis: 111111
# roslaunch op3_manager op3_manager.launch
```  

#### Execution result
When `op3_manager` runs, robot moves to initial posture.  

1. execution result screen  

  ![](/assets/images/platform/op3/op3_manager_01.png)
2. execution result of ROBOTIS-OP3  

  ![](/assets/images/platform/op3/op3_manager_02.png)


### Description
This section explains configuration files used in `op3_manager`.  

#### Robot file(`.robot`)  
Information of the robot to operate.  
Control frequency, communication interface, baud rate, available devices and their properties are defined.  

- Default path of Robot File : `op3_manager/config/OP3.robot`

- Contents

  ```bash
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

> Reference : [Robot Information file(.robot)]  


#### Joint Initialize File (`.yaml`)
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

> Reference : [Joint initialize file(.yaml)]  


#### Offset file(`.yaml`)
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

> Reference : [How to use offset tuner]


## [How to execute Default Demo](#how-to-execute-default-demo)

### Overview   
This chapter explains how to play basic demonstrations of OP3.
There are three available demos; playing soccer, vision and sequence of various actions.
> Reference : [op3_demo]

### Getting started
#### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### Run
1. Auto Start  
  ROBOTIS-OP3 begins to play demo when startup.  

2. Manual Start  
  Connect to ROBOTIS-OP3 and open the terminal window.
  Acquire the root permission and execute the launch file.  
  Enter the following commands in the terminal.  
  _(password : 111111)_  
  The demo launch file executes `op3_demo` and `op3_manager`.  

  ```
  $ sudo bash
  [sudo] password for robotis: 111111
  # roslaunch op3_demo demo.launch
  ```

#### Execution result
Dynamixels of ROBOTIS-OP3 will be powered and take the initial posture.  


### Description
#### Button Functions
From the left, each button is assigned for Mode, Start, User and Reset.  
  - Mode button
    - short press : In Ready Mode, mode button switches to the next demo(soccer ??vision ??action)
    - long press : While demo is running, press and hold the mode button to switch to Ready Mode.  

  - Start button
    - short press : Play selected demo from Ready Mode. If demo is running, start button will pause or resume demo.  

  - User button

  - Reset button
    - Reset button will cut off the power to all Dynamixel.

#### Soccer Demo
1. How to play
  Press the mode button once from demonstration ready mode to switch to autonomous soccer mode, then play soccer demo by pressing the start button.  
  (ROBOTIS-OP3 will announce "Autonomous soccer mode" and red LED in the back will be lit.)  
  When the demo begins, ROBOTIS-OP3 will announce "Start soccer demonstration" and stand up to search for a ball.  
  If desired ball is detected, walk close to the ball and kick it.  

2. Setting Walking Parameters
  Walking motion imports parameters saved in the `op3_walking_module` in `op3_manager`. Default parameters can be configured by using walking tuner in the `op3_gui_demo`.  
  > Reference : [How to use walking tuner]

3. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.  


#### Vision Demo
1. How to Play
Press the mode button twice from demonstration ready mode to switch to vision processing mode, then play vision demo by pressing the start button.
  (ROBOTIS-OP3 will announce "Vision processing mode" and green LED in the back will be lit.)  
  When the demo begins, ROBOTIS-OP3 will announce "Start vision processing demonstration" and stand up to search for a face.  
  If a face is detected, RGB-LED on the chest and back turns into white color and OP3's head will follow the detected face.  
    > Reference : [Face Tracker - ROS Package]


2. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.  


#### Action Demo
1. How to Play
Press the mode button thrice from demonstration ready mode to switch to interactive motion mode, then play action demo by pressing the start button.
  (ROBOTIS-OP3 will announce "Interactive motion mode" and blue LED in the back will be lit.)  
  When the demo begins, ROBOTIS-OP3 will start playing predefined action sequence along with audio.  
  `action_script.yaml` contains motion and audio bundles.  

2. `action_script.yaml` file description  
 - File path : `/op3_demo/script/action_script.yaml`  

 - Contents  

    ```
    # combination action page number and mp3 file path
    action_and_sound:
      4 : "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Thank you.mp3"
      41: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Introduction.mp3"
      24: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Wow.mp3"
      23: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Yes go.mp3"
      15: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Sit down.mp3"
      1: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Stand up.mp3"
      54: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Clap please.mp3"
      27: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Oops.mp3"
      38: "/home/robotis/catkin_ws/src/ROBOTIS-OP3/ROBOTIS-OP3-Demo/op3_demo/Data/mp3/Bye bye.mp3"

    # play list
    default: [4, 41, 24, 23, 15, 1, 54, 27, 38]
    ```

    - action_and_sound : Combined information of page number of action file and mp3 file path to play with  
      `action number : mp3 file path`  

    - default : Play list of action and sound in the interactive motion mode  

3. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.


## [How to execute GUI program](#how-to-execute-gui-program)

### Overview   
The GUI program provides various functions for ROBOTIS-OP3.
- Take OP3 to the initial posture
- Configure various modules in the OP3  
- Save and edit walking parameters  
- Control the head joint of the OP3  
- Play action files in the OP3  

> Reference : [op3_gui_demo]  

![](/assets/images/platform/op3/op3_gui_diagram.png)

### Getting started
#### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### Run the program
There are three options to run the GUI program.
1. Connect input devices and display device directly to ROBOTIS-OP3 and run the GUI program on the robot.  
2. Use VNC from a remote PC to obtain control over the OP3 SBC(Intel NUC) and initiate the GUI program remotely.  
3. Run the GUI program on a remote PC in the same ROS network with ROBOTIS-OP3.  
Open the terminal window and enter the following command.
`op3_manager` should be running before executing GUI demo program.

```
$ roslaunch op3_gui_demo op3_demo.launch
```  
  > Reference : [How to run op3_manager]

#### Execution result

![](/assets/images/platform/op3/op3_gui.png)



### Description
#### How to take the initial pose of ROBOTIS-OP3
Clicking the button surrounded by the red dashed rectangle will let the `base_module` control each joint of ROBOTIS-OP3 and take the initial posture.

![](/assets/images/platform/op3/op3_gui_initial_pose.png)

#### How to set the Module
- Follow the below procedure to configure modules that control corresponding joint of ROBOTIS-OP3.  
  1. Click the module button to configure.  
    - `none`  
    - `head_control_module`  
    - `action_module`  
    - `walking_module`  

  2. Confirm from the joint status table below the module buttons that corresponding joints are set correctly.  

![](/assets/images/platform/op3/op3_gui_set_module.png)
- `Get Mode` button will report which module is assigned for each joint.  

![](/assets/images/platform/op3/op3_gui_get_module.png)

#### [How to use walking tuner](#how-to-use-walking-tuner)

##### Overview   
This chapter explains how to configure walking parameters and test them with ROBOTIS-OP3.  
Basic demo uses saved walking parameters.  


##### Description
###### Setting Module
Activate `walking_module` on the lower body part of ROBOTIS-OP3 for walking test.   
Confirm that the joints used for walking are set as `walking_module`, then move to `Walking` tab.
(When the walking module is activated, ROBOTIS-OP3 will take the initial posture for walking.)    

![](/assets/images/platform/op3/op3_gui_walking_tuner_01.png)

![](/assets/images/platform/op3/op3_gui_walking_tuner_02.png)

###### Start / Stop Walking  
 1. `start` button : Initiate walking  
 2. `stop` button : Stop walking. When stopped, walking related parameters will be reset.  

![](/assets/images/platform/op3/op3_gui_walking_tuner_03.png)

###### Apply Parameters
 1. `Refresh` button : Acquire all parameter currently applied on `walking_module`.  
 2. `Save` button : Save all parameter currently applied on `walking_module` as default parameter and use it for other program such as `op3_demo`.  
 3. `Apply` button : Apply modified parameters from the GUI to `walking_module`.  

![](/assets/images/platform/op3/op3_gui_walking_tuner_04.png)


#### [How to play the motions](#how-to-play-the-motions)

##### Overview   
This chapter explains how to play predefined actions.  
The `action_module` controls each joint of ROBOTIS-OP3.  

> Reference : [op3_action_module]

##### Description
###### How to play
 1. Set the module : Press the `action_module` button.  
 2. Select `Motion` tab of the gui demo program.

  ![](/assets/images/platform/op3/op3_gui_action_01.png)
 3. Click the action button to play  

  ![](/assets/images/platform/op3/op3_gui_action_02.png)
###### Creating and editing actions for `action_module`  
  > Reference : [How to create the motions]

#### [How to control the head joints](#how-to-control-the-head-joints)

##### Overview   
This chapter explains how to control the head joint of ROBOTIS-OP3.  
Operator can get different camera view angle by controlling head joints.  

> Reference : [op3_head_control_module]

##### Head Joint Control  
###### Setting the Module : Click `head_control_module` button  

###### Select `Head Control` tab of the gui demo program.  

  ![](/assets/images/platform/op3/op3_gui_control_head_01.png)
###### Change the value for the specific joint.  
 1. Use the slide bar to control the head joint.  
 2. Enter desired values in the text box to control the head joint.  
 3. Bring the head joint to center position.  

  ![](/assets/images/platform/op3/op3_gui_control_head_02.png)

  ![](/assets/images/platform/op3/op3_gui_control_head_03.png)

#### [How to control upgraded walking(online walking)](#how-to-control-upgraded-walkingonline-walking)

##### Overview   
This page explains how to control upgraded walking(online walking).  

> Reference 1 : [Introduction to Humanoid Robotics]

> Reference 2 : [op3_online_walking_module]

##### Description
###### How to
 - Preparation : Set the module and move to the tab
   1. Setting the module : Click `online_walking_module` button

   2. Select `Online Walking` tab of the gui demo program.


  ![](/assets/images/platform/op3/op3_online_walking_01.png)

 - Controlling walking of ROBOTIS-OP3
    1. Go to initial pose : click `Go to Initial Pose` button

    2. Balance On   

    3. Set the walking parameters    

    4. Send a walking command to `op3_manager`


  ![](/assets/images/platform/op3/op3_online_walking_02.png)

    > Walking parameters
    >  - DSP ratio : double support phase ratio
    >  - LIPM Height : linear inverted pendulum height
    >  - Foot Height Max : maximum value of foot height
    >  - ZMP Offset x : ZMP offset for x-direction
    >  - ZMP Offset y : ZMP offset for y-direction(The larger the value, the outer the zmp.)
    >  - Body Offset : desired body offset
    >  - Foot Distance : desired foot distance between left and right foot

##### Online walking using footstep planner
  > Reference : [Online walking using footstep planner]  

## [How to use offset tuner](#how-to-use-offset-tuner)

### Overview   
This chapter explains how to run the ROBOTIS-OP3 offset tuner program.  
`op3_offset_tuner_server` and `op3_offset_tuner_client` are used to adjust offsets of ROBOTIS-OP3.  

> Reference : [op3_offset_tuner_server]  
> Reference2 : [op3_offset_tuner_client]


  ![](/assets/images/platform/op3/op3_offset_tuner_diagram.png)

### Run Offset Tuner Program   

### How to launch programs  
#### Launching server and client program separately
Offset Tuner is consisted of server and client programs so that other PC in the same ROS network can tune offsets.  

Execute the offset tuner server program first.  
(Other programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should be terminated to run the offset tuner server).  

```
$ roslaunch op3_offset_tuner_server op3_offset_tuner_server.launch
```

After starting the offset tuner server, execute client GUI program from the identical PC or any PCs in the same ROS network.  

```
$ rosrun op3_offset_tuner_client op3_offset_tuner_client
```

#### Launching server and client program at once
Enter the following commands in the terminal window.
(Other programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should be terminated to run the offset tuner.)
```
$ roslaunch op3_offset_tuner_client op3_offset_tuner.launch
```



### Configuration Files
#### `op3_offset_tuner_server` configuration files  
 - `offset.yaml` : Offset data and offset adjusting posture information are saved  
 - `OP3.robot` : Description of ROBOTIS-OP3 is saved  
 - `dxl_init_OP3.yaml` : Dynamixel configurations are saved and used for joint initialization  

#### `op3_offset_tuner_client` configuration file  
 - `joint_data.yaml` : GUI menu configuration file  

### How to use Offset tuner client GUI program  

  ![](/assets/images/platform/op3/How to use offset tuner_2.png)

## [How to create the motions](#how-to-create-the-motions)

### Overview   
ROBOTIS-OP3 Action Editor Node   
This chapter explains how to create and edit action file used in the [op3_action_module] of ROBOTIS-OP3.   

#### Action File
The action file contains ROBOTIS-OP3's poses and time data. The current position describes positions of Dynamixels which converted from actual Dynamixel resolution to 4095 resolution. The action file is written as binary file so users can read its contents with op3_action_editor. ROBOTIS currently provides a default action file with source code. It is located in "op3_action_module/data" directory.  

The action file contains 256 pages. Each page can store up to 7 stages (or steps) of action data. The default action file does not use all pages and user can add own actions by writing them on the empty page.   


### Getting started
#### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### Run
Execute the launch file.  
 `op3_action_editor` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_offset_tuner` and `op3_walking_tuner` should not be running.  
Before executing the `op3_action_editor` launch file, other programs should be terminated.  
```
$ roslaunch op3_action_editor op3_action_editor.launch
```

#### UI

  ![](/assets/images/platform/op3/thormang3_action_editor_tui.jpg)

**Page number**: Page number is the listed page number. If user wants to create a new action poses, user can use any empty page.  
**Page title**: ROBOTIS recommends user to use a page title when creating a new action on an empty page.  
**Current position**: The current position describes position of Dynamixel which converted from actual Dynamixel resolution to 4095 resolution. This data is represented by STP7 in op3_action_editor. Sometimes the position may be read as ---- in op3_action_editor. This means position of the Dynamixel has not been read (or torque is off).
If user turns the Dynamixel off, current position cannot be read until turn it back on.
User can turn off the torque of specific Dynamixels. This is very convenient when acquiring position values directly from Dynamixels for a new robot posture instead of calculating those values. To do that, turn off the torque of desired Dynamixels, then make a posture and hold the robot joint by hand until turn the torque back on. The robot will be remaining at current posture and user can read position values of corresponding Dynamixels.  
**Steps or stages**: Each page can store up to 7 steps, from STP0 to STP6. However, some actions may be required more than 7 stages to perform completely. This can be resolved by simply using multiple pages and link them with Next
**Next**: Next indicates whether to continue action on a different page. To continue actions, just list the page number where the action is to be continued. Number 0 indicates that action does not continue onto another page (default value). Linking page does not have to have the numerical order.  
**Play Count**: Play Count is the number of times the action of the page is to be played.  
**Exit**: There might be some cases when an action has to be stopped. In these cases, the robot may be in unstable position. Exit is much like "Next", so "Exit" should be linked to a page where ROBOTIS-OP3 can return to a stable pose. If "Exit" is 0, it means that there is no linked exit page (default value).  
Tip: When calling an action requires multiple pages, ROBOTIS strongly suggests user to call the action from the starting page. For example, clap starts at page 7 and ends at page 8. This means you should call page 7 when calling clap. Calling the page 8 may cause unexpected behavior of the robot.  
**STP7**: "STP7" column is the current position of the Dynamixel which converted to 4095 resolution from its original resolution. "----" means that torque has been released.  
**PauseTime**: "PauseTime" is the pause duration period for motion playback for step STP[x].  
**Time(x 8msec)** : "Time" is the time period for ROBOTIS-OP3 to complete step STP[x]. Each time unit account for 8ms of time.  

It is strongly advised that when user tests user's own newly-created or edited actions, there should be small incremental changes in position, speed/time, and pause values for the sake of ROBOTIS-OP3's stability.  


#### The Contents of The Default Action File
The below table shows the contents of the default action file.  

| page number | page title | brief description of page                             | number of pages |
|:------------|:-----------|:------------------------------------------------------|:----------------|
| 1           | walki_init | initial standing pose                                 | 1               |
| 2           | hello      | greeting                                              | 1               |
| 3           | thank_you  | Thank you                                             | 1               |
| 4           | yes        | yes                                                   | 1               |
| 5           | no         | no                                                    | 1               |
| 6           | fighting   | fighting                                              | 1               |
| 7           | clap       | clap                                                  | 2               |
| 9           | S_H_RE     | ready for shaking hands                               | 1               |
| 10          | S_H        | shaking hands                                         | 1               |
| 11          | S_H_END    | move to initialpose fram ready pose for shaking hands | 1               |
| 12          | scanning   | looking around                                        | 1               |
| 13          | ceremony   | ceremony                                              | 1               |


#### Basic Command of Action Editor
After typing "help", the commend list will appear as shown below.  

  ![](/assets/images/platform/op3/thormang3_action_editor_tui_command_list.jpg)

**exit**: exits the program.  
**re**: refreshes the screen.  
**b**: moves to the previous page.  
**n**: moves to the next page.  
**page [index]**: moves to the [index] page. For example typing page 5 outputs data from page 5 on screen.  
**list**: outputs a list of pages.  
**new**: initializes current page by clearing all actuator position data.  
**copy [index]**: copies data from page [index] to current page. For example if you are on page 5 and want to copy page 9 then type copy 9.  
**set [value]**: sets position value on chosen actuator. For example If you want ID19 (head pan) to have a value of 512 then using the keyboard's directional keys place the cursor on ID19 and type set 512.  
**save**: saves any changes you've made. the saved motion file (motion_4096.bin can be found at "op3_action_module/data")  
**play**: plays motion(s) of current page.  
**name**: changes the name of the current page. You can view the name of the page at the top right portion of the screen. For example, page 2 is titled hello; to change the name type name and press the "ENTER" key. "name:" will appear at the bottom of the screen. Input the desired name for the page, good for instance, and press the "ENTER" key again.  
**i**: inserts data from STP7 to STP0. Moves data from STP[x] to STP[x + 1] if any.  
**i [index]**: inserts data from STP7 to STP[index]. Moves data from STP[index] to STP[index + 1] if any.  
**m [index] [index2]**: moves data from [index2] to [index].  
**d [index]**: deletes data from STP[index]. Moves data from STP[index] to STP[index - 1].  
**on/off**: turns on/off torque from all Dynamixels.  
**on/off [index1] [index2] [index3] ??** : turns torque on/off from ID[index1] ID[index2] ID[index3]. For example off 20 releases torque from ID20. Notice that STP7 for ID20 will read [----]. Typing on 20 turns torque from ID20 on again and the screen outputs the current position data of ID20.  



#### Example Action editing with op3_action_editor
1) Run the op3_action_editor  
2) Find the page where the "walking_init page" is by typing "list"  

![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example1.jpg)

3) Exit the list and go to any blank page by typing "page [x]"(for example, page 15).

![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example2.jpg)


4) And copy the page 1 to page [x].  

![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example3.jpg)

6) Go to "walking_init" pose by typing "play"  

5) Turn off the torque of ID 2, 4 and 8 by typing "off 2 4 8"  


![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example4.jpg)

6) After getting the desired pose turn torque on again by simple typing on. And insert the pose to step 1 by typing "i 1"  


![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example5.jpg)

7) Edit "Pause Time", "Time" of STP1 and "Page Step" as shown below.  

![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example6.jpg)

8) Type "play" and check the ROBOTIS-OP3's action  





## [How to use ball detector](#how-to-use-ball-detector)

### Overview   
This chapter explains how to calibrate the `ball_detector_node` to find a ball. The `ball_detector_node` detects a ball by the designated color and Hough Circle Transform.  


### Getting started  
#### Run the program  
```
$ roslaunch ball_detector ball_detector_from_usb_cam.launch
```
or
```
$ roslaunch op3_demo demo.launch
```

#### How to change the parameters  
1. Dynamic Reconfigure and Image View  
    - run the `rqt`  
        ```
        $ rqt
        ```
    - Open `Dynamic Reconfigure`   
    Select `Plugins -> Configuration -> Dynamic Reconfigure`

    ![](/assets/images/platform/op3/ball_detector_node_01.png)

    - Open `Image View`  
    Select `Plugins -> Visualization -> Image View`  

    ![](/assets/images/platform/op3/ball_detector_node_02.png)

2. Parameters    
The description for each parameter will pop up when hovering the mouse cursor over each parameter.  

    ![](/assets/images/platform/op3/ball_detector_node_03.png)

    - gaussian_blur_size: Size of Gaussian Blur Kernel (odd value)  
    - gaussian_blur_sigma: Std deviation of Gaussian Blur  
    - canny_edge_th: Threshold of the edge detector  
    - hough_accum_resolution: Resolution of the Hough accumulator, in terms of inverse ratio of image resolution  
    - min_circle_dist: Minimum distance between circles  
    - hough_accum_th: Accumulator threshold to decide center detection  
    - min_radius: Minimum circle radius allowed, pixels. (if unknown, put 0 for a detault.)  
    - max_radius: Maximum circle radius allowed, pixels. (if unknown, put 0 for a detault.)  
    - filter_h_min: Minimum threshold of H filter  
    - filter_h_max: Maximum threshold of H filter  
    - filter_s_min: Minimum threshold of S filter  
    - filter_s_max: Maximum threshold of S filter  
    - filter_v_min: Minimum threshold of V filter  
    - filter_v_max: Maximum threshold of V filter  
    - use_second_filter: Use second filter  
    - filter2_h_min: Minimum threshold of H filter  
    - filter2_h_max: Maximum threshold of H filter  
    - filter2_s_min: Minimum threshold of S filter  
    - filter2_s_max: Maximum threshold of S filter  
    - filter2_v_min: Minimum threshold of V filter  
    - filter2_v_max: Maximum threshold of V filter  
    - ellipse_size: Ellipse size  
    - debug_image: Show filtered image to debug  

3. Description  
    1. How the ball_detector_node works  
        ball_detector_node filters the HSV value first, then detect the ball with `HoughCircles`  

    2. How to calibrate  
        - Set H(hue) value (color value) first with full range of S and V. Then set the range of S(saturation) and V(value) to remove the noise.  
        *Hue is measured by degrees within the cylindrically represented color system. Therefore, the value 360 can be represented as 0, and the minimum value can have a bigger number than the maximum value.  (ex : min - 350 / max - 10 [Red area])

        - If you check the ?�use_second_filter?? you can get an image which is detected with two HSV variations.   

      ![](/assets/images/platform/op3/ball_detector_node_04.png)

        - If you check the ?�debug_image??you can check the HSV filtered, binary image.   

      ![](/assets/images/platform/op3/ball_detector_node_05.png)



        - After you set the HSV range, you could calibrate the threshold value to detect the edge better.*  

## [How to control upgraded walking using footstep planner](#how-to-control-upgraded-walking-using-footstep-planner)

### Overview   
This chapter explains upgraded walking and footstep planner.

> Reference : [op3_how_to_control_upgraded_walking]

### Getting started  
#### Installation
 - [humanoid_navigation] for footstep planner  
     follow link and install the packages  

 - [op3_navigation]
    - Download source
        ```
        $ cd ~/catkin_ws/src
        $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools.git
        ```
    - Build source
        ```
        $ cd ~/catkin_ws
        $ catkin_make
        ```


#### Run the program  
1. op3_manager
   ```
   $ roslaunch op3_manager op3_manager.launch
   ```

2. op3_gui_demo and footstep planner
   ```
   $ roslaunch op3_gui_demo op3_demo_walking.launch
   ```

3. rviz for upgraded walking with footstep planner  
  If user want to launch a rviz in ROBOTIS-OP3, a monitor is connected to ROBOTIS-OP3.  
   ```
   $ roslaunch robotis_op3_description robotis_op3_walking.launch
   ```

#### Walking with footstep planner
- Preparation : Set the module and move to the tab
  1. Setting the module : Click `online_walking_module` button

  2. Select `Online Walking` tab of the gui demo program.

   ![](/assets/images/platform/op3/op3_online_walking_01.png)

- Controlling walking of ROBOTIS-OP3
   1. Go to initial pose : click `Go to Initial Pose` button

   2. Balance On   

   3. Set the walking parameters     

    ![](/assets/images/platform/op3/op3_online_walking_footstep_01.png)

   4. Set a interactive marker in rviz 3d screen and Move the marker to the target pose of feet.   
    ![](/assets/images/platform/op3/op3_online_walking_footstep_02.png)

    ![](/assets/images/platform/op3/op3_online_walking_footstep_04.png)

   5. plan the path and send a walking message to ROBOTIS-OP3     

    ![](/assets/images/platform/op3/op3_online_walking_footstep_03.png)

    ![](/assets/images/platform/op3/op3_online_walking_footstep_05.png)







[op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager
[Robot Information file(.robot)]: /docs/en/platform/software/tutorials/#creating-new-robot-manager
[Joint initialize file(.yaml)]: /docs/en/platform/software/tutorials/#creating-new-robot-manager
[How to use offset tuner]: /docs/en/platform/op3/tutorials/#how-to-use-offset-tuner
[Installing ROBOTIS ROS Package]: /docs/en/platform/op3/recovery/#installing-robotis-ros-packages

[op3_demo]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-demo
[op3_gui_demo]: /docs/en/platform/op3/robotis_ros_packages/#op3_gui_demo
[How to use walking tuner]: /docs/en/platform/op3/tutorials/#how-to-use-walking-tuner


[op3_action_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-action-module
[How to create the motions]: /docs/en/platform/op3/tutorials/#how-to-create-the-motions

[op3_head_control_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-head-control-module

[Introduction to Humanoid Robotics]: http://www.springer.com/gp/book/9783642545351

[op3_online_walking_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-online-walking-module
[Online walking using footstep planner]: /docs/en/platform/op3/tutorials/#how-to-control-upgraded-walking-using-footstep-planner

[op3_offset_tuner_server]: /docs/en/platform/op3/robotis_ros_packages/#op3-offset-tuner-server
[op3_offset_tuner_client]: /docs/en/platform/op3/robotis_ros_packages/#op3-offset-tuner-client

[op3_how_to_control_upgraded_walking]: /docs/en/platform/op3/tutorials/#how-to-control-upgraded-walkingonline-walking

[humanoid_navigation]: /docs/en/platform/common/humanoid_navigation/#humanoid-navigation
[How to run op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager

[op3_navigation]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools/tree/master/op3_navigation
[Face Tracker - ROS Package]: https://github.com/ROBOTIS-GIT/face_detection
