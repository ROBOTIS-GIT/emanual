{% assign safe_stop_time= "[Safe Stop Time(104)]" %}
{% assign overexcitation_time= "[Overexcitation Time(112)]" %}

Controls Torque ON/OFF state. Setting the value to '1' enables Torque state and prevents writing data in the EEPROM area. If Torque cannot be enabled, the Result Fail bit in the returned status packet will be set to '1'.

| Value | Description |
|:-----:| :---------  |
| 0     | Torque OFF  |
| 1     | Torque ON   |


{% if page.product_group=='dxl_y_m' %}
Writing '1' to Torque Enable initiates the Torque ON process in the following sequence:  
Torque ON 🡪 Brake Release 🡪 Start Goal Data Update  
Writing '0' to Torque Enable initiates the Torque OFF process in the following sequence:  
Stop Goal Data Update 🡪 Slow Stop 🡪 Lock Brake 🡪 Torque OFF  

**Note** : If the value of Gain Save(170) is ‘0’, changes will not be saved when the device is rebooted or powered off.
{: .notice}

**Note** : When the [Controller State(152)] is Processing Torque On(4), or Processing Torque Off(6), writing values to Torque Enable(512), [Goal PWM(524)], [Goal Current(526)], [Goal Velocity(528)], [Goal Position(532)] will result in a “Result Fail” status return.
{: .notice}
{% endif %}
