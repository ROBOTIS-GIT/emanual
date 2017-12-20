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
  nav: "dynamixelworkbench"
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

# [Supported Dynamixels](#supported-dynamixel)

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

## Single Manager Packages
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

## Controllers Packages 
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
            

    1. torque_control - Dynamixel torque control example using ***toolbox*** library which is based on [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/). Two Dynamixels which set by torque control mode are commanded by joint_operator. **Note**: This packages only supports XM430-W350-R
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

## Operators Packages 
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

## Toolbox Packages 
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


