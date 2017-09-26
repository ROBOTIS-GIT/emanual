These values are maximum and minimum operating voltages.
When current input voltage acquired from Present Input Voltage(623) exceeds the range of Max Voltage Limit(36) and Min Voltage Limit(40), Input Voltage Error Bit(Bit 0) in the Hardware Error Status(892) will be set to '1'. If Input Voltage Error Bit(Bit 0) is configured in the Shutdown(48) when Input Voltage Error occurs, Torque Enable(562) is cleared to ‘0’ and Torque will be disabled. For more details, please refer to the [Shutdown(48)](#shutdown) section.

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|About 0.1V|0 ~ 400|0 ~ 40.0V|
