{% if page.product_group=='dxl_y_m' %}
{% assign present_inverter_temperature= "[Present Inverter Temperature(570)]" %}
{% assign present_motor_temperature= "[Present Motor Temperature(571)]" %}
{% endif %}

This is the upper limit for the operating temperature of the inverter and motor.  
If the values of {{ present_inverter_temperature }} or {{ present_motor_temperature}} exceed the Inverter Temperature Limit and Motor Temperature Limit respectively, an overheating error occurs. The values of the control table items shown in the table below will be changed, and the device will enter an error state. After an error occurs, the Status Packet will include an Alert Bit (0x80) in the Error field.


| Address   | Label              | Value Change                                        | Description                                                                          |
|:---------:|:------------------:|:----------------------------------------------------|:------------------------------------------------------------------------------------------|
| 152       | [Controller State]    | 9 (Hardware Fault)                                  | The internal controller transitions to Hardware Fault state.                          |
| 153       | [Error Code]       | 3 (Inverter Overheating)<br />4 (Motor Overheating) | The temperature of the inverter is higher than the Inverter Temperature Limit(56).<br />The temperature of the motor is higher than the Motor Temperature Limit(57). |
| 512       | [Torque Enable]    | 0 (Torque OFF)                                      | An error has occurred, causing the device’s torque to be disabled.                              |
| 154 ~ 169 | Error Code History | Error Code                                          | The currently occurring error code is added to the Error Code History.                    |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512
