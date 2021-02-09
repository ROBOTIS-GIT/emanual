It is the value of the maximum torque limit.  
0 ~ 1,023(0x3FF) is available, and the unit is about 0.1%.  
For example, if the value is 512, it is about 50%; that means only 50% of the maximum torque will be used.  
When the power is turned on, Torque Limit(34) is reset to the value of [Max Torque(14)].  

**NOTE** : If the function of Alarm Shutdown is triggered, the motor loses its torque because Torque Limit(34) becomes 0. Once error conditions are resolved and Torque Limit(34) is changed to the value other than 0, the motor can be operated again.
{: .notice}
