---
layout: archive
lang: en
ref: dynamixelworkbench
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_workbench/dynamixel_workbench/
sidebar:
  title: Dynamixel-Workbench
  nav: "dynamixel_workbench"
---

# [Introduction](#introduction)

![](/assets/images/sw/dynamixel/dynamixel_workbench/dynamixel_workbench_intro.jpg)

The **Dynamixel Workbench** metapackage contains four packages: **Single Manager**, **Controllers**, **Operators**, and **Toolbox**. The ***Single Manager*** package provides a program that can manage the entire Dynamixel series, including Dynamixel, Dynamixel X, and Dynamixel PRO, using the ***Toolbox*** library developed on the basis of [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). These packages not only show the status of Dynamixel, but also allow you to change Control Table address values via command line or GUI interface. The ***Controllers*** package introduces how to employ the Dynamixel on different operating mode with ***Toolbox*** library.  In addition, the ***Operators*** demonstrates some straightforward examples by operating ***Controllers***.

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

| Dynamixel Series |                |                |                |               |               |
| ---------------- | -------------- | -------------- | -------------- | ------------- | ------------- |
| **AX**           | AX-12W         | AX-12/12+/12A  | AX-18F/18A     |
| **RX**           | RX-10          | RX-24F         | RX-28          | RX-64         |
| **EX**           | EX-106+        |
| **MX**           | MX-12W         | MX-28T/R/AT/AR | MX-64T/R/AT/AR | MX-106T/R     |
| **XL**           | XL430-W250     |
| **XM**           | XM430-210-T/R  | XM430-W350-T/R |
| **XH**           | XH430-W210-T/R | XH430-W350-T/R | XH430-V210     | XH430-V350    |
| **PRO-L**        | L42-10-S300-R  | L54-30-S500-R  | L54-30-S400-R  | L54-50-S500-R | L54-50-S290-R |
| **PRO-M**        | M42-10-S260-R  | M54-40-S250-R  | M54-60-S250-R  |
| **PRO-H**        | H42-20-S300-R  | H54-100-S500-R | H54-200-S500-R |

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

    1. position_control - Dynamixel position control example using ***toolbox*** library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). Two common Dynamixel series which set by position control mode are commanded by joint_operator.
        1. Messages
            * /position_control/dynamixel_state - Provides states of two Dynamixels

        1. Services
            * /joint_command - Command to change the angle
            
        1. Parameters
            * /profile_velocity - Command to change the profile velocity
            * /profile_acceleration - command to change the profile acceleration
              
    1. velocity_control - Dynamixel velocity control example using ***toolbox*** library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). Two common Dynamixel series which set by velocity control mode are commanded by wheel_operator.
        1. Messages
            * /velocity_control/dynamixel_state - Provides states of two Dynamixels
        1. Services
            * /wheel_command - Command to change the speed
            

    1. torque_control - Dynamixel torque control example using ***toolbox*** library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). Two Dynamixels which set by torque control mode are commanded by joint_operator. **Note: This packages only supports XM430-W350-R**
        1. Messages
            * /torque_control/dynamixel_state - Provides states of two Dynamixels
        1. Services
            * /joint_command - Command to change the angle
        1. Parameters
            * /p_gain - Command to change the p gain
            * /d_gain - command to change the d gain

    1. velocity_control - Dynamixel multi-port example using ***toolbox*** library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). Two Dynamixels which set by position control mode are commanded by joint_operator.
        1. Messages
            * /multi_port/pan_state - Provides states of a Dynamixel
            * /multi_port/tilt_state - Provides states of a Dynamixel
            
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

 * dynamixel_workbench_toolbox - This package is composed of ***dynamixel_tool***, ***dynamixel_driver*** and ***dynamixel_multi_driver*** class. The ***dynamixel_tool*** class loads the information of Dynamixel stored in '.device' files. The ***dynamixel_driver*** class which is based on dynamixel_sdk provides functions to control an Dynamixel. The ***dynamixel_multi_driver*** class which is inherited by ***dynamixel_driver*** class provides functions to control Dynamixels.

