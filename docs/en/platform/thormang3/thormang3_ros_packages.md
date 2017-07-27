---
layout: archive
lang: en
ref: thormang3_ros_packages
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/thormang3_ros_packages/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

<div style="counter-reset: h1 1">
</div>

# [THORMANG3 ROS Packages](#thormang3-ros-packages)


## [MPC Packages](#mpc-packages)

### [thormang3_manager](#thormang3_manager)

`thormang3_manager` is a package to apply ROBOTIS Framework to THORMANG3. Refer to the below link to create a new robot manager.

1. Download & Build  

    `Note` Reference : [MPC Installation]
    {: .notice}

2. Run  
    Execute the program with a .launch file in order to load ROS parameters. The command should be executed from the root account to configure the attribute of Thread.  
    ```
    $ sudo bash
    [sudo] password for robotis:
    # roslaunch thormang3_manager thormang3_manager.launch
    ```

#### ROS API

+ Launch Parameters
  - gazebo (bool, default: false) : Configure whether to the program run in gazebo mode.
  - gazebo_robot_name (string, default: "") : Configure the robot name for joint_state topic name when running in gazebo mode.
  ex) If thormang3 is the gazebo_robot_name, /thormang3/joint_states will be subscribed.
  - offset_file_path (string, default: "") : This path indicates the location of the file that contains offset data of each joint and initial posture data for offset adjustment.
  - robot_file_path (string, default: "") : This path indicates the location of .robot file that contains robot data.
  - init_file_path (string, default: "") : This path indicates the location of the file that contains initialization information of each joint.
  - ft_data_path (string, default: "") : This path indicates the location of the file that contains calibration matrix and unloaded voltage information of the FT sensor.
  - ft_calibration_data_path (string, default: "") : This path indicates the location of the file that contains the reference value for FT sensor calibration.


### [thormang3_kinematics_dynamics](#thormang3_kinematics_dynamics)

`thormang3_kinematics_dynamics` is a kinematics and dynamics library that provides joint & link information and basic robotics function. To use this library, it is necessary to set the `CMakeList.txt` and `package.xml` of each module

In `CMakeList.txt`,
```c++
find_package( thormang3_kinematics_dynamics )   
target_link_libraries( thormang3_kinematics_dynamics )   
```

In `package.xml`,
```c++
<build_depend>thormang3_kinematics_dynamics</build_depend>   
```

#### Functions

1. LinkData.cpp  

    + name : Joint name  
    + parent : Parent joint ID  
    + sibling : Sibling joint ID  
    + child : Child joint ID  
    + mass : Mass  
    + relative_position : Joint relative position (relative to parent)  
    + joint_axis : Joint axis vector (relative to parent)  
    + center_of_mass : Center of mass (Link Local)  
    + inertia : Moment of Inertia (Link Local)  
    + joint_limit_max : Joint upper limit  
    + joint_limit_min : Joint lower limit  
    + joint_angle : Joint angle  
    + joint_velocity : Joint velocity  
    + joint_acceleration : Joint acceleration  
    + position: Link position  
    + orientation : Link orientation  
    + transformation : Link transformation matrix   

2. ThorMang3KinematicsDynamics.cpp  

  + THORMANG3 joint & link information
    ```c++
    ThorMang3KinematicsDynamics(TREE_SELECT tree)
    ```   

  + Find kinematics tree
    - arguments : start joint id
    - return value : vector ( n x 1 )

    ```c++
    std::vector<int> findRoute( int to )
    ```  

  + Find kinematics tree
    - arguments : start joint id and end joint id
    - return value : vector ( n x 1 )  

    ```c++
    std::vector<int> findRoute( int from , int to )
    ```  

  + Calculate total mass
    - arguments : start joint id
    - return value : total mass  

    ```c++
    double TotalMass( int joint_ID )
    ```  

  + Calculate center of mass
    - arguments : start joint id
    - return value : 3 x 1 matrix

    ```c++
    Eigen::MatrixXd CalcMC( int joint_ID )
    Eigen::MatrixXd CalcCOM( Eigen::MatrixXd MC )
    ```   

  + Calculate forward kinematics
    - arguments : start joint id  

    ```c++
    void ForwardKinematics( int joint_ID )
    ```  

  + Calculate forward kinematics
    - arguments : vector ( n x 1 )
    - return value : 6 x n matrix  

    ```c++
    Eigen::MatrixXd CalcJacobian( std::vector<int> idx )
    ```  

  + Calculate inverse kinematics
    - arguments : end joint id, target position, target orientation, max iteration, calculation error
    - return value : true or false

    ```c++
    bool InverseKinematics
    ( int to,
      Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation,
      int max_iter,                 double ik_err )
    ```  

  + Calculate inverse kinematics
    - arguments : start joint id, end joint id, target position, target orientation, max iteration, calculation error
    - return value : true or false

    ```c++
    bool InverseKinematics
    ( int from,                     int to,
      Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation,
      int max_iter,                 double ik_err )
    ```  

  + Calculate inverse kinematics for leg
    - arguments : output, target position (x y z), target orientation (roll pitch yaw)
    - return value : true or false

    ```c++
    bool InverseKinematicsforLeg
    ( double *out,
      double x,    double y,     double z,
      double roll, double pitch, double yaw )
    ```  

  + Calculate inverse kinematics for right leg
    - arguments : output, target position (x y z), target orientation (roll pitch yaw)
    - return value : true or false

    ```c++
    bool InverseKinematicsforRightLeg
    ( double *out,
      double x,    double y,     double z,
      double roll, double pitch, double yaw);
    ```  

  + Calculate inverse kinematics for left leg
    - arguments : output, target position (x y z), target orientation (roll pitch yaw)
    - return value : true or false

    ```c++
    bool InverseKinematicsforLeftLeg
    ( double *out,
      double x,    double y,     double z,
      double roll, double pitch, double yaw);
    ```  

