- File: [`thormang3_walking_module_msgs/BalanceParam.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_walking_module_msgs/msg/BalanceParam.msg)

- Message Definition
 ```
 float32 cob_x_offset_m
 float32 cob_y_offset_m

 float32 hip_roll_swap_angle_rad

 float32 foot_roll_gyro_p_gain
 float32 foot_roll_gyro_d_gain
 float32 foot_pitch_gyro_p_gain
 float32 foot_pitch_gyro_d_gain

 float32 foot_roll_angle_p_gain
 float32 foot_roll_angle_d_gain
 float32 foot_pitch_angle_p_gain
 float32 foot_pitch_angle_d_gain

 float32 foot_x_force_p_gain
 float32 foot_x_force_d_gain
 float32 foot_y_force_p_gain
 float32 foot_y_force_d_gain
 float32 foot_z_force_p_gain
 float32 foot_z_force_d_gain
 float32 foot_roll_torque_p_gain
 float32 foot_roll_torque_d_gain
 float32 foot_pitch_torque_p_gain
 float32 foot_pitch_torque_d_gain

 float32 roll_gyro_cut_off_frequency
 float32 pitch_gyro_cut_off_frequency

 float32 roll_angle_cut_off_frequency
 float32 pitch_angle_cut_off_frequency

 float32 foot_x_force_cut_off_frequency
 float32 foot_y_force_cut_off_frequency
 float32 foot_z_force_cut_off_frequency
 float32 foot_roll_torque_cut_off_frequency
 float32 foot_pitch_torque_cut_off_frequency
 ```

- Description
These are the parameters used in the Balance Algorithm.
PD Control and low pass filter are used, therefore, PD gain and cut off frequency are declared in pairs.

**COB Offset**
* ` float32 cob_x_offset_m`
&emsp;&emsp; x_offset of center of body
* ` float32 cob_y_offset_m`
&emsp;&emsp; y_offset of center of body


**FeedForward**
* ` float32 hip_roll_swap_angle_rad`
&emsp;&emsp; Feedforward of Hip Roll


**Gain**
* ` float32 foot_roll_gyro_p_gain`
&emsp;&emsp; P Gain for foot using x directional angular velocity acquired from the IMU
* ` float32 foot_roll_gyro_d_gain`
&emsp;&emsp; D Gain for foot using x directional angular velocity acquired from the IMU
* ` float32 foot_pitch_gyro_p_gain`
&emsp;&emsp; P Gain for foot using y directional angular velocity acquired from the IMU
* ` float32 foot_pitch_gyro_d_gain`
&emsp;&emsp; D Gain for foot using y directional angular velocity acquired from the IMU
* ` float32 foot_roll_angle_p_gain`
&emsp;&emsp; P Gain for foot using Roll angle acquired from the IMU
* ` float32 foot_roll_angle_d_gain`
&emsp;&emsp; D Gain for foot using Roll angle acquired from the IMU
* ` float32 foot_pitch_angle_p_gain`
&emsp;&emsp; P Gain for foot using Pitch angle acquired from the IMU
* ` float32 foot_pitch_angle_d_gain`
&emsp;&emsp; D Gain for foot using Pitch angle acquired from the IMU
* ` float32 foot_x_force_p_gain`
&emsp;&emsp; P Gain for foot using x directional force
* ` float32 foot_x_force_d_gain`
&emsp;&emsp; D Gain for foot using x directional force
* ` float32 foot_y_force_p_gain`
&emsp;&emsp; P Gain for foot using y directional force
* ` float32 foot_y_force_d_gain`
&emsp;&emsp; D Gain for foot using y directional force
* ` float32 foot_z_force_p_gain`
&emsp;&emsp; P Gain for foot using z directional force
* ` float32 foot_z_force_d_gain`
&emsp;&emsp; D Gain for foot using z directional force
* ` float32 foot_roll_torque_p_gain`
&emsp;&emsp; P Gain for foot using x directional torque
* ` float32 foot_roll_torque_d_gain`
&emsp;&emsp; D Gain for foot using x directional torque
* ` float32 foot_pitch_torque_p_gain`
&emsp;&emsp; P Gain for foot using y directional torque
* ` float32 foot_pitch_torque_d_gain`
&emsp;&emsp; D Gain for foot using y directional torque


**Cut Off Frequency**
* ` float32 roll_gyro_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the x directional angular velocity acquired from the IMU
* ` float32 pitch_gyro_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the y directional angular velocity acquired from the IMU
* ` float32 roll_angle_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the Roll angle acquired from the IMU
* ` float32 pitch_angle_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the Pitch angle acquired from the IMU
* ` float32 foot_x_force_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the x directional force from Force-Torque sensor
* ` float32 foot_y_force_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the y directional force from Force-Torque sensor
* ` float32 foot_z_force_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the z directional force from Force-Torque sensor
* ` float32 foot_roll_torque_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the x directional torque from Force-Torque sensor
* ` float32 foot_pitch_torque_cut_off_frequency`
&emsp;&emsp; Cut Off Frequency for the y directional torque from Force-Torque sensor


<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
