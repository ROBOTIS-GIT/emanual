These values are maximum and minimum operating voltages.  
When present input voltage acquired from [Present Input Voltage(623)] exceeds the range of [Max Voltage Limit(36)] and [Min Voltage Limit(40)], Input Voltage Error Bit(Bit 0) in the Hardware [Error Status(892)] will be set to '1'.  
If Input Voltage Error Bit(Bit 0) is configured in the [Shutdown(48)] when Input Voltage Error occurs, [Torque Enable(562)] is cleared to ‘0’ and Torque will be disabled.  
For more details, please refer to the [Shutdown(48)] section.

|    Unit    | Value Range | Description |
|:----------:|:-----------:|:-----------:|
| About 0.1V |   0 ~ 400   |  0 ~ 40.0V  |

[Shutdown(48)]: #shutdown
[Present Input Voltage(623)]: #present-input-voltage623
[Max Voltage Limit(36)]: #minmax-voltage-limit22-24
[Min Voltage Limit(40)]: #minmax-voltage-limit22-24
[Error Status(892)]: #error-status892
[Torque Enable(562)]: #torque-enable562
