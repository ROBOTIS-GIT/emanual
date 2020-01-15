**CAUTION** : Data in the EEPROM Area can only be written when [Torque Enable(64)] value of control table of each motor in the DYNAMIXEL is cleared to ‘0’.
{: .notice--warning}

**CAUTION** : Each motor on 2XL430 has its own control table. However, [Baud Rate(8)] and [Protocol Type(13)] values are synced all the time as there is only one communication module in the 2XL430 actuator.
In addition, [Torque Enable(64)] must be set as “0” when modifying these addresses. 
{: .notice--warning}
