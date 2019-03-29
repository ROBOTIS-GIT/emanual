It is the value of the maximum torque limit.
0 ~ 1,023(0x3FF) is available, and the unit is about 0.1%.
For example, if the value is 512, it is about 50%; that means only 50% of the maximum torque will be used.
If the power is turned on, the value of [Max Torque(14)] is used as the initial value.

**NOTE** : If the function of Alarm Shutdown is triggered, the motor loses its torque because the value becomes 0. Once error conditions are resolved and this value is changed to the value other than 0, the motor can be operated again.
{: .notice}