1. Library
    1. dynamixel_tool - Library for obtaining Dynamixel information (e.g. model name, model number, baudrate and control table).
        1. Function Reference
            * DynamixelTool(uint8_t id, uint16_t model_number) - It helps find Dynamixel's information using id, model_number

            * DynamixelTool(uint8_t id, std::string model_name) - It helps find  Dynamixel's information using id, model_name

            * bool getModelName(uint16_t model_number) - It helps find model name using model_number

            * bool getModelPath() - It finds model information file(~.device) path

            * bool getModelItem() - It arranges model information in model information file(~.device)

            For example of model information(~.device):

            ```
            [device info]
            model_number = 1030
            model_name  = XM430_W210_R

            [type info]
            torque_to_current_value_ratio   = 235.53647082
            velocity_to_value_ratio 	= 41.71

            value_of_0_radian_position      = 2048
            value_of_min_radian_position    = 0
            value_of_max_radian_position    = 4095
            min_radian                      = -3.14159265
            max_radian                      =  3.14159265

            [baud rate]
            # baud rate | value
            9600        | 0
            57600       | 1
            115200      | 2
            1000000     | 3
            2000000     | 4
            3000000     | 5
            4000000     | 6
            4500000     | 7

            [control table]
            # addr | item name                | length | access | memory
            0   | model_number             | 2      | R      | EEPROM
            6   | version_of_firmware      | 1      | R      | EEPROM
            7   | id                       | 1      | RW     | EEPROM
            8   | baud_rate                | 1      | RW     | EEPROM
            9   | return_delay_time        | 1      | RW     | EEPROM
            11  | operating_mode           | 1      | RW     | EEPROM
            13  | protocol_version         | 1      | RW     | EEPROM
            20  | homing_offset            | 4      | RW     | EEPROM
            24  | moving_threshold         | 4      | RW     | EEPROM
            31  | max_temperature_limit    | 1      | RW     | EEPROM
            32  | max_voltage_limit        | 2      | RW     | EEPROM
            34  | min_voltage_limit        | 2      | RW     | EEPROM
            36  | pwm_limit                | 2      | RW     | EEPROM
            38  | current_limit            | 2      | RW     | EEPROM
            40  | acceleration_limit       | 4      | RW     | EEPROM
            44  | velocity_limit           | 4      | RW     | EEPROM
            48  | max_position_limit       | 4      | RW     | EEPROM
            52  | min_position_limit       | 4      | RW     | EEPROM
            63  | shutdown                 | 1      | RW     | EEPROM
            64  | torque_enable            | 1      | RW     | RAM
            65  | led                      | 1      | RW     | RAM
            68  | status_return_level      | 1      | RW     | RAM
            69  | registered_instruction   | 1      | R      | RAM
            70  | hardware_error_status    | 1      | R      | RAM
            76  | velocity_i_gain          | 2      | RW     | RAM
            78  | velocity_p_gain          | 2      | RW     | RAM
            80  | position_d_gain          | 2      | RW     | RAM
            82  | position_i_gain          | 2      | RW     | RAM
            84  | position_p_gain          | 2      | RW     | RAM
            88  | feedforward_2nd_gain     | 2      | RW     | RAM
            90  | feedforward_1st_gain     | 2      | RW     | RAM
            100 | goal_pwm                 | 2      | RW     | RAM
            102 | goal_current             | 2      | RW     | RAM
            104 | goal_velocity            | 4      | RW     | RAM
            108 | profile_acceleration     | 4      | RW     | RAM
            112 | profile_velocity         | 4      | RW     | RAM
            116 | goal_position            | 4      | RW     | RAM
            120 | realtime_tick            | 2      | R      | RAM
            122 | moving                   | 1      | R      | RAM
            123 | moving_status            | 1      | R      | RAM
            124 | present_pwm              | 2      | R      | RAM
            126 | present_current          | 2      | R      | RAM
            128 | present_velocity         | 4      | R      | RAM
            132 | present_position         | 4      | R      | RAM
            136 | velocity_trajectory      | 4      | R      | RAM
            140 | position_trajectory      | 4      | R      | RAM
            144 | present_input_voltage    | 2      | R      | RAM
            146 | present_temperature      | 1      | R      | RAM
            168 | indirect_address_1       | 2      | RW     | RAM
            224 | indirect_data_1          | 1      | RW     | RAM
            578 | indirect_address_29      | 2      | RW     | RAM
            634 | indirect_data_29         | 1      | RW     | RAM
            ```

    1. dynamixel_driver -  Library to control a Dynamixel. It is based on Dynamixel SDK.
        1. Function Reference
            * DynamixelDriver(std::string device_name, int baud_rate, float protocol_version) - It helps connect USB port and Dynamixel

            * bool setPortHandler(std::string device_name) - It helps set porthandler (device_name : /tty/USBx)

            * bool setPacketHandler(float protocol_version) - It helps set packethandler (protocol version : 1.0 or 2.0)

            * bool scan() - It helps search Dynamixel ID and make Dynamixel instance.

            * bool ping(uint8_t id) - It helps make Dynamixel instance.

            * bool reboot() - Reboot Dynamixel (It only applies protocol version 2.0)

            * bool reset() - Reset Dynamixel (ID : 1, BAUD RATE : 57600 or 1000000)

            * bool setBaudrate(uint32_t baud_rate) - It helps set baudrate

            * char* getPortName() - It helps get device name

            * float getProtocolVersion() - It helps get protocol version

            * uint32_t getBaudrate() - It helps get baudrate

            * bool writeRegister(std::string addr_name, uint32_t value) - It helps write register

            * bool readRegister(std::string addr_name, int32_t *value) - It helps read register

    1. dynamixel_multi_driver - Library to control multiple Dynamixels. It is inherited by dynamixel_driver.
        1. Function Reference
            * DynamixelMultiDriver(std::string device_name, int baud_rate, float protocol_version) - It helps connect USB port and Dynamixel

            * bool loadDynamixel(std::vector<dynamixel_driver::DynamixelInfo *> dynamixel_info) - It helps load multiple Dynamixel instances

            * bool initSyncWrite() - It helps init sync write handler

            * bool initSyncRead() - It helps init sync read handler

            * dynamixel::GroupSyncWrite* setSyncWrite(std::string addr_name) - It helps set sync write handler

            * dynamixel::GroupSyncRead* setSyncRead(std::string addr_name) - It helps set sync read handler

            * bool readMultiRegister(std::string addr_name) - It helps read multiple information about dynamixel

            * bool syncWrite{address_name}(std::vector<xxx> &xxx) - It helps write value using sync write handler

            * bool syncRead{address_name}(std::vector<xxx> &xxx) - It helps read value using sync read handler
            
