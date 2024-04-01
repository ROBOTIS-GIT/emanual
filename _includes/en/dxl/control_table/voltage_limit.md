{% if page.product_group=='dxl_y_m' %}
{% assign present_input_voltage= "[Present Input Voltage(568)]" %}
{% endif %}

Min/Max Voltage Limit is used to configure the upper and lower limits of the input voltage.  
If the {{ present_input_voltage }} voltage exits the range between Max Voltage Limit or Min Voltage Limit, an input voltage error will be triggered. In such cases, the values in the control table are changed as shown in the table below, and the device comes to a stop. Since an error has occurred in the device, the next Status Packet transmitted will include an Alert Bit (0x80) in the Error field.


| Address   | Label                | Value Change                                        | Description                                                                             |
|:---------:|:--------------------:|:----------------------------------------------------|:----------------------------------------------------------------------------------------|
| 152       | [Controller State]      | 9 (Hardware Fault)                                  | The internal controller transitions to Hardware Fault state.                            |
| 153       | [Error Code]         | 1 (Over Voltage Error)<br />2 (Low Voltage Error)   | The present input voltage is higher than the Max Voltage Limit.<br />The present input voltage is lower than the Min Voltage Limit. |
| 512       | [Torque Enable]      | 0 (Torque OFF)                                      | An error has occurred, causing the device’s torque to be disabled.                            |
| 154 ~ 169 | Error Code History   | Error Code                                          | The currently occurring error code is added to the Error Code History.                  |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512
