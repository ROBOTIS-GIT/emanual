This value limits operating temperature. When the Present Temperature(625) that indicates internal temperature of Dynamixel is greater than the Temperature Limit(21), the Over Heating Error Bit(Bit 2) in the Hardware Error Status(892) will be set. If Overheating Error Bit(Bit 2) is configured in the Shutdown(48) when Over Heating Error occurs, Torque Enable(562) is cleared to ‘0’ and Torque will be disabled. For more details, please refer to the [Shutdown(48)](#shutdown) section.

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|About 1&deg;|0 ~ 100|0 ~ 100&deg;|

`Caution` Do not set the temperature lower/higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Keep using the product when the temperature is high can cause severe damage.
{: .notice--warning}
