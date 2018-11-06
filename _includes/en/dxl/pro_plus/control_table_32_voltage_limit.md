These values are maximum and minimum operating voltages.  
When the Present Input Voltage(592) exceeds the range of Max Voltage Limit(32) and Min Voltage Limit(34), Input Voltage Error Bit(0x01) is set in the Hardware Error Status(518) and Alert Bit(0x80) is set in the Error field of the Status Packet.  
If Input Voltage Error Bit(0x10) is configured in the Shutdown(63), Torque Enable(512) is cleared to ‘0’ and Torque is disabled. For more details, please refer to the [Shutdown(63)] section.

|     Unit      | Value Range |
|:-------------:|:-----------:|
| about 0.1 [V] |   0 ~ 350   |