### [thormang3_action_module](#thormang3_action_module)

`thormang3_action_module` is one of the Motion Module. This module can load and play a motion file.
The motion file is edited with thormang3_action_editor

- Download & Build  
  `Note` Reference : [MPC Installation]
  {: .notice}

#### ROS API

  - Subscribed Topics  
    `/robotis/action/page_num`([std_msgs/Int32])  
     The page number will be played.  
     If user send a page number between 1 ~ 255, the page will be played.  
     If user send -1, the action will be stopped.  
     If user send -2, the action will be broken(stop immediately).

    `/robotis/action/start_action`([thormang3_action_module_msgs/StartAction])  
     The page number and joint names will be played.

  - Published Topics  
    `/robotis/status`([robotis_controller_msgs/StatusMsg])  
     The message indicates status of the action_module.

  - Services  
    `/robotis/action/is_running`([thormang3_action_module_msgs/IsRunning])  
     The service that checks whether THORMANG3's action is being played or not.

### [thormang3_base_module](#thormang3_base_module)

`thormang3_base_module` is a module for initial posture. This module is included in thormang3_manager as a library.

- Download & Build  
  `Note` Reference : [MPC Installation]
  {: .notice}

  The Motion Module is used in the manager as a form of library.

  `Note` Reference : Creating new robot manager
  {: .notice}

#### ROS API

  - Subscribed Topics  
    `/robotis/base/ini_pose`([std_msgs/String])  
     A command to take the initial posture(This command is effective even when the base module is inactive).

  - Published Topics  
    `/robotis/enable_ctrl_module`([std_msgs/String])  
     A base_module activation topic to take the initial posture.

    `/robotis/status`([robotis_controller_msgs/StatusMsg])  
     A message that contains the status of base_module.


### [thormang3_manipulation_module](#thormang3_manipulation_module)

THORMANG3 manipulation module for the upper body.

- Download & Build  
  `Note` Reference : [MPC Installation]
  {: .notice}

#### ROS API

  - Subscribed Topics  
    `/robotis/manipulation/ini_pose_msg` (std_msgs/String)  
     A message to take the initial posture.

    `/robotis/manipulation/joint_pose_msg` (thormang3_manipulation_module_msgs/JointPose)  
     A message to move to the target point in the Joint Space.

    `/robotis/manipulation/kinematics_pose_msg` (thormang3_manipulation_module_msgs/KinematicsPose)  
     A message to move to the target pose in the Task Space.

  - Published Topics  
    `/robotis/status` (robotis_controller_msgs/StatusMsg)  
     A status message of THORMANG3

  - Services  
    `/robotis/manipulation/get_joint_pose` (thormang3_manipulation_module_msgs/GetJointPose)  
     A service that reads the pose of specific joint.

    `/robotis/manipulation/get_kinematics_pose` (thormang3_manipulation_module_msgs/GetKinematicsPose)  
     A service that reads the pose of end effector from a specific kinematics group.


### [thormang3_walking_module](#thormang3_walking_module)

![](/assets/images/platform/thormang3/thormang3_walking_module_diagram.jpg)

As seen from the above figure, thormang3_walking_module is one of the MotionModules from ROS Framework.
THROMANG3 can be controlled with Topics and Services.
Users can designate almost all Step Parameters.(thormang3_walking_module_msgs/StepData)

1. Pattern Generation  
    thormang3_walking_module includes online walking pattern generator.
    The pattern is generated from Foot Step Data input.  
    ![](/assets/images/platform/thormang3/thormang3_walking_module_algorithm_diagram.jpg)

2. Balance Algorithm  
    The balance algorithm is included as shown below.(thormang3_walking_module_msgs/BalanceParam)
    ![](/assets/images/platform/thormang3/thormang3_walking_module_balance_diagram.jpg)

- Download & Build  
  `Note` Reference : [MPC Installation]
  {: .notice}

#### ROS API

  - Subscribed Topics  
    `/robotis/sensor/imu/imu` (sensor_msgs/Imu)  
   Current data of the IMU Sensor

  - Published Topics  
    `/robotis/status`(robotis_controller_msgs/StatusMsg)  
   Status message of THORMANG3

  - Services  
    `/robotis/walking/get_reference_step_data`(thormang3_walking_module_msgs/GetReferenceStrpData)  
   A service that collects current location of THORMANG3 in the Global from the Walking Module.

    `/robotis/walking/add_step_data`(thormang3_walking_module_msgs/AddStepDataArray)  
   A service that adds StepData created by the user.

    `/robotis/walking/walking_start`(thormang3_walking_module_msgs/WalkingStart)  
   A service that commands to start walking.

    `/robotis/walking/is_running`(thormang3_walking_module_msgs/IsRunning)  
   A service that checks whether THORMANG3 is walking or not.

    `/robotis/walking/set_balance_param`(thormang3_walking_module_msgs/SetBalanceParam)  
   A service that can set Balance Algorithm parameters.

    `/robotis/walking/remove_existing_step_data`(thormang3_walking_module_msgs/RemoveExistingStepData)  
   A service that deletes existing StepData.


### [thormang3_head_control_module](#thormang3_head_control_module)

This module is to control the head. This module is included in the Thormang3 Manager as a library.

- Download & Build  
  `Note` Reference : [MPC Installation]
  {: .notice}

`Note` Reference : Creating new robot manager
{: .notice}

#### ROS API

