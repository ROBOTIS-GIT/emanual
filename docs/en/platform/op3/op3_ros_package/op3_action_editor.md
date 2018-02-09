### 1. Overview   
ROBOTIS-OP3 Action Editor Node   
This chapter explains how to create and edit action file used in the [op3_action_module] of ROBOTIS-OP3.   

#### 1.1 Action File
The action file contains ROBOTIS-OP3’s poses and time data. The current position describes positions of Dynamixels which converted from actual Dynamixel resolution to 4095 resolution. The action file is written as binary file so users can read its contents with op3_action_editor. ROBOTIS currently provides a default action file with source code. It is located in "op3_action_module/data" directory.  

The action file contains 256 pages. Each page can store up to 7 stages (or steps) of action data. The default action file does not use all pages and user can add own actions by writing them on the empty page.   


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package]  

#### 2.2 Run
Execute the launch file.  
 `op3_action_editor` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_offset_tuner` and `op3_walking_tuner` should not be running.  
Before executing the `op3_action_editor` launch file, other programs should be terminated.  
```
$ roslaunch op3_action_editor op3_action_editor.launch
```  

#### 2.3 UI

![](/assets/images/platform/op3/thormang3_action_editor_tui.jpg)

**Page number**: Page number is the listed page number. If user wants to create a new action poses, user can use any empty page.  
**Page title**: ROBOTIS recommends user to use a page title when creating a new action on an empty page.  
**Current position**: The current position describes position of Dynamixel which converted from actual Dynamixel resolution to 4095 resolution. This data is represented by STP7 in op3_action_editor. Sometimes the position may be read as ---- in op3_action_editor. This means position of the Dynamixel has not been read (or torque is off).
If user turns the Dynamixel off, current position cannot be read until turn it back on.
User can turn off the torque of specific Dynamixels. This is very convenient when acquiring position values directly from Dynamixels for a new robot posture instead of calculating those values. To do that, turn off the torque of desired Dynamixels, then make a posture and hold the robot joint by hand until turn the torque back on. The robot will be remaining at current posture and user can read position values of corresponding Dynamixels.  
**Steps or stages**: Each page can store up to 7 steps, from STP0 to STP6. However, some actions may be required more than 7 stages to perform completely. This can be resolved by simply using multiple pages and link them with “Next”.  
**Next**: “Next” indicates whether to continue action on a different page. To continue actions, just list the page number where the action is to be continued. Number 0 indicates that action does not continue onto another page (default value). Linking page does not have to have the numerical order.  
**Play Count**: “Play Count” is the number of times the action of the page is to be played.  
**Exit**: There might be some cases when an action has to be stopped. In these cases, the robot may be in unstable position. “Exit” is much like "Next", so "Exit" should be linked to a page where ROBOTIS-OP3 can return to a stable pose. If "Exit" is 0, it means that there is no linked exit page (default value).  
Tip: When calling an action requires multiple pages, ROBOTIS strongly suggests user to call the action from the starting page. For example, “clap” starts at page 7 and ends at page 8. This means you should call page 7 when calling “clap.” Calling the page 8 may cause unexpected behavior of the robot.  
**STP7**: "STP7" column is the current position of the Dynamixel which converted to 4095 resolution from its original resolution. "----" means that torque has been released.  
**PauseTime**: "PauseTime" is the pause duration period for motion playback for step STP[x].  
**Time(x 8msec)** : "Time" is the time period for ROBOTIS-OP3 to complete step STP[x]. Each time unit account for 8ms of time.  

It is strongly advised that when user tests user’s own newly-created or edited actions, there should be small incremental changes in position, speed/time, and pause values for the sake of ROBOTIS-OP3's stability.  


#### 2.4 The Contents of The Default Action File
The below table shows the contents of the default action file.  

| page number | page title | brief description of page                             | number of pages |
|-------------|------------|-------------------------------------------------------|-----------------|
|      1      | walki_init | initial standing pose                                 |        1        |
|      2      |    hello   | greeting                                              |        1        |
|      3      |  thank_you | Thank you                                             |        1        |
|      4      |     yes    | yes                                                   |        1        |
|      5      |      no    | no                                                    |        1        |
|      6      |  fighting  | fighting                                              |        1        |
|      7      |    clap    | clap                                                  |        2        |
|      9      |   S_H_RE   | ready for shaking hands                               |        1        |
|     10      |     S_H    | shaking hands                                         |        1        |
|     11      |   S_H_END  | move to initialpose fram ready pose for shaking hands |        1        |
|     12      |  scanning  | looking around                                        |        1        |
|     13      |  ceremony  | ceremony                                              |        1        |


#### 2.5 Basic Command of Action Editor
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
**on/off [index1] [index2] [index3] …** : turns torque on/off from ID[index1] ID[index2] ID[index3]. For example off 20 releases torque from ID20. Notice that STP7 for ID20 will read [----]. Typing on 20 turns torque from ID20 on again and the screen outputs the current position data of ID20.  



#### 2.6 Example Action editing with op3_action_editor
1) Run the op3_action_editor  
2) Find the page where the "walking_init page" is by typing "list"  
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example1.jpg)

3) Exit the list and go to any blank page by typing "page [x]"(for example, page 15).
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example2.jpg)

4) And copy the page 1 to page [x].  
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example3.jpg)

3) Go to "walking_init" pose by typing "play"  

5) Turn off the torque of ID 2, 4 and 8 by typing "off 2 4 8"  
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example4.jpg)

6) After getting the desired pose turn torque on again by simple typing on. And insert the pose to step 1 by typing "i 1"  
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example5.jpg)

7) Edit "Pause Time", "Time" of STP1 and "Page Step" as shown below.  
  ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example6.jpg)

8) Type "play" and check the ROBOTIS-OP3's action  


[&lt;&lt; Back]


[op3_action_module]:[op3_action_module]
[&lt;&lt; Back]:[robotis_op3_tools.md]

[Installing ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md
