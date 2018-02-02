### 1. Overview   
This chapter explains how to play basic demonstrations of OP3.
There are three available demos; playing soccer, vision and sequence of various actions.
> Reference : [op3_demo]

### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  

#### 2.2 Run
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

#### 2.3 Execution result
Dynamixels of ROBOTIS-OP3 will be powered and take the initial posture.  





### 3. Description
#### 3.1 Button Functions
From the left, each button is assigned for Mode, Start, User and Reset.  
  - Mode button
    - short press : In Ready Mode, mode button switches to the next demo(soccer → vision → action)
    - long press : While demo is running, press and hold the mode button to switch to Ready Mode.  

  - Start button
    - short press : Play selected demo from Ready Mode. If demo is running, start button will pause or resume demo.  

  - User button

  - Reset button
    - Reset button will cut off the power to all Dynamixel.

#### 3.2 Soccer Demo
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


#### 3.3 Vision Demo
1. How to Play
Press the mode button twice from demonstration ready mode to switch to vision processing mode, then play vision demo by pressing the start button.
  (ROBOTIS-OP3 will announce "Vision processing mode" and green LED in the back will be lit.)  
  When the demo begins, ROBOTIS-OP3 will announce "Start vision processing demonstration" and stand up to search for a face.  
  If a face is detected, RGB-LED on the chest and back turns into white color and OP3's head will follow the detected face.  
    > Reference : [Face Tracker - ROS Package]


2. Return to Demonstration Ready Mode  
  Pressing and holding the mode button for 3 seconds will make ROBOTIS-OP3 to take the initial posture and return to Demonstration ready mode.  


#### 3.4 Action Demo
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




[&lt;&lt; Back](OP3-User's-Guide.md)

[op3_demo]:[op3_demo.md]
[How to use walking tuner]:[OP3-How-to-use-walking-tuner.md]
[Face Tracker - ROS Package]:https://github.com/ROBOTIS-GIT/face_detection
