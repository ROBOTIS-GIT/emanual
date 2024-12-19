The Temperature Limit(31) is used to configure an upper limit on DYNAMIXEL operating temperature.  
When the [Present Temperature(146)] is greater than the Temperature Limit(31), the **Overheating Error Bit(0x04)** and **Alert Bit(0x80)** in the [Hardware Error Status(70)] register will be set. If the Overheating Error Bit(0x04) is configured in [Shutdown(63)], [Torque Enable(64)] will be set to ‘0’ (Torque OFF). 
See [Shutdown(63)] for more detailed information.

|     Unit     | Value Range | Description  |
|:------------:|:-----------:|:------------:|
| About 1&deg; |   0 ~ 100   | 0 ~ 100&deg; |

**CAUTION** : Do not set this value higher than it's default. In the case that a DYNAMIXEL triggers a temperature shutdown alarm (Overheating Error Bit(0x04)), let it cool for 20 minutes or more before resuming use to prevent damage to the actuator.
{: .notice--warning}
