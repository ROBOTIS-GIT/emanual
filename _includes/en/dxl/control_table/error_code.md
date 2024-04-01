{% assign max_voltage_limit= "[Max Voltage Limit(60)]" %}
{% assign min_voltage_limit= "[Min Voltage Limit(62)]" %}
{% assign inverter_temperature_limit= "[Inverter Temperature Limit(56)]" %}
{% assign motor_temperature_limit= "[Motor Temperature Limit(57)]" %}
{% assign following_error_threshold= "[Following Error Threshold(44)]" %}
{% assign velocity_limit= "[Velocity Limit(72)]" %}
{% assign position_limit_threshold= "[Position Limit Threshold(38)]" %}

Error Code stores the value of any currently active error statuses. The list of errors that may occur is as follows:

| Value     |           Label              | Torque ON | *Hold | Error Clear | Description                                                                |
|:---------:|:----------------------------:|:---------:|:-----:|:-----------:|:---------------------------------------------------------------------------|
| 0 (0x00)  | No Error                     | -         | -     | -           | No error                                                                   |
| 1 (0x01)  | Over Voltage Error           | N         | -     | Y           | Device supply voltage exceeds the {{ max_voltage_limit }}                  |
| 2 (0x02)  | Low Voltage Error            | N         | -     | Y           | Device supply voltage exceeds the {{ min_voltage_limit }}                  |
| 3 (0x03)  | Inverter Overheating Error   | N         | -     | Y           | The inverter temperature has exceeded the {{ inverter_temperature_limit }} |
| 4 (0x04)  | Motor Overheating Error      | N         | -     | Y           | The motor temperature has exceeded the {{ motor_temperature_limit }}.      |
| 5 (0x05)  | Overload Error               | N         | -     | Y           | Operating current exceeding rated current for an extended duration         |
| 7 (0x07)  | Inverter Error               | N         | -     | N           | An issue has occurred with the inverter                                    |
| 9 (0x09)  | Battery Warning              | Y         | N     | N           | Low Multi-Turn battery voltage. Replacement recommended                    |
| 10 (0x0A) | Battery Error                | N         | -     | N           | Multi-Turn battery voltage is too low, causing issues                      |
| 11 (0x0B) | Magnet Error                 | N         | -     | N           | Multi-Turn position lost. Multi-Turn reset required                        |
| 12 (0x0C) | Multi-Turn Error             | N         | -     | N           | An issue has occurred with the Multi-Turn IC                               |
| 13 (0x0D) | Encoder Error                | N         | -     | N           | An issue has occurred with the Encoder IC                                  |
| 14 (0x0E) | Hall Sensor Error            | N         | -     | N           | An issue has occurred with the Hall Sensor                                 |
| 15 (0x0F) | Calibration Error            | N         | -     | N           | Cannot find calibration Data                                               |
| 17 (0x11) | Following Error              | Y         | Y     | Y           | Position control error exceeds the {{ following_error_threshold }}         |
| 18 (0x12) | Bus Watchdog Error           | Y         | Y     | Y           | An issue has occurred with the Bus Watchdog                                |
| 19 (0x13) | Over Speed Error             | Y         | Y     | Y           | Rotates at a speed of 120% or more than the {{ velocity_limit }}           |
| 20 (0x14) | Position Limit Reached Error | Y         | Y     | Y           | In position control mode, the current position has moved<br />beyond the Max/Min Position Limit + {{ position_limit_threshold }} range. |


**Note** : *Hold indicates that writing new Goal Values is not possible while Torque is On and this error is in effect. In position and velocity control modes, the current position is maintained after deceleration and stop, while in current control mode, the servo will enter Dynamic Brake mode.
{: .notice}


#### [How to Clear Error](#how-to-clear-error)

Many errors reported in the Error Code register can be cleared without requiring a reset of the actuator by using either of the methods below:
1. Error Clear Packet: Errors that can be cleared can be reset by sending an [Error Clear Packet].
2. DYNAMIXEL Wizard 2.0: You can clear the error by pressing the Clear button located next to the Error Code on the right of the screen.


![](/assets/images/dxl/y/clear_error.png)

