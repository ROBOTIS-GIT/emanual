Dynamixel can protect itself by detecting errors occur during the operation.
The errors can be set as the table below.

|Bit   | Item     | Description     |
| :-------------: | :-------------: | :------------- |
|Bit 7|0|-|
|Bit 6|Instruction Error|When undefined Instruction is transmitted or the Action command is delivered without the reg_write command|
|Bit 5|Overload Error|When the current load cannot be controlled with the set maximum torque|
|Bit 4|CheckSum Error|When the Checksum of the transmitted Instruction Packet is invalid|
|Bit 3|Range Error|When the command is given beyond the range of usage|
|Bit 2|OverHeating Error|When the internal temperature is out of the range of operating temperature set in the Control Table|
|Bit 1|Angle Limit Error|When Goal Position is written with the value that is not between CW Angle Limit and CCW Angle Limit|
|Bit 0|Input Voltage Error|When the applied voltage is out of the range of operating voltage set in the Control Table|

It is possible to make duplicate set since the function of each bit is run by  the logic of ‘OR’. That is, if 0x05 (binary 00000101) is set, both Input Voltage Error and Overheating Error can be detected.
If errors occur, in case of Alarm LED, the LED blinks; in case of Alarm Shutdown, the motor output becomes 0 % by resetting the value of Torque Limit(34) to 0.
