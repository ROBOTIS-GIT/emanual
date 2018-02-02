### 1. Overview
This chapter introduces the module that utilizes OpenCR as sensor and IO interface.
This module provides Gyro, Acceleration, Button and LED functions.

  > Reference : [OPENCR]

### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)    

#### 2.2 Usage
The Sensor Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

### 3. ROS API
#### 3.1 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg])  
&emsp;&emsp; This message notifies the status of open_cr_module.  

`/robotis/open_cr/imu`([sensor_msgs/Imu])  
&emsp;&emsp; This message contains IMU data from OpenCR.  

`/robotis/open_cr/button`([std_msgs/String]))  
&emsp;&emsp; This message notifies the status of the button connected to OpenCR GPIO.  

<br>[[&lt;&lt; [Back](ROBOTIS-OP3-Modules.md)

[OPENCR]:https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_op3
[Creating new robot manager]:[Creating-new-robot-manager.md]
[robotis_controller_msgs/StatusMsg]:/docs/en/popup/StatusMsg.msg/
[sensor_msgs/Imu]:/docs/en/popup/sensor_msgs_IMU_msg/
[std_msgs/String]:/docs/en/popup/std_msgs_string/
