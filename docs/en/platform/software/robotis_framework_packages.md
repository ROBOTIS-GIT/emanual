---
layout: archive
lang: en
ref: software_robotis_framework_packages
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/software/robotis_framework_packages/
sidebar:
  title: ROBOTIS-FRAMEWORK
  nav: "robotis-framework"
---

# [Robotis Framework Packages](#robotis-framework-packages)

## [DynamixelSDK](#dynamixelsdk)

### Overview

Dynamixel SDK is a standard programming libraries to develop the software that controls Dynamixel.
Please refer to the below link for more information about the Dynamixel SDK.

> Reference : [ROBOTIS Dynamixel SDK Documents]

## [Robotis Framework](#robotis-framework)

### [robotis_controller](#robotis_controller)

#### Overview

This is the main package that controls THORMANG3. This package is responsible for following functions.

1. Initialization  
    1. Load robot information file(.robot) and initialize the robot with the [[robotis_device]] package.  
    2. Configures initial value for each joint by loading initialization file(.yaml).  
    3. Gets ready to use sync write and bulk read for the joint control.
2. Periodically call process() function by the timer (default cycle: 8 msec)  
    1. The startTimer() creates a thread that calls process() function periodically.  
3. What process() does :  
    1. Receives status packets with Bulk Read to get status of each sensors and joints.  
    2. Transfers the result value of the Motion Module with Sync Write.  
    3. Transfers instruction packet to each sensors and joints with Bulk Read.    
    4. Calls process() function of the Sensor Module in the list and saves the result value.  
    5. Calls process() function of the Motion Module in the list and saves the result value.  
    6. Publishes current value and target value in the form of ROS Topic.  

Please refer to the below link to create the Robot Manager that uses `robotis_controller` package.  
> Reference : [Creating new robot manager]

#### ROS API

##### Subscribed Topics
`/robotis/write_control_table` ([robotis_controller_msgs/WriteControlTable]{: .popup})  
&emsp;&emsp; The message can write multiple item values to a specific joint by using Sync Write.  

`/robotis/sync_write_item` ([robotis_controller_msgs/SyncWriteItem]{: .popup})  
&emsp;&emsp; The message can write a specific item value to multiple joints by using Sync Write.  

`/robotis/set_joint_ctrl_modules` ([robotis_controller_msgs/JointCtrlModule]{: .popup})  
&emsp;&emsp; The message can configure motion modules that controls specific joints.  

`/robotis/enable_ctrl_module` ([std_msgs/String]{: .popup})  
&emsp;&emsp; This message assigns a specific motion module that manages specific joints to a motion control module.

`/robotis/set_control_mode` ([std_msgs/String]{: .popup})  
&emsp;&emsp; The message sets the control mode of `robotis_controller` to ether `DIRECT_CONTROL_MODE` or `MOTION_MODULE_MODE`.

`/robotis/set_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; This message includes status data for each joint. The data in this message is transmitted to each joint to control the joint.  

#### Published Topics
`/robotis/goal_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; The message publishes goal joint status value for each joint.  

`/robotis/present_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; The message publishes current joint status value read from each joint.  

`/robotis/present_joint_ctrl_modules` ([robotis_controller_msgs/JointCtrlModule]{: .popup})  
&emsp;&emsp; The message publishes current status of motion module that controls each joint.   

##### Services
`/robotis/get_present_joint_ctrl_modules` ([robotis_controller_msgs/GetJointModule]{: .popup})  
&emsp;&emsp; The service to get the configuration of motion module that controls each joint.  

### [robotis_device](#robotis_device)

#### Overview
This is the package that manages device information of ROBOTIS robots. This package is used when reading device information with the robot information file from the [`robotis_controller`] package.

#### Devices

The package is consisted of `devices` folder that contains directories for each device and each device directory contains `.device` file that saves device information. In order to add a new device, go to the relevant directory for the device and append the device information to the `.device` file. The following is the content of each device file.

##### dynamixel
Device information file for dynamixel type is consisted of three sessions. The name of session is specified between '[' and ']'.
Comments start with '#' and any texts after '#' will not be considered as source code.
The following is the option that can be configured in each session.

###### device info
```
[device info]
model_name  = H54-200-S500-R
device_type = dynamixel
```
- `model_name` : Model name of the device.
- `device_type` : Type of the device. Type can be either `dynamixel` or `sensor`.

###### type info
```
[type info]
torque_to_current_value_ratio   = 9.09201

value_of_0_radian_position      = 0
value_of_min_radian_position    = -250950
value_of_max_radian_position    =  250950
min_radian                      = -3.14159265
max_radian                      =  3.14159265

