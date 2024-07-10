
| Value      | Operating Mode                             | Description                                                                                                                                                                                                                                                                                   |
|:-----------|:-------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1          | Velocity Control Mode                      | This mode controls velocity. This mode behaves similarly to a standard DC motor, and is best suited to applications like drive wheels.|
| 3(Default) | Position Control Mode                      | This mode controls position. This mode is identical to the Joint Mode from existing DYNAMIXEL. Operating position range is limited by the [Max Position Limit(48)] and the [Min Position Limit(52)]. This mode is ideal for articulated robots that each joint rotates less than 360 degrees. |
| 4          | Extended Position Control Mode(Multi-turn) | This mode controls position. This mode is identical to the Multi-turn Position Control from existing DYNAMIXEL. 512 turns are supported(-256[rev] ~ 256[rev]). This mode is ideal for multi-turn wrists or conveyer systems or a system that requires an additional reduction gear. Note that [Max Position Limit(48)], [Min Position Limit(52)] are not used on Extended Position Control Mode.                      |
| 16         | PWM Control Mode  (Voltage Control Mode)   | This mode directly controls PWM output. (Voltage Control Mode)                                                                                                                                                                                                                                |

{% capture group_notice_01 %}
**NOTE** : When the value of the Operating Mode(11) register changes, the  [Velocity PI(76, 78)](#velocity-pi-gain76-78); [Position PID(80, 82, 84)](#position-pid-gain80-82-84); [Feedforward(88, 90)](#position-pid-gain80-82-84), will be reset according to the selected Operating Mode(11). Aside from this, the following registers will also be reset: 

1. [Profile Velocity(112)](#profile-velocity112) and [Profile Acceleration(108)](#profile-acceleration108) will be set to ‘0’
2. [Goal PWM(100)](#goal-pwm100) and [Goal Current(102)](#goal-current102) are reset to the value of [PWM Limit(36)](#pwm-limit36) and [Current Limit(38)](#current-limit38) respectively
3. When the Operating Mode(11) is set to **Current-based Position Control Mode**, [Position PID(80, 82, 84)](#position-pid-gain80-82-84) and [PWM Limit(36)](#pwm-limit36) values will be reset. 
{% endcapture %}
<div class="notice">{{ group_notice_01 | markdownify }}</div>

{% capture group_notice_02 %}
**NOTE** : PWM stands for **Pulse Width Modulation**, the signal that modulates voltage to control motors. It changes pulse width to control average supply voltage to the motor, and this technique is widely used in the motor control field.  
PWM Control Mode is similar to the Wheel Mode of [AX](/docs/en/dxl/ax/ax-12w/#cw-compliance-margin) and [RX](/docs/en/dxl/rx/rx-10/#moving-speed-32) series.
[Goal PWM(100)](#goal-pwm) is used to control supply voltage for DYNAMIXELs in **PWM Control Mode**.
{% endcapture %}
<div class="notice">{{ group_notice_02 | markdownify }}</div>

{% include en/dxl/control_table_opmode_note.md %}
