This represents the code for the issue occurring in the device. The list of errors that may occur in the device is as follows:

| Value     |           Label              | Torque ON | *Hold | Error Clear | Description                                                                |
|:---------:|:----------------------------:|:---------:|:-----:|:-----------:|:---------------------------------------------------------------------------|
| 0 (0x00)  | No Error                     | -         | -     | -           | No error                                                                   |
| 1 (0x01)  | Over Voltage Error           | N         | -     | Y           | Device supply voltage exceeds the [Max Voltage Limit(60)]                  |
| 2 (0x02)  | Low Voltage Error            | N         | -     | Y           | Device supply voltage exceeds the [Min Voltage Limit(62)]                  |
| 3 (0x03)  | Inverter Overheating Error   | N         | -     | Y           | The inverter temperature has exceeded the [Inverter Temperature Limit(56)] |
| 4 (0x04)  | Motor Overheating Error      | N         | -     | Y           | The motor temperature has exceeded the [Motor Temperature Limit(57)].      |
| 5 (0x05)  | Overload Error               | N         | -     | Y           | Operating current exceeding rated current for an extended duration         |
| 7 (0x07)  | Inverter Error               | N         | -     | N           | An issue has occurred with the inverter                                    |
| 9 (0x09)  | Battery Warning              | Y         | N     | N           | Low Multi-Turn battery voltage. Replacement recommended                    |
| 10 (0x0A) | Battery Error                | N         | -     | N           | Multi-Turn battery voltage is too low, causing issues                      |
| 11 (0x0B) | Magnet Error                 | N         | -     | N           | Multi-Turn position lost. Multi-Turn reset required                        |
| 12 (0x0C) | Multi-Turn Error             | N         | -     | N           | An issue has occurred with the Multi-Turn IC                               |
| 13 (0x0D) | Encoder Error                | N         | -     | N           | An issue has occurred with the Encoder IC                                  |
| 14 (0x0E) | Hall Sensor Error            | N         | -     | N           | An issue has occurred with the Hall Sensor                                 |
| 15 (0x0F) | Calibration Error            | N         | -     | N           | Cannot find calibration Data                                               |
| 17 (0x11) | Following Error              | Y         | Y     | Y           | Position control error exceeds the [Following Error Threshold(44)]         |
| 18 (0x12) | Bus Watchdog Error           | Y         | Y     | Y           | An issue has occurred with the Bus Watchdog                                |
| 19 (0x13) | Over Speed Error             | Y         | Y     | Y           | Rotates at a speed of 120% or more than the [Velocity Limit(72)]           |
| 20 (0x14) | Position Limit Reached Error | Y         | Y     | Y           | In position control mode, the current position has moved<br />beyond the Max/Min [Position Limit(76, 84)] + [Position Limit Threshold(38)] range. |


**Note** : *Hold status indicates that Goal Value Write is not possible while Torque is On. In position and velocity control modes, the current position is maintained after deceleration and stop, while in current control mode, it is in Dynamic Brake mode.
{: .notice}


#### [How to Clear Error](#how-to-clear-error)

If an error occurs in the device, errors that can be cleared can be resolved using the methods below. 
1. Error Clear Packet: Errors that can be cleared can be reset using the [Error Clear Packet].
2. DYNAMIXEL Wizard 2.0: You can clear the error by pressing the Clear button located next to the Error Code on the right.


![](/assets/images/dxl/y/clear_error.png)

