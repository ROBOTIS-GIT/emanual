It exists in each direction of CW/CCW and sets the level of Torque near the goal position.
Compliance Slope is set in 7 steps, the higher the value, the more flexibility is obtained.
Data representative value is actually used value. That is, even if the value is set to 25, 16 is used internally as the representative value.

| Step |     Data Value      | Data Representative Value |
|:----:|:-------------------:|:-------------------------:|
|  1   |  0(0x00) ~ 3(0x03)  |          2(0x02)          |
|  2   |  4(0x04) ~ 7(0x07)  |          4(0x04)          |
|  3   |  8(0x08)~15(0x0F)   |          8(0x08)          |
|  4   |  16(0x10)~31(0x1F)  |         16(0x10)          |
|  5   |  32(0x20)~63(0x3F)  |         32(0x20)          |
|  6   | 64(0x40)~127(0x7F)  |         64(0x40)          |
|  7   | 128(0x80)~254(0xFE) |         128(0x80)         |


Compliance is to set the control flexibility of the motor.
The following diagram shows the relationship between output torque and position error of the motor.

![](/assets/images/dxl/dxl_compliance.png)
