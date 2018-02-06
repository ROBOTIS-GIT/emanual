- File: [`thormang3_walking_module_msgs/DampingBalanceParam.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-THORMANG-MPC/blob/master/thormang3_walking_module_msgs/msg/DampingBalanceParam.msg)

- Message Definition
 ```
 float32 cob_x_offset_m
 float32 cob_y_offset_m

 float32 hip_roll_swap_angle_rad

 float32 gyro_gain

 float32 foot_roll_angle_gain
 float32 foot_pitch_angle_gain

 float32 foot_x_force_gain
 float32 foot_y_force_gain
 float32 foot_z_force_gain
 float32 foot_roll_torque_gain
 float32 foot_pitch_torque_gain

 float32 foot_roll_angle_time_constant
 float32 foot_pitch_angle_time_constant

 float32 foot_x_force_time_constant
 float32 foot_y_force_time_constant
 float32 foot_z_force_time_constant
 float32 foot_roll_torque_time_constant
 float32 foot_pitch_torque_time_constant
 ```

- Description
These are the parameters used in the Balance Algorithm.
Most algorithms are based on PD Control, therefore, gain and timeconstant are declared in pairs.

**COB Offset**
* ` float32 cob_x_offset_m`
&emsp;&emsp; x_offset of cob
* ` float32 cob_y_offset_m`
&emsp;&emsp; y_offset of cob


**FeedForward**
* ` float32 hip_roll_swap_angle_rad`
&emsp;&emsp; Feedforward of Hip Roll



**Gain**
* ` float32 gyro_gain`
&emsp;&emsp; Gain for the Gyro
* ` float32 foot_roll_angle_gain`
&emsp;&emsp; Gain for the Roll data acquired from the IMU
* ` float32 foot_pitch_angle_gain`
&emsp;&emsp; Gain for the Pitch data acquired from the IMU
* ` float32 foot_x_force_gain`
&emsp;&emsp; Gain for the Fx data acquired from the FT Sensor
* ` float32 foot_y_force_gain`
&emsp;&emsp; Gain for the Fy data acquired from the FT Sensor
* ` float32 foot_z_force_gain`
&emsp;&emsp; Gain for the Fz data acquired from the FT Sensor
* ` float32 foot_roll_torque_gain`
&emsp;&emsp; Gain for the Tx data acquired from the FT Sensor
* ` float32 foot_pitch_torque_gain`
&emsp;&emsp; Gain for the Ty data acquired from the FT Sensor



**Time Constant**
* ` float32 foot_roll_angle_time_constant`
&emsp;&emsp; Time constant for the Roll data acquired from the IMU
* ` float32 foot_pitch_angle_time_constant`
&emsp;&emsp; Time constant for the Pitch data acquired from the IMU
* ` float32 foot_x_force_time_constant`
&emsp;&emsp; Time constant for the Fx data acquired from the FT Sensor
* ` float32 foot_y_force_time_constant`
&emsp;&emsp; Time constant for the Fy data acquired from the FT Sensor
* ` float32 foot_z_force_time_constant`
&emsp;&emsp; Time constant for the Fz data acquired from the FT Sensor
* ` float32 foot_roll_torque_time_constant`
&emsp;&emsp; Time constant for the Tx data acquired from the FT Sensor
* ` float32 foot_pitch_torque_time_constant`
&emsp;&emsp; Time constant for the Tz data acquired from the FT Sensor

<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
