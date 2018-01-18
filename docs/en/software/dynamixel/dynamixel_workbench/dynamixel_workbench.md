---
layout: archive
lang: en
ref: dynamixelworkbench
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_workbench/dynamixel_workbench/
sidebar:
  title: DYNAMIXEL-Workbench
  nav: "dynamixel_workbench"
---

# [Introduction](#introduction)

![](/assets/images/sw/dynamixel/dynamixel_workbench/dynamixel_workbench_intro.jpg)

The **Dynamixel Workbench** metapackage contains four packages: **Single Manager**, **Controllers**, **Operators**, and **Toolbox**. The ***Single Manager*** package provides a program that can manage the entire Dynamixel series, including Dynamixel, Dynamixel X, and Dynamixel PRO, using the ***Toolbox*** library developed on the basis of [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). These packages not only show the status of Dynamixel, but also allow you to change Control Table address values via command line or GUI interface. The ***Controllers*** package introduces how to employ the Dynamixel on different operating mode with Dynamixel Workbench library(***Toolbox***).  In addition, the ***Operators*** demonstrates some straightforward examples by operating ***Controllers***.

[ROS WIKI](http://wiki.ros.org/dynamixel_workbench)

# [Installation](#installation)

  **Main package**

  ```
  $ sudo apt-get install ros-kinetic-dynamixel-workbench
  $ sudo apt-get install ros-kinetic-dynamixel-workbench-msgs
  ```
  or

  ```
  $ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
  $ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
  ```

  **Dependent package**

  ```
  $ sudo apt-get install ros-kinetic-dynamixel-sdk
  $ sudo apt-get install ros-kinetic-qt-build
  ```

# [Supported Dynamixels](#supported-dynamixels)

| Dynamixel Series |               |                   |                   |                     |               |
| ---------------- | ------------- | ----------------- | ----------------- | ------------------- | ------------- |
| **AX**           | AX-12W        | AX-12+/12A        | AX-18F/18A        |
| **RX**           | RX-10         | RX-24F            | RX-28             | RX-64               |
| **EX**           | EX-106+       |
| **MX**           | MX-12W        | MX-28, MX-28(2.0) | MX-64, MX-64(2.0) | MX-106, MX-106(2.0) |
| **XL**           | XL320         | XL430-W250        |
| **XM**           | XM430-210     | XM430-W350        | XM540-W210        | XM540-W270          |
| **XH**           | XH430-W210    | XH430-W350        | XH430-V210        | XH430-V350          |
| **PRO-L**        | L42-10-S300-R | L54-30-S500-R     | L54-30-S400-R     | L54-50-S500-R       | L54-50-S290-R |
| **PRO-M**        | M42-10-S260-R | M54-40-S250-R     | M54-60-S250-R     |
| **PRO-H**        | H42-20-S300-R | H54-100-S500-R    | H54-200-S500-R    |

# [Package Description](#package-description)

## [Single Manager](#single-manager)

* dynamixel_workbench_single_manager - Check Dynamixel status and access Dynamixel's Control Table addresses via **command line**.
 
1. Nodes

    1. dynamixel_monitor - To show states of a Dynamixel by topic messages
        1. Messages
            * /dynamixel/(model_name) - Provides states of connected Dynamixel

        1. Services
            * /dynamixel/info - Provides information about connected Dynamixel
            * /dynamixel/command - Receive command to control Dynamixel
              
    1. dynamixel_controller - To change the Dynamixel's address value through command line
          1. Messages
            
          1. Services
              * /dynamixel/info - Get information about connected Dynamixel
              * /dynamixel/command - Send command to control Dynamixel
          
* dynamixel_workbench_single_manager_gui - Check Dynamixel status and access Dynamixel's Control Table addresses via **GUI**.

![](/assets/images/sw/dynamixel/dynamixel_workbench/single_manager_gui.jpg)

1. Nodes

    1. dynamixel_workbench_single_manager_gui - To manage and represent states of a Dynamixels and change their address value through GUI
        1. Messages
            * /dynamixel/(model_name) - Take states of connected Dynamixel

        1. Services
            * /dynamixel/info - Get information about connected Dynamixel
            * /dynamixel/command - Send command to control Dynamixel          

## [Controllers](#controllers) 

 * dynamixel_workbench_controllers - Contains 3 different controllers(Position, Velocity, Torque) and Multi port example that demonstrate how to control the Dynamixels

1. Nodes

    1. position_control - Dynamixel position control example using Dynamixel Workbench library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). 
        1. Messages
            * /dynamixel_state - Provides states of connected Dynamixels

        1. Services
            * /joint_command - Command to change the angle
              
    1. velocity_control - Dynamixel velocity control example using Dynamixel Workbench library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). 
        1. Messages
            * /dynamixel_state - Provides states of connected Dynamixels
        1. Services
            * /wheel_command - Command to change the speed
            

    1. torque_control - Dynamixel torque control example using Dynamixel Workbench library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). **Note: This packages only supports XM430-W350-R**
        1. Messages
            * /dynamixel_state - Provides states of connected Dynamixels
        1. Services
            * /joint_command - Command to change the angle

    1. multi_port - Dynamixel multi-port example using Dynamixel Workbench library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). 
        1. Messages
            * /dynamixel_state - Provides states of connected Dynamixels
            
        1. Services
            * /joint_command - Command to change the angle  

