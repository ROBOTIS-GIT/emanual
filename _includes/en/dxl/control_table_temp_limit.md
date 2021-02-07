
The operating temperature's upper bound of the DYNAMIXEL.

For instance, if the value of the Temperature Limit(11) is set as '80', it means 80[&deg;C]
Providing that the operating DYNAMIXEL's internal temperature is over the Temperature Limit(11), the Status Packet transmits Overheating Error Bit (Bit2) via the ERROR field. If Overheating flag is set in the [Shutdown](#shutdown), the Alarm LED will start blinking and the motor's output will be 0 [%].


|     Unit      | Value Range |
|:-------------:|:-----------:|
| About 1&deg;C |   0 ~ 100   |


**CAUTION** : Do not set the temperature higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Keep using the product when the temperature is high can cause severe damage.
{: .notice--warning}
