This value limits operating temperature.  
When the Present Temperature(625) that indicates internal temperature of Dynamixel is greater than the Temperature Limit(21), the Over Heating Error Bit(Bit 2) in the Hardware Error Status(892) will be set.  
If Overheating Error Bit(Bit 2) is configured in the [Shutdown(48)] when Over Heating Error occurs, [Torque Enable(562)] is cleared to ‘0’ and Torque will be disabled.  
For more details, please refer to the [Shutdown(48)] section.

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|About 1&deg;|0 ~ 100|0 ~ 100&deg;|

**CAUTION** : Do not set the temperature lower/higher than the default value. When the temperature alarm shutdown occurs, wait for 20 minutes to cool the temperature before reuse. Keep using the product with high temperature can cause severe damage to Dynamixel.
{: .notice--warning}

[Shutdown(48)]: #shutdown
[Torque Enable(562)]: #torque-enable562