## [Operators](#operators)

 * dynamixel_workbench_operators - Contains **Joint Operator** and **Wheel Operator**. Operators make commands for ***Controllers***.

1. Nodes

    1. joint_operator - Command Dynamixels to move to a specific position
        1. Messages
            
        1. Services
            * /joint_command - Command to change the angle  

    1. wheel_operator - Give Dynamixels to rotate to a specific velocity
        1. Messages
            
        1. Services
            * /wheel_command - Command to change the velocity  

## [Toolbox](#toolbox) 

 * dynamixel_workbench_toolbox - This package is composed of ***dynamixel_item***, ***dynamixel_tool***, ***dynamixel_driver***, and ***dynamixel_workbench*** class. The ***dynamixel_item*** is saved control table item and information of Dynamixels. The ***dynamixel_tool*** class loads its by model name of Dynamixels. The ***dynamixel_driver*** class includes wraped function used in DYNAMIXEL SDK. ***dynamixel_workbench*** class makes simple to use Dynamixels.

1. Library
    1. dynamixel_driver
        1. Function Reference
            * init(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600) - Set connected device name and baudrate of Dynamixels

            * setPortHandler(const char *device_name) - Set Port Handler

            * setPacketHandler(void) - Set PacketHandlers(1.0, 2.0)
            
            * setPacketHandler(float protocol_version) - Set PacketHandler

            * setBaudrate(uint32_t baud_rate) - Set baudrate

            * getProtocolVersion(void) - Return protocol version
 
            * getBaudrate(void) - Return baudrate
   
            * getModelName(uint8_t id) - Return model name
      
            * getModelNum(uint8_t id) - Return model number
       
            * getControlItemPtr(uint8_t id) - Return pointer of control table item
            
            * getTheNumberOfItem(uint8_t id) - Return the number of loaded control table item

            * scan(uint8_t *get_id, uint8_t *get_id_num, uint8_t range = 200) - Scan Dynamixels
            
            * ping(uint8_t id, uint16_t *get_model_number) - Ping a Dynamixel

            * reboot(uint8_t id) - Reboot a Dynamixel

            * reset(uint8_t id) - Reset a Dynamixel

            * writeRegister(uint8_t id, const char *item_name, int32_t data) - Write data in address (item)

            * readRegister(uint8_t id, const char *item_name, int32_t *data) - Read data in address (item)

            * addSyncWrite(const char *item_name) - Add sync write handler

            * syncWrite(const char *item_name, int32_t *data) - Write synchronize data in address (item)

            * addSyncRead(const char *item_name) - Add sync read handler
         
            * syncRead(const char *item_name, int32_t *data) - Read synchronize data in address (item)

            * initBulkWrite() - Initialize bulk write handler
          
            * addBulkWriteParam(uint8_t id, const char *item_name, int32_t data) - Add parameter for bulk write
         
            * bulkWrite() - Write bulk data in address (item)

            * initBulkRead() - Initialize bulk read handler
         
            * addBulkReadParam(uint8_t id, const char *item_name) - Add parameter for bulk read
          
            * sendBulkReadPacket() - Send packet for bulk read
          
            * bulkRead(uint8_t id, const char *item_name, int32_t *data) - Read bulk data in address (item)

            * convertRadian2Value(uint8_t id, float radian) - Convert radian to value
          
            * convertValue2Radian(uint8_t id, int32_t value) - Convert value to radian

            * convertVelocity2Value(uint8_t id, float velocity) - Convert velocity to value
          
            * convertValue2Velocity(uint8_t id, int32_t value) - Convert value to velocity

            * convertTorque2Value(uint8_t id, float torque) - Convert torque to value
            
            * convertValue2Torque(uint8_t id, int16_t value) - Convert value to torque

    1. dynamixel_workbench
        1. Function Reference
            * begin(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600) - Set connected device name and baudrate of Dynamixels

            * scan(uint8_t *get_id, uint8_t *get_id_num = 0, uint8_t range = 200) - Scan Dynamixels

            * ping(uint8_t id, uint16_t *get_model_number = 0) - Ping a Dynamixel

            * reboot(uint8_t id) - Reboot a Dynamixel

            * reset(uint8_t id) - Reset a Dynamixel

            * setID(uint8_t id, uint8_t new_id) - Set new id

            * setBaud(uint8_t id, uint32_t new_baud) - Set new baudrate

            * setPacketHandler(float protocol_version) - Set new packet handler

            * getModelName(uint8_t id) - Get model name

            * ledOn(uint8_t id) - LED On

            * ledOff(uint8_t id) - LED off

            * jointMode(uint8_t id, uint16_t vel = 0, uint16_t acc = 0) - Set joint mode

            * wheelMode(uint8_t id, uint16_t vel = 0, uint16_t acc = 0) - Set wheel mode

            * currentMode(uint8_t id, uint8_t cur = 50) - Set current mode

            * goalPosition(uint8_t id, uint16_t goal) - Send position data

            * goalSpeed(uint8_t id, int32_t goal) - Send velocity data

            * itemWrite(uint8_t id, const char* item_name, int32_t value) - Write data in address

            * syncWrite(const char *item_name, int32_t* value) - Write synchronize data in address

            * bulkWrite(void) - Write data in address - Write bulk data in address

            * itemRead(uint8_t id, const char* item_name) - Read data in address

            * syncRead(const char* item_name) - Read synchronize data in address

            * bulkRead(uint8_t id, const char* item_name) - Read bulk data in address

            * addSyncWrite(const char* item_name) - Add sync write handler

            * addSyncRead(const char* item_name) - Add sync read handler

            * initBulkWrite() - Initialize bulk write handler

            * initBulkRead() - Initialize bulk read handler

            * addBulkWriteParam(uint8_t id, const char *item_name, int32_t data) - Add bulk write parameter

            * addBulkReadParam(uint8_t id, const char *item_name) - Add bulk read parameter

            * setBulkRead() - Set bulk read parameter

            * convertRadian2Value(uint8_t id, float radian) - Convert radian to value
          
            * convertValue2Radian(uint8_t id, int32_t value) - Convert value to radian

            * convertVelocity2Value(uint8_t id, float velocity) - Convert velocity to value
          
            * convertValue2Velocity(uint8_t id, int32_t value) - Convert value to velocity

            * convertTorque2Value(uint8_t id, float torque) - Convert torque to value
            
            * convertValue2Torque(uint8_t id, int16_t value) - Convert value to torque
            
