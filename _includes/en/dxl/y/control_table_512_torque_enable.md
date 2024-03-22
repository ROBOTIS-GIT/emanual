
Controls Torque ON/OFF. Writing '1' enables Torque ON state and locks all data in the EEPROM area. If Torque ON is not possible, the Result Fail bit in the Status Packet error will be set to '1'.

| Value |  Description        |
|:-----:| :-----------------  |
| 0     | Request Torque OFF  |
| 1     | Request Torque ON   |


Writing '1' to Torque Enable initiates the Torque ON process in the following sequence:  
Torque ON 🡪 Brake Release 🡪 Start Goal Data Update  
Writing '0' to Torque Enable initiates the Torque OFF process in the following sequence:  
Stop Goal Data Update 🡪 Slow Stop 🡪 Lock Brake 🡪 Torque OFF  

**Note** : If the value of Gain Save(170) is ‘0’, changes will not be saved when the device is rebooted or powered off.
{: .notice}

**Note** : When the value of [Controller State(152)] is Process Torque On(4), Process Torque Off(6), writing values to Torque Enable(512), [Goal PWM(524)], [Goal Current(526)], G[oal Velocity(528)], [Goal Position(532)] will result in a “Result Fail” return.
{: .notice}
