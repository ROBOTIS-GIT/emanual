The Temperature Limit(31) limits operating temperature of the DYNAMIXEL.  
When the [Present Temperature(146)](#present-temperature146) is greater than the Temperature Limit(31), the **Over Heating Error Bit(0x04)** and **Alert Bit(0x80)** in the [Hardware Error Status(70)](hardware-error-status70) will be set. If Overheating Error Bit(0x04) is configured in the [Shutdown(63)], [Torque Enable(64)] will be set to ‘0’ (Torque OFF). 
See the [Shutdown(63)] for more detailed information.

|     Unit     | Value Range | Description  |
|:------------:|:-----------:|:------------:|
| About 1&deg; |   0 ~ 100   | 0 ~ 100&deg; |

**CAUTION** : Do not set this value higher than its default. In case that DYNAMIXEL encounters temperature warning alarm (Overheating Error Bit(0x04)), let it cool for 20 minutes or more. Otherwise, it may cause severe damage in operating.
{: .notice--warning}
