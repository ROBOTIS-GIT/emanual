This value limits operating temperature.  
When the Present Temperature(594) that indicates internal temperature of device is greater than the Temperature Limit(31), the Overheating Error Bit(0x04) in the Hardware Error Status(518) will be set.  
If Overheating Error Bit(0x04) is configured in the [Shutdown(63)], [Torque Enable(512)] will be set to ‘0’ (Torque OFF). 
For more details, please refer to the [Shutdown(63)] section.

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|About 1 [&deg;C]|0 ~ 100|0 ~ 100 [&deg;C]|

**CAUTION** : Do not set the temperature lower/higher than the default value. When the temperature alarm shutdown occurs, wait for 20 minutes to cool the temperature before reuse. Keep using the product with high temperature can cause severe damage to the device.
{: .notice--warning}

[Shutdown(63)]: #shutdown
[Torque Enable(512)]: #torque-enable512
