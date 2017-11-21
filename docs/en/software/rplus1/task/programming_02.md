---
layout: archive
lang: en
ref: rplus1_task_programming_02
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus1/task/programming_02/
sidebar:
  title: R+ Task 1.0
  nav: "rplustask1"
---

<div style="counter-reset: h1 3 h2 2">
</div>

## [Controller Parameters](#controller-parameters)

### [Remocon TXD](#remocon-txd)

This parameter is used to transmit data via a wireless communication module (IR, zigbee module).

- The data must be a number/value between  0 & 65535 transmitted or sent, wirelessly (IR or Zigbee).
- When the "Remocon TXD" parameter is set, the data is immediately sent wirelessly.

`Note` Compatiable Controllers : [CM-100], [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}


#### Example

In the example below, the program waits for data, and when the data arrives, the received data is transmitted wirelessly.

It is commonly used to send a response to the control program on a PC connected using ZIG2Serial.

![Remocon TXD][img_remocon_txd]

### [Remocon RXD](#remocon-rxd)

This parameter is used to read the received data received via the wireless communication module (IR, zigbee module).

- The data is a number between 0 and 65535.
- The [Remocon Arrived] parameter can be used check for new data.
- You can save up to maximum 2 wireless data by using a receiving buffer.
- When 2 data are saved in the receiving buffer, firstly received data will be read at first, and the remaining data will be read at second according to the received order. If there is only 1 data value in the buffer, when READ is executed, the latest data will be retrieved.

`Note` Compatiable Controllers : [CM-100], [CM-5], [CM-510], [CM-700]
{: .notice}

#### Example

The code below shows how to control movement direction using the RC-100.

![Remocon RXD][img_remocon_rxd]

### [Remocon Arrived](#remocon-arrived)

This parameter is used to check whether there are any new data received via the wireless communication module(IR, zigbee module).

This value is either TRUE or FALSE.
- TRUE ( 1 ) : There is new data in the input buffer.
- FALSE ( 0 ) : All data in the input buffer have been retrieved.

`Note` Compatiable Controllers : [CM-100], [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

The code below shows how to control movement direction using RC-100.

Normally used to check whether new data has been received to process.

![Remocon Arrived][img_remocon_arrived]

### [Aux LED](#aux-led)

This parameter is either TRUE or FALSE and used to read and set the controller's Aux LED status.

- TRUE (1) :  When the Aux LED parameter is set to TRUE, the LED will turn on. When the Aux LED parameter is read, a value of TRUE signifies that the LED is on.
- FALSE (0) : When the Aux LED parameter is set to FALSE, the LED will turn off.  When the Aux LED parameter is read, a value of FALSE signifies that the LED is off. False means that the input buffer is empty. i.e either no data has been received or all data has been retrieved

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

In this example, the Aux LED is turned on and off for 1 second 3 times.

![Aux LED][img_aux_led]

### [Button](#button)

This parameter is used to read the controller's button status.

- For CM-5, CM-510, CM-530
  - Each button is assigned a unique value as follows.
  - R button : 1, L button : 2, D button : 4, U button : 8, START button : 16
  - When several buttons are pressed, the value assigned to the pressed buttons are added and read.
  - Even if you do not know the buttons' code values, you can easily determine which buttons have been pressed by using the buttons' constant values.

- For OpenCM9.04
  - Use of true/false constants
  - When button is pressed(ture), When button is not pressed (false)

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700], [OpenCM9.04]
{: .notice}

![Button][img_button]

#### Example

This example shows how to perform different motions depending on which button is pressed.

![Button Example][img_button_example]

### [Timer](#timer)

This parameter is used read the timer's current value or to set the timer, which begins to count down automatically.  The timer is located in the controller.

You can use "Timer value" constant to set the timer's value.

![Timer][img_timer]

When a decimal number is entered,  it will automatically be converted to the corresponding timer value.
The actual timer value is between 0 and 255.  Each timer value is 0.128 seconds.
If you set a value greater than 0 in the timer parameter, the timer will start to count down every 0.128 seconds.

