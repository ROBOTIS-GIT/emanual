It means currently applied load.
For example, the value is 512, it means the load is detected in the direction of CCW about 50% of the maximum torque.

| Unit  | Value Range   | Description |
| :---: | :-----------: | :---: |
| 0.1%  | -1,000 ~ 1,000| Positive(CCW Load), Negative(CW Load) |

**NOTE** : The Present load is an inferred value based on the internal output value; not a measured value using torque sensor, etc. Therefore, it may be inaccurate for measuring weight or torque. It is recommended to use it for predicting the direction and size of the force being applied to the joint.
{: .notice}
