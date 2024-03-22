These are the upper and lower limits of the operating voltage.  
If the Present [Input Voltage(568)] indicating the currently applied voltage goes beyond the range of Max Voltage Limit (60) or Min Voltage Limit (62), an error occurs. In such cases, the values in the control table are changed as shown in the table below, and the device comes to a stop. Since an error has occurred in the device, the Status Packet transmits an Alert Bit (0x80) through the Error field.


| Address   | Label                | Value Change                                        | Description                                                                             |
|:---------:|:--------------------:|:----------------------------------------------------|:----------------------------------------------------------------------------------------|
| 152       | [Controller State]      | 9 (Hardware Fault)                                  | The internal controller transitions to Hardware Fault state.                            |
| 153       | [Error Code]         | 1 (Over Voltage Error)<br />2 (Low Voltage Error)   | The present input voltage is higher than the Max Voltage Limit(60).<br />The present input voltage is less than the Over Voltage Limit(61). |
| 512       | [Torque Enable]      | 0 (Torque OFF)                                      | An error occurs, causing the device’s torque to be disabled.                            |
| 154 ~ 169 | Error Code History   | Error Code                                          | The currently occurring error code is added to the Error Code History.                  |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512