- Subscribed Topics  
    `/robotis/head_control/move_lidar`(std_msgs/String)  
     The command moves the head in order to obtain Lidar data.

    `/robotis/head_control/move_lidar_with_range`(std_msgs/Float64)  
     This command scans up and down a given range at the current head position to generate 3D lidar data.

    `/robotis/head_control/set_joint_states`(sensor_msgs/JointState)  
     The message controls joints that are connected to the head.

    `/robotis/head_control/set_joint_states_time`(thormang3_head_control_module_msgs/HeadJointPose)  
     The message moves head joints for given time.

- Published Topics  
    `/robotis/sensor/move_lidar`(std_msgs/String)  
     This message reports the head movement to the Node which assembles LiDAR data.

    `/robotis/status`(robotis_controller_msgs/StatusMsg)  
     The message indicates status of the head_control_module.


### [ati_ft_sensor](#ati_ft_sensor)

This is a library to use ForceTorque Sensor(FT Sensor) of ATI Inc in the ROS.
The library can load saved Calibration Matrix and Unloaded Voltage from the YAML File.
The library does not include functions to communicate with hardwares. It can convert voltage output from the FT sensor to N or Nm.

#### Functions

1. ATIForceTorqueSensorTWE Class
```cpp
bool Initialize(const std::string& ft_data_path,		
                const std::string& ft_data_key,  
                const std::string& ft_frame_id,  
                const std::string& ft_raw_publish_name,
                const std::string& ft_scaled_publish_name)
```
  - arguments :
      - ft_data_path : Location of the YAML file to save Calibration Matrix and Unloaded Voltage
      - ft_data_key
        - The key to read data from YAML
        - Key format used to read YAML looks like : ft_data_key + "_calibration_matrix" 와 _ft_data_key + "_unload"
        - For example, if "ft_right_foot_calibration_matrix" and "ft_right_foot_unload" are saved in the YAML, ft_data_key should be "ft_right_foot".
      - ft_frame_id : The frame_id to publish sensor outputs
      - ft_raw_publish_name : The topic name for raw outputs
      - ft_scaled_publish_name : The topic name for scaled outputs
  - description : The function that configures variables in the Class according to Arguments
  - return value : Indicates Initialization success/failure result
 
```cpp
void SetScaleFactor(double ft_scale_factor)
```
  - arguments :
    - ft_scale_factor : The gain value for calculating scaled output
    - Refer to the "SetScaleParam" function.
  - description : Function sets the scale gain of the FT sensor
  - return value : void
 
```cpp
void SetNullForceTorque(Eigen::MatrixXd ft_null)
```
  - arguments :
    - ft_null : Null value for calculating scaled output
    - Refer to the "SetScaleParam" function
  - description : Function sets null value of the FT sensor
  - return value : void
 
```cpp
void SetScaleParam(double ft_scale_factor, Eigen::MatrixXd ft_null)
```
  - arguments :
    - ft_scale_factor : The gain value for calculating scaled output
    - ft_null : Null value when calculating scaled output
  - description :
    - Function sets Parameter for calculating scaled output
    - The scaled output can be calculated as below.
    - ft_scaled = ft_scale_factor * (ft_raw - ft_null)
  - return value : void
 
```cpp
void SetCurrentVoltageOutput(double voltage0, double voltage1, double voltage2, double voltage3, double voltage4, double voltage5)
```
  - arguments :
    - voltage0 : The output voltage of the FT sensor #0
    - voltage1 : The output voltage of the FT sensor #1
    - voltage2 : The output voltage of the FT sensor #2
    - voltage3 : The output voltage of the FT sensor #3
    - voltage4 : The output voltage of the FT sensor #4
    - voltage5 : The output voltage of the FT sensor #5
  - description : Function sets internal variables for the output voltage of the FT sensors and converts them to force torque.
  - return value : void
 
```cpp
void SetCurrentVoltageOutput(Eigen::MatrixXd _voltage)
```
  - arguments :
    - voltage : The 6x1 matrix form of output voltage of the FT sensor
  - description : Function sets internal variables for the output voltage of the FT sensors and converts them to force torque.
  - return value : void
 
```cpp
Eigen::MatrixXd GetCurrentForceTorqueRaw()
```
  - arguments : void
  - description : Return the most recent Raw Force and Torque of the voltage calculated from the "SetCurrentVoltageOutput" function.
  - return value : Raw Force & Raw Torque
  - Eigen::MatrixXd ft = GetCurrentForceTorqueRaw()
  - force_x = ft.coeff(0,0);
  - force_y = ft.coeff(1,0);
  - force_z = ft.coeff(2,0);
  - torque_x = ft.coeff(3,0);
  - torque_y = ft.coeff(4,0);
  - torque_z = ft.coeff(5,0);
 
```cpp
Eigen::MatrixXd GetCurrentForceTorqueScaled()
```
  - arguments : void
  - description : Return the most recent Scaled Force and Torque of the voltage calculated from the "SetCurrentVoltageOutput" function.
  - return value : Scaled Force & Scaled Torque
  - Eigen::MatrixXd ft = GetCurrentForceTorqueScaled()
  - force_x = ft.coeff(0,0);
  - force_y = ft.coeff(1,0);
  - force_z = ft.coeff(2,0);
  - torque_x = ft.coeff(3,0);
  - torque_y = ft.coeff(4,0);
  - torque_z = ft.coeff(5,0);
 
```cpp
void GetCurrentForceTorqueRaw(double* _force_x_N,   double* _force_y_N,   double* _force_z_N,
                              double* _torque_x_Nm, double* _torque_y_Nm, double* _torque_z_Nm)
```
  - arguments : The return pointer of Raw Force and Raw Torque
  - description : Return the most recent Raw Force and Torque of the voltage calculated from the "SetCurrentVoltageOutput" function.
  - return value : void
 