# [Tutorials](#tutorials)

## [Single Manager Tutorials](#single-manager-tutorials)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

### [Command line](#command-line)

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Create a launch file for the single manager node

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_single_manager*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W210**

            1. Make a launch file in ros package which we created

            ```            
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit single_manager.launch
            ```

            1. Type or Copy & Paste code below to connect dynamixel_workbench_single manager packages and set parameters
            
            ```
            <launch>
            <arg name="use_ping"         default="false"/>
            <arg name="id"               default="1"/>

            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="57600"/>

            <arg name="scan_range"       default="10"/>

            <param name="ping"             value="$(arg use_ping)"  type="bool"/>
            <param name="ping_id"          value="$(arg id)"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>

            <param name="scan_range"        value="$(arg scan_range)"/>

            <node name="single_dynamixel_monitor" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_monitor" required="true" output="screen"/>

            <node name="single_dynamixel_controller" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_controller" required="true" output="screen"/>
            </launch>
            ```

**Note :** Each Dynamixel has different default baudrate (e.g. 1000000 or 57600). Before excute the single manager, it needs to be checked the baudrate of [Dynamixel e-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/)
{: .notice--info}

            1. Before we operating this package, we need to access permission for USB device
            
            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            ```
        
        1. Launch paskage

            1. Now we can run tutorial package:
            
            ```
            $ cd ~/catkin_ws && catkin_make 
            $ roslaunch my_dynamixel_workbench_tutorial single_manager.launch
            ```

            If single_manager find linked Dynamixel, we could show state of it and command list:

            ```
            [ID] 1, [Model Name] XM430-W210, [BAUD RATE] 57600 [VERSION] 2.0
            dynamixel_workbench_single_manager : Init Success!

            ----------------------------------------------------------------------
            Single Manager supports GUI (dynamixel_workbench_single_manager_gui)  
            ----------------------------------------------------------------------
            Command list :
            [help|h|?].........: help
            [info].............: information of a Dynamixel
            [table]............: check a control table of a Dynamixel
            [torque_on]........: torque on Dynamixel
            [torque_off].......: torque off Dynamixel
            [goal].............: set data to goal position address ex) goal 1024
            [id]...............: change id ex) id 3
            [baud].............: change baud rate ex) baud 57600
            [version]..........: change protocol version ex) version 2.0
            [reboot]...........: reboot a Dynamixel(only protocol version 2.0)
            [reset]............: command for all data back to factory settings values
            [table_item].......: change address value of a Dynamixel ex) Goal_Position 1024
            [exit].............: shutdown
            ----------------------------------------------------------------------
            Press Enter Key To Command A Dynamixel
            [CMD]
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixel through /dynamixel/[motor_name] topic:

            ```
            $ rostopic echo /dynamixel/[motor_name]
            ```

            For example:

            ```
            Model_Number: 1030
            Firmware_Version: 40
            ID: 1
            Baud_Rate: 1
            Return_Delay_Time: 250
            Drive_Mode: 0
            Operating_Mode: 1
            Secondary_ID: 255
            Protocol_Version: 2
            Homing_Offset: 0
            Moving_Threshold: 10
            Temperature_Limit: 80
            Max_Voltage_Limit: 160
            Min_Voltage_Limit: 95
            PWM_Limit: 885
            Current_Limit: 32767
            Acceleration_Limit: 32767
            Velocity_Limit: 480
            Max_Position_Limit: 4095
            Min_Position_Limit: 0
            Shutdown: 1
            Torque_Enable: 0
            LED: 0
            Status_Return_Level: 2
            Registered_Instruction: 0
            Hardware_Error_Status: 0
            Velocity_I_Gain: 1920
            Velocity_P_Gain: 100
            Position_D_Gain: 0
            Position_I_Gain: 0
            Position_P_Gain: 800
            Feedforward_2nd_Gain: 0
            Feedforward_1st_Gain: 0
            Bus_Watchdog: 0
            Goal_PWM: 885
            Goal_Current: 1193
            Goal_Velocity: 480
            Profile_Acceleration: 0
            Profile_Velocity: 0
            Goal_Position: 2320
            Realtime_Tick: 30351
            Moving: 0
            Moving_Status: 0
            Present_PWM: 0
            Present_Load: 0
            Present_Current: -3
            Present_Velocity: 0
            Present_Position: 2320
            Velocity_Trajectory: 0
            Position_Trajectory: 2320
            Present_Input_Voltage: 121
            Present_Temperature: 28
            ```

        1. Send command to Dynamixel

            We operate a Dynamixel using command. Address names can be checked published message or using table command. If user wants to specific information about control table of a Dynamixel, please follow the link [E-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/). **NOTE: BEFORE YOU COMMAND, YOU NEED TO PRESS ENTER KEY**

            ```
            [CMD]torque_on
            [CMD]goal 2048
            ```

            The Dynamixel is running!! If you have a question about running single_manager, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [GUI](#gui)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Create a launch file for the single monitor node

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_single_manager*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W210**

            1. Make a launch file in ros package which we created

            ```            
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit single_monitor.launch
            ```

            1. Type or Copy&Paste code below to connect dynamixel_workbench_single manager packages and set parameters
            
            ```
            <launch>
            <arg name="use_ping"         default="false"/>
            <arg name="id"               default="1"/>

            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="57600"/>

            <arg name="scan_range"       default="200"/>

            <param name="ping"             value="$(arg use_ping)"  type="bool"/>
            <param name="ping_id"          value="$(arg id)"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>

            <param name="scan_range"        value="$(arg scan_range)"/>

            <node name="single_dynamixel_monitor" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_monitor" required="true" output="screen"/>
            </launch>
            ```

            **NOTE: Each Dynamixel has different default baudrate (e.g. 1000000 or 57600). Before excute the single manager, it needs to be checked the baudrate of [Dynamixel e-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/)**

        1. Launch packages

            1. Before we operating this package, we need to access permission for USB device
            
            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            ```
            1. Now we can run tutorial package:
            
            ```
            $ cd ~/catkin_ws && catkin_make 
            $ roslaunch my_dynamixel_workbench_tutorial single_monitor.launch
            ```

            If single_manager find linked Dynamixel, we could show state of it and command list:

            ```
            [ID] 1, [Model Name] XM430-W210, [BAUD RATE] 57600 [VERSION] 2.0
            dynamixel_workbench_single_manager : Init Success!
            ```

            And we run single_manager_gui:

            ```
            $ rosrun dynamixel_workbench_single_manager_gui dynamixel_workbench_single_manager_gui
            ```

            Now, GUI is opened! 

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/single_manager_gui.jpg)

            We check current states of linked Dynamixel in left window and information of it in up-right.

        1. Send command to Dynamixel

            Let's operate the Dynamixel using GUI. We easily change a ID, Operating Mode and Baudrate by seperated widget and access all address using combobox widget. If we change motor position, first we push a **Torque Enable** button. **NOTE: SOME ADDRESS VALUES CAN BE APPLIED AFTER TORQUE ON. IF YOU WANT MORE INFORMATION, PLEASE FOLLOW THE LINK [E-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/))**

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/gui_torque_enable.jpg)

            Second, we should select goal_position in combobox and turn dial, type value on line edit or push Position ZERO. 

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/gui_goal_position.jpg)

            The Dynamixel is running!! If you have a question about running single_manager_gui, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

## [Controllers Tutorials](#controllers-tutorials)

### [Position controller](#position-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare Dynamixels

            We need to prepare connected Dynamixels which are set same baudrate. In this tutorial shows pan tilt example.

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/pan_tilt_example.jpg)

        1. Create a launch file for the position control node            

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W350**

            1. Make a launch file in ros package which we created

            ```
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit position_control.launch
            ```

            1. Type or copy&paste code below to connect dynamixel_workbench_controllers packages and set parameters

            ```
            <launch>
            <arg name="device_name"                default="/dev/ttyUSB0"/>
            <arg name="baud_rate"                  default="57600"/>

            <arg name="scan_range"                 default="10"/>

            <arg name="profile_velocity"           default="200"/>
            <arg name="profile_acceleration"       default="50"/>

            <param name="device_name"              value="$(arg device_name)"/>
            <param name="baud_rate"                value="$(arg baud_rate)"/>

            <param name="scan_range"               value="$(arg scan_range)"/>

            <param name="profile_velocity"         value="$(arg profile_velocity)"/>
            <param name="profile_acceleration"     value="$(arg profile_acceleration)"/>

            <node name="position_control" pkg="dynamixel_workbench_controllers" type="position_control" required="true" output="screen"/>
            </launch>
            ```

            1. Before we operating this package, we need to access permission for USB device

            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            ```

        1. Run package

            Now we can run tutorial package:

            ```
            $ cd ~/catkin_ws && catkin_make
            $ roslaunch my_dynamixel_workbench_tutorial position_control.launch
            ```

            If position_controllers find linked Dynamixels, we could show state of it and command list and set torque on:

            ```
            -----------------------------------------------------------------------
            dynamixel_workbench controller; position control example             
            -----------------------------------------------------------------------

            MODEL   : XM430-W350
            ID      : 1

            MODEL   : XM430-W350
            ID      : 2

            -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /dynamixel_state topic:

            ```
            $ rostopic echo /dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: "XM430-W350"
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 350
                goal_position: 4004
                present_current: 0
                present_velocity: 0
                present_position: 4004
                moving: 0
            - 
                model_name: "XM430-W350"
                id: 2
                torque_enable: 1
                goal_current: 0
                goal_velocity: 350
                goal_position: 1969
                present_current: 0
                present_velocity: 0
                present_position: 1969
                moving: 0
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [id] [goal_position]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [id] [goal_position]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad 1 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 1 3000
            ```

            The pan & tilt is running!! If you have a question about running ***position_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Velocity controller](#velocity-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need two Dynamixels which are assembled common mobile platform.

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/wheel_example.jpg)

        1. Create a launch file for the velocity control node            

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W350**

            1. Make a launch file in ros package which we created

            ```
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit velocity_control.launch
            ```

            1. Type or copy&paste code below to connect dynamixel_workbench_controllers packages and set parameters

            ```
            <launch>
            <arg name="device_name"             default="/dev/ttyUSB0"/>
            <arg name="baud_rate"               default="57600"/>

            <arg name="left_wheel"              default="1"/>
            <arg name="right_wheel"             default="2"/>

            <arg name="profile_velocity"        default="200"/>
            <arg name="profile_acceleration"    default="50"/>

            <param name="device_name"           value="$(arg device_name)"/>
            <param name="baud_rate"             value="$(arg baud_rate)"/>

            <param name="left_wheel"            value="$(arg left_wheel)"/>
            <param name="right_wheel"           value="$(arg right_wheel)"/>

            <param name="profile_velocity"      value="$(arg profile_velocity)"/>
            <param name="profile_acceleration"  value="$(arg profile_acceleration)"/>

            <node name="velocity_control" pkg="dynamixel_workbench_controllers" type="velocity_control" required="true" output="screen"/>
            </launch>
            ```

            1. Before we operating this package, we need to access permission for USB device

            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            ```

        1. Run package

            Now we can run tutorial package:

            ```
            $ cd ~/catkin_ws && catkin_make
            $ roslaunch my_dynamixel_workbench_tutorial velocity_control.launch
            ```

            If velocity_controllers find linked Dynamixels, we could show state of it and command list and set torque on:

            ```
            -----------------------------------------------------------------------
            dynamixel_workbench controller; velocity control example             
            -----------------------------------------------------------------------

            MODEL   : XM430-W350
            ID      : 1

            MODEL   : XM430-W350
            ID      : 2

            -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /dynamixel_state topic:

            ```
            $ rostopic echo /dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: "XM430-W350"
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 0
                goal_position: 2050
                present_current: 0
                present_velocity: 0
                present_position: 2049
                moving: 0
            - 
                model_name: "XM430-W350"
                id: 2
                torque_enable: 1
                goal_current: 0
                goal_velocity: 0
                goal_position: 1969
                present_current: 0
                present_velocity: 0
                present_position: 1967
                moving: 0
            ```

        1. Control mobile platform

            We run the two linked Dynamixels using rosservice call or dynamixel_workbench_operators [unit : rad/sec].

            ```
            $ rosrun dynamixel_workbench_operators wheel_operator 
            ```

            Then, we can set velocity using keyboard.

            ```
            [ INFO] [1498123238.521332487]: Set angular velocity(+-0.2 rad/sec) to your Dynamixel!! by using keyboard
            [ INFO] [1498123238.521369361]: w : Forward
            [ INFO] [1498123238.521380496]: x : Backward
            [ INFO] [1498123238.521389146]: a : Left
            [ INFO] [1498123238.521397016]: d : Right
            [ INFO] [1498123238.521404724]: s : STOPS

            [ INFO] [1498123238.521414139]: ESC : exit
            ```

            Press 'w' then the mobile plaform is running!! or

            ```
            $ rosservice call /wheel_command -- [right_vel] [left_vel]
            ```

            The mobile plaform is working!!

            If you have a question about running ***velocity_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Torque controller](#torque-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}
        
**Warning :** THIS TUTORIAL ONLY SUPPORT XM430-W350-R.
{: .notice--warning}

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need to prepare connected Dynamixels which are set same baudrate. In this tutorial shows pan tilt example.

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/pan_tilt_example.jpg)

        1. Create a launch file for the torque control node            

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **3000000**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W350**

            1. Make a launch file in ros package which we created

            ```
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit torque_control.launch
            ```

            1. Type or copy&paste code below to connect dynamixel_workbench_controllers packages and set parameters

            ```
            <launch>
            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="3000000"/>

            <arg name="pan_id"           default="1"/>
            <arg name="tilt_id"          default="2"/>

            <arg name="p_gain"           default="0.003"/>
            <arg name="d_gain"           default="0.00002"/>

            <param name="device_name"    value="$(arg device_name)"/>
            <param name="baud_rate"      value="$(arg baud_rate)"/>

            <param name="pan_id"         value="$(arg pan_id)"/>
            <param name="tilt_id"        value="$(arg tilt_id)"/>

            <param name="p_gain"         value="$(arg p_gain)"/>
            <param name="d_gain"         value="$(arg d_gain)"/>

            <node name="torque_control" pkg="dynamixel_workbench_controllers" type="torque_control" required="true" output="screen"/>
            </launch>
            ```

            1. Before we operating this package, we need to access permission for USB device

            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            ```

        1. Run package

            Now we can run tutorial package:

            ```
            $ cd ~/catkin_ws && catkin_make
            $ roslaunch my_dynamixel_workbench_tutorial torque_control.launch
            ```

            If position_controllers find linked Dynamixels, we could show state of it and command list and set torque on:

            ```
            -----------------------------------------------------------------------
            dynamixel_workbench controller; torque control example               
            -----------------------------------------------------------------------

            MODEL   : XM430-W350
            ID      : 1

            MODEL   : XM430-W350
            ID      : 2

            -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /dynamixel_state topic:

            ```
            $ rostopic echo /dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: "XM430-W350"
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 350
                goal_position: 2049
                present_current: 0
                present_velocity: 0
                present_position: 2049
                moving: 0
            - 
                model_name: "XM430-W350"
                id: 2
                torque_enable: 1
                goal_current: -375
                goal_velocity: 350
                goal_position: 1967
                present_current: -19
                present_velocity: -90
                present_position: 2328
                moving: 1
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [id] [goal_position]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [id] [goal_position]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad 1 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 1 3000
            ```

            The pan & tilt is running!! If you have a question about running ***torque_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Multi port controller](#multi-port-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare Dynamixels

            We need to prepare connected Dynamixels which are set same baudrate. In this tutorial shows connected three Dynamixels.

        1. Create a launch file for the position control node            

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets device name and baudrate of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name and baudrate correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W350**

            1. Make a launch file in ros package which we created

            ```
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit multi_port.launch
            ```

            1. Type or copy&paste code below to connect dynamixel_workbench_controllers packages and set parameters

            ```
            <launch>
            <arg name="pan_device_name"      default="/dev/ttyUSB0"/>
            <arg name="pan_baud_rate"        default="57600"/>

            <arg name="tilt_device_name"      default="/dev/ttyUSB1"/>
            <arg name="tilt_baud_rate"        default="57600"/>

            <arg name="scan_range"                 default="10"/>

            <arg name="profile_velocity"           default="200"/>
            <arg name="profile_acceleration"       default="50"/>

            <param name="pan/device_name"      value="$(arg pan_device_name)"/>
            <param name="pan/baud_rate"        value="$(arg pan_baud_rate)"/>

            <param name="tilt/device_name"      value="$(arg tilt_device_name)"/>
            <param name="tilt/baud_rate"        value="$(arg tilt_baud_rate)"/>

            <param name="scan_range"               value="$(arg scan_range)"/>

            <param name="profile_velocity"         value="$(arg profile_velocity)"/>
            <param name="profile_acceleration"     value="$(arg profile_acceleration)"/>

            <node name="multi_port_example" pkg="dynamixel_workbench_controllers" type="multi_port" required="true" output="screen"/>
            </launch>
            ```

            1. Before we operating this package, we need to access permission for USB device

            ```
            $ sudo chmod a+rw /dev/ttyUSB0
            $ sudo chmod a+rw /dev/ttyUSB1
            ```

        1. Run package

            Now we can run tutorial package:

            ```
            $ cd ~/catkin_ws && catkin_make
            $ roslaunch my_dynamixel_workbench_tutorial multi_port.launch
            ```

            If multi_controllers find linked Dynamixels, we could show state of it and command list and set torque on:

            ```
            -----------------------------------------------------------------------
            dynamixel_workbench controller; multi port example                    
            -----------------------------------------------------------------------

            MODEL   : XM430-W350
            ID      : 1

            MODEL   : XM430-W350
            ID      : 2

            -----------------------------------------------------------------------

            MODEL   : MX-28
            ID      : 1

            -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /dynamixel_state topic:

            ```
            $ rostopic echo /dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: "XM430-W350"
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 0
                goal_position: 2050
                present_current: 0
                present_velocity: 0
                present_position: 2049
                moving: 0
            - 
                model_name: "XM430-W350"
                id: 2
                torque_enable: 1
                goal_current: 0
                goal_velocity: 0
                goal_position: 1765
                present_current: 0
                present_velocity: 0
                present_position: 1765
                moving: 0
            - 
                model_name: "MX-28"
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 0
                goal_position: 698
                present_current: 0
                present_velocity: 0
                present_position: 698
                moving: 0
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [id] [goal_position]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [id] [goal_position]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad 1 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 1 3000
            ```

            The Dynamixel is running!! If you have a question about running ***multi_port***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).