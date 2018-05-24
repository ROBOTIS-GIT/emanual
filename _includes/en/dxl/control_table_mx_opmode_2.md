
|Value|Operating Mode|Description|
| :---: | :---: | :--- |
|1|Velocity Control Mode<br />(0&deg; ~ 360&deg;)|This mode controls velocity and ideal for wheel operation.<br />This mode is identical to the Wheel Mode(endless) from existing Dynamixels.|
|3(Default)|Position Control Mode|This mode controls position and identical to the Joint Mode.<br />Operating position range is limited by Max Position Limit(48) and Min Position Limit(52).<br />This mode is ideal for articulated robots that each joint rotates less than 360&deg;.|
|4|Extended Position Control Mode<br />(Multi-turn)|This mode controls position and identical to Multi-turn Mode.<br />512 turns are supported(-256[rev] ~ 256[rev]) and ideal for multi-turn wrists or conveyer systems or a system that requires an additional reduction gear.|
|16|PWM Control Mode<br />(Voltage Control Mode)|This mode directly controls PWM output (Voltage Control Mode)|

{% capture opmode_notice_01 %}
**NOTE** : Switching Operating Mode will reset gains(PID, Feedfoward) properly to the selected Operating Mode. The profile generator and limits will also be reset.
1. Profile Velocity(112), Profile Acceleration(108) : Reset to ‘0’
2. Goal PWM(100) : Reset to PWM Limit(36)
{% endcapture %}

<div class="notice">
  {{ opmode_notice_01 | markdownify }}
</div>

{% capture opmode_notice_02 %}
**NOTE** : PWM is the abbreviation for Pulse Width Modulation that modulates PWM Duty to control motors.  
The PWM Control Mode changes pulse width to control average supply voltage to the motor and this technique is widely used in the motor control field.  
Therefore, PWM Control Mode uses Goal PWM(100) value to control supply voltage for Dynamixel.  
PWM Control Mode is similar to the Wheel Mode of Dynamixel AX and RX series.
{% endcapture %}

<div class="notice">
  {{ opmode_notice_02 | markdownify }}
</div>
