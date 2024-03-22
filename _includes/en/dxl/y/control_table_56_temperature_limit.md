This is the upper limit for the operating temperature of the inverter and motor.  
If the values of [Present Inverter Temperature(570)] or [Present Motor Temperature(571)] exceed the Inverter Temperature Limit(56) and Motor Temperature Limit(57) respectively, an overheating error occurs. The values of the control table items shown in the table below will be changed, and the device will enter an error state. After an error occurs, the Status Packet transmits an Alert Bit (0x80) through the Error field.


| Address   | Label              | Value Change                                        | Description                                                                          |
|:---------:|:------------------:|:----------------------------------------------------|:------------------------------------------------------------------------------------------|
| 152       | [Controller State]    | 9 (Hardware Fault)                                  | The internal controller transitions to Hardware Fault state.                          |
| 153       | [Error Code]       | 3 (Inverter Overheating)<br />4 (Motor Overheating) | The temperature of the inverter is higher than the Inverter Temperature Limit(56).<br />The temperature of the motor is higher than the Motor Temperature Limit(57). |
| 512       | [Torque Enable]    | 0 (Torque OFF)                                      | An error occurs, causing the device’s torque to be disabled.                              |
| 154 ~ 169 | Error Code History | Error Code                                          | The currently occurring error code is added to the Error Code History.                    |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512