`Note` Compatiable Controllers : [CM-100], [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

The code below will print the value from the Center IR sensor every second.

![Timer Example][img_timer_example]

### [HR Timer](#hr-timer)

Internally the controller sets a counter; this is the parameter for the high resolution timer. This timer is set for every 1ms, useful for more accurate timing.

- You can use "Timer value" constant to set the timer's value.

![HR Timer 01][img_hr_timer_01]
![HR Timer 02][img_hr_timer_02]

- When a decimal number is entered, it will automatically be converted to the corresponding timer value.
- The actual timer value is between 0 and 65535.  Each timer value is 0.001 seconds.
- If you set a value greater than 0 in the timer parameter, the timer will start to count down every 0.001 seconds.

`Note` Compatiable Controllers : [CM-530]
{: .notice}

#### Example

While in fast forward motion the timer can help the tires react faster upon detection of a line.

![HR Timer Example][img_hr_timer_example]

### [Remocon ID](#remocon-id)

This parameter is used to set or read the currently set remote control ID. Please note that the controller will not receive any data if this parameter does not match the ID of the transmitting remote.

- The ID is a number between 0 and 65535.
- When the opponent's ID is set to 65535(0xFFFF, in hexadecimal), it will send data to all Zigbee modules, regardless of ID.(Broadcasting Mode)

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

This example sets the opponent's wireless ID to "123", reads the value, and prints it on the screen.

![Remocon ID][img_remocon_id]

- For seamless Zigbee communication, the opponent's wireless ID must be set to the correct value.
- Using the broadcasting mode improperly may cause unforeseen problems.

### [My ID](#my-id)

- CM-100
  - This parameter is used to determine whether or not a module ZIG-110 module has been installed.
  - If a ZIG-110 wireless communication module is installed, TRUE(1) is returned.  Otherwise, FALSE(2), is returned.

- Other Controllers : This parameter is used to read the ID of the Zigbee module installed in the robot.
  - If a ZigBee module is installed, its ID is read (a number between 0 and 65534). If not, 65535 (0xFFFF in hexadecimal) is returned.

`Note` Compatiable Controllers : [CM-100], [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

This example checks whether a ZIG-110 module is installed in the CM-100 controller. If the module is not installed, it sets the RC-100 channel according to the number of times the start button is pressed.

![My ID Example 01][img_my_id_example_01]

This example prints the ZigBee module's ID. This code can be used with controllers other than CM-100.

![My ID Example 02][img_my_id_example_02]

### [IR Left/Center/Right](#ir-leftcenterright)

This parameters are used to read the IR sensors' values.

- The sensor value is between 0 and 1023.
- For objects with the same or similar color, the closer it is, the higher the value(closer to 1023), and the farther away it is, the lower the value (closer to 0).
- For objects with the same distance, the lighter(white) the object, the higher the value, and the darker(black) the object, the lower the value.

`Note` Compatiable Controllers : [CM-100]
{: .notice}

#### Example

In this example, specific motions are performed when only the left IR sensor detects an object or when only the right IR sensor detects an object..

![Controller IR Sensor][img_controller_ir_sensor]

- Sensor values may be affected by external lights which emit infrared rays such as sunlight or a fluorescent lamp.
- Sensor values depend on the object's color or surrounding light, so using the IR sensor to measure the exact distance is not recommended.
- As above mentioned, IR sensor values are different if objects have different colors, even if they are the same distance away. This characteristic can be utilized to distinguish black from white(Can be used for tracing line).

### [Buzzer Index](#buzzer-index)

This parameter is used to set the musical note or melody to be played or to retrieve the note or melody currently being played using the buzzers in the controller.

- The "Buzzer Time" parameter must always be used with the "Buzzer Index" parameter.  "Buzzer Time" must be set before "Buzzer Index" is set. (The order is important) (Click here for more information on "Buzzer Time".)
- Depending on what the "Buzzer Time" is set to, "Buzzer Index" can be set to play a musical note or a melody.
  - When "Buzzer  Time" is set to 255 : Melody Mode
  - Choose from 16 different melodies (0~15).

    ![Buzzer 01][img_buzzer_01]

  - When "Buzzer Time" is between 0 and 254 : Musical Note Mode
  - Choose from 27 notes.  The selected notes will play for the length set as " Buzzer Time".

    ![Buzzer 02][img_buzzer_02]

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-530]
{: .notice}

#### Example

Plays melody 3.

![Buzzer Example 01][img_buzzer_example_01]

Plays Do, Mi and Sol for 0.3 seconds each.

![Buzzer Example 02][img_buzzer_example_02]

### [Buzzer Time](#buzzer-time)

This parameter is used to set how long the note or melody will be played or to retrieve how much longer it will be played.

- The "Buzzer Time" parameter is always used with the "Buzzer Index" parameter. "Buzzer Time" must be set before "Buzzer Index" is set. (The order is important) (Click here for more information on "Buzzer Time.")
- "Buzzer Time" can be set to a value between 0 and 255.
- Each value represents 0.1 second.  For example, when "Buzzer Time" is set to 1, the note will be played for 0.1 second.  The maximum length a note will be played is 5 seconds. Therefore, when values between 50 and 254 are entered, the note will be played for 5 seconds.
  - When "Buzzer Time" is set to 255 : Melody Mode
  - Choose from 16 different melodies ('0~15) .
  - When the melody finishes playing, "Buzzer Time" is reset to 0.

    ![Buzzer 01][img_buzzer_01]

  - When "Buzzer Time" is between 0 and 254 :Musical Note Mode
  - Choose from 27 notes.  The selected note will play for the length set as "Buzzer Time."

    ![Buzzer 02][img_buzzer_02]

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-530]
{: .notice}

#### Example

Plays melody 3. (Same as the example in "Buzzer Index")

![Buzzer Example 01][img_buzzer_example_01]

Plays Do, Mi and Sol for 0.3 seconds each.(Same as the example in "Buzzer Index")

![Buzzer Example 02][img_buzzer_example_02]

- "Buzzer Time" cannot be set while a note or melody is being played.

### [Sound Count](#sound-count)

A controller equipped with a microphone has a function to count sounds when the sound is louder than a certain threshold.  For example, it is possible to count claps.  This parameter is used to retrieve the number of detected sounds.

- "Sound Count" uses the numbers between 0 and  255.  As a result, the maximum number of sounds counted is 255.
- When the sounds are no longer detected, the number of detected sounds will be input into the "Sound Count" parameter.
- Because "Sound Count" is not initialized automatically, you have to reset it to 0 before use.

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-530]
{: .notice}

#### Example

Detects sounds and repeats a specific motion for as many times as it is detected.

![Sound Count][img_sound_count]

- The geared motor connected to the controller may make loud noises while moving, which will be detected by the microphone. Please use the sound detection function only when the OLLO/Bioloid has stopped moving completely.

### [Current Sound Count](#current-sound-count)

A controller equipped with a microphone has a function to count sounds when the sound is louder than a certain threshold.  For example, it is possible to count claps.  This parameter is used to retrieve the number of detected sounds.

- "Current Sound Count" uses numbers between 0 and 255.  As a result, the maximum number of sounds counted is 255.
- The parameter value is increased in real-time whenever a sound is detected.
- If a new sound is not detected for 0.8 seconds, the value of the "Current Sound Count" parameter is passed to the "Sound Count" parameter, and the "Current Sound Count" parameter is reset to 0.

`Note` Compatiable Controllers : [CM-100], [CM-510]
{: .notice}

#### Example

This code saves the current sound count  in the "DetectionCount" variable.

![Current Sound Count Example 01][img_current_sound_count_example_01]

This code pauses the program when no sounds are detected.

![Current Sound Count Example 02][img_current_sound_count_example_02]

This code executes a block of code when 3 sounds are detected.

![Current Sound Count Example 03][img_current_sound_count_example_03]

- When it is connected with controller, sometimes the sounds of geared motor can be too loud to be input in the controller in normal way. Please use the sound detection function only when the OLLO/Bioloid has stopped moving completely.

### [Button Count](#button-count)

This parameter is used to read how many times the START button was pressed when the controller was first turned on.

"Button Counts" uses numbers between 0 and 255.  As a result, only up to 255 button presses can be counted .

`Note` Compatiable Controllers : [CM-100], [CM-150]
{: .notice}

#### Example

The example executes different motions according to how many times the START button was pressed - once, twice, or more.

![Button Example][img_button_example]

### [Powersave Timer](#powersave-timer)

The controller has a hibernate function to conserve battery.  If no commands are received for a set period, the controller can turn itself off.  This parameter is used to set how long the controller will wait or how much time is left.

- "Powersave timer" can be set using powersave constants.

  ![Powersave][img_powersave]

- "Powersave timer" uses numbers between 0 and 255.
- The unit is minutes (i.e., a value of 1 equals 1 minute)
- The default value is 5 minutes.
- Setting the "Powersave timer" to 0 will turn it off.
- The time remaining on the timer is always in minutes. For example, when 50 seconds remain, the timer will say that 1 minute remains.

`Note` Compatiable Controllers : [CM-100], [CM-150]
{: .notice}

#### Example

The controller will be turned off if no data is received for 2 minutes.  If data is received, the timer is reset to 2 minutes.

![Powersave Example][img_powersave_example]

- To keep the controller from turning itself off even when certain actions are performed, you must manually reset "Powersave timer."

### [RC-100 Channel](#rc-100-channel)

This parameter is used to set up the infrared communication channel or to check the current channel between the controller's IR receiver and RC-100.

- The RC-100 channel can be set using constant numbers.

  ![RC100][img_rc100]

- "RC-100 Channel" uses numbers between 0 and 8.
- The Channel 0 is the special one that can be communicated with every other channels.

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-530]
{: .notice}


#### Example

Sets the RC-100 channel according to how many times the START button was pressed.

![RC100 Example][img_rc100_example]

- For smooth infrared wireless communication, please refer to the section on how to set the channel for RC-100, and make sure that both RC-100 and the controller's IR receiver are set to the same channel.

## [Motion Parameters](#motion-parameters)

### [Motion Page](#motion-page)

This parameter executes motions.

