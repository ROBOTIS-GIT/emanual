This value limits operating temperature.  
When the Present Temperature(146) that indicates internal temperature of Dynamixel is greater than the Temperature Limit(31), the Over Heating Error Bit(0x04) and Hardware Error Bit(0x80) in the Hardware Error Status(70) will be set.  
If Overheating Error Bit(0x04) is configured in the Shutdown(63), Torque Enable(64) is cleared to ‘0’ and Torque will be disabled.  
For more details, please refer to the [Shutdown(63)](#shutdown63) section.

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|About 1&deg;|0 ~ 100|0 ~ 100&deg;|

**CAUTION** : Do not set the temperature higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Keep using the product when the temperature is high can cause severe damage.
{: .notice--warning}
