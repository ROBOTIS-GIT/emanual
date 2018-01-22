### 1. Overview
This chapter introduces the module that utilizes OpenCR as sensor and IO interface.
This module provides Gyro, Acceleration, Button and LED functions.

  > Reference : [OPENCR](https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_op3)

### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages.md)    

#### 2.2 Usage
The Sensor Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager](Creating-new-robot-manager.md)

### 3. ROS API
#### 3.1 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg](StatusMsg.msg))  
&emsp;&emsp; This message notifies the status of open_cr_module.  

`/robotis/open_cr/imu`([sensor_msgs/Imu](http://docs.ros.org/api/sensor_msgs/html/msg/Imu.html))  
&emsp;&emsp; This message contains IMU data from OpenCR.  

`/robotis/open_cr/button`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message notifies the status of the button connected to OpenCR GPIO.  

<br>[[&lt;&lt; [Back](ROBOTIS-OP3-Modules.md)