- When the motion page number is entered, the corresponding motion is executed.
- "Motion Page" can be read to see which motion is currently being executed.
- Certain page numbers can be used to stop the current motion.
  - When the stop command is executed, "Number of Page Repeats" will be ignored.
  - To confirm that a motion has stopped completely, check the motion status.
  - When "Motion Page" is set to 0, the controller will execute to the Exit page and stop.
  - When "Motion Page" is set to -1, the controller will execute to the current page and stop.
- If a page with no motions is set, an error message will be returned. (See error messages)
- "Motion Page" uses numbers between 1 and 255. (Some controllers use numbers between 1 and 127.)

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

Executes motion page #3.

![Motion Page][img_motion_page]

### [Motion Status](#motion-status)

This parameter is used to check the status of the motion.

- If a motion is being performed, 1 is returned.  Otherwise, 0 is returned.
- True/False can also be used.
  - True: Motion is being performed.
  - False: Motion is not being performed.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

Executes motion page #3 and waits until it is completed.

![Motion Status][img_motion_status]

### [Joint Offset](#joint-offset)

To apply the joint offset to a robot, a motion must be performed after the "Joint Offset" parameter is set.
{: .notice}

This parameter can be applied to each joint separately.

- -255 ~ 255 : The offset will be applied to the selected joint's location value.
  - Ex) If the location value of the joint with ID #3 is set as 300 → 400 → 500 in the motion data, and the joint offset is -100, the actual location value of the joint will be adjusted to 200 → 300 → 400.

- 1024 : If the joint offset is set to 1024, the selected joint will not be affected by the motion data during operation.
  - Ex) This function can be used to control the location values directly, instead of the motion.  A primary example is the Gripper, which should not move when a motion is being performed.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-530], [CM-700]
{: .notice}

#### Example

- Set an offset value to a specific joint.
  While motion page #3 is being performed, set the offset of the joint with ID 4 as -100, and wait for the motion to finish.

  ![Joint Example 01][img_joint_example_01]

- Keep a joint from being affected by motion data
  Set up joint ID #4 to be unaffected while a motion is being executed.
  ![Joint Example 02][img_joint_example_02]

## [Peripheral Devices](#Peripheral-devices)

Peripheral devices are modules connected directly to the controller. The followings are peripheral devices.

### [Reduction Motor](#reduction-motor)

This parameter is used to control the reduction motor's direction and power (Speed).
(Please refer to the Geared Motor [GM-12A] for more information)

- The reduction motor's control values can be set using motor control constants.
- The direction and power must be set together.

  ![Reduction Motor][img_reduction_motor]

- CCW (Counter clock wise) 0 ~ 1023 : Decimal numbers between 0 and 1023
- CW (Clockwise) 0 ~ 1023 : Decimal numbers between 1024 and 2047

The control values are numbers between 0 and 2047.

`Note` Compatiable Controllers : [CM-100]
{: .notice}

#### Example

In this example, the reduction motor connected to Port 1 will rotate in the clockwise direction for 1 second at maximum speed, before rotating in the counterclockwise direction for 1 second.  These motions will repeat without end.

![Reduction Motor Example][img_reduction_motor_example]

#### Tips

- Make sure the motor is connected to the correct port.
- Speed and direction can be controlled separately using motor control constants.
- In this example, the motor in Port 1 is set as "CCW:700",and the motor in Port 2 is set as "CW:700."

![Reduction Motor Tips][img_reduction_motor_tips]

### [Servo Motor](#servo-motor)

This parameter is used to set the movements of servo motors.  This parameter consists of 3 sub-parameters (move mode, speed, location), it helps to set up the movement of servo motor in more detailed way. (Please refer to the Servo Motor [SM-10A] for more information)

- Drive mode is set as either True or False.
  - TRUE (1) : Operate in joint mode.  In joint mode, the speed parameter is used to configure power output, and the location parameter is used to configure angular movement.
  - False (0) :Operate in rotation mode. In rotation mode, the servo motor operates like a reduction motor, so only the speed parameter is used. The location parameter is ignored.

- Motor control constants can be used to set the speed (power).
  - CCW (Counter clock wise) 0 ~ 1023 : Decimal numbers between 0 and 1023
  - CW (Clockwise) 0 ~ 1023 : Decimal numbers between 1024 and 2047

  ![SM-10A_01][img_sm_10a_01]

- Location value constants can be used to set the location in joint mode.
  - Uses decimal numbers between 0 and 1023.
  - The red circle indicates the current values. The value can be set by dragging the jog dial with your mouse to the appropriate value.
  - The maximum controllable angle is 300&deg;. Thus, the minimum controllable angle, indicated by the location value of 1, is 0.29&deg;.(300&deg; / 1024 = 0.29&deg;)

  ![SM-10A_02][img_sm_10a_02]

For detailed information about controllable angles, refer to the Servo Motor [SM-10A].

`Note` Compatiable Controllers : [CM-100]
{: .notice}

#### Example

Set the servo motor at Port 3 in rotation mode and turn it clockwise with 600 outputs.

![SM-10A Example_01][img_sm-10a_example_01]

Set the servo motor at Port 3 in joint mode and move it to location 500 with maximum speed.

![SM-10A Example_02][img_sm-10a_example_02]

#### Tips

- Make sure the motor is connected to the correct port.
- The servo motor is not suitable for detailed control, as it lacks the precision and torque of a Dynamixel motor.

`Warning` If a program that controls LED modules is executed while another module (servo motor, IR module, etc.) is connected to the port, the module may be damaged.
{: .notice--warning}

### [Touch Sensor](#touch-sensor)

This parameter is used to read the status of touch sensor (whether is was touched or not)
(Please refer to the Touch Sensor [TS-10] for more information)

While the sensor being touched, the returned value will be TRUE(1). However, if you take off your hands from touch sensor, the returned value will be reset as False(0).

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-700]
{: .notice}

#### Example

This example executes a block of code when the touch sensor at Port 3 is touched.

![TS-10 Example][img_ts-10_example]

### [LED Module](#led-module)

This parameter is used to turn on the LED or to read its current status.
(Please refer to the LED Module [LM-10] for more information)

- LED module output constants can be used.

  ![LED Module][img_led_module]

- The actual values are numbers between 0 and 3. The following list shows what each value represents when setting or reading the LED module values.
  - 0 : Turn off both LEDs.
  - 1 : Turn on right LED only.
  - 2 : Turn on left LED only.
  - 3 : Turn on both LEDs.

`Note` Compatiable Controllers : [CM-100]
{: .notice}

#### Example

Turn on both LEDs connected to Port 3.

![LED Module Example][img_led_module_example]

`Warning` If a program that controls LED modules is executed while another module (servo motor, IR module, etc.) is connected to the port, the module may be damaged.
{: .notice--warning}

### [IR Sensor](#ir-sensor)

This parameter is used to read the value of the IR sensor module.
(Please refer to the IR Sensor [IRSS-10] for more information)

- IR sensor values are numbers between 0 and 1023.
- For objects with the same or similar color, the closer it is, the higher the value (closer to 1023), and the farther away it is, the lower the value (closer to 0).
- For objects with the same distance, the lighter (white) the object, the higher the value, and the darker (black) the object, the lower the value.