# [Tutorials](#tutorials)

## [Single Manager Tutorials](#single-manager-tutorials)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

### [Command line](#command-line)

        1. Create a package

            This package contains default launch file(***single_manager.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_single_manager*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Create a launch file for the single manager node

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_single_manager*** package and sets device name, baudrate and protocol version of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name, baudrate and protocol version correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W210-R**

            1. Make a launch file in ros package which we created

            ```            
            $ cd my_dynamixel_workbench_tutorial
            $ mkdir launch
            $ cd launch
            $ gedit single_manager.launch
            ```

            1. Type or Copy&Paste code below to connect dynamixel_workbench_single manager packages and set parameters
            
            ```
            <launch>
            <arg name="use_ping"         default="false"/>
            <arg name="id"               default="1"/>

            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="57600"/>
            <arg name="protocol_version" default="2.0"/>

            <param name="ping"             value="$(arg use_ping)"  type="bool"/>
            <param name="ping_id"          value="$(arg id)"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>
            <param name="protocol_version" value="$(arg protocol_version)"/>

            <node name="single_dynamixel_monitor" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_monitor" required="true" output="screen"/>

            <node name="single_dynamixel_controller" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_controller" required="true" output="screen"/>
            </launch>
            ```

            **NOTE: Each Dynamixel has different default baudrate (e.g. 1000000 or 57600). Before excute the single manager, it needs to be checked the baudrate of [Dynamixel e-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/)**

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
            [ INFO] [1498120819.125555149]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498120819.125989319]: Succeeded to change the baudrate(57600)!
            [ INFO] [1498120819.126012342]: Scan Dynamixel(ID: 1~253) Using Protocol 2.0

            [ INFO] [1498120819.126023837]: ...wait for seconds
            [ INFO] [1498120819.158510315]: ...Succeeded to find dynamixel

            [ INFO] [1498120819.158539843]: [ID] 1, [Model Name] XM430_W210, [BAUD RATE] 57600
            [ INFO] [1498120819.160766066]: dynamixel_workbench_single_manager : Init Success!
            And press Enter key to command the Dynamixel:

            [ INFO] [1498120821.643246443]: ----------------------------------------------------------------------
            [ INFO] [1498120821.643297230]: Single Manager supports GUI (dynamixel_workbench_single_manager_gui)  
            [ INFO] [1498120821.643311697]: ----------------------------------------------------------------------
            [ INFO] [1498120821.643335297]: Command list :
            [ INFO] [1498120821.643348112]: [help|h|?]...........: help
            [ INFO] [1498120821.643363078]: [info]...............: information of a Dynamixel
            [ INFO] [1498120821.643375468]: [table]..............: check a control table of a Dynamixel
            [ INFO] [1498120821.643388111]: [torque_on]..........: torque on Dynamixel
            [ INFO] [1498120821.643399388]: [torque_off].........: torque off Dynamixel
            [ INFO] [1498120821.643410949]: [reboot].............: reboot a Dynamixel(only protocol version 2.0)
            [ INFO] [1498120821.643422932]: [factory_reset]......: command for all data back to factory settings values
            [ INFO] [1498120821.643433879]: [[table_item] [value]: change address value of a Dynamixel
            [ INFO] [1498120821.643444016]: [exit]...............: shutdown
            [ INFO] [1498120821.643458553]: ----------------------------------------------------------------------
            [ INFO] [1498120821.643466760]: Press Enter Key To Command A Dynamixel
            [ CMD ]
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixel through /dynamixel/[motor_name] topic:

            ```
            $ rostopic echo /dynamixel/[motor_name]
            ```

            For example:

            ```
            model_number: 1030
            version_of_firmware: 39
            id: 1
            baud_rate: 1
            return_delay_time: 250
            drive_mode: 0
            operating_mode: 3
            secondary_id: 255
            protocol_version: 2
            homing_offset: 0
            moving_threshold: 10
            temperature_limit: 80
            max_voltage_limit: 160
            min_voltage_limit: 95
            pwm_limit: 885
            current_limit: 1193
            acceleration_limit: 32767
            velocity_limit: 480
            max_position_limit: 4095
            min_position_limit: 0
            shutdown: 52
            torque_enable: 0
            led: 0
            status_return_level: 2
            registered_instruction: 0
            hardware_error_status: 0
            velocity_i_gain: 1920
            velocity_p_gain: 100
            position_d_gain: 0
            position_i_gain: 0
            position_p_gain: 800
            feedforward_2nd_gain: 0
            feedforward_1st_gain: 0
            bus_watchdog: 0
            goal_pwm: 885
            goal_current: 1193
            goal_velocity: 480
            profile_acceleration: 0
            profile_velocity: 0
            goal_position: 1903
            realtime_tick: 6550
            moving: 0
            moving_status: 1
            present_pwm: 0
            present_current: -3
            present_velocity: 0
            present_position: 1903
            velocity_trajectory: 0
            position_trajectory: 1903
            present_input_voltage: 120
            present_temperature: 28
            ```

        1. Send command to Dynamixel

            We operate a Dynamixel using command. Address names can be checked published message or using table command. If user wants to specific information about control table of a Dynamixel, please follow the link [E-MANUAL](http://emanual.robotis.com/docs/en/dxl/x/xm430-w210/). **NOTE: BEFORE YOU COMMAND, YOU NEED TO PRESS ENTER KEY**

            ```
            [CMD]torque_on
            [CMD]goal_position 2048
            ```

            The Dynamixel is running!! If you have a question about running single_manager, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [GUI](#gui)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            This package contains default launch file(***single_manager.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_single_manager*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Create a launch file for the single manager node

            First we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_single_manager*** package and sets device name, baudrate and protocol version of a Dynamixel. We assume that the Dynamixel is connected to **/dev/ttyUSB0** and baudrate **57600**. If not, make sure you set your device name, baudrate and protocol version correctly. **NOTE: IN THIS TUTORIAL, WE USE XM430-W210-R**

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
            <arg name="protocol_version" default="2.0"/>

            <param name="ping"             value="$(arg use_ping)"  type="bool"/>
            <param name="ping_id"          value="$(arg id)"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>
            <param name="protocol_version" value="$(arg protocol_version)"/>

            <node name="single_dynamixel_monitor" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_monitor" required="true" output="screen"/>

            <node name="single_dynamixel_controller" pkg="dynamixel_workbench_single_manager"
                    type="single_dynamixel_controller" required="true" output="screen"/>
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
            [ INFO] [1498120819.125555149]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498120819.125989319]: Succeeded to change the baudrate(57600)!
            [ INFO] [1498120819.126012342]: Scan Dynamixel(ID: 1~253) Using Protocol 2.0

            [ INFO] [1498120819.126023837]: ...wait for seconds
            [ INFO] [1498120819.158510315]: ...Succeeded to find dynamixel

            [ INFO] [1498120819.158539843]: [ID] 1, [Model Name] XM430_W210, [BAUD RATE] 57600
            [ INFO] [1498120819.160766066]: dynamixel_workbench_single_manager : Init Success!
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

            This package contains default launch file(***position_control.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_controllers*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need to two Dynamixels set by position control mode and assemble it to pan tilt structure. If you need to check your Dynamixel states, you might use **dynamixel_workbench_single_manager**

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/pan_tilt_example.jpg)

        1. Create a launch file for the position control node            

            Now we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets **device name**, **baudrate**, **protocol version** and **id** of Dynamixels. We assume that the XM430-W210-R is connected to ***/dev/ttyUSB0*** and has ***57600*** baudrate, ***2.0*** protocol_version and each motor is set id 1 and 2. If not, make sure you set your Dynamixel correctly.

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
            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="57600"/>
            <arg name="protocol_version" default="2.0"/>

            <arg name="pan_id"           default="1"/>
            <arg name="tilt_id"          default="2"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>
            <param name="protocol_version" value="$(arg protocol_version)"/>

            <param name="pan_id"           value="$(arg pan_id)"/>
            <param name="tilt_id"          value="$(arg tilt_id)"/>

            <node name="position_control_example" pkg="dynamixel_workbench_controllers" type="position_control" required="true" output="screen">
                <rosparam>
                profile_velocity: 100
                profile_acceleration: 10
                </rosparam>
            </node>
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
            [ INFO] [1498122845.734230049]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498122845.734694362]: Succeeded to change the baudrate(57600)!
            [ INFO] [1498122845.774595659]: -----------------------------------------------------------------------
            [ INFO] [1498122845.774621277]:   dynamixel_workbench controller; position control example(Pan & Tilt) 
            [ INFO] [1498122845.774630837]: -----------------------------------------------------------------------
            [ INFO] [1498122845.774647858]: PAN MOTOR INFO
            [ INFO] [1498122845.774659373]: ID    : 1
            [ INFO] [1498122845.774671990]: MODEL : XM430_W210
            [ INFO] [1498122845.774681590]:  
            [ INFO] [1498122845.774690925]: TILT MOTOR INFO
            [ INFO] [1498122845.774700485]: ID    : 2
            [ INFO] [1498122845.774710310]: MODEL : XM430_W210
            [ INFO] [1498122845.774721509]:  
            [ INFO] [1498122845.774730931]: Profile Velocity     : 100
            [ INFO] [1498122845.774740424]: Profile Acceleration : 10
            [ INFO] [1498122845.774750915]: -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /position_control/dynamixel_state topic:

            ```
            $ rostopic echo /position_control/dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: XM430_W350
                id: 1
                torque_enable: 1
                goal_current: 1193
                goal_velocity: 350
                goal_position: 2045
                present_current: 0
                present_velocity: 0
                present_position: 2045
                moving: 0
            - 
                model_name: XM430_W350
                id: 2
                torque_enable: 1
                goal_current: 1193
                goal_velocity: 350
                goal_position: 2049
                present_current: 0
                present_velocity: 0
                present_position: 2049
                moving: 0
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [pan_pos] [tilt_pos]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [pan_pos] [tilt_pos]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad -1.0 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 2048 3000
            ```

            The pan & tilt is running!! If you have a question about running ***position_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Velocity controller](#velocity-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            This package contains default launch file(***velocity_control.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_controllers*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need to two Dynamixels set by position control mode and assemble it to mobile platform. If you need to check your Dynamixel states, you might use **dynamixel_workbench_single_manager**

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/wheel_example.jpg)

        1. Create a launch file for the velocity control node            

            Now we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets **device name**, **baudrate**, **protocol version** and **id** of Dynamixels. We assume that the XM430-W210-R is connected to ***/dev/ttyUSB0*** and has ***57600*** baudrate, ***2.0*** protocol_version and each motor is set id 1 and 2(reversed mode ON). If not, make sure you set your Dynamixel correctly.

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
            <arg name="device_name"      default="/dev/ttyUSB0"/>
            <arg name="baud_rate"        default="57600"/>
            <arg name="protocol_version" default="2.0"/>

            <arg name="left_id"           default="1"/>
            <arg name="right_id"          default="2"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>
            <param name="protocol_version" value="$(arg protocol_version)"/>

            <param name="left_id"           value="$(arg left_id)"/>
            <param name="right_id"          value="$(arg right_id)"/>

            <node name="velocity_control_example" pkg="dynamixel_workbench_controllers" type="velocity_control" required="true" output="screen"/>
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

            If position_controllers find linked Dynamixels, we could show state of it and command list and set torque on:

            ```
            [ INFO] [1498123155.082127632]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498123155.082561764]: Succeeded to change the baudrate(57600)!
            [ INFO] [1498123155.121064903]: -----------------------------------------------------------------------
            [ INFO] [1498123155.121091173]:   dynamixel_workbench controller; velocity control example             
            [ INFO] [1498123155.121100252]: -----------------------------------------------------------------------
            [ INFO] [1498123155.121110565]: PAN MOTOR INFO
            [ INFO] [1498123155.121121295]: ID    : 1
            [ INFO] [1498123155.121132022]: MODEL : XM430_W210
            [ INFO] [1498123155.121146306]:  
            [ INFO] [1498123155.121156065]: TILT MOTOR INFO
            [ INFO] [1498123155.121167943]: ID    : 2
            [ INFO] [1498123155.121184882]: MODEL : XM430_W210
            [ INFO] [1498123155.121196264]: -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /velocity_control/dynamixel_state topic:

            ```
            $ rostopic echo /velocity_control/dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: XM430_W350
                id: 1
                torque_enable: 1
                goal_current: 1193
                goal_velocity: 0
                goal_position: 1294
                present_current: -2
                present_velocity: 0
                present_position: 1294
                moving: 0
            - 
                model_name: XM430_W210
                id: 2
                torque_enable: 1
                goal_current: 1193
                goal_velocity: 0
                goal_position: 1673
                present_current: 1
                present_velocity: 0
                present_position: 1673
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
            $ rosservice call /wheel_command -- [left_wheel_velocity] [right_wheel_velocity]
            ```

            The mobile plaform is working!!

            If you have a question about running ***velocity_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Torque controller](#torque-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}
        
**Warning :** THIS TUTORIAL ONLY SUPPORT XM430-W350-R.
{: .notice--warning}

        1. Create a package

            This package contains default launch file(***torque_control.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_controllers*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need to two Dynamixels set by position control mode and assemble it to pan tilt structure. If you need to check your Dynamixel states, you might use **dynamixel_workbench_single_manager**

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/pan_tilt_example.jpg)

        1. Create a launch file for the torque control node            

            Now we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets **device name**, **baudrate**, **protocol version** and **id** of Dynamixels. We assume that the XM430-W210-R is connected to ***/dev/ttyUSB0*** and has ***57600*** baudrate, ***2.0*** protocol_version and each motor is set id 1 and 2. If not, make sure you set your Dynamixel correctly.

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
            <arg name="protocol_version" default="2.0"/>

            <arg name="pan_id"           default="1"/>
            <arg name="tilt_id"          default="2"/>

            <param name="device_name"      value="$(arg device_name)"/>
            <param name="baud_rate"        value="$(arg baud_rate)"/>
            <param name="protocol_version" value="$(arg protocol_version)"/>

            <param name="pan_id"           value="$(arg pan_id)"/>
            <param name="tilt_id"          value="$(arg tilt_id)"/>

            <node name="torque_control_example" pkg="dynamixel_workbench_controllers" type="torque_control" required="true" output="screen">
                <rosparam>
                p_gain: 0.003
                d_gain: 0.00002
                </rosparam>
            </node>
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
            [ INFO] [1498182411.418438682]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498182411.418885307]: Succeeded to change the baudrate(3000000)!
            [ INFO] [1498182411.463426922]: -----------------------------------------------------------------------
            [ INFO] [1498182411.463452289]:   dynamixel_workbench controller; torque control example(Pan & Tilt)   
            [ INFO] [1498182411.463461118]: -----------------------------------------------------------------------
            [ INFO] [1498182411.463469012]: PAN MOTOR INFO
            [ INFO] [1498182411.463477534]: ID    : 1
            [ INFO] [1498182411.463494604]: MODEL : XM430_W350
            [ INFO] [1498182411.463503819]:  
            [ INFO] [1498182411.463516786]: TILT MOTOR INFO
            [ INFO] [1498182411.463525396]: ID    : 2
            [ INFO] [1498182411.463535349]: MODEL : XM430_W350
            [ INFO] [1498182411.463546206]: -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through /torque_control/dynamixel_state topic:

            ```
            $ rostopic echo /torque_control/dynamixel_state
            ```

            For example:

            ```
            dynamixel_state: 
            - 
                model_name: XM430_W350
                id: 1
                torque_enable: 1
                goal_current: 0
                goal_velocity: 350
                goal_position: 2997
                present_current: 0
                present_velocity: 0
                present_position: 2045
                moving: 0
            - 
                model_name: XM430_W350
                id: 2
                torque_enable: 1
                goal_current: 2
                goal_velocity: 350
                goal_position: 2002
                present_current: 1
                present_velocity: 0
                present_position: 2047
                moving: 0
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [pan_pos] [tilt_pos]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [pan_pos] [tilt_pos]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad -1.0 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 2048 3000
            ```

            The pan & tilt is running!! If you have a question about running ***torque_control***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).

### [Multi port controller](#multi-port-controller)

**Note :** IF YOU ALREADY CREATE **my_dynamixel_workbench_tutorial** PACKAGE, THEN YOU JUMP TO STEP 2.
{: .notice--info}

        1. Create a package

            This package contains default launch file(***multi_port.launch***) in launch folder. But, in this tutorial, we create a new tutorial package to show how to run ***dynamixel_workbench_controllers*** in other package.

            ```
            $ cd ~/catkin_ws/src
            $ catkin_create_pkg my_dynamixel_workbench_tutorial std_msgs roscpp
            ```

        1. Prepare two Dynamixels

            We need to two Dynamixels set by position control mode and assemble it to pan tilt structure. If you need to check your Dynamixel states, you might use **dynamixel_workbench_single_manager**

            ![](/assets/images/sw/dynamixel/dynamixel_workbench/multi_port_example.jpg)

        1. Create a launch file for the multi port node            

            Now we need a launch file in launch folder in ***my_dynamixel_workbench_tutorial*** package. This launch file connects to the ***dynamixel_workbench_controllers*** package and sets **device name** and **baudrate**, **model name**, **protocol version** and **id** of each Dynamixel. We assume that the XM430-W210-R and AX-12A is connected to ***/dev/ttyUSB0*** and /***dev/ttyUSB1*** has ***57600*** and ***1000000*** baudrate, ***2.0*** and ***1.0*** protocol_version and each motor is set id 1 and 2. If not, make sure you set your Dynamixel correctly.

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
            <arg name="pan_protocol_version" default="2.0"/>
            <arg name="pan_id"               default="1"/>

            <arg name="tilt_device_name"      default="/dev/ttyUSB1"/>
            <arg name="tilt_baud_rate"        default="1000000"/>
            <arg name="tilt_protocol_version" default="1.0"/>
            <arg name="tilt_id"               default="2"/>

            <param name="pan/device_name"      value="$(arg pan_device_name)"/>
            <param name="pan/baud_rate"        value="$(arg pan_baud_rate)"/>
            <param name="pan/protocol_version" value="$(arg pan_protocol_version)"/>
            <param name="pan/id"               value="$(arg pan_id)"/>

            <param name="tilt/device_name"      value="$(arg tilt_device_name)"/>
            <param name="tilt/baud_rate"        value="$(arg tilt_baud_rate)"/>
            <param name="tilt/protocol_version" value="$(arg tilt_protocol_version)"/>
            <param name="tilt/id"               value="$(arg tilt_id)"/>

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
            [ INFO] [1498184258.502362847]: Succeeded to open the port(/dev/ttyUSB0)!
            [ INFO] [1498184258.502806700]: Succeeded to change the baudrate(57600)!
            [ INFO] [1498184258.503057217]: Succeeded to open the port(/dev/ttyUSB1)!
            [ INFO] [1498184258.503422356]: Succeeded to change the baudrate(1000000)!
            [ INFO] [1498184258.554007180]: -----------------------------------------------------------------------
            [ INFO] [1498184258.554031799]:   dynamixel_workbench controller; multi port example(Pan & Tilt)       
            [ INFO] [1498184258.554041637]: -----------------------------------------------------------------------
            [ INFO] [1498184258.554050470]: PAN MOTOR INFO
            [ INFO] [1498184258.554058450]: Device Name    : /dev/ttyUSB0
            [ INFO] [1498184258.554069607]: ID             : 1
            [ INFO] [1498184258.554077269]: MODEL          : XM430_W350
            [ INFO] [1498184258.554088212]:  
            [ INFO] [1498184258.554104133]: TILT MOTOR INFO
            [ INFO] [1498184258.554117854]: Device Name    : /dev/ttyUSB1
            [ INFO] [1498184258.554133085]: ID             : 2
            [ INFO] [1498184258.554157634]: MODEL          : AX_12A
            [ INFO] [1498184258.554175165]: -----------------------------------------------------------------------
            ```

        1. Check state of Dynamixel

            Now, we can check a state of linked Dynamixels through ***/multi_port/pan_state*** and ***/multi_port/tilt_state*** topic:

            ```
            $ rostopic echo /multi_port/pan_state
            ```

            For example:

            ```
            model_name: XM430_W350
            id: 1
            torque_enable: 1
            goal_current: 1193
            goal_velocity: 350
            goal_position: 2080
            present_current: 0
            present_velocity: 0
            present_position: 2080
            moving: 0
            ```

        1. Control pan & tilt

            We run the two linked Dynamixels using **rosservice call** or **dynamixel_workbench_operators** with different unit ***radian*** or ***raw*** value.

            ```
            $ rosservice call /joint_command -- [unit] [pan_pos] [tilt_pos]
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator [unit] [pan_pos] [tilt_pos]
            ```

            Example

            ```
            $ rosservice call /joint_command -- rad -1.0 2.0
            ```

            or

            ```
            $ rosrun dynamixel_workbench_operators joint_operator raw 2048 3000
            ```

            The pan & tilt is running!! If you have a question about running ***multi_port***, please make a [new issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues).