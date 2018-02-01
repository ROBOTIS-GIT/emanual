The Dynamixel can protect itself by detecting dangerous situations that could occur during the operation. Each Bit is inclusively processed with the ‘OR’ logic, therefore, multiple options can be generated. For instance, when ‘0x05’ (binary : 00000101) is defined as Shutdown(48), Dynamixel can detect both Input Voltage Error(binary : 00000001) and Overheating Error(binary : 00000100). If those errors are detected, Torque Enable(562) is cleared to ‘0’ and the motor output becomes 0[%]. In order to reuse Dynamixel Pro in shutdown status, REBOOT has to be done. The followings are detectable situations.

|Bit   | Item     | Description     |
| :-------------: | :-------------: | :------------- |
|Bit 7|-|-|
|Bit 6|-|-|
|Bit 5|Overload Error(default)|Detect persistent load that exceeds maximum output|
|Bit 4|Electrical Shock Error(default)|Detect electric shock on the circuit or insufficient power to operate the motor|
|Bit 3|Motor Encoder Error|Detect malfunction of the motor encoder|
|Bit 2|OverHeating Error(default)|Detect internal temperature exceeds the configured operating temperature|
|Bit 1|Motor Hall Sensor Error|Motor hall sensor value exceeds normal range|
|Bit 0|Input Voltage Error|Detect input voltage exceeds the configured operating voltage|

`Note` If Shutdown occurs, use below method to reboot Dynamixels.
1. H/W REBOOT : Turn off the power and turn on again
2. S/W REBOOT : Transmit REBOOT Instruction (For more details, please refer to the [Protocol] section of e-Manual.)

[Protocol]: /docs/en/dxl/protocol2/#reboot