`Note` Compatiable Controllers : [CM-100], [CM-510], [CM-700]
{: .notice}

#### Example

This example executes a block of code if the value of the IR sensor connected to Port 3 is less than 500.

![IR Sensor][img_ir_sensor_example]

`Warning` If a program that controls IR modules is executed while another module (servo motor, LED module, etc.) is connected to the port, the module may be damaged.
{: .notice--warning}

### [DMS Sensor](#dms-sensor)

This parameter is used to read the value of the DMS sensor.
(Please refer to the Distance Measurement Sensor [DMS-80] for more information)

- DMS sensor values are numbers between 0 and 1023.
- For objects with the same or similar colors, the close it is, the higher the value (closer to 1023) and the farther away it is, the lower the value (closer to 0).
- Unlike IR sensors, DMS sensors are hardly affected by colors.

`Note` Compatiable Controllers : [CM-510], [CM-700]
{: .notice}

#### Example

This example executes a block of code if the value of the DMS sensor connected to Port 3 is less than 500.

![DMS Example][img_dms_example]

### [User Devices](#user-devices)

This parameter is used to set or read the values of user's devices.
(Please refer to the [Custom Device] for more information)

- Although the same address is used to read & write values, the actual port pins are different(Check user's port pin information).
- The value read from the user's device is the voltage level of the input port.
- The value read is a number between 0 and 1023.
- When the user's device is set  as 1, It will deliver 5V to the output port.
- Setting the user's device as 1 does not guarantee that the value read from the user's device will be 1.
- The output of the user's device can be set using port value constants.

`Note` Compatiable Controllers : [CM-510], [CM-700]
{: .notice}

#### Example

After setting the user's device at Port 3 as 1 (high), if the value read value from Port 3 is less than 500, the output port is set as 0 (low).

![User Device Example][img_user_device_example]

## [Dynamixel Parameters](#dynamixel-parameters)

### [Torque Enable](#torque-enable)
This parameter is used to turn the motor's torque on or off. It can also be used to determine whether the motor's torque is currently on or off.

The value is either TRUE or FALSE.
- TRUE (1) : When set to TRUE, the motor's torque  turns on.  When the parameter is read, a value of TRUE signifies that the motor's torque is on.
- FALSE (0) : When set to FALSE, the motor's torque turns off.  When the parameter is read, a value of FALSE signifies that the motor's torque is OFF.

#### Example

When the R button of the controller is pressed, the actuator with ID 1 will turn on.  When the L button is pressed, it will turn off.

![Torque Enable][img_torque_enable]

### [LED](#led)

This parameter is used to set or read the Dynamixel's LED status.

The value is either TRUE or FALSE.
- TRUE (1 ) : When set to TRUE,  the LED turns on. When the parameter is read, a value of TRUE signifies that the LED is on.
- FALSE ( 0 ) : When set to FALSE, the LED turns off.  When the parameter is read, a value of FALSE signifies that the LED is off.

#### Example

Turns the LED on for 1 second and turns it off.

![LED][img_led]

### [CW/CCW Margin](#cwccw-margin)
These parameters are NOT available for MX Series.
These parameters are used to set  or read the actuator's margin value.

- Margin values are numbers between 0 and 254.
- The margin designates the area around the goal position that receives no torque.
- The recommended value is 1. Unless otherwise specified, use the recommended value.

#### Example

Set both margins as 1.

![CWCCW Margin][img_cwccw_margin]

### [CW/CCW Slope](#cwccw-slope)

These parameters are NOT available for MX Series.

These parameters are used to set or read the actuator's slope value.

- The slope value will be created at both CW/CCW  directions, and the output level will be set near the target position.
- If you set the lower slope value, it will reach to the target position by reducing the initial power NOT that much. On the contrary, if you set the higher value, it will reach the target position by reducing considerable powers as it reaches to the goal.
- If you set the lower slope value, it will resist with maximum power not to stray from target position.
- Even if you set the higher value, it will resist with more and more power if it is strayed too much from target position.
- Compliance Slope will be changed into 7 Data representative values according to the input Data. In other words, if you input 25, in real operation, 16 -the representative value of 25-, will be used.

|Level|Real Data Value|Representative Data Value|
| :---: | :---: | :---: |
|1|0 (0x00) ~ 3(0x03)|2 (0x02)|
|2|4(0x04) ~ 7(0x07)|4 (0x04)|
|3|8(0x08)~15(0x0F)|8 (0x08)|
|4|16(0x10)~31(0x1F)|16 (0x10)|
|5|32(0x20)~63(0x3F)|32 (0x20)|
|6|64(0x40)~127(0x7F)|64 (0x40)|
|7|128(0x80)~254(0xFE)|128 (0x80)|

- Appropriate Compliance Slope, Power control, and the Compliance Margin values will make it possible to create smoother movement.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

#### Example

Sets both slope values as 32. Binary numbers are used to set the parameter.

![CWCCW Slope][img_cwccw_slope]

### [PID Gain](#pid-gain)
These parameters are NOT available for AX, DX, RX and EX Series.
Parameters for the actuator’s set PID values.

- P gain refers to the value of proportional band. A small gap between vales grow bigger near the target value.
- I gain refers to the value of integral action.
- D Gain refers to the value of derivative action.
- Gains values are in between 0~254.

#### Example

Set the P and I value 32

![PID Gain][img_pid_gain]

### [Goal Position](#goal-position)

This parameters is used to set or read the actuator's goal position.

- Position constants can be used.
- The value can be input directly, or set using the jog dial.
- The position values of AX, DX, and RX-series are numbers between 0 and 1023
- The position values of EX-series are numbers between 0 and 4095

![Goal Position][img_sm_10a_02]

#### Example

When the R button of the controller is pressed, the goal position of the actuator with ID 1 will be set as 1.  When the L button is pressed, the goal position will be set as 1023.

![Goal Position Example][img_goal_position_example]

### [Moving Speed](#moving-speed)

This parameter is used to set or read the speed of actuator.

- Motor control constants can be used.

![Moving Speed][img_reduction_motor]

- In joint mode, the direction value is meaningless, and only the power value will be used.
- In joint mode, set the value as 0 to output at maximum power.
- In endless rotation mode, the direction and power values must be set together.
- The joint mode or endless rotation mode can be set using at RoboPlus Manager. (Refer to "actuator mode")

#### Example

When the R button of the controller is pressed, the speed of the actuator with ID1 will be set as 0.  When the L button is pressed, the speed will be set as 500.
(If the actuator is in joint mode, the speed of 0 equates to maximum output. )

![Moving Speed Example][img_moving_speed_example]

### [Torque Limit](#torque-limit)

This parameter is used to set or read the power status of actuator.

- Torque limit values are numbers between 0 and 1023 .

#### Example

Set the maximum torque of the actuator with ID 1 as 500.

![Torque Limit Example][img_torque_limit_example]

### [Present Position](#present-position)

This parameter is used to read the actuator's current position.

- The current position of the actuator is read.

#### Example

Prints the present position of the actuator with ID 1 on the screen.

![Present Position Example][img_present_position_example]

### [Present Speed](#present-speed)

This parameter is used to read the actuator's current speed.

- The current speed of the actuator is read.

#### Example

Prints the present speed of the actuator ID 1 on the screen.

![Present Speed Example][img_present_speed_example]

### [Present Load](#present-load)

This parameter is used to read the actuator's current load.

- The current load of the actuator is read.

#### Example

Prints the present load of the actuator with ID 1 on the screen.

![Present Load Example][img_present_load_example]

### [Voltage](#voltage)

This parameter is used to read the Dynamixel's current voltage.

- The current voltage of the Dynamixel is read.
- The actual voltage is 1/10 of the read value. For example, if the returned value is 115, the actual voltage is 11.5V.

#### Example

Prints the current voltage of the Dynamixel with ID 1 on the screen.

![Voltage Example][img_voltage_example]

### [Temperature](#temperature)

This parameter is used to read the Dynamixel's current temperature.

- The current temperature of the Dynamixel is read.

#### xample

Prints the present temperature of the Dynamixel with ID 1 on the screen.

![Temperature Example][img_temperature_example]

### [Moving](#moving)

This parameter is used to determine whether the actuator is currently moving or not.

- The status of the actuator's movement (whether it is moving or not) is returned.
- If it is moving, 1 is returned.  If it is not, 0 is returned.

#### Example

Sets the goal position of the actuator with ID 1 as 0, and waits for it to stop moving.

![Moving Example][img_moving_example]

### [Sensed Current](#sensed-current)
This parameter is NOT available for AX, DX and RX Series.
This parameter is used to check the current being consumed. You can read EX Series motor's current with this parameter.

- If the value is 512, the currnet is 0 ampere.  That is, there is no current flowing.
- If the value is larger than 512, the current is rotating the motor clockwise, and the size of the current is proportional to the size of the data. (1 = aprroximately 10 mA)
- For example, if the data is 612, 1A (612-512=100 => 100x10mA = 1,000mA) is being used to rotate the motor in the clockwise direction.
- If the value is smaller than 512, the current is rotating the counterclockwise, and the size of the current is proportional to the size of the data. ( 1 = aprroximately. 10 mA)
- For example, if the data is 312, 2A (512-312=200 => 200x10mA=2,000mA) is being used to rotate the motor in the counterclockwise direction.

### Example

If the current of the EX motor with ID 1 is larger than 1A and flowing in the clockwise direction, the LED will turn on.  Otherwise, If it is larger than 2A, the motor will be turned off.

![Sensed Current Example][img_sensed_current_example]

## [Universal Sensor S1](#universal-sensor-s1)

### [IR Left/Center/Right](#ir-leftcenterright)

These parameters are used to read the current IR sensor value from the universal sensor(AX-S1).

- The current DMS sensor value of the universal sensor (S1) can be read.
- Sensor values depend on the object's color and surrounding light, so using the IR sensor to measure the exact distance is not recommended.
- As mentioned above, IR sensor values are different if objects have different colors, even if they are the same distance away.  This characteristic can be utilized to distinguish black from white. (Used for tracing lines)
- The sensor value is between 0 and 255.

#### Example

In this example, specific motions are performed when only the left IR sensor detects an object or when only the right IR sensor detects an object.

![IR LCR][img_ir_lcr_example]

#### Tip

- Sensor values may be affected by external lights that emit infrared rays, such as sunlight or a fluorescent lamp.
- Sensor values depend on the object's color and surrounding light, so using the IR sensor to measure the exact distance is not recommended.
- As mentioned above, IR sensor values are different if objects have different colors, even if they are the same distance away. This characteristic can be utilized to distinguish black from white. (Used for tracing lines)

### [Light Left/Center/Right](#light-leftcenterright)

This parameter is used to read the current light brightness from the universal sensor(S1).

- The current light brightness value of the universal sensor(S1) can be read.
- The intensity of radiation of near by light sources such as candles and light bulb can be measured.
- The sensor value is between 0 and 255.

#### Example

A block of code is executed when the left sensor detects brightness over 200.

![Light LCR][img_light_lcr_example]

### [Object Detected](#object-detected)

This parameter is used to determine whether an object is detected within a certain distance from an IR sensor (Left/Center/Right) of the universal sensor(S1).

- If an object is detected within a certain distance, the following values are returned.
- Binary numbers can be used for the bit values.

![Object Detected][img_object_detected]

|Binary value|Decimal value||Meaning in `Object Detected` Commands|
| :---: | :---: | :---: |
|000|0|Not detected|
|001|1|Detected by left sensor|
|010|2|Detected by center sensor|
|011|3|Detected by left and center sensors|
|100|4|Detected by right sensor|
|101|5|Detected by right and left sensors|
|110|6|Detected by right and center sensors|
|111|7|Detected by every sensor|

#### Example

The object detection threshold is set as 50, and a block of code will be executed when an object is detected within the threshold.

![Object Detected Ex][img_object_detected_ex]

### [Light Detected](#light-detected)

This parameter is used to determine whether a light is detected within a certain distance from an IR sensor (Left/Center/Right) of the universal sensor(S1).
Compatible Controller

- If a light is detected within a certain distance, the following values are returned.
- Binary numbers can be used for the bit values.

![Light Detected][img_light_detected]

|Binary value|Decimal value||Meaning in `Object Detected` Commands|
| :---: | :---: | :---: |
|000|0|Not detected|
|001|1|Detected by left sensor|
|010|2|Detected by center sensor|
|011|3|Detected by left and center sensors|
|100|4|Detected by right sensor|
|101|5|Detected by right and left sensors|
|110|6|Detected by right and center sensors|
|111|7|Detected by every sensor|

#### Example

The light detection threshold is set as 50, and a block of code will be executed when a light is detected within the threshold.

![Light Detected Ex][img_light_detected_ex]

### [Sound Max Data](#sound-max-data)

This parameter is used to set or read the maximum sound data of the universal sensor(S1).

- Reads the maximum sound data detected by the universal sensor(S1).
- If the detected volume is louder than the volume of the max sound data, the max sound data is replaced with the detected value.
- The value is between 0 and 255.
- Because "Sound max data" is not initialized automatically, the user must reset it 0 before use.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

#### Example

Initialize "Sound max data" as 0 and execute a block of code when it exceeds 200.

![Sound Max][img_sound_max]

### [Sound Data](#sound-data)

This parameter is used to read the current sound level of the universal sensor (S1).

- Reads the sound data of the universal sensor(S1).
- If no sounds are detected, the returned value will be near 127.  When sounds are detected, the value will change according to the volume.
- The louder the sound, the more the value will fluctuate from 127 to 0 and 255.
- The value is between 0 and 255.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

#### Example

Prints the current sound volume on the screen.

![Sound Data][img_sound_data]

### [Sound Count](#sound-count)

This parameter is used to read or initialize the number of sounds detected by the universal sensor(S1).

- "Sound Count" uses numbers between 0 and 255.
- When sounds are no longer detected, the number of detected sounds will be input into the "'Sound Count" parameter.
- Because "Sound Count" is not initialized automatically, the user must reset it to 0 before use.

#### Example

Initializes "Sound count" as 0 and wait for a sound to be detected. Then, call the "Play" function.

![Sound Count][img_sound_count]

### [Sound Time](#sound-time)

This parameter is used to set or read how long the sound will be played.

- The value is between 0 and 65535.
- When "sound count" is initialized as 0, "sound  time" will be also initialized as 0.

#### Example

The following example uses two AX-S1 sensors to determine the direction of the detected sound.

![Sound Time][img_sound_time]

### [Buzzer Index](#buzzer-index)

This parameter is used to set or read the musical note played by the buzzer of the universal sensor (S1).

- The "Buzzer Time" parameter must always be used with the "Buzzer Index" parameter.  "Buzzer Time" must be set before "Buzzer Index" is set for the correct sound to be played.  (This order is very important)  (Click here for more information on "Buzzer Time.")
- Depending on what the "Buzzer Time" is set to, "Buzzer Index" can be set to play a musical note or a melody.
  - "Buzzer Time" is set to 255 : Melody Mode
  - Choose from 26 different melodies (0 ~ 25).
    ![Buzzer Index 01][img_buzzer_index_01]

  - When "Buzzer Time" is between 0 and 254 : Musical Note Mode
  - Choose from 51 notes.  The selected note will play for the length set as "Buzzer Time."
    ![Buzzer Index 02][img_buzzer_index_02]

#### Example

Plays melody #3.

![Buzzer Index Ex01][img_buzzer_index_ex01]

Plays Do, Mi, and Sol for 0.3 seconds each.

![Buzzer Index Ex02][img_buzzer_index_ex02]

### [Buzzer Time](#buzzer-time)

This parameter is used to set or read how long the sound is played by the buzzer of the universal sensor (S1).

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- "Buzzer Time" parameter must always be used with the "Buzzer Index" parameter.  "Buzzer Time" must be set before "Buzzer Index" is set for the correct sound to be played. (The order is important.) (Click  here for more information on "Buzzer Time.".)
- "Buzzer Time" can be set using buzzer time constants.
- "Buzzer Time" can be set to a value between 0 and 255.
- Each value represents 0.1 second.  For example, when "Buzzer Time" is set to 1, the note will be played for 0.1 second.  The maximum length a note will be played is 5 seconds.  Therefore, when values between 50 and 254 are entered, the note will be played for 5 seconds.
  - When "Buzzer Time" is set to 255 : Melody Mode
  - Choose from 26 different melodies (0-25).
  - When the melody finishes playing, "Buzzer Time" is reset to 0.
    ![Buzzer Time 01][img_buzzer_time_01]

  - "Buzzer Time" is between 0 and 254 : Musical Note Mode
  - Choose from 51 notes.  The selected note will play for the length set as "Buzzer Time."
  - When it is set to 254, the sound will play without end.
    ![Buzzer Time 02][img_buzzer_time_02]

#### Example

Plays melody #3 .

![Buzzer Time Ex01][img_buzzer_time_ex01]

Plays Do, Mi and Sol for 0.3 seconds each.  (Same as the example in "Buzzer Index")

![Buzzer Time Ex02][img_buzzer_time_ex02]

### [IR COM Arrived](#ir-com-arrived)

This parameter is used to check whether there are any new data received via the wireless communication module.

- 1 : Indicates that there is new data in the input buffer.
- 0 : Indicates that all data in the input have been retrieved using the "IR COM RXD"' parameter.

#### Example

Waits for new data to arrive and executes a block of code when the received data is 100.

![IR COM Arrived][img_ir_com_arrived_ex]

### [IR COM RXD](#ir-com-rxd)

This parameter is used to read the data received via the wireless communication module.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- The data is a number between 0 and 65535.
- The IR COM Arrived parameter is can be used to check for new data.
- Because there is an input buffer, a maximum of 2 data values can be saved.
- If the input buffer is filled with 2 data values when READ is executed, the first data will be read and removed from the buffer. If there is only 1 data value in the input buffer when READ is executed, the latest data will be retrieved.

#### Example

Waits for new data to arrive and executes a block of code when the received data is 100.

![IR COM RXD][img_ir_com_rxd_ex]

### [IR COM TXD](#ir-com-txd)

This parameter is used to transmit data via a wireless communication module.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- The data to send must be a number between 0 and 65535.
- When the "Remocon TXD" parameter is set, the data is immediately sent wirelessly.

#### Example

Waits for new data to arrive, and when the data arrives, the received data is transmitted wirelessly.

![IR COM TXD][img_ir_com_txd_ex]

### [Object Detection Threshold](#object-detection-threshold)

This parameter is used to set or read the object detection threshold.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- Set the object detection threshold to be used when determining whether an object is detected or not.
- There is a short-range detection mode and a long-distance detection mode.
- The short range detection mode is activated when the threshold value is set as 0.

#### Example

The object detection threshold is set as 50, and a block of code will be executed when an object is detected within the threshold.

![Object Detection Threshold][img_object_det_thr]

### [Light Detection Threshold](#light-detection-threshold)

This parameter is used to set or read the light detection threshold of the universal sensor (S1).

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- Set the threshold to be used when determining whether a light is detected or not.

#### Example

The light detection threshold is set as 50, and a block of code will be executed when a light is detected within the threshold.

![Light Detection Threshold][img_light_det_thr]

## [IR Sensor Array](#ir-sensor-array)

### [IR Sensor Value](#ir-sensor-value)

These parameters are used to read the current IR sensor value from the IR Sensor Array.

- The IR array reads values between 1 and 7. The array can be used at distances from 0cm to 5cm.
- Textures and colors from walls and obstacles can influence the output values of the IR array.
- The sensor value is between 0 and 1023.

#### Example

Detected values can emit different sounds as following the array’s values.

![IR Sensor Value][img_ir_sensor_value_ex]

#### Tip

- Sensor values may be affected by external lights that emit infrared rays, such as sunlight or a fluorescent lamp.
- Sensor values depend on the object's color and surrounding light, so using the IR sensor to measure the exact distance is not recommended.
- As mentioned above, IR sensor values are different if objects have different colors, even if they are the same distance away. This characteristic can be utilized to distinguish black from white. (Used for tracing lines)

### [IR Array Buzzer Index](#ir-array-buzzer-index)

This parameter is used to set or read the musical note played by the buzzer of the ir sensor array

- The "Buzzer Time" parameter must always be used with the "Buzzer Index" parameter.  "Buzzer Time" must be set before "Buzzer Index" is set for the correct sound to be played.  (This order is very important) (Click here for more information on "Buzzer Time.")
- Depending on what the "Buzzer Time" is set to, "Buzzer Index" can be set to play a musical note or a melody.
  - "Buzzer Time" is set to 255 : Melody Mode
  - Choose from 26 different melodies (0 ~ 25).

    ![Buzzer Index 01][img_buzzer_index_01]

  - When "Buzzer Time" is between 0 and 254 : Musical Note Mode
  - Choose from 51 notes.  The selected note will play for the length set as "Buzzer Time."
    ![Buzzer Index 02][img_buzzer_index_02]

#### Example

Plays melody #3.

![Buzzer Index 03][img_buzzer_index_ex03]

Plays Do, Mi, and Sol for 0.3 seconds each.

![Buzzer Index 04][img_buzzer_index_ex04]

### [IR Array Buzzer Time](#ir-array-buzzer-time)

This parameter is used to set or read how long the sound is played by the buzzer of the ir sensor array.

- "Buzzer Time" parameter must always be used with the "Buzzer Index" parameter.  "Buzzer Time" must be set before "Buzzer Index" is set for the correct sound to be played. (The order is important.) (Click  here for more information on "Buzzer Time.".)
- "Buzzer Time" can be set using buzzer time constants.
- "Buzzer Time" can be set to a value between 0 and 255.
- Each value represents 0.1 second.  For example, when "Buzzer Time" is set to 1, the note will be played for 0.1 second.  The maximum length a note will be played is 5 seconds.  Therefore, when values between 50 and 254 are entered, the note will be played for 5 seconds.
  - When "Buzzer Time" is set to 255 : Melody Mode
  - Choose from 26 different melodies (0-25).
  - When the melody finishes playing, "Buzzer Time" is reset to 0.

    ![Buzzer Index 01][img_buzzer_index_01]

  - "Buzzer Time" is between 0 and 254 : Musical Note Mode
  - Choose from 51 notes.  The selected note will play for the length set as "Buzzer Time."
  - When it is set to 254, the sound will play without end.
    ![Buzzer Index 02][img_buzzer_index_02]

#### Example

Plays melody #3.

![Buzzer Index 03][img_buzzer_index_ex03]

Plays Do, Mi, and Sol for 0.3 seconds each.

![Buzzer Index 04][img_buzzer_index_ex04]

### [Auto Threshold Mode](#auto-threshold-mode)

Parameters for set black values and automatic detection start/set.

- Starts when transitioning from ‘0’ to ‘1’ then sets after transitioning from ‘1’ to ‘0’
- Also sets the timer from start to set.

#### Example

During a ‘1’ the LED will turn on, detecting a white or black then the array automatically sets values.

![Auto Thresh][img_auto_thr]

### [IR Obstacle Detected](#ir-obstacle-detected)

Paramenters to determine IR array obstacle values

- In the IR array if each IR sensor detected black value is lower than the set black valuethe values will be assigned as shown below; the LED turns on.

|Binary value|Decimal Value|Black Detection|
| :---: | :---: | :---: |
|0000001|1|Black detection for IR sensor #1|
|0000010|2|Black detection for IR sensor #2|
|0000100|4|Black detection for IR sensor #3|
|0001000|8|Black detection for IR sensor #4|
|0010000|16|Black detection for IR sensor #5|
|0100000|32|Black detection for IR sensor #6|
|1000000|64|Black detection for IR sensor #7|

- From the diagram you may check binary values.

![IR Obstacle][img_ir_obstacle]

#### Example

Set sensor #1 to 100; when sensor #1 detects black do a specified action.

![IR Obstacle Ex][img_ir_obstacle_ex]

### [IR Threshold](#ir-threshold)

Reference black/white for the IR array

- Determines white/black set values.
- sensor and set black values

||Black Detection|LED|
| :---: | :---: | :---: |
|Sensor value <= set value|BIT 1|ON|
|Sensor value > set value|BIT 0|OFF|

#### Example

Set sensor #1 to 100; when sensor #1 detects black do a specified action.

![IR Thresh EX][img_ir_thresh_ex]

### [Direct Access](#direct-access)

The address of peripheral devices such as Dynamixels can be accessed directly and read from or written to.

`Note` Compatiable Controllers : [CM-5], [CM-510], [CM-700]
{: .notice}

- Data can be read from or written to a specific in the form of bytes or words.

#### Example

Write 0 at word address 25 of the Dynamixel with ID 105.

![Direct Access 01][img_direct_access_01]

Print the value stored in the word address 25 of the Dynamixel with ID 105.

![Direct Access 02][img_direct_access_02]

## [Variables](#variables)

This is a storage place inside a program capable of saving, editing, and reading data.

- If a variable with the same name already exists, it is not created.  Instead, the existing varible is used.
- Spaces are not permitted in variable names.
- Variable names cannot start with a number.
- Special characters (!, @, #, $, etc ) are not allowed in variable names.(Underscores ( _ ) are permitted.)

### Example

Variables may be used for many purposes.  Existing Variables are listed in the "Set Device or Number" window.

![Variables][img_variables_ex]

### Tip

Variables are useful when a number to be remembered, when a value must be changed depending on the situation, or when multiple values must be changed at once.

[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-5]: /docs/en/parts/controller/cm-5/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-900]: /docs/en/parts/controller/cm-900/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[EXP485]: /docs/en/parts/controller/exp485/
[OpenCR]: /docs/en/parts/controller/opencr/
[GM-12A]: /docs/en/parts/motor/gm-10a/
[SM-10A]: /docs/en/parts/motor/sm-10a/
[TS-10]: /docs/en/parts/sensor/ts-10/
[LM-10]: /docs/en/parts/display/lm-10/
[IRSS-10]: /docs/en/parts/sensor/irss-10/
[DMS-80]: /docs/en/parts/sensor/dms-80/
[Custom Device]: ???

[img_remocon_txd]: /assets/images/sw/rplus1/task/roboplus_task_en_078.png
[img_remocon_rxd]: /assets/images/sw/rplus1/task/roboplus_task_en_079.png
[img_remocon_arrived]: /assets/images/sw/rplus1/task/roboplus_task_en_080.png
[img_aux_led]: /assets/images/sw/rplus1/task/roboplus_task_en_081.png
[img_button]: /assets/images/sw/rplus1/task/roboplus_task_082.png
[img_button_example]: /assets/images/sw/rplus1/task/roboplus_task_en_083.png
[img_timer]: /assets/images/sw/rplus1/task/roboplus_task_en_085.png
[img_timer_example]: /assets/images/sw/rplus1/task/roboplus_task_en_086.png
[img_hr_timer_01]: /assets/images/sw/rplus1/task/roboplus_task_en_087.png
[img_hr_timer_02]: /assets/images/sw/rplus1/task/roboplus_task_en_088.png
[img_hr_timer_example]: /assets/images/sw/rplus1/task/roboplus_task_en_089.png
[img_remocon_id]: /assets/images/sw/rplus1/task/roboplus_task_en_090.png
[img_my_id_example_01]: /assets/images/sw/rplus1/task/roboplus_task_en_091.png
[img_my_id_example_02]: /assets/images/sw/rplus1/task/roboplus_task_en_092.png
[img_controller_ir_sensor]: /assets/images/sw/rplus1/task/roboplus_task_en_093.png
[img_buzzer_01]: /assets/images/sw/rplus1/task/roboplus_task_en_094.png
[img_buzzer_02]: /assets/images/sw/rplus1/task/roboplus_task_en_095.png
[img_buzzer_example_01]: /assets/images/sw/rplus1/task/roboplus_task_en_096.png
[img_buzzer_example_02]: /assets/images/sw/rplus1/task/roboplus_task_en_097.png
[img_sound_count]: /assets/images/sw/rplus1/task/roboplus_task_en_098.png
[img_current_sound_count_example_01]: /assets/images/sw/rplus1/task/roboplus_task_en_099.png
[img_current_sound_count_example_02]: /assets/images/sw/rplus1/task/roboplus_task_en_100.png
[img_current_sound_count_example_03]: /assets/images/sw/rplus1/task/roboplus_task_en_101.png
[img_button_example]: /assets/images/sw/rplus1/task/roboplus_task_en_102.png
[img_powersave]: /assets/images/sw/rplus1/task/roboplus_task_en_103.png
[img_powersave_example]: /assets/images/sw/rplus1/task/roboplus_task_en_104.png
[img_rc100]: /assets/images/sw/rplus1/task/roboplus_task_en_105.png
[img_rc100_example]: /assets/images/sw/rplus1/task/roboplus_task_en_106.png
[img_motion_page]: /assets/images/sw/rplus1/task/roboplus_task_en_206.png
[img_motion_status]: /assets/images/sw/rplus1/task/roboplus_task_en_207.png
[img_joint_example_01]: /assets/images/sw/rplus1/task/roboplus_task_en_208.png
[img_joint_example_02]: /assets/images/sw/rplus1/task/roboplus_task_en_209.png
[img_reduction_motor]: /assets/images/sw/rplus1/task/roboplus_task_en_211.png
[img_reduction_motor_example]: /assets/images/sw/rplus1/task/roboplus_task_en_212.png
[img_reduction_motor_tips]: /assets/images/sw/rplus1/task/roboplus_task_en_213.png
[img_sm_10a_01]: /assets/images/sw/rplus1/task/roboplus_task_en_211.png
[img_sm_10a_02]: /assets/images/sw/rplus1/task/roboplus_task_214.png
[img_sm-10a_example_01]: /assets/images/sw/rplus1/task/roboplus_task_en_215.png
[img_sm-10a_example_02]: /assets/images/sw/rplus1/task/roboplus_task_en_216.png
[img_ts-10_example]: /assets/images/sw/rplus1/task/roboplus_task_en_217.png
[img_led_module]: /assets/images/sw/rplus1/task/roboplus_task_en_218.png
[img_led_module_example]: /assets/images/sw/rplus1/task/roboplus_task_219.png
[img_ir_sensor_example]: /assets/images/sw/rplus1/task/roboplus_task_en_220.png
[img_dms_example]: /assets/images/sw/rplus1/task/roboplus_task_en_220.png
[img_user_device_example]: /assets/images/sw/rplus1/task/roboplus_task_en_225.png
[img_torque_enable]: /assets/images/sw/rplus1/task/roboplus_task_en_226.png
[img_led]: /assets/images/sw/rplus1/task/roboplus_task_en_227.png
[img_cwccw_margin]: /assets/images/sw/rplus1/task/roboplus_task_en_228.png
[img_cwccw_slope]: /assets/images/sw/rplus1/task/roboplus_task_en_229.png
[img_pid_gain]: /assets/images/sw/rplus1/task/roboplus_task_en_240.png
[img_goal_position_example]: /assets/images/sw/rplus1/task/roboplus_task_en_230.png
[img_moving_speed_example]: /assets/images/sw/rplus1/task/roboplus_task_en_231.png
[img_torque_limit_example]: /assets/images/sw/rplus1/task/roboplus_task_en_232.png
[img_present_position_example]: /assets/images/sw/rplus1/task/roboplus_task_en_233.png
[img_present_speed_example]: /assets/images/sw/rplus1/task/roboplus_task_en_234.png
[img_present_load_example]: /assets/images/sw/rplus1/task/roboplus_task_en_235.png
[img_voltage_example]: /assets/images/sw/rplus1/task/roboplus_task_en_236.png
[img_temperature_example]: /assets/images/sw/rplus1/task/roboplus_task_en_237.png
[img_moving_example]: /assets/images/sw/rplus1/task/roboplus_task_en_238.png
[img_sensed_current_example]: /assets/images/sw/rplus1/task/roboplus_task_en_239.png
[img_ir_lcr_example]: /assets/images/sw/rplus1/task/roboplus_task_en_241.png
[img_light_lcr_example]: /assets/images/sw/rplus1/task/roboplus_task_en_242.png
[img_object_detected]: /assets/images/sw/rplus1/task/roboplus_task_en_243.png
[img_object_detected_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_244.png
[img_light_detected]: /assets/images/sw/rplus1/task/roboplus_task_en_245.png
[img_light_detected_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_246.png
[img_sound_max]: /assets/images/sw/rplus1/task/roboplus_task_en_247.png
[img_sound_data]: /assets/images/sw/rplus1/task/roboplus_task_en_248.png
[img_sound_count]: /assets/images/sw/rplus1/task/roboplus_task_en_249.png
[img_sound_time]: /assets/images/sw/rplus1/task/roboplus_task_en_250.png
[img_buzzer_index_01]: /assets/images/sw/rplus1/task/roboplus_task_en_094.png
[img_buzzer_index_02]: /assets/images/sw/rplus1/task/roboplus_task_en_095.png
[img_buzzer_index_ex01]: /assets/images/sw/rplus1/task/roboplus_task_en_251.png
[img_buzzer_index_ex02]: /assets/images/sw/rplus1/task/roboplus_task_en_252.png
[img_buzzer_time_01]: /assets/images/sw/rplus1/task/roboplus_task_en_094.png
[img_buzzer_time_02]: /assets/images/sw/rplus1/task/roboplus_task_en_095.png
[img_buzzer_time_ex01]: /assets/images/sw/rplus1/task/roboplus_task_en_251.png
[img_buzzer_time_ex02]: /assets/images/sw/rplus1/task/roboplus_task_en_252.png
[img_ir_com_arrived_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_253.png
[img_ir_com_rxd_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_253.png
[img_ir_com_txd_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_254.png
[img_object_det_thr]: /assets/images/sw/rplus1/task/roboplus_task_en_244.png
[img_light_det_thr]: /assets/images/sw/rplus1/task/roboplus_task_en_246.png
[img_ir_sensor_value_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_255.png
[img_buzzer_index_ex03]: /assets/images/sw/rplus1/task/roboplus_task_en_256.png
[img_buzzer_index_ex04]: /assets/images/sw/rplus1/task/roboplus_task_en_257.png
[img_auto_thr]: /assets/images/sw/rplus1/task/roboplus_task_en_258.png
[img_ir_obstacl]: /assets/images/sw/rplus1/task/roboplus_task_en_259.pnge
[img_ir_obstacle_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_260.png
[img_ir_thresh_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_261.png
[img_direct_access_01]: /assets/images/sw/rplus1/task/roboplus_task_en_262.png
[img_direct_access_02]: /assets/images/sw/rplus1/task/roboplus_task_en_263.png
[img_variables_ex]: /assets/images/sw/rplus1/task/roboplus_task_en_264.png
