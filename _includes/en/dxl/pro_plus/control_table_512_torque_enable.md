Controls Torque ON/OFF. Writing ‘1’ to this address will turn on the Torque and all Data in the EEPROM area will be protected.

| Value        | Description    |
| :-------: | :------------- |
|0(Default)  | Torque OFF and the motor does not generate torque|
|1          | Torque ON and all Data in the EEPROM area will be locked|

**NOTE** : Present Position(580) can be reset when Operating Mode(11) and Torque Enable(512) are updated. For more details, please refer to the Homing Offset(20) and Present Position(580).
{: .notice}
