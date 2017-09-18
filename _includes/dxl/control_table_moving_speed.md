It is a moving speed to Goal Position.
The range and the unit of the value may vary depending on the operation mode.

+ Join Mode
  0~1023 (0X3FF) can be used, and the unit is about 0.111rpm.
  If it is set to 0, it means the maximum rpm of the motor is used without controlling the speed.
  If it is 1023, it is about 114rpm.
  For example, if it is set to 300, it is about 33.3 rpm.

  `Note` Please check the maximum rpm of relevant model in Joint Mode.  Even if the motor is set to more than maximum rpm, it cannot generate the torque more than the maximum rpm.
  {: .notice}

+ Wheel Mode
  0~2047( 0X7FF) can be used, the unit is about 0.1%.
  If a value in the range of 0~1023 is used, it is stopped by setting to 0 while rotating to CCW direction.
  If a value in the range of 1024~2047 is used, it is stopped by setting to 1024 while rotating to CW direction.
  That is, the 10th bit becomes the direction bit to control the direction.
  In Wheel Mode, only the output control is possible, not speed.
  For example, if it is set to 512, it means the output is controlled by 50% of the maximum output.
