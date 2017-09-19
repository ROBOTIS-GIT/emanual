Controls Torque ON/OFF. Writing ‘1’ to this address will turn on the Torque and all Data in the EEPROM area will be protected.

| Value | Description     |
| :-------------: | :------------- |
|0|Turn off the torque(Free run state)|
|1|Turn on the torque and lock EEPROM area|

`Note` Present Position(132) can be reset when Operating Mode(11) and Torque Enable(64) are updated. For more details, please refer to the Homing Offset(20) and Present Position(132).
{: .notice}
