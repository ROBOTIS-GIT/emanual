The operating voltage's upper and lower bound of the DYNAMIXEL.

|    Unit    | Value Range | Description |
|:----------:|:-----------:|:-----------:|
| About 0.1V |  50 ~ 160   | 5.0 ~ 16.0V |


The range of value is from 50 to 160 and the unit is 0.1 [V]. For instance, if the value of the Max Voltage Limit(12) is set as ‘80’, it means 8 V.
If the [Present Voltage(42)] is lower than the Min Voltage Limit(12) or over the Max Voltage Limit(13), the Status Packet transmits Input Voltage Error Bit(0x01) via the ERROR field. Providing that Input Voltage Error Bit(0x01) flag is set in the [Shutdown](#shutdown), the Alarm LED will start blinking and the motor's output will be 0 [%].


[Present Voltage(42)]: #present-voltage
