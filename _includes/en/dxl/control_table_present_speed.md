It is the present moving speed.
0~2,047 (0x7FF) can be used.
If a value is in the rage of 0~1,023, it means that the motor rotates to the CCW direction.
If a value is in the rage of 1,024~2,047, it means that the motor rotates to the CW direction.
That is, the 10th bit becomes the direction bit to control the direction, and 0 and 1,024 are equal.
The unit of this value varies depending on operation mode.

+ Joint Mode

  The unit is about 0.111rpm.
  For example, if it is set to 300, it means that the motor is moving to the CCW direction at a rate of about 33.3rpm.

+ Wheel Mode

  The unit is about 0.1%.
  For example, if it is set to 512, it means that the torque is controlled by 50% of the maximum torque to the CCW direction.
