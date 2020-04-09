---
layout: popup
---

- File: `thormang3_walking_module_msgs/StepTimeData.msg`

- Message Definition

 ```c
   ## WalkingStateFlag
   int16   walking_state
   int16   InWalkingStarting=0 #WalkingStarting
   int16   InWalking= 1        #Walking
   int16   InWalkingEnding=2   #WalkingEnding

   # global time (Unit:sec)
    float32 abs_step_time

   # dsp_ratio >= 0.0 dsp_ratio < 1.0, recommand value is 0.2
    float32 dsp_ratio

   # 0.0 <= start_time_delay_ratio    < 1.0
   # 0.0 <= finish_time_advance_ratio < 1.0
   # 0.0 <= start_time_delay_ratio +  finish_time_advance_ratio < 1.0
   # default value is 0.0
   float32 start_time_delay_ratio_x
   float32 start_time_delay_ratio_y
   float32 start_time_delay_ratio_z
   float32 start_time_delay_ratio_roll
   float32 start_time_delay_ratio_pitch
   float32 start_time_delay_ratio_yaw
   float32 finish_time_advance_ratio_x
   float32 finish_time_advance_ratio_y
   float32 finish_time_advance_ratio_z
   float32 finish_time_advance_ratio_roll
   float32 finish_time_advance_ratio_pitch
   float32 finish_time_advance_ratio_yaw

 ```

- Description
Time related Step Data Parameters
&emsp;

    * `int16   walking_state`
&emsp;&emsp; Flag for the Walking State
     ```c
    int16 InWalkingStarting = 0 #WalkingStarting
    int16 InWalking = 1         #Walking
    int16 InWalkingEnding = 2   #WalkingEnding
     ```

    * ` float32 abs_step_time`
&emsp;&emsp; Time to terminate current step.
&emsp;&emsp; The unit is in second and the parameter has to be set in accordance with the global time.

    * ` float32 dsp_ratio`
&emsp;&emsp; DSP(Double Support Phase) ratio of current step
     ```
    dsp_ratio >= 0.0 dsp_ratio < 1.0, recommand value is 0.2
     ```

    * ` float32 start_time_delay_ratio_x`
&emsp;&emsp; Set the delay ratio of the start time for the movement on X axis.

    * ` float32 start_time_delay_ratio_y`
&emsp;&emsp; Set the delay ratio of the start time for the movement on Y axis.

    * ` float32 start_time_delay_ratio_z`
&emsp;&emsp; Set the delay ratio of the start time for the movement on Z axis.

    * ` float32 start_time_delay_ratio_roll`
&emsp;&emsp; Set the delay ratio of the start time for the roll movement.

    * ` float32 start_time_delay_ratio_pitch`
&emsp;&emsp; Set the delay ratio of the start time for the pitch movement.

    * ` float32 start_time_delay_ratio_yaw`
&emsp;&emsp; Set the delay ratio of the start time for the yaw movement.

    * ` float32 finish_time_advance_ratio_x`
&emsp;&emsp; Set the advance ratio of the finish time for the movement on X axis.

    * ` float32 finish_time_advance_ratio_y`
&emsp;&emsp; Set the advance ratio of the finish time for the movement on Y axis.

    * ` float32 finish_time_advance_ratio_z`
&emsp;&emsp; Set the advance ratio of the finish time for the movement on Z axis.

    * ` float32 finish_time_advance_ratio_roll`
&emsp;&emsp; Set the advance ratio of the finish time for the roll movement.

    * ` float32 finish_time_advance_ratio_pitch`
&emsp;&emsp; Set the advance ratio of the finish time for the pitch movement.

    * ` float32 finish_time_advance_ratio_yaw`
&emsp;&emsp; Set the advance ratio of the finish time for the yaw movement.
&emsp;&emsp; Start Time Delay Ratio and Finish Time Advance Ratio have to fulfill following conditions.
     ```c
    0.0 <= start_time_delay_ratio    < 1.0
    0.0 <= finish_time_advance_ratio < 1.0
    0.0 <= start_time_delay_ratio +  finish_time_advance_ratio < 1.0
    default value is 0.0
     ```
