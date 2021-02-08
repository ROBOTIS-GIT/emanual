The operating voltage's upper and lower bound of the DYNAMIXEL.

|    Unit    | Value Range | Description |
|:----------:|:-----------:|:-----------:|
| About 0.1V |  50 ~ 160   | 5.0 ~ 16.0V |


The range of value is from 50 to 160 and the per unit value is 0.1 [V]. For instance, if the value of the Max Voltage Limit(13) is set as ‘80’, it means 8 V.
If the [Present Voltage(42)] which is representing the input voltage to the device (the DYNAMIXEL) is lower than the Min Voltage Limit(12) or over the Max Voltage Limit(13), the Status Packet transmits Input Voltage Error Bit(0x01) via the ERROR field. Providing that Input Voltage Error Bit(0x01) flag is set in the [Alarm LED(17)/Shutdown(18)](#alarm-led17-shutdown18), the Alarm LED will start blinking and the motor's output will be 0 [%].

[Present Voltage(42)]: #present-voltage
