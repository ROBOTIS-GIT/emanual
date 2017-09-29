It means currently applied load.
The range of the value is 0~2047, and the unit is about 0.1%.
If the value is 0~1,023, it means the load works to the CCW direction.
If the value is 1,024~2,047, it means the load works to the CW direction.
That is, the 10th bit becomes the direction bit to control the direction, and 1,024 is equal to 0.
For example, the value is 512, it means the load is detected in the direction of CCW about 50% of the maximum torque.

| Bit | 15 ~ 11  | 10 | 9 ~ 0|
| :----: | :---: | :---: | :---: |
| Value | 0 | Load Direction | Data (Load Ratio)|

`Note` CCW Load : Load Direction = 0, CW Load : Load Direction = 1
{: .notice}

`Note` Present load is an inferred value based on the internal output value; not a measured value using torque sensor, etc. Therefore, it may be inaccurate for measuring weight or torque. It is recommended to use it for predicting the direction and size of the force being applied to the joint.
{: .notice}
