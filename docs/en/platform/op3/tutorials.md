---
layout: archive
lang: en
ref: op3_tutorials
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/tutorials/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 5
---

<style>body {counter-reset: h1 4 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Tutorials](#tutorials)

## [ROBOTIS-OP3 Bringup](#robotis-op3-bringup)

### Overview   
This chapter explains how to run ROBOTIS-OP3. `op3_bringup` demo launches `op3_manager`.   
Several modules of `op3_manager` are controlling ROBOTIS-OP3 and various topics and services transmit commands and report status.  
The `op3_manager` cooperates with other programs such as `op3_demo` and `op3_gui_demo`.  

> Reference : [op3_manager]

#### Test environment
 * Linux Mint 22 Wilma (Base : Ubuntu Noble)
 * ROS2 Jazzy

### Getting started
#### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### Stop the Linux service that run default demo
ROBOTIS-OP3 runs default demo automatically. If you would run `op3_bringup` demo, you have to stop the default demo service.  

```bash
$ sudo systemctl stop op3_demo.service
[sudo] password for robotis: 111111
```

#### Bringup
Type below commands in the terminal window.  

```bash
$ ros2 launch op3_bringup op3_bringup.launch.py  
```

Note that, if `op3_bringup` package is missing, update the package to download the missing pacakge by following the given insturction.
```bash
$ cd ~/robotis_ws/src/ROBOTIS-OP3-Demo
$ git pull
$ cd ~/robotis_ws
$ colcon build --symlink-install
```

#### Execution result
When `op3_bringup` runs, robot moves to initial posture.  

1. execution result screen  

    ![](/assets/images/platform/op3/op3_bringup_ros2.png)  

    If you get an error for offset.yaml, run op3_offset_tuner(server and client) and save the offset.
    {: .notice}

2. execution result of ROBOTIS-OP3(Init pose in RVIZ)  

    ![](/assets/images/platform/op3/op3_manager_02.png)

3. It's ready to move, now user can control ROBOTIS-OP3 using a program such as [op3_gui_demo].  

4. If user turn off the program, press `ctrl+c` in terminal window.

#### op3_bringup.launch.py
```py
import launch
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory

def generate_launch_description():
  op3_manager_launch = IncludeLaunchDescription(
    PythonLaunchDescriptionSource(
      [get_package_share_directory('op3_manager'), '/launch/op3_manager.launch.py']
    )
  )

  usb_cam_node = Node(
    package='usb_cam',
    executable='usb_cam_node_exe',
    name='usb_cam_node_exe',
    output='log',
    parameters=[{
      'video_device': '/dev/video0',
      'image_width': 1280,
      'image_height': 720,
      'framerate': 30.0,
      'camera_frame_id': 'cam_link',
      'camera_name': 'camera',
      'io_method': 'mmap',
      'pixel_format': 'mjpeg2rgb',
      'av_device_format': 'YUV422P',
    }],
    remappings=[('/image_raw', '/usb_cam_node/image_raw')]
  )

  return LaunchDescription([
    op3_manager_launch,
    usb_cam_node
  ])
```  

- `op3_manager` : framework to control of ROBOTIS-OP3
  - Robot file : `op3_manager/config/OP3.robot`   
  - Joint initialize file : `op3_manager/config/dxl_init_OP3.yaml`  
  - Offset file : `op3_manager/config/offset.yaml`  
- `usb_cam` : package for usb camera of ROBOTIS-OP3    

### Visualization
Type below commands in the terminal window for visualization.   

```bash
$ ros2 launch op3_bringup op3_bringup_visualization.launch.py  
```  
- rviz2 screen  

  ![](/assets/images/platform/op3/op3_bringup_visualization_01_ros2.png)  


#### op3_bringup_visualization.launch.py
```py
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.substitutions import LaunchConfiguration, PathJoinSubstitution, Command
from launch_ros.substitutions import FindPackageShare
from launch_ros.actions import Node

from launch_ros.parameter_descriptions import ParameterValue

def generate_launch_description():
  ld = LaunchDescription()

  op3_description_path = FindPackageShare('op3_description')
  op3_urdf_path = PathJoinSubstitution([op3_description_path, 'urdf', 'robotis_op3.urdf.xacro'])
  op3_description_content = ParameterValue(Command(['xacro ', op3_urdf_path]), value_type=str)

  default_rviz_config_path = PathJoinSubstitution([op3_description_path, 'rviz', 'op3.rviz'])

  # Launch description 
  # joint_state_publisher 
#   ld.add_action(Node(
#     package='joint_state_publisher',
#     executable='joint_state_publisher',
#     parameters=[{'source_list': ['/robotis/present_joint_states']}],
#     remappings=[('/joint_states', '/robotis/present_joint_states')])
#   )

  # joint_state_publisher_gui
  ld.add_action(Node(
    package='joint_state_publisher_gui',
    executable='joint_state_publisher_gui',
    parameters=[{'source_list': ['/robotis/present_joint_states']}],
    remappings=[('/joint_states', '/robotis/present_joint_states')])
  )

  # robot_state_publisher 
  ld.add_action(Node(
    package='robot_state_publisher',
    executable='robot_state_publisher',
    parameters=[{'robot_description': op3_description_content,}],
    remappings=[('/joint_states', '/robotis/present_joint_states'),],)
  )

  # Rviz 
  ld.add_action(Node(
    package='rviz2',
    executable='rviz2',
    name='rviz2',
    output='screen',
    arguments=['-d', default_rviz_config_path],)
  )

  return ld
```

- `joint_state_publisher_gui` : visualization of joint value of ROBOTIS-OP3
- `robot_state_publisher` : making TF message for robot model
- `rviz2` : visualization tool

### Description
This section explains configuration files used in `op3_manager`(within `op3_bringup.launch.py`).  

#### Robot file(`.robot`)  
Information of the robot to operate.  
Control frequency, communication interface, baud rate, available devices and their properties are defined.  

- Default path of Robot File : `op3_manager/config/OP3.robot`

- Contents

  ```ini
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
Set initialization values for properties of DYNAMIXEL or sensor.  

- Default path of Initialization file : `op3_manager/config/dxl_init_OP3.yaml`  

- Contents  

  ```yaml
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

  ```yaml
  offset:
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
  The demo launch file executes `op3_demo` and `op3_manager`.  
  
    ```
    $ ros2 launch op3_demo demo.launch.xml
    ```

#### Execution result
DYNAMIXEL of ROBOTIS-OP3 will be powered and take the initial posture.  


### Description
#### Button Functions
From the left, each button is assigned for Mode, Start, User and Reset.  
  - Mode button
    - short press : In Ready Mode, mode button switches to the next demo(soccer > vision > action)
    - long press : While demo is running, press and hold the mode button to switch to Ready Mode.  

  - Start button
    - short press : Play selected demo from Ready Mode. If demo is running, start button will pause or resume demo.  

  - User button

  - Reset button
    - Reset button will cut off the power to all DYNAMIXEL.

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
    > Reference : [Face Tracker - `branch:jazzy-devel`]

2. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.  


#### Action Demo
1. How to Play  
  Press the mode button thrice from demonstration ready mode to switch to interactive motion mode, then play action demo by pressing the start button.
  (ROBOTIS-OP3 will announce "Interactive motion mode" and blue LED in the back will be lit.)  
  When the demo begins, ROBOTIS-OP3 will start playing predefined action sequence along with audio.  
  `action_script.yaml` contains motion and audio bundles.  

2. `action_script.yaml` file description  
    - File path : `/op3_demo/list/action_script.yaml`  
    - Contents  

      ```yaml
      # combination action page number and mp3 file path
      action_and_sound: 
        4 : "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Thank you.mp3"
        41: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Introduction.mp3"
        24: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Wow.mp3"
        23: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Yes go.mp3"
        15: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Sit down.mp3"
        1: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Stand up.mp3"
        54: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Clap please.mp3"
        27: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Oops.mp3"
        38: "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Bye bye.mp3"
      #  101 : "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Oops.mp3"
        110 : ""
        111 : "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Intro01.mp3"
        115 : "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Intro02.mp3"
        118 : "/home/robotis/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Intro03.mp3"

      # play list
      prev_default: [4, 41, 24, 23, 15, 1, 54, 27, 38]
      default: [4, 110, 111, 115, 118, 24, 54, 27, 38]

      # example of play list
      #certification: [101]
      ```

    - action_and_sound : Combined information of page number of action file and mp3 file path to play with  
      `action number : mp3 file path`  
    - default : Play list of action and sound in the interactive motion mode  

3. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.


## [How to execute GUI program](#how-to-execute-gui-program)

![](/assets/images/platform/op3/op3_gui_diagram.png)  
> Reference : [op3_gui_demo]  
 
### [Run the program](#run-the-program)
There are three options to run the GUI program.  
1. Connect input devices and display device directly to ROBOTIS-OP3 and run the GUI program on the robot.  
2. Use VNC from a remote PC to obtain control over the OP3 SBC(Intel NUC) and initiate the GUI program remotely.  
3. Run the GUI program on a remote PC in the same ROS network with ROBOTIS-OP3.  
  Open the terminal window and enter the following command.  
  `op3_manager` should be running before executing GUI demo program.  

    ```
    $ ros2 launch op3_gui_demo op3_demo.launch.py
    ```

    > Reference : [How to run op3_manager]
  
- Execution result  
  ![](/assets/images/platform/op3/op3_gui_ros2.png)

### [How to take the initial pose of ROBOTIS-OP3](#how-to-take-the-initial-pose)
Clicking the button surrounded by the red dashed rectangle will let the `base_module` control each joint of ROBOTIS-OP3 and take the initial posture.

![](/assets/images/platform/op3/op3_gui_initial_pose_ros2.png)

### [How to set the Module](#how-to-set-the-module)
- Follow the below procedure to configure modules that control corresponding joint of ROBOTIS-OP3.  
    1. Click the module button to configure.  
      - `none`  
      - `head_control_module`  
      - `action_module`  
      - `walking_module`  
      - `direct_control_module`

    2. Confirm from the joint status table below the module buttons that corresponding joints are set correctly.  
      ![](/assets/images/platform/op3/op3_gui_set_module_ros2.png)

- `Get Mode` button will report which module is assigned for each joint.  

  ![](/assets/images/platform/op3/op3_gui_get_module_ros2.png)

### [How to use walking tuner](#how-to-use-walking-tuner)

#### Overview   
This chapter explains how to configure walking parameters and test them with ROBOTIS-OP3.  
Basic demo uses saved walking parameters.  


#### Description
##### Setting Module
Activate `walking_module` on the lower body part of ROBOTIS-OP3 for walking test.   
Confirm that the joints used for walking are set as `walking_module`, then move to `Walking` tab.  
![](/assets/images/platform/op3/op3_gui_walking_tuner_01_ros2.png)

When the walking module is activated, ROBOTIS-OP3 will take the initial posture for walking.  
![](/assets/images/platform/op3/op3_gui_walking_tuner_02.png)

##### Start / Stop Walking  
1. `start` button : Initiate walking  
2. `stop` button : Stop walking. When stopped, walking related parameters will be reset.  

  ![](/assets/images/platform/op3/op3_gui_walking_tuner_03_ros2.png)

##### Apply Parameters
1. `Refresh` button : Acquire all parameter currently applied on `walking_module`.  
2. `Save` button : Save all parameter currently applied on `walking_module` as default parameter and use it for other program such as `op3_demo`.  
3. `Apply` button : Apply modified parameters from the GUI to `walking_module`.  

  ![](/assets/images/platform/op3/op3_gui_walking_tuner_04_ros2.png)

### [How to play the motions](#how-to-play-the-motions)

#### Overview   
This chapter explains how to play predefined actions.  
The `action_module` controls each joint of ROBOTIS-OP3.  

> Reference : [op3_action_module]

#### Description
##### How to play
1. Set the module : Press the `action_module` button.  
2. Select `Motion` tab of the gui demo program.

    ![](/assets/images/platform/op3/op3_gui_action_01_ros2.png)

3. Click the action button to play  

    ![](/assets/images/platform/op3/op3_gui_action_02_ros2.png)

##### Creating and editing actions for `action_module`  

> Reference : [How to create the motions]

### [How to control the head joints](#how-to-control-the-head-joints)

#### Overview   
This chapter explains how to control the head joint of ROBOTIS-OP3.  
Operator can get different camera view angle by controlling head joints.  

> Reference : [op3_head_control_module]

#### Head Joint Control  

1. Setting the Module : Click `head_control_module` button  
2. Select `Head Control` tab of the gui demo program.  
  ![](/assets/images/platform/op3/op3_gui_control_head_01_ros2.png)

3. Change the value for the specific joint.  
   1. Use the slide bar to control the head joint.  
   2. Enter desired values in the text box to control the head joint.  
   3. Bring the head joint to center position.  
   
    ![](/assets/images/platform/op3/op3_gui_control_head_02_ros2.png)  
    ![](/assets/images/platform/op3/op3_gui_control_head_03.png)  
  
  
## [How to use offset tuner](#how-to-use-offset-tuner)

### Overview  
{% capture deprecated_offset_tuner %}  
`deprecated`    
This chapter has been merged into [How to use tuner client](#how-to-use-tuner-client)  
{% endcapture %}  
<div class="notice">{{ deprecated_offset_tuner | markdownify }}</div> 

> Reference : [op3_offset_tuner_server]  
> Reference : [op3_offset_tuner_client]

![](/assets/images/platform/op3/op3_offset_tuner_diagram.png)  
  
## [How to use tuner client](#how-to-use-tuner-client)  

### Overview     
this chapter explains how to adjust kinematic offset and position gain of ROBOTIS-OP3.
In the past, we were able to adjust the offset by using op3_offset_server and op3_offset_client. Now we can set both offset and gain using new op3_tuning_module and op3_tuner_client. we made an op3_tuning_module and used it with op3_manager, so you do not need to run the server for using just to tune the offset.
 
> Reference : [op3_tuning_module]  
> Reference : [op3_tuner_client]

- Before  
![](/assets/images/platform/op3/op3_offset_tuner_diagram.png)  
- After   
![](/assets/images/platform/op3/op3_tuner_diagram.png)  

### Run Tuner Program   

### How to launch programs  
#### Launching `op3_manager` and `op3_tuner_client` program separately
Tuner is consisted of op3_manager and client program so that other PC in the same ROS network can tune offsets and gains.  

Execute the `op3_manager` first.  
(Other programs such as `op3_action_editor` and `op3_walking_tuner` should be terminated to run the `op3_manager`).  

```
$ ros2 launch op3_manager op3_manager.launch.py  
```

After starting the `op3_manager`, execute client GUI program from the identical PC or any PCs in the same ROS network.  

```
$ ros2 launch op3_tuner_client op3_tuner_client.launch.xml
```

#### Launching `op3_manager` and `op3_tuner_client` program at once
Enter the following commands in the terminal window.  
(Other programs such as `op3_action_editor` and `op3_walking_tuner` should be terminated to run the offset tuner.)

```
$ ros2 launch op3_tuner_client op3_tuner.launch.xml 
```

![launch image](/assets/images/platform/op3/op3_tuner_execution_ros2.png)

### Configuration Files
#### `op3_manager` configuration files   
- config/`OP3.robot` : Contains the description of ROBOTIS-OP3.  
- config/`dxl_init_OP3.yaml` : Stores DYNAMIXEL configurations, included gains, used for joint initialization. 
- config/`offset.yaml` : Saves offset data.  
 
#### `op3_tuning_module` configuration files  
- data/`tune_pose.yaml` : Stores offset adjustment posture data and gain tuning posture data.  

  ```
  init_pose:  
    move_time: time   # sec  
    target_pose:  
      joint_name: angle(degree)  
      ...  

  tune_pose_01:  
    move_time: [time, time, ...]  # sec
    target_pose: [pose_name, pose_name, ...]  
  tune_pose_02:  
    move_time: [time, time, ...]  
    target_pose: [pose_name, pose_name, ...]  
  tune_pose_03:  
    move_time: [time, time, ...]  
    target_pose: [pose_name, pose_name, ...]    
  tune_pose_04:  
    move_time: [time, time, ...]   
    target_pose: [pose_name, pose_name, ...]  

  pose_data:  
    pose_name:  
      joint_name: angle(degree)  
      ...  
  ```

#### `op3_tuner_client` configuration file  
- config/`joint_data.yaml` : GUI menu configuration file  

### How to use tuner client GUI program   
#### How to tune the offset  
![](/assets/images/platform/op3/op3_tuner_offset_01.png)  
1. go `Initial Pose`   
2. Select tab of `Kinematics Group`  
3. Click the `Refresh` Button for getting current states of joints  
4. tune the offset of joints  
5. Click the `Save Offset` button for saving to file.  

#### How to tune the gain  
![](/assets/images/platform/op3/op3_tuner_gain_01.png)  
1. go `Initial Pose`   
2. Select tab of `Kinematics Group`  
3. Click the `Refresh` Button for getting current states of joints  
4. change the pose and tune the gain of joints for watching the graph of the joint  
(If you want to tune other joint, delete topics and add topics that you want to tune)    
5. Click the `Save Gain` button for saving to file.  

  > Reference : Order of the joint name in the topic(`/robotis/goal_joint_states`)    

  ```
  0 : haed_pan  
  1 : haed_tilt  
  2 : l_ank_pitch  
  3 : l_ank_roll  
  4 : l_el  
  5 : l_hip_pitch  
  6 : l_hip_roll  
  7 : l_hip_yaw  
  8 : l_knee  
  9 : l_sho_pitch  
  10 : l_sho_roll  
  11 : r_ank_pitch  
  12 : r_ank_roll  
  13 : r_el  
  14 : r_hip_pitch  
  15 : r_hip_roll  
  16 : r_hip_yaw  
  17 : r_knee  
  18 : r_sho_pitch  
  19 : r_sho_roll   
  ```
  
  > If you want to check in your hand, type like the belows    

  ```
  $ ros2 topic echo /robotis/goal_joint_states --once
  ```

## [How to create the motions](#how-to-create-the-motions)

### Overview   
ROBOTIS-OP3 Action Editor Node.  
This chapter explains how to create and edit action file used in the [op3_action_module] of ROBOTIS-OP3.   

#### Action File
The action file contains ROBOTIS-OP3's poses and time data. The `Current position` describes positions of DYNAMIXEL, which are converted from the actual DYNAMIXEL resolution to a 4,095 resolution. The `action file` is written as a binary file, so users can read its contents with `op3_action_editor`. ROBOTIS currently provides a default action file with the source code. It is located in the `op3_action_module/data` directory.  

The action file contains 256 pages. Each page can store up to 7 stages (or steps) of action data. The default action file does not use all pages, and users can add their own actions by writing them to the empty pages.   


### Getting started
#### Download & Build
> Reference : [Installing ROBOTIS ROS Package]

#### Run
Run the executor file.  
`op3_action_editor` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_offset_tuner` and `op3_walking_tuner` should not be running.  
Before running the `op3_action_editor` executor file, other programs should be terminated.  
```
$ ros2 run op3_action_editor executor.py
```

#### UI

![](/assets/images/platform/op3/op3_action_editor_tui.png)

- **Page number**: Page number is the listed page number. If user wants to create a new action poses, user can use any empty page.  
- **Page title**: ROBOTIS recommends user to use a page title when creating a new action on an empty page.  
- **Current position**: The current position describes position of DYNAMIXEL which converted from actual DYNAMIXEL resolution to 4,095 resolution. This data is represented by STP7 in op3_action_editor. Sometimes the position may be read as ---- in op3_action_editor. This means position of DYNAMIXEL has not been read (or torque is off).  
  If user turns DYNAMIXEL off, current position cannot be read until turn it back on.  
  User can turn off the torque of specific DYNAMIXEL. This is very convenient when acquiring position values directly from DYNAMIXEL for a new robot posture instead of calculating those values. To do that, turn off the torque of desired DYNAMIXEL, then make a posture and hold the robot joint by hand until turn the torque back on. The robot will be remaining at current posture and user can read position values of corresponding DYNAMIXEL.  
- **Steps or stages**: Each page can store up to 7 steps, from STP0 to STP6. However, some actions may be required more than 7 stages to perform completely. This can be resolved by simply using multiple pages and link them with Next
- **Next**: Next indicates whether to continue action on a different page. To continue actions, just list the page number where the action is to be continued. Number 0 indicates that action does not continue onto another page (default value). Linking page does not have to have the numerical order.  
- **Play Count**: The number of times the page's action will be executed.  
- **Exit**: There might be some cases when an action has to be stopped. In these cases, the robot may be in unstable position. Exit is much like "Next", so "Exit" should be linked to a page where ROBOTIS-OP3 can return to a stable pose. If "Exit" is 0, it means that there is no linked exit page (default value).  
  `Tip` : When calling an action requires multiple pages, ROBOTIS strongly suggests user to call the action from the starting page. For example, clap starts at page 7 and ends at page 8. This means you should call page 7 when calling clap. Calling the page 8 may cause unexpected behavior of the robot.  
- **STP7**: "STP7" column is the current position of DYNAMIXEL which converted to 4,095 resolution from its original resolution. "----" means that torque has been released.  
- **PauseTime**: "PauseTime" is the pause duration period for motion playback for step STP[x].  
- **Time(x 8msec)** : "Time" is the time period for ROBOTIS-OP3 to complete step STP[x]. Each time unit account for 8ms of time.  

It is strongly advised that when user tests user's own newly-created or edited actions, there should be small incremental changes in position, speed/time, and pause values for the sake of ROBOTIS-OP3's stability.  


#### The Contents of The Default Action File
The below table shows the contents of the default action file.  

| page number | page title    | brief description of page                             | number of pages |
|:-----------:|:--------------|:------------------------------------------------------|:---------------:|
|      1      | standup       | Standing-up                                           |        1        |
|      4      | thankyou      | Thank you                                             |        1        |
|      9      | walkready     | Walking-ready                                         |        1        |
|     15      | sit down      | Sitting-down                                          |        1        |
|     23      | yes go        | Yes Go                                                |        1        |
|     24      | wow1          | Wow                                                   |        2        |
|     27      | oops          | Oops                                                  |        1        |
|     38      | bye1          | Bye                                                   |        2        |
|     41      | talk2         | Introduction                                          |        7        |
|     54      | clapplz1      | Clap please                                           |        2        |
|     60      | keep_re       | Keeper Ready                                          |        1        |
|     61      | keep_r        | Defence to Right                                      |        1        |
|     62      | keep_l        | Defence to Left                                       |        1        |
|     80      | walk_ready    | Soccer Init pose                                      |        1        |
|    120      | l_kick_170519 | Soccer Left Kick                                      |        1        |
|    121      | r_kick_170519 | Soccer Right Kick                                     |        1        |
|    122      | f_get_up      | Get up (Front)                                        |        1        |
|    123      | b_get_up      | Get up (Back)                                         |        1        |
|    126      | push up       | Push-up                                               |        4        |
|    202      | b_getup_dumb  | Roll back                                             |        1        |
|    204      | see_right_up  | Look                                                  |        1        |


#### Basic Command of Action Editor
After typing "help", the commend list will appear as shown below.  

![](/assets/images/platform/op3/op3_action_editor_command_list.png)

- **exit**: exits the program.  
- **re**: refreshes the screen.  
- **b**: moves to the previous page.  
- **n**: moves to the next page.  
- **page [index]**: moves to the [index] page. For example typing page 5 outputs data from page 5 on screen.  
- **list**: outputs a list of pages.  
- **new**: initializes current page by clearing all actuator position data.  
- **copy [index]**: copies data from page [index] to current page. For example if you are on page 5 and want to copy page 9 then type copy 9.  
- **set [value]**: sets position value on chosen actuator. For example If you want ID19 (head pan) to have a value of 512 then using the keyboard's directional keys place the cursor on ID19 and type set 512.  
- **save**: saves any changes you've made. the saved motion file (motion_4096.bin can be found at "op3_action_module/data")  
- **play**: plays motion(s) of current page.  
- **playboth [index]**: plays motion(s) of current page with [index] mp3.
- **g [index]**: plays motion of STP[index].
- **name**: changes the name of the current page. You can view the name of the page at the top right portion of the screen. For example, page 2 is titled hello; to change the name type name and press the "ENTER" key. "name:" will appear at the bottom of the screen. Input the desired name for the page, good for instance, and press the "ENTER" key again.  
- **time**: change time base playing.
- **speed**: change speed base playing.
- **w [index]**: overwrites the data of STP[index] with the data of STP7(current pose).
- **i**: inserts data from STP7 to STP0. Moves data from STP[x] to STP[x + 1] if any.  
- **i [index]**: inserts data from STP7 to STP[index]. Moves data from STP[index] to STP[index + 1] if any.  
- **m [index] [index2]**: moves data from [index2] to [index].  
- **d [index]**: deletes data from STP[index]. Moves data from STP[index] to STP[index - 1].  
- **mlr [index]**: mirrors the left-side values of STP[index] to the right-side values.
- **mrl [index]**: mirrors the right-side values of STP[index] to the left-side values.
- **ms [index]**: swaps the left and right values of STP[index].
- **on/off**: turns on/off torque from all DYNAMIXEL.  
- **on/off [index1] [index2] [index3] ...** : turns torque on/off from ID[index1] ID[index2] ID[index3]. For example off 20 releases torque from ID20. Notice that STP7 for ID20 will read [----]. Typing on 20 turns torque from ID20 on again and the screen outputs the current position data of ID20.  



#### Example Action editing with op3_action_editor
1. Run the op3_action_editor  
2. Type `list` to find where the `walkready` page is located.  

    ![](/assets/images/platform/op3/op3_action_editor_list.png)

3. Exit the list and go to any blank page by typing `page [x]` (for example, page 12).

    ![](/assets/images/platform/op3/op3_action_editor_example2.png)

4. And copy the page 9 to page [x] by typing `copy 9`.

    ![](/assets/images/platform/op3/op3_action_editor_example3.png)

5. Go to `walkready` pose by typing `play`  
6. Turn off the torque of ID 2, 4 and 8 by typing `off 2 4 8`  

    ![](/assets/images/platform/op3/op3_action_editor_example4.png)

7. After getting the desired pose turn torque on again by simple typing `on`. And insert the pose to step 1 by typing `i 1`  

    ![](/assets/images/platform/op3/op3_action_editor_example5.png)

8. Edit `Pause Time`, `Time` of STP1 and `Page Step` as shown below.  

    ![](/assets/images/platform/op3/op3_action_editor_example6.png)

9. Type `play` and check the ROBOTIS-OP3's action  

## [How to use ball detector](#how-to-use-ball-detector)

### Overview   
This chapter explains how to calibrate the `ball_detector_node` to find a ball. The `ball_detector_node` detects a ball by the designated color and Hough Circle Transform.  

### Getting started  
#### Run the program  

```
$ ros2 launch op3_ball_detector ball_detector_from_usb_cam.launch.py
```

or

```
$ ros2 launch op3_demo demo.launch.xml
```

#### How to change the parameters  
1. Dynamic Reconfigure and Image View  
    - run the `rqt`  

      ```
      $ rqt
      ```

    - Open `Dynamic Reconfigure`   
      Select `Plugins -> Configuration -> Dynamic Reconfigure`

      ![](/assets/images/platform/op3/ball_detector_node_01_rev3.png)

    - Open `Image View`  
      Select `Plugins -> Visualization -> Image View`  

      ![](/assets/images/platform/op3/ball_detector_node_02_rev3.png)

2. Parameters    
    - canny_edge_th: Threshold of the edge detector  
    - ellipse_size: Ellipse size  
    - gaussian_blur_sigma: Std deviation of Gaussian Blur  
    - gaussian_blur_size: Size of Gaussian Blur Kernel (odd value)  
    - hough_accum_resolution: Resolution of the Hough accumulator, in terms of inverse ratio of image resolution  
    - hough_accum_th: Accumulator threshold to decide center detection  
    - min_circle_dist: Minimum distance between circles  
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
    - debug_image: Show filtered image to debug  

3. Description  
    - How the ball_detector_node works  
      ball_detector_node filters the HSV value first, then detect the ball with `HoughCircles`  

    - How to calibrate  
        - Set H(hue) value (color value) first with full range of S and V. Then set the range of S(saturation) and V(value) to remove the noise.  
          `Hue` is measured by degrees within the cylindrically represented color system. Therefore, the value 360 can be represented as 0, and the minimum value can have a bigger number than the maximum value.  (ex : min - 350 / max - 10 [Red area])

        - If you check the `use_second_filter` you can get an image which is detected with two HSV variations.   

          ![](/assets/images/platform/op3/ball_detector_node_04_rev3.png)

        - If you check the `debug_image` you can check the HSV filtered, binary image.   

          ![](/assets/images/platform/op3/ball_detector_node_05_rev3.png)

        - After you set the HSV range, you could calibrate the threshold value to detect the edge better.  


## [How to use Web Setting Tool](#how-to-use-web-setting-tool)

### Overview   
  This chapter explains how to set the parameters of ROBOTIS-OP3 through a web page.

  > Reference : [ROBOT WEB TOOL]  
  > Reference : [web_video_server - ros2]   
  > Reference : [rosbridge_suite - ros2]  


### Getting started  
#### Installation
- web_video_server  
  ```
  $ sudo apt install ros-jazzy-web-video-server
  ```

- rosbridge_server  
  ```
  $ sudo apt install ros-jazzy-rosbridge-server
  ```

- Update and build source
  - ROBOTIS-OP3-Demo  
    ```
    $ cd ~/robotis_ws/src/ROBOTIS-OP3-Demo
    $ git pull
    ```

  - ROBOTIS-OP3-Tools  
    ```
    $ cd ~/robotis_ws/src/ROBOTIS-OP3-Tools
    $ git pull
    ```

  - Build source  
    ```
    $ cd ~/robotis_ws
    $ colcon build --symlink-install
    ```


- Setup the Web Server
  - Install web server(APACHE2)
    ```
    $ sudo apt install apache2
    ```
  - Check the default page from a web browser
    - http://10.42.0.1


- Copy files from ROBOTIS-OP3-Tools folder to the web server folder : github
  ```
  $ cd ~/robotis_ws/src/ROBOTIS-OP3-Tools/op3_web_setting_tool
  $ sudo cp -r ./html /var/www
  ```  


#### How to connect ROBOTIS-OP3 WiFi
Connect to ROBOTIS-OP3 WiFi with below information
- WiFi ssid : ROBOTIS-OP3-Share
- password : _11111111_  
  For security reasons, it is recommended to change the WiFi password.

  > Reference : [How to connect]  


#### How to run web setting tool
-  How to run the packages manually for web server
 ```
 $ ros2 launch op3_web_setting_tool web_setting_server.launch.xml
 ```


#### How to set parameters
##### Menu  

![](/assets/images/platform/op3/op3_web_setting_01.png)

1. Demo : Control default demo of ROBOTIS-OP3.    
2. Soccer : Setting for ball_detector.   
3. Vision : View the status of the detected face.    
4. Action : Testing ROBOTIS-OP3 actions.   
5. Camera : Change the parameters of ROBOTIS-OP3 camera.  

##### Ball Detector parameters  
  ![](/assets/images/platform/op3/op3_web_setting_02.png)
  > Modified parameter values will be saved automatically.  

  - gaussian blur size: Size of Gaussian Blur Kernel (odd value)  
  - gaussian blur sigma: Standard deviation of Gaussian Blur  
  - canny edge threshold: Threshold of the edge detector  
  - hough accum resolution: Resolution of the Hough accumulator, in terms of inverse ratio of image resolution  
  - min circle distance: Minimum distance between circles  
  - hough accum threshold: Accumulator threshold to decide center detection  
  - min radius: Minimum circle radius allowed, pixels. (if unknown, set to 0 as a default.)  
  - max radius: Maximum circle radius allowed, pixels. (if unknown, set to 0 as a default.)  
  - ellipse size: Ellipse size    
  - Hue min: Minimum threshold of H filter  
  - Hue max: Maximum threshold of H filter  
  - Saturation min: Minimum threshold of S filter  
  - Saturation max: Maximum threshold of S filter  
  - Value min: Minimum threshold of V filter  
  - Value max: Maximum threshold of V filter  
  - Debug image: Show filtered image to debug  
  - Normal image : Show normal image
  - Reset parameters : reset all of parameters

  > Reference : [detail of parameter]  

##### Camera Setting parameters  
  ![](/assets/images/platform/op3/op3_web_setting_06.png)
  > Modified parameter values will be saved automatically.  


## [Read-Write Tutorial](#read-write-tutorial)

### Overview   
This chapter explains to user how to get joint angles of ROBOTIS-OP3 and how to set their values.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/6Rle7U84vHM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

#### Framework Diagram

![](/assets/images/platform/op3/op3_manager_03.png)  

This is a framework diagram. The framework(op3_manager) works in the following way.

1. Initialization  
2. Add sensors and motion modules  
3. Start the timer and run threads  
    Execute the process function within the thread at a cycle of 8ms.  
    The process function performs the following operations according to the mode.  

    - DirectControlMode : This mode directly controls the robot using topics received from the user.  

      1. BulkRead RX : Received rx packet containing joint information of each DYNAMIXEL  
      2. SyncWrite : Transmit joint values to the multiple DYNAMIXEL's to control
      3. BulkRead TX : Transmit tx packet to get information of dynamixel  	
      4. Call `process()` function of each sensor module  
      5. Publish a topic that contains present & goal joint states  

    - MotionModuleMode : This mode controls the robot using motion module.  

      1. BulkRead RX : Received rx packet containing joint information of each DYNAMIXEL  
      2. SyncWrite : Transmit goal values(position, velocity, current, position PID gain, velocity PID gain) to multiple DYNAMIXEL's  
      3. BulkRead TX : Transmit tx packet to get information of dynamixel  
      4. Call `process()` function of each sensor module  
      5. Call `process()` function of each motion module  
      6. Publish a topic that contains present & goal joint states  

### Description  
#### How to Get Joint States  
- `motion_module` uses joint states inside of the `op3_manager`.  
  If user creates and uses a motion_module, user can get additional information by adding a bulkread item.  
  bulkread item is added by modifying [OP3.robot] file.   
  In robotis_controller, when the process() function of each motion_module is called,
  two arguments pass the imformation about joint.
  - `robot_-> dxls_` contains information about each joint.
  - `sensor_result_` contains information about the sensor.  
- Other ROS packages use joint states outside of the `op3_manager`.  
  The process function in robotis_controller reads the information of each joint and publishes it as a topic.  
  - topic name : `/robotis/present_joint_states`  
  - Containing Information : present position, present velocity, present effort, goal position, goal velocity, goal effort  


#### How to Set Joint States  
op3_manager provides a way to control each joint of the robot with the following two methods.  

- `robotis_controller`  
  If the control mode of the robotis_controller meets one of the below two conditions, the user can directly control joints of the robot using the `/robotis /set_joint_states` topic.  
  - DirectControlMode  
  - none of the activating module under the MotionModuleMode  
- `motion_module` : `direct_control_module`  
  User can directly control joints of the robot using `direct_control_module` that is one of the motion modules.  
  Users can implement features in the motion module. `direct_control_module` has a simple self-collision checking(check the distance between end-effector and COB).  
  The topic name to control the robot is `/robotis/direct_control/set_joint_states`.  

> Reference : SyncWriteItem  
> Framework provides `SyncWriteItem`, a way to write to devices aperiodically.  
> If user send a `SyncWriteItem` message with the name of `/robotis/sync_write_item`, Framework try to sync-write to devices with those message.  

### Read-Write Demo
#### Download & Build  
 > Reference : [Installing ROBOTIS ROS Package]

#### How to Run Demo  
Stop the default demo  

```
$ sudo systemctl stop op3_demo
[sudo] password for robotis: 111111
```  

Run read-write demo  
```
$ ros2 launch op3_read_write_demo op3_read_write.launch.xml
```

#### op3_read_write.launch.xml  
```xml
<?xml version="1.0" ?>
<launch>
        
    <!-- OP3 Manager -->
    <node pkg="op3_manager" exec="op3_manager" output="screen">
        <param name="angle_unit" value="30.0" />

        <param name="gazebo" value="false"/>
        <param name="gazebo_robot_name" value="robotis_op3"/>
            
        <param name="offset_file_path" value="$(find-pkg-share op3_manager)/config/offset.yaml"/>
        <param name="robot_file_path" value="$(find-pkg-share op3_manager)/config/OP3.robot"/>
        <param name="init_file_path" value="$(find-pkg-share op3_manager)/config/dxl_init_OP3.yaml"/>
        <param name="device_name" value="/dev/ttyUSB0"/>
        
        <param name="/robotis/direct_control/default_moving_time" value="0.04"/>
        <param name="/robotis/direct_control/default_moving_angle" value="90.0"/>
    </node>

    <!-- OP3 Read-Write demo -->
    <node pkg="op3_read_write_demo" exec="read_write" output="screen"/>
</launch>
```  
 - parameters
   - `gazebo` : parameter for gazebo simulation  
   - `gazebo_robot_name` : robot name for gazebo simulation  
   - `offset_file_path` : The file path containing the offset value of each joint, used by op3_manager.  
   - `robot_file_path` : The file path containing the robot information  
   - `init_file_path` : The file path containing the initial parameters of joints  
   - `device_name` : device name to communicate with robot  
   - `/robitis/direct_control/default_moving_time` : minimum moving time for direct_control_module  
   - `/robitis/direct_control/default_moving_angle` : moving angle per 1 sec, used in direct_control_module  
 - node  
   - `op3_manager` : This node controls ROBOTIS-OP3 hardware  
   - `op3_read_write` : read-write demo, described in this chapter  
 - rqt_graph  
   ![](/assets/images/platform/op3/op3_read_write_graph_rev3.png)

#### How to Operate  

 - Description : Buttons  
   From the left : `mode` button, `start` button, `user` button, `reset` button  
   - `mode` button : start read_write demo using `robotis_controller`  
   - `start` button : start read_write demo using `direct_control_module`  
   - `user` button : torque on all joints  
   - `reset` button : torque off all joints  

#### Source Code  
- [read_write.cpp `branch:jazzy-devel`]  

  ```cpp
  #include <rclcpp/rclcpp.hpp>
  #include <std_msgs/msg/string.hpp>
  #include <sensor_msgs/msg/joint_state.hpp>

  #include "robotis_controller_msgs/srv/set_module.hpp"
  #include "robotis_controller_msgs/msg/sync_write_item.hpp"

  void buttonHandlerCallback(const std_msgs::msg::String::SharedPtr msg);
  void jointstatesCallback(const sensor_msgs::msg::JointState::SharedPtr msg);
  void readyToDemo();
  void setModule(const std::string& module_name);
  void goInitPose();
  void setLED(int led);
  bool checkManagerRunning(std::string& manager_name);
  void torqueOnAll();
  void torqueOff(const std::string& body_side);

  enum ControlModule
  {
    None = 0,
    DirectControlModule = 1,
    Framework = 2,
  };

  const int SPIN_RATE = 30;
  const bool DEBUG_PRINT = false;

  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr init_pose_pub;
  rclcpp::Publisher<robotis_controller_msgs::msg::SyncWriteItem>::SharedPtr sync_write_pub;
  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr dxl_torque_pub;
  rclcpp::Publisher<sensor_msgs::msg::JointState>::SharedPtr write_joint_pub;
  rclcpp::Publisher<sensor_msgs::msg::JointState>::SharedPtr write_joint_pub2;
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr button_sub;
  rclcpp::Subscription<sensor_msgs::msg::JointState>::SharedPtr read_joint_sub;

  rclcpp::Client<robotis_controller_msgs::srv::SetModule>::SharedPtr set_joint_module_client;

  int control_module = None;
  bool demo_ready = false;

  rclcpp::Node::SharedPtr node;

  //node main
  int main(int argc, char **argv)
  {
    //init ros
    rclcpp::init(argc, argv);

    node = rclcpp::Node::make_shared("read_write_demo");

    init_pose_pub = node->create_publisher<std_msgs::msg::String>("/robotis/base/ini_pose", 5);
    sync_write_pub = node->create_publisher<robotis_controller_msgs::msg::SyncWriteItem>("/robotis/sync_write_item", 10);
    dxl_torque_pub = node->create_publisher<std_msgs::msg::String>("/robotis/dxl_torque", 10);
    write_joint_pub = node->create_publisher<sensor_msgs::msg::JointState>("/robotis/set_joint_states", 10);
    write_joint_pub2 = node->create_publisher<sensor_msgs::msg::JointState>("/robotis/direct_control/set_joint_states", 10);

    read_joint_sub = node->create_subscription<sensor_msgs::msg::JointState>("/robotis/present_joint_states", 10, jointstatesCallback);
    button_sub = node->create_subscription<std_msgs::msg::String>("/robotis/open_cr/button", 10, buttonHandlerCallback);

    // service
    set_joint_module_client = node->create_client<robotis_controller_msgs::srv::SetModule>("/robotis/set_present_ctrl_modules");

    rclcpp::Rate loop_rate(SPIN_RATE);

    // wait for starting of op3_manager
    std::string manager_name = "/op3_manager";
    while (rclcpp::ok())
    {
      rclcpp::sleep_for(std::chrono::seconds(1));

      if (checkManagerRunning(manager_name) == true)
      {
        RCLCPP_INFO(node->get_logger(), "Succeed to connect");
        break;
      }
      RCLCPP_WARN(node->get_logger(), "Waiting for op3 manager");
    }

    readyToDemo();

    //node loop
    while (rclcpp::ok())
    {
      // process

      //execute pending callbacks
      rclcpp::spin_some(node);

      //relax to fit output rate
      loop_rate.sleep();
    }

    //exit program
    rclcpp::shutdown();
    return 0;
  }

  void buttonHandlerCallback(const std_msgs::msg::String::SharedPtr msg)
  {
    // starting demo using robotis_controller
    if (msg->data == "mode")
    {
      control_module = Framework;
      RCLCPP_INFO(node->get_logger(), "Button : mode | Framework");
      readyToDemo();
    }
    // starting demo using direct_control_module
    else if (msg->data == "start")
    {
      control_module = DirectControlModule;
      RCLCPP_INFO(node->get_logger(), "Button : start | Direct control module");
      readyToDemo();
    }
    // torque on all joints of ROBOTIS-OP3
    else if (msg->data == "user")
    {
      torqueOnAll();
      control_module = None;
    }
  }

  void jointstatesCallback(const sensor_msgs::msg::JointState::SharedPtr msg)
  {
    if(control_module == None)
      return;

    sensor_msgs::msg::JointState write_msg;
    write_msg.header = msg->header;

    for(int ix = 0; ix < msg->name.size(); ix++)
    {
      std::string joint_name = msg->name[ix];
      double joint_position = msg->position[ix];

      // mirror and copy joint angles from right to left
      if(joint_name == "r_sho_pitch")
      {
        write_msg.name.push_back("r_sho_pitch");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_sho_pitch");
        write_msg.position.push_back(-joint_position);
      }
      if(joint_name == "r_sho_roll")
      {
        write_msg.name.push_back("r_sho_roll");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_sho_roll");
        write_msg.position.push_back(-joint_position);
      }
      if(joint_name == "r_el")
      {
        write_msg.name.push_back("r_el");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_el");
        write_msg.position.push_back(-joint_position);
      }
    }

    // publish a message to set the joint angles
    if(control_module == Framework)
      write_joint_pub->publish(write_msg);
    else if(control_module == DirectControlModule)
      write_joint_pub2->publish(write_msg);
  }

  void readyToDemo()
  {
    RCLCPP_INFO(node->get_logger(), "Start Read-Write Demo");
    // turn off LED
    setLED(0x04);

    torqueOnAll();
    RCLCPP_INFO(node->get_logger(), "Torque on All joints");

    // send message for going init posture
    goInitPose();
    RCLCPP_INFO(node->get_logger(), "Go Init pose");

    // wait while ROBOTIS-OP3 goes to the init posture.
    rclcpp::sleep_for(std::chrono::seconds(4));

    // turn on R/G/B LED [0x01 | 0x02 | 0x04]
    setLED(control_module);

    // change the module for demo
    if(control_module == Framework)
    {
      setModule("none");
      RCLCPP_INFO(node->get_logger(), "Change module to none");
    }
    else if(control_module == DirectControlModule)
    {
      setModule("direct_control_module");
      RCLCPP_INFO(node->get_logger(), "Change module to direct_control_module");
    }
    else
    {
      RCLCPP_ERROR(node->get_logger(), "Invalid control module : %d", control_module);
      return;
    }

    // torque off : right arm
    torqueOff("right");
    RCLCPP_INFO(node->get_logger(), "Torque off");
  }

  void goInitPose()
  {
    std_msgs::msg::String init_msg;
    init_msg.data = "ini_pose";

    init_pose_pub->publish(init_msg);
  }

  void setLED(int led)
  {
    robotis_controller_msgs::msg::SyncWriteItem syncwrite_msg;
    syncwrite_msg.item_name = "LED";
    syncwrite_msg.joint_name.push_back("open-cr");
    syncwrite_msg.value.push_back(led);

    sync_write_pub->publish(syncwrite_msg);
  }

  bool checkManagerRunning(std::string& manager_name)
  {
    auto node_list = node->get_node_names();

    for (const auto& node_name : node_list)
    {
      if (node_name == manager_name)
        return true;
    }

    RCLCPP_ERROR(node->get_logger(), "Can't find op3_manager");
    return false;
  }

  void setModule(const std::string& module_name)
  {
    auto request = std::make_shared<robotis_controller_msgs::srv::SetModule::Request>();
    request->module_name = module_name;

    if (!set_joint_module_client->wait_for_service(std::chrono::seconds(1)))
    {
      RCLCPP_ERROR(node->get_logger(), "Service not available");
      return;
    }

    auto future = set_joint_module_client->async_send_request(request,
        [module_name](rclcpp::Client<robotis_controller_msgs::srv::SetModule>::SharedFuture result)
        {
          RCLCPP_INFO(node->get_logger(), "read_write setModule(%s) : result : %d", module_name.c_str(), result.get()->result);
        });
  }

  void torqueOnAll()
  {
    std_msgs::msg::String check_msg;
    check_msg.data = "check";

    dxl_torque_pub->publish(check_msg);
  }

  void torqueOff(const std::string& body_side)
  {
    robotis_controller_msgs::msg::SyncWriteItem syncwrite_msg;
    int torque_value = 0;
    syncwrite_msg.item_name = "torque_enable";

    if(body_side == "right")
    {
      syncwrite_msg.joint_name.push_back("r_sho_pitch");
      syncwrite_msg.value.push_back(torque_value);
      syncwrite_msg.joint_name.push_back("r_sho_roll");
      syncwrite_msg.value.push_back(torque_value);
      syncwrite_msg.joint_name.push_back("r_el");
      syncwrite_msg.value.push_back(torque_value);
    }
    else if(body_side == "left")
    {
      syncwrite_msg.joint_name.push_back("l_sho_pitch");
      syncwrite_msg.value.push_back(torque_value);
      syncwrite_msg.joint_name.push_back("l_sho_roll");
      syncwrite_msg.value.push_back(torque_value);
      syncwrite_msg.joint_name.push_back("l_el");
      syncwrite_msg.value.push_back(torque_value);
    }
    else
      return;

    sync_write_pub->publish(syncwrite_msg);
  }
  ```

- Code Explanation  
  The `main ()` function checks if the `/op3_manager` node is running. Otherwise, wait for it to run.  

  ```cpp  
  // wait for starting of op3_manager
  std::string manager_name = "/op3_manager";
  while (ros::ok())
  {
    ros::Duration(1.0).sleep();

    if (checkManagerRunning(manager_name) == true)
    {
      break;
      ROS_INFO_COND(DEBUG_PRINT, "Succeed to connect");
    }
    ROS_WARN("Waiting for op3 manager");
  }
  ```

  If `/op3_manager` is running, take the initial posture for the demo and process the topic and service.  

  ```cpp
  readyToDemo();

  //node loop
  while (ros::ok())
  {
    // process

    //execute pending callbacks
    ros::spinOnce();

    //relax to fit output rate
    loop_rate.sleep();
  }
  ```

  When the button on the back of ROBOTIS-OP3 is pressed, it is processed by the following function.   
  `mode` and `start` buttons will start demo. If you press `user` button, torque of all joint will be turned on.  
  Before starting the demo, the `readyToDemo()` function uses `SyncWriteItem` to turn off the right arm torque.  

  ```cpp
  void buttonHandlerCallback(const std_msgs::String::ConstPtr& msg)
  {
    // starting demo using robotis_controller
    if (msg->data == "mode")
    {
      control_module = Framework;
      ROS_INFO("Button : mode | Framework");
      readyToDemo();
    }
    // starting demo using direct_control_module
    else if (msg->data == "start")
    {
      control_module = DirectControlModule;
      ROS_INFO("Button : start | Direct control module");
      readyToDemo();
    }
    // torque on all joints of ROBOTIS-OP3
    else if (msg->data == "user")
    {
      torqueOnAll();
      control_module = None;
    }
  }
  ```  

  If `op3_manager` receives the present value of the joint, it is processed by the following function according to demo mode.  
  Create a JointState message with the value of the left arm joint created by mirroring the value of the right arm joint, and pass it to the `op3_manager` as a topic based on each demo.  

  ```cpp
  void jointstatesCallback(const sensor_msgs::JointState::ConstPtr& msg)
  {
    if(control_module == None)
      return;

    sensor_msgs::JointState write_msg;
    write_msg.header = msg->header;

    for(int ix = 0; ix < msg->name.size(); ix++)
    {
      std::string joint_name = msg->name[ix];
      double joint_position = msg->position[ix];

      // mirror and copy joint angles from right to left
      if(joint_name == "r_sho_pitch")
      {
        write_msg.name.push_back("r_sho_pitch");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_sho_pitch");
        write_msg.position.push_back(-joint_position);
      }
      if(joint_name == "r_sho_roll")
      {
        write_msg.name.push_back("r_sho_roll");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_sho_roll");
        write_msg.position.push_back(-joint_position);
      }
      if(joint_name == "r_el")
      {
        write_msg.name.push_back("r_el");
        write_msg.position.push_back(joint_position);
        write_msg.name.push_back("l_el");
        write_msg.position.push_back(-joint_position);
      }
    }

    // publish a message to set the joint angles
    if(control_module == Framework)
      write_joint_pub.publish(write_msg);
    else if(control_module == DirectControlModule)
      write_joint_pub2.publish(write_msg);
  }
  ```


[op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager
[Robot Information file(.robot)]: /docs/en/software/robotis_framework_packages/tutorials/#robot-information-file-robot
[Joint initialize file(.yaml)]: /docs/en/software/robotis_framework_packages/tutorials/#joint-initialize-file-yaml
[How to use offset tuner]: /docs/en/platform/op3/tutorials/#how-to-use-offset-tuner
[Installing ROBOTIS ROS Package]: /docs/en/platform/op3/recovery/#installing-robotis-ros-packages

[op3_demo]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-demo
[op3_gui_demo]: /docs/en/platform/op3/robotis_ros_packages/#op3-gui-demo
[How to use walking tuner]: /docs/en/platform/op3/tutorials/#how-to-use-walking-tuner


[op3_action_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-action-module
[How to create the motions]: /docs/en/platform/op3/tutorials/#how-to-create-the-motions

[op3_head_control_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-head-control-module

[Introduction to Humanoid Robotics]: http://www.springer.com/gp/book/9783642545351

[op3_online_walking_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-online-walking-module
[Online walking using footstep planner]: /docs/en/platform/op3/tutorials/#how-to-control-upgraded-walking-using-footstep-planner

[op3_offset_tuner_server]: /docs/en/platform/op3/robotis_ros_packages/#op3-offset-tuner-server
[op3_offset_tuner_client]: /docs/en/platform/op3/robotis_ros_packages/#op3-offset-tuner-client

[op3_tuning_module]: /docs/en/platform/op3/robotis_ros_packages/#op3-tuning-module
[op3_tuner_client]: /docs/en/platform/op3/robotis_ros_packages/#op3-tuner-client

[op3_how_to_control_upgraded_walking]: /docs/en/platform/op3/tutorials/#how-to-control-upgraded-walkingonline-walking

[humanoid_navigation]: /docs/en/platform/common/humanoid_navigation/#humanoid-navigation
[How to run op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager

[Face Tracker - `branch:jazzy-devel`]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-ETC/tree/jazzy-devel/face_detection
[ROBOT WEB TOOL]: https://robotwebtools.github.io/
[web_video_server - ros2]: https://github.com/RobotWebTools/web_video_server  
[rosbridge_suite - ros2]: https://github.com/RobotWebTools/rosbridge_suite
[How to connect]: /docs/en/platform/op3/quick_start/#example--ssh-client-for-windows
[detail of parameter]: /docs/en/platform/op3/tutorials/#how-to-use-ball-detector
[read_write.cpp `branch:jazzy-devel`]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo/blob/jazzy-devel/op3_read_write_demo/src/read_write.cpp

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/tutorials_rev2.md %}
</section>
