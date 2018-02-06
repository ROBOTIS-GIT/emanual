### 1. Overview  
`op3_manager` package applies ROBOTIS Framework to ROBOTIS OP3.  
Refer to the below link to create a new robot manager.  
> Reference : [Creating new robot manager]

### 2. Getting started  
#### 2.1 Download & Build  
 > Reference : [Installation ROBOTIS ROS Package]

#### 2.2. Run  
Execute the program with a `.launch` file in order to load ROS parameters.  
The command should be executed under the root account to configure the attribute of Thread.  
`op3_manager` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_walking_tuner` and `op3_action_editor` should not be running.  
Before executing the `op3_manager` launch file, other programs should be terminated.  
```
$ sudo bash  
[sudo] password for robotis:   
# roslaunch op3_manager op3_manager.launch  
```

### 3. ROS API  
#### 3.1. Parameters  
launch parameters  

`gazebo` (bool, default: false)  
&emsp;&emsp; Configure whether to run the program in gazebo mode.  

`gazebo_robot_name` (string, default: "")  
&emsp;&emsp; Configure the robot name for joint_state topic name when running in gazebo mode.  
&emsp;&emsp; ex) If `op3` is the `gazebo_robot_name`, `/op3/joint_states` will be subscribed.

`offset_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of the file that contains offset data of each joint and initial posture data for offset adjustment.

`robot_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of .robot file that contains robot description data.

`init_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of the file that contains initialization information of each joint.

`device_name` (string, default: "/dev/ttyUSB0")  
&emsp;&emsp; This port name is used to open the communication port of OpenCR that manages Dynamixel power supply.

`baud_rate` (int, default: "2000000")  
&emsp;&emsp; This baud rate is used to open the communication port of OpenCR that manages Dynamixel power supply.

### 4. Modules  
This chapter explains various modules in `op3_manager`.  
Actual control is processed within each modules.  

#### 4.1 Motion Module
 1. [op3_action_module] : This manages every joint actions.  
 2. [op3_base_module] : This module manages initial posture and basic functions.  
 3. [op3_head_control_module] : This module controls OP3 head.  
 4. [op3_walking_module] : This module controls walking.  
 5. [op3_online_walking_module] : This module controls upgraded walking.  


#### 4.2 Sensor Module  
 1. [open_cr_module] : This module is required to use OpenCR as a sensor.  


### 5. Source  
Structure of `op3_manager`  
 - Initialize with Robot file(`.robot`)and Joint initialize file (`.yaml`).  
 - Apply offset file(`.yaml`).  
 - Add modules(each module manages calculation for control or sensor related functions).  
 - Initiate timer in the controller.  
 - According to the frequency stated in the `.robot` file, exchange data with Dynamixels and OpenCR.


```
...

// initialize robot
if (controller->initialize(g_robot_file, g_init_file) == false)
{
  ROS_ERROR("ROBOTIS Controller Initialize Fail!");
  return -1;
}

// load offset
if (g_offset_file != "")
  controller->loadOffset(g_offset_file);

sleep(1);

/* Add Sensor Module */
controller->addSensorModule((SensorModule*) OpenCRModule::getInstance());

/* Add Motion Module */
controller->addMotionModule((MotionModule*) ActionModule::getInstance());
controller->addMotionModule((MotionModule*) BaseModule::getInstance());
controller->addMotionModule((MotionModule*) HeadControlModule::getInstance());
controller->addMotionModule((MotionModule*) WalkingModule::getInstance());

// start timer
controller->startTimer();

...
```


[&lt;&lt; Back]

[Creating new robot manager]:[Creating-new-robot-manager.md]
[op3_action_module]:op3_action_module.md
[op3_base_module]:op3_base_module.md
[op3_head_control_module]:op3_head_control_module.md
[op3_walking_module]:op3_walking_module.md
[op3_online_walking_module]:op3_online_walking_module.md
[open_cr_module]:open_cr_module.md
[Installation ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md
[&lt;&lt; Back]:OP3-User's-Guide.md