```cpp
void GetCurrentForceTorqueScaled(double* _force_x_N,   double* _force_y_N,   double* _force_z_N,
                                 double* _torque_x_Nm, double* _torque_y_Nm, double* _torque_z_Nm)
```
  - description : Return the most recent Scaled Force and Torque of the voltage calculated from the "SetCurrentVoltageOutput" function.
  - return value : void
 
```cpp
void SetCurrentVoltageOutputPublishForceTorque(double _voltage0, double _voltage1, double _voltage2,
                                               double _voltage3, double _voltage4, double _voltage5)
```
  - arguments :
    - voltage0 : The output voltage of the FT sensor #0
    - voltage1 : The output voltage of the FT sensor #1
    - voltage2 : The output voltage of the FT sensor #2
    - voltage3 : The output voltage of the FT sensor #3
    - voltage4 : The output voltage of the FT sensor #4
    - voltage5 : The output voltage of the FT sensor #5
  - description : Function sets internal variables for the output voltage of the FT sensors and converts them to force torque, then publish the converted force torque.
  - return value : void
 
```cpp
void SetCurrentVoltageOutputPublish(Eigen::MatrixXd _voltage)
```
  - arguments :
    - voltage : The 6x1 matrix form of output voltage of the FT sensor
  - description : Function sets internal variables for the output voltage of the FT sensors and converts them to force torque, then publish the converted force torque.
  - return value : void


### [thormang3_feet_ft_module](#thormang3_feet_ft_module)

The sensor module of THORMANG3 that uses ati_ft_sensor library.
Acquired sensor values when the robot is hanging on the lift and standing on the ground can be used for the Calibration feature.

#### ROS API

1. Subscribed Topics
  `/robotis/feet_ft/ft_calib_command` (std_msgs/String)  
   FT Calibration Command

2. Published Topics
  `/robotis/status` (robotis_controller_msgs/StatusMsg)  
   The status message of THORMANG3

  `/robotis/feet_ft/both_ft_value` (thormang3_feet_ft_module_msgs/BothWrench)  
   Both Wrench

  `/robotis/sensor/ft_right_foot/raw` (geometry_msgs/WrenchStamped)  
   raw output from the force torque sensor on the right foot

  `/robotis/sensor/ft_right_foot/scaled` (geometry_msgs/WrenchStamped)  
   scaled output from the force torque sensor on the right foot

  `/robotis/sensor/ft_right_foot/raw`(geometry_msgs/WrenchStamped)  
   raw output from the force torque sensor on the left foot

  `/robotis/sensor/ft_right_foot/scaled`(geometry_msgs/renchStamped)  
   scaled output from the force torque sensor on the left foot

### [thormang3_balance_control](#thormang3_balance_control)

Library for using Balance Algorithm of THORMANG3 in ROS. There is two kinds of algorithm.

#### Functions and Variables

1. BalanceLowPassFilter Class

    `void initialize(double control_cycle_sec_, double cut_off_frequency)`
    - arguments :
        - control_cycle_sec : control cycle in sec of motion module
        - cut_off_frequency : cut off frequency for low pass filter
    - description : the function that configures variables in the class according to arguments
    - return value : void

    `void setCutOffFrequency(double cut_off_frequency)`
    - arguments :
        -cut off frequency : desired cut off frequency for filtering. If cut_off_frequency is less than 0, filtering is not performed.
    - description : the function for setting cut off frequency
    - return value : void

    `double getCutOffFrequency(void)`
    - arguments : void
    - description : the function for getting set cut off frequency
    - return value : current set cut off frequency

    `double getFilteredOutput(double present_raw_value)`
    - arguments :
        - present_raw_value : raw value
    - description : the function for filtering and getting its result
    - return value : filtered value

2. Damping Controller Class

    `double getFeedBack(double present_sensor_output)`
    - arguments :
        - present_sensor_output : present sensor output
    - description : the function for calculating damping control and getting its result
    - return value : result calculated by damping controller

    `double desired_`
    - description : desired value for damping controller

    `double gain_`
    - description : gain for damping controller

    `double time_constant_sec_`
    - description : time constant for damping controller

    `double output_`
    - description : result of damping controller

    `double control_cycle_sec_`
    - description : control cycle in sec of motion module

3. BalancePDController Class

    `double getFeedBack(double present_sensor_output)`
    - arguments :
        - present_sensor_output : present sensor output
    - description : the function for calculating PD control and getting its result
    - return value : result calculated by PD controller

    `double desired_`
    - description : desired value for PD controller

    `double p_gain_`
    - description : P gain for PD controller

    `double d_gain_`
    - description : D gain for PD controller