torque_enable_item_name         = torque_enable
present_position_item_name      = present_position
present_velocity_item_name      = present_velocity
present_current_item_name       = present_current
goal_position_item_name         = goal_position
goal_velocity_item_name         = goal_velocity
goal_current_item_name          = goal_torque
position_d_gain_item_name       =
position_i_gain_item_name       =
position_p_gain_item_name       = position_p_gain
```

Values can be deleted for unused variables. However, depending on the control method, at least one goal_position_item_name or goal_velocity_item_name or goal_current_item_name should be defined.

- `torque_to_current_value_ratio` : The current ratio of torque to current control value.  
    current control value = torque(N) * torque_to_current_value_ratio
- `velocity_to_value_ratio` : The velocity ratio of velocity to control value.  
    velocity control value = velocity(Rad/s) * velocity_to_value_ratio
- `min_radian` : The minimum radian value of the position allowed for current dynamixel.
- `max_radian` : The maximum radian value of the position allowed for current dynamixel.
- `value_of_0_radian_position` : The position value at 0 radian position.
- `value_of_min_radian_position` : The position value at min radian position.
- `value_of_max_radian_position` : The position value at max radian position.
- `torque_enable_item_name` : Name of the torque enable item
- `present_position_item_name` : Name of the current position item
- `present_velocity_item_name` : Name of the current velocity item
- `present_current_item_name` : Name of the current current item
- `goal_position_item_name` : Name of the goal position item
- `goal_velocity_item_name` : Name of the goal velocity item
- `goal_current_item_name` : Name of the goal current item
- `position_d_gain_item_name` : Name of the D gain item of position PID control
- `position_i_gain_item_name` : Name of the I gain item of position PID control
- `position_p_gain_item_name` : Name of the P gain item of position PID control

###### control table
```
[control table]
# addr | item name                | length | access | memory |   min value   |  max value  | signed
   0   | model_number             | 2      | R      | EEPROM | 0             | 65535       | N
   6   | version_of_firmware      | 1      | R      | EEPROM | 0             | 254         | N
   7   | ID                       | 1      | RW     | EEPROM | 0             | 252         | N
   8   | baudrate                 | 1      | RW     | EEPROM | 0             | 8           | N
...
```
- `address` : Address of the Item. When transmitting control packets, items in the control packet are distinguished by the address.
- `item name` : Name of the Item. The item name is used to distinguish items in the topic for control.
- `length` : Data length of the Item.
- `access` : Access permission of the Item. (R:Read, W:Write, RW:Read/Write)
- `memory` : Type of memory that saves the Item.
    - `EEPROM` : EEPROM keeps data without power supply. Some devices may not allow to write to EEPROM when torque is on.
    - `RAM` : RAM loses its data and become initialized when the power is cut off.
- `min value` : Minimum data value of the Item.
- `max value` : Maximum data value of the Item.
- `signed` : Y for signed Item data, N for unsigned Item data.

### [robotis_framework_common](#robotis_framework_common)

#### Overview
The package contains commonly used Headers for the ROBOTIS Framework.

#### Description

##### singleton.h

Singleton pattern template

```c++
#ifndef ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_
#define ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_

namespace robotis_framework
{

template <class T>
class Singleton
{
private:
  static T *unique_instance_;

protected:
  Singleton() { }
  Singleton(Singleton const&) { }
  Singleton& operator=(Singleton const&) { return *this; }

public:
  static T* getInstance()
  {
    if(unique_instance_ == NULL)
      unique_instance_ = new T;
    return unique_instance_;
  }

  static void destroyInstance()
  {
    if(unique_instance_)
    {
      delete unique_instance_;
      unique_instance_ = NULL;
    }
  }
};

template <class T> T* Singleton<T>::unique_instance_ = NULL;

}

#endif /* ROBOTIS_FRAMEWORK_COMMON_SINGLETON_H_ */
```

##### motion_module.h
Please refer to the below link for the instruction of creating the new Motion Module.  
> Reference : [Creating new motion module]

##### sensor_module.h
Please refer to the below link for the instruction of creating the new Sensor Module.  
> Reference : [Creating new sensor module]

## [ROBOTIS Framework msgs](#robotis-framework-msgs)

### [robotis_controller_msgs](#robotis-controller-msgs)

#### Overview
This package defines Messages and Service that are used in the [robotis_controller].

#### ROS Message Types
* [JointCtrlModule.msg]{: .popup}
* [StatusMsg.msg]{: .popup}
* [SyncWriteItem.msg]{: .popup}

#### ROS Service Types
* [GetJointModule.srv]{: .popup}


[Creating new motion module]: /docs/en/platform/software/tutorials/#creating-new-motion-module/
[Creating new sensor module]: /docs/en/platform/software/tutorials/#creating-new-sensor-module/
[Creating new robot manager]: /docs/en/platform/software/tutorials/#creating-new-robot-manager/

[std_msgs/String]: /docs/en/popup/std_msgs_string/
[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[robotis_controller_msgs/WriteControlTable]: /docs/en/popup/WriteControlTable.msg/
[robotis_controller_msgs/SyncWriteItem]: /docs/en/popup/SyncWriteItem.msg/
[robotis_controller_msgs/JointCtrlModule]: /docs/en/popup/JointCtrlModule.msg/
[robotis_controller_msgs/GetJointModule]: /docs/en/popup/GetJointModule.srv/

[ROBOTIS Dynamixel SDK Documents]:https://github.com/ROBOTIS-GIT/DynamixelSDK/wiki


[`robotis_controller`]: #robotis_controller

[robotis_controller]:  #robotis_controller
[JointCtrlModule.msg]: /docs/en/popup/JointCtrlModule.msg/
[StatusMsg.msg]: /docs/en/popup/StatusMsg.msg/
[SyncWriteItem.msg]: /docs/en/popup/SyncWriteItem.msg/
[GetJointModule.srv]: /docs/en/popup/GetJointModule.srv/
