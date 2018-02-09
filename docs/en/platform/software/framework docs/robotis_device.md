### 1. Overview
This is the package that manages device information of ROBOTIS robots. This package is used when reading device information with the robot information file from the [`robotis_controller`] package.

### 2. Devices

The package is consisted of `devices` folder that contains directories for each device and each device directory contains `.device` file that saves device information. In order to add a new device, go to the relevant directory for the device and append the device information to the `.device` file. The following is the content of each device file.

#### 2.1. dynamixel
Device information file for dynamixel type is consisted of three sessions. The name of session is specified between '[' and ']'.
Comments start with '#' and any texts after '#' will not be considered as source code.
The following is the option that can be configured in each session.

##### 2.1.1. device info
```
[device info]
model_name  = H54-200-S500-R
device_type = dynamixel
```
- `model_name` : Model name of the device.
- `device_type` : Type of the device. Type can be either `dynamixel` or `sensor`.

##### 2.1.2. type info
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

##### 2.1.3. control table
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


<br>[&lt;&lt; Back](ROBOTIS_Framework.md)

[`robotis_controller`]:robotis_controller.md