4. BalanceControlUsingDampingConroller Class

    `void initialize(const int control_cycle_msec)`
    - arguments :
        - control_cycle_msec : control cycel of motion module in milliseconds
    - description : the function that configures variables in the class according to arguments
    - return value : void

    `void setGyroBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with gyro
    - return value : void

    `void setOrientationBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with orientation from IMU sensor
    - return value : void

    `void setForceTorqueBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with force and torque from ft sensor
    - return value : void

    `void process(int *balance_error, Eigen::MatrixXd *robot_to_cob_modified, Eigen::MatrixXd *robot_to_right_foot_modified, Eigen::MatrixXd *robot_to_left_foot_modified)`
    - arguments :
        - balance_error : the one of below values would be returned
            - BalanceControlError::NoError(= 0) : There is no error.
            - BalanceControlError::BalanceLimit(= 0) : The modification value by the balance algorithm is greater than the maximum modification.
        - robot_to_cob_modified : the center of body modification calculated by balance algorithm
        - robot_to_right_foot_modified : the right foot modification calculated by balance algorithm
        - robot_to_left_foot_modified : the left_foot of body modification calculated by balance algorithm
    - description : calculating balance algorithm using desired values and sensor outputs
    - return value : void

    `void setDesiredPose(const Eigen::MatrixXd &robot_to_cob, const Eigen::MatrixXd &robot_to_right_foot, const Eigen::MatrixXd &robot_to_left_foot)`
    - arguments :
        - robot_to_cob : desired pose of center of body with respect to robot's local coordinate
        - robot_to_right_foot : desired pose of right foot with respect to robot's local coordinate
        - robot_to_left_foot : desired pose of left foot with respect to robot's local coordinate
    - description : the function for setting desired pose of right foot, left foot and center of body
    - return value : void

    `void setDesiredCOBGyro(double gyro_roll, double gyro_pitch)`
    - arguments :
        - gyro_roll : desired x directional angular velocity with respect robot's local coordinate
        - gyro_pitch : desired y directional angular velocity with respect robot's local coordinate
    - description : the function for setting desired angular velocity
    - return value : void

    `void setDesiredCOBOrientation(double cob_orientation_roll, double cob_orientation_pitch)`
    - arguments :
        - cob_orientation_roll : desired roll angle in radian of robot's local coordinate
        - cob_orientation_pitch : desired pitch angle in radian of robot's local coordinate
    - description : the function for setting desired robot's orientation
    - return value : void

    `void setDesiredFootForceTorque(double r_force_x_N,      double r_force_y_N,       double r_force_z_N,
                                 double r_torque_roll_Nm, double r_torque_pitch_Nm, double r_torque_yaw_Nm,
                                 double l_force_x_N,      double l_force_y_N,       double l_force_z_N,
                                 double l_torque_roll_Nm, double l_torque_pitch_Nm, double l_torque_yaw_Nm)`
    - arguments :
        - r_force_x_N : desired x directional force on right foot with respect to robot's local coordinate
        - r_force_y_N : desired y directional force on right foot with respect to robot's local coordinate
        - r_force_z_N : desired z directional force on right foot with respect to robot's local coordinate
        - r_torque_roll_Nm : desired x directional torque on right foot with respect to robot's local coordinate
        - r_torque_pitch_Nm : desired y directional torque on right foot with respect to robot's local coordinate
        - r_torque_yaw_Nm : desired z directional torque on right foot with respect to robot's local coordinate
        - l_force_x_N : desired x directional force on left foot with respect to robot's local coordinate
        - l_force_y_N : desired y directional force on left foot with respect to robot's local coordinate
        - l_force_z_N : desired z directional force on left foot with respect to robot's local coordinate
        - l_torque_roll_Nm : desired x directional torque on left foot with respect to robot's local coordinate
        - l_torque_pitch_Nm : desired x directional torque on left foot with respect to robot's local coordinate
        - l_torque_yaw_Nm : desired x directional torque on left foot with respect to robot's local coordinate
    - description : the function for setting desired force in newton and torque in newton-meter on feet
    - return value : void

    `void setCurrentGyroSensorOutput(double gyro_roll, double gyro_pitch)`
    - arguments :
      - gyro_roll : current x directional angular velocity with respect robot's local coordinate
      - gyro_pitch : current y directional angular velocity with respect robot's local coordinate
    - description : the function for setting current angular velocity from IMU sensor
    - return value :

    `void setCurrentOrientationSensorOutput(double cob_orientation_roll, double cob_orientation_pitch)`
    - arguments :
        - cob_orientation_roll : current roll angle in radian of robot's local coordinate
        - cob_orientation_pitch : current pitch angle in radian of robot's local coordinate
    - description : the function for setting current orientation from IMU sensor
    - return value : void

    `void setCurrentFootForceTorqueSensorOutput(double r_force_x_N,      double r_force_y_N,       double r_force_z_N,
                                               double r_torque_roll_Nm, double r_torque_pitch_Nm, double r_torque_yaw_Nm,
                                               double l_force_x_N,      double l_force_y_N,       double l_force_z_N,
                                               double l_torque_roll_Nm, double l_torque_pitch_Nm, double l_torque_yaw_Nm)`
    - arguments :
        - r_force_x_N : current x directional force on right foot with respect to robot's local coordinate
        - r_force_y_N : current y directional force on right foot with respect to robot's local coordinate
        - r_force_z_N : current z directional force on right foot with respect to robot's local coordinate
        - r_torque_roll_Nm : current x directional torque on right foot with respect to robot's local coordinate
        - r_torque_pitch_Nm : current y directional torque on right foot with respect to robot's local coordinate
        - r_torque_yaw_Nm : current z directional torque on right foot with respect to roboti's local coordinate
        - l_force_x_N : current x directional force on left foot with respect to robot's local coordinate
        - l_force_y_N : current y directional force on left foot with respect to robot's local coordinate
        - l_force_z_N : current z directional force on left foot with respect to robot's local coordinate
        - l_torque_roll_Nm : current x directional torque on left foot with respect to robot's local coordinate
        - l_torque_pitch_Nm : current x directional torque on left foot with respect to robot's local coordinate
        - l_torque_yaw_Nm : current x directional torque on left foot with respect to robot's local coordinate
    - description : the function for setting current force and torque from force-torque sensor on both feet
    - return value : void

    `void setMaximumAdjustment(double cob_x_max_adjustment_m,  double cob_y_max_adjustment_m,  double cob_z_max_adjustment_m,
                              double cob_roll_max_adjustment_rad, double cob_pitch_max_adjustment_rad, double cob_yaw_max_adjustment_rad,
                              double foot_x_max_adjustment_m, double foot_y_max_adjustment_m, double foot_z_max_adjustment_m,
                              double foot_roll_max_adjustment_rad, double foot_pitch_max_adjustment_rad, double foot_yaw_max_adjustment_rad)`
    - arguments :
        - cob_x_max_adjustment_m : the maximum x directinal linear modification of center of body
        - cob_y_max_adjustment_m : the maximum y directinal linear modification of center of body
        - cob_z_max_adjustment_m : the maximum z directinal linear modification of center of body
        - cob_roll_max_adjustment_rad : the maximum x directinal angular modification of center of body
        - cob_pitch_max_adjustment_rad : the maximum y directinal angular modification of center of body
        - cob_yaw_max_adjustment_rad : the maximum z directinal angular modification of center of body
        - foot_x_max_adjustment_m : the maximum x directinal linear modification of foot
        - foot_y_max_adjustment_m : the maximum y directinal linear modification of foot
        - foot_z_max_adjustment_m : the maximum z directinal linear modification of foot
        - foot_roll_max_adjustment_rad : the maximum x directinal angular modification of foot
        - foot_pitch_max_adjustment_rad : the maximum y directinal angular modification of foot
        - foot_yaw_max_adjustment_rad : the maximum z directinal angular modification of foot
    - description : the function for setting maximum modification
    - return value : void

    `void setCOBManualAdjustment(double cob_x_adjustment_m, double cob_y_adjustment_m, double cob_z_adjustment_m)`
    - arguments :
        - cob_x_adjustment_m : the x offset of center of body
        - cob_y_adjustment_m : the y offset of center of body
        - cob_z_adjustment_m : the z offset of center of body
    - description : the function for setting manual modification of center of body
    - return value : void

    `double getCOBManualAdjustmentX()`
    - arguments : void
    - description : the function for getting x directional manual modification of center of body
    - return value : x directional manual modification of center of body

    `double getCOBManualAdjustmentY()`
    - arguments : void
    - description : the function for getting y directional manual modification of center of body
    - return value : y directional manual modification of center of body

    `double getCOBManualAdjustmentZ()`
    - arguments : void
    - description : the function for getting z directional manual modification of center of body
    - return value : z directional manual modification of center of body

    `void setGyroBalanceGainRatio(double gyro_balance_gain_ratio)`
    - arguments :
    - gyro_balance_gain_ratio : gyro balance gain
    - description : the function for setting gyro balance gain
    - return value : void

    `double getGyroBalanceGainRatio(void)`
    - arguments : void
    - description : the function for getting set gyro balance gain
    - return value : current set gyro balance gain

    `DampingController foot_roll_angle_ctrl_`
    - description : damping controller for foot using roll angle
    `DampingController foot_pitch_angle_ctrl_`
    - description : damping controller for foot using pitch angle
    `DampingController right_foot_force_x_ctrl_`
    - description : damping controller for foot using force x on right foot
    `DampingController right_foot_force_y_ctrl_`
    - description : damping controller for foot using force y on right foot
    `DampingController right_foot_force_z_ctrl_`
    - description : damping controller for foot using force z on right foot
    `DampingController right_foot_torque_roll_ctrl_`
    - description : damping controller for foot using torque x on right foot
    `DampingController right_foot_torque_pitch_ctrl_`
    - description : damping controller for foot using torque y on right foot
    `DampingController left_foot_force_x_ctrl_`
    - description : damping controller for foot using force x on left foot
    `DampingController left_foot_force_y_ctrl_`
    - description : damping controller for foot using force y on left foot
    `DampingController left_foot_force_z_ctrl_`
    - description : damping controller for foot using force z on left foot
    `DampingController left_foot_torque_roll_ctrl_`
    - description : damping controller for foot using torque x on left foot
    `DampingController left_foot_torque_pitch_ctrl_`
    - description : damping controller for foot using torque y on left foot

5. BalanceControlUsingPDController Class

    `void initialize(const int control_cycle_msec)`
    - arguments :
        - control_cycle_msec : control cycel of motion module in milliseconds
    - description : the function that configures variables in the class according to arguments
    - return value : void

    `void setGyroBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with gyro
    - return value : void

    `void setOrientationBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with orientation from IMU sensor
    - return value : void

    `void setForceTorqueBalanceEnable(bool enable)`
    - arguments :
        - enable : true or false
    - description : The function that turns on or off the balance algorithm with force and torque from ft sensor
    - return value : void

    `void process(int *balance_error, Eigen::MatrixXd *robot_to_cob_modified, Eigen::MatrixXd *robot_to_right_foot_modified, Eigen::MatrixXd *robot_to_left_foot_modified)`
    - arguments :
        - balance_error : the one of below values would be returned
        - BalanceControlError::NoError(= 0) : There is no error.
        - BalanceControlError::BalanceLimit(= 0) : The modification value by the balance algorithm is greater than the maximum modification.
        - robot_to_cob_modified : the center of body modification calculated by balance algorithm
        - robot_to_right_foot_modified : the right foot modification calculated by balance algorithm
        - robot_to_left_foot_modified : the left_foot of body modification calculated by balance algorithm
    - description : calculating balance algorithm using desired values and sensor outputs
    - return value : void

    `void setDesiredPose(const Eigen::MatrixXd &robot_to_cob, const Eigen::MatrixXd &robot_to_right_foot, const Eigen::MatrixXd &robot_to_left_foot)`
    - arguments :
        - robot_to_cob : desired pose of center of body with respect to robot's local coordinate
        - robot_to_right_foot : desired pose of right foot with respect to robot's local coordinate
        - robot_to_left_foot : desired pose of left foot with respect to robot's local coordinate
    - description : the function for setting desired pose of right foot, left foot and center of body
    - return value : void

    `void setDesiredCOBGyro(double gyro_roll, double gyro_pitch)`
    - arguments :
        - gyro_roll : desired x directional angular velocity with respect robot's local coordinate
        - gyro_pitch : desired y directional angular velocity with respect robot's local coordinate
    - description : the function for setting desired angular velocity
    - return value : void

    `void setDesiredCOBOrientation(double cob_orientation_roll, double cob_orientation_pitch)`
    - arguments :
        - cob_orientation_roll : desired roll angle in radian of robot's local coordinate
        - cob_orientation_pitch : desired pitch angle in radian of robot's local coordinate
    - description : the function for setting desired robot's orientation
    - return value : void

    `void setDesiredFootForceTorque(double r_force_x_N,      double r_force_y_N,       double r_force_z_N,
                                     double r_torque_roll_Nm, double r_torque_pitch_Nm, double r_torque_yaw_Nm,
                                     double l_force_x_N,      double l_force_y_N,       double l_force_z_N,
                                     double l_torque_roll_Nm, double l_torque_pitch_Nm, double l_torque_yaw_Nm)`
    - arguments :
        - r_force_x_N : desired x directional force on right foot with respect to robot's local coordinate
        - r_force_y_N : desired y directional force on right foot with respect to robot's local coordinate
        - r_force_z_N : desired z directional force on right foot with respect to robot's local coordinate
        - r_torque_roll_Nm : desired x directional torque on right foot with respect to robot's local coordinate
        - r_torque_pitch_Nm : desired y directional torque on right foot with respect to robot's local coordinate
        - r_torque_yaw_Nm : desired z directional torque on right foot with respect to robot's local coordinate
        - l_force_x_N : desired x directional force on left foot with respect to robot's local coordinate
        - l_force_y_N : desired y directional force on left foot with respect to robot's local coordinate
        - l_force_z_N : desired z directional force on left foot with respect to robot's local coordinate
        - l_torque_roll_Nm : desired x directional torque on left foot with respect to robot's local coordinate
        - l_torque_pitch_Nm : desired x directional torque on left foot with respect to robot's local coordinate
        - l_torque_yaw_Nm : desired x directional torque on left foot with respect to robot's local coordinate
    - description : the function for setting desired force in newton and torque in newton-meter on feet
    - return value : void

    `void setCurrentGyroSensorOutput(double gyro_roll, double gyro_pitch)`
    - arguments :
        - gyro_roll : current x directional angular velocity with respect robot's local coordinate
        - gyro_pitch : current y directional angular velocity with respect robot's local coordinate
    - description : the function for setting current angular velocity from IMU sensor
    - return value :

    `void setCurrentOrientationSensorOutput(double cob_orientation_roll, double cob_orientation_pitch)`
    - arguments :
        - cob_orientation_roll : current roll angle in radian of robot's local coordinate
        - cob_orientation_pitch : current pitch angle in radian of robot's local coordinate
    - description : the function for setting current orientation from IMU sensor
    - return value : void

    `void setCurrentFootForceTorqueSensorOutput(double r_force_x_N,      double r_force_y_N,       double r_force_z_N,
                                               double r_torque_roll_Nm, double r_torque_pitch_Nm, double r_torque_yaw_Nm,
                                               double l_force_x_N,      double l_force_y_N,       double l_force_z_N,
                                               double l_torque_roll_Nm, double l_torque_pitch_Nm, double l_torque_yaw_Nm)`
    - arguments :
        - r_force_x_N : current x directional force on right foot with respect to robot's local coordinate
        - r_force_y_N : current y directional force on right foot with respect to robot's local coordinate
        - r_force_z_N : current z directional force on right foot with respect to robot's local coordinate
        - r_torque_roll_Nm : current x directional torque on right foot with respect to robot's local coordinate
        - r_torque_pitch_Nm : current y directional torque on right foot with respect to robot's local coordinate
        - r_torque_yaw_Nm : current z directional torque on right foot with respect to robot's local coordinate
        - l_force_x_N : current x directional force on left foot with respect to robot's local coordinate
        - l_force_y_N : current y directional force on left foot with respect to robot's local coordinate
        - l_force_z_N : current z directional force on left foot with respect to robot's local coordinate
        - l_torque_roll_Nm : current x directional torque on left foot with respect to robot's local coordinate
        - l_torque_pitch_Nm : current x directional torque on left foot with respect to robot's local coordinate
        - l_torque_yaw_Nm : current x directional torque on left foot with respect to robot's local coordinate
    - description : the function for setting current force and torque from force-torque sensor on both feet
    - return value : void

    `void setMaximumAdjustment(double cob_x_max_adjustment_m,  double cob_y_max_adjustment_m,  double cob_z_max_adjustment_m,
                              double cob_roll_max_adjustment_rad, double cob_pitch_max_adjustment_rad, double cob_yaw_max_adjustment_rad,
                              double foot_x_max_adjustment_m, double foot_y_max_adjustment_m, double foot_z_max_adjustment_m,
                              double foot_roll_max_adjustment_rad, double foot_pitch_max_adjustment_rad, double foot_yaw_max_adjustment_rad)`
    - arguments :
        - cob_x_max_adjustment_m : the maximum x directinal linear modification of center of body
        - cob_y_max_adjustment_m : the maximum y directinal linear modification of center of body
        - cob_z_max_adjustment_m : the maximum z directinal linear modification of center of body
        - cob_roll_max_adjustment_rad : the maximum x directinal angular modification of center of body
        - cob_pitch_max_adjustment_rad : the maximum y directinal angular modification of center of body
        - cob_yaw_max_adjustment_rad : the maximum z directinal angular modification of center of body
        - foot_x_max_adjustment_m : the maximum x directinal linear modification of foot
        - foot_y_max_adjustment_m : the maximum y directinal linear modification of foot
        - foot_z_max_adjustment_m : the maximum z directinal linear modification of foot
        - foot_roll_max_adjustment_rad : the maximum x directinal angular modification of foot
        - foot_pitch_max_adjustment_rad : the maximum y directinal angular modification of foot
        - foot_yaw_max_adjustment_rad : the maximum z directinal angular modification of foot
    - description : the function for setting maximum modification
    - return value : void

    `void setCOBManualAdjustment(double cob_x_adjustment_m, double cob_y_adjustment_m, double cob_z_adjustment_m)`
    - arguments :
        - cob_x_adjustment_m : the x offset of center of body
        - cob_y_adjustment_m : the y offset of center of body
        - cob_z_adjustment_m : the z offset of center of body
    - description : the function for setting manual modification of center of body
    - return value : void

    `double getCOBManualAdjustmentX()`
    - arguments : void
    - description : the function for getting current set x directional manual modification of center of body
    - return value : x directional manual modification of center of body

    `double getCOBManualAdjustmentY()`
    - arguments : void
    - description : the function for getting current set y directional manual modification of center of body
    - return value : y directional manual modification of center of body

    `double getCOBManualAdjustmentZ()`
    - arguments : void
    - description : the function for getting current set z directional manual modification of center of body
    - return value : z directional manual modification of center of body

    `BalancePDController foot_roll_gyro_ctrl_`
    - description : PD controller for foot using x directional gyro

    `BalancePDController foot_pitch_gyro_ctrl_`
    - description : PD controller for foot using y directional gyro

    `BalancePDController foot_roll_angle_ctrl_`
    - description : PD controller for foot using roll angle

    `BalancePDController right_foot_force_x_ctrl_`
    - description : PD controller for foot using x directional force on right foot

    `BalancePDController right_foot_force_y_ctrl_`
    - description : PD controller for foot using y directional force on right foot

    `BalancePDController right_foot_force_z_ctrl_`
    - description : PD controller for foot using z directional force on right foot

    `BalancePDController right_foot_torque_roll_ctrl_`
    - description : PD controller for foot using x directional torque on right foot

    `BalancePDController right_foot_torque_pitch_ctrl_`
    - description : PD controller for foot using y directional torque on right foot

    `BalancePDController left_foot_force_x_ctrl_`
    - description : PD controller for foot using x directional force on left foot

    `BalancePDController left_foot_force_y_ctrl_`
    - description : PD controller for foot using y directional force on left foot

    `BalancePDController left_foot_force_z_ctrl_`
    - description : PD controller for foot using z directional force on left foot

    `BalancePDController left_foot_torque_roll_ctrl_`
    - description : PD controller for foot using x directional torque on left foot

    `BalancePDController left_foot_torque_pitch_ctrl_`
    - description : PD controller for foot using y directional torque on left foot

    `BalanceLowPassFilter roll_gyro_lpf_`
    - description : Low Pass Filter for x directional angular velocity from IMU

    `BalanceLowPassFilter pitch_gyro_lpf_`
    - description : Low Pass Filter for y directional angular velocity from IMU

    `BalanceLowPassFilter roll_angle_lpf_;`
    - description : Low Pass Filter for roll angle from IMU

    `BalanceLowPassFilter pitch_angle_lpf_;`
    - description : Low Pass Filter for pitch angle from IMU

    `BalanceLowPassFilter right_foot_force_x_lpf_;`
    - description : Low Pass Filter for x directional force from force-torque sensor on right foot

    `BalanceLowPassFilter right_foot_force_y_lpf_;`
    - description : Low Pass Filter for y directional force from force-torque sensor on right foot

    `BalanceLowPassFilter right_foot_force_z_lpf_;`
    - description : Low Pass Filter for z directional force from force-torque sensor on right foot

    `BalanceLowPassFilter right_foot_torque_roll_lpf_;`
    - description : Low Pass Filter for x directional torque from force-torque sensor on right foot

    `BalanceLowPassFilter right_foot_torque_pitch_lpf_;`
    - description : Low Pass Filter for y directional torque from force-torque sensor on right foot

    `BalanceLowPassFilter left_foot_force_x_lpf_;`
    - description : Low Pass Filter for x directional force from force-torque sensor on left foot

    `BalanceLowPassFilter left_foot_force_y_lpf_;`
    - description : Low Pass Filter for y directional force from force-torque sensor on left foot

    `BalanceLowPassFilter left_foot_force_z_lpf_;`
    - description : Low Pass Filter for z directional force from force-torque sensor on left foot

    `BalanceLowPassFilter left_foot_torque_roll_lpf_;`
    - description : Low Pass Filter for x directional torque from force-torque sensor on left foot

    `BalanceLowPassFilter left_foot_torque_pitch_lpf_;`
    - description : Low Pass Filter for y directional torque from force-torque sensor on left foot


### [imu-3dm-gx4](#imu-3dm-gx4)

This module is for the IMU Sensor(MicroStrain 3DM-GX4-25).
This module exists in a separated Node, and this module is launched along with the thormang3_manager when executing .launch file of the thormang3_manager.
This is the modified version of KumarRobotics/imu_3dm_gx4.

#### ROS API

- Published Topics
    `/robotis/sensor/imu/imu` (sensor_msgs/Imu)
    Current output of the IMU Sensor


## [PPC Packages](#ppc-packages)


## [OPC Packages](#opc-packages)


## [Common Packages](#common-packages)


## [Tools Packages](#tools-packages)


## [THORMANG msgs Package](#thormang-msgs-package)


[MPC Installation]: https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/ROBOTIS-ROS-Package-installation#21-mpc
[std_msgs/Int32]: http://docs.ros.org/api/std_msgs/html/msg/Int32.html
[std_msgs/String]: http://docs.ros.org/api/std_msgs/html/msg/String.html
[thormang3_action_module_msgs/StartAction]: https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/StartAction.msg
[robotis_controller_msgs/StatusMsg]: https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/StatusMsg.msg
[thormang3_action_module_msgs/IsRunning]: https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/(thormang3_action_module_msgs)IsRunning.srv
