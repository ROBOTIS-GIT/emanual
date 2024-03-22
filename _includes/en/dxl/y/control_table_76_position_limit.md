In Position Control mode, this value serves as a limit for the target position within the 32-bit range (-2,147,483,647 ~ 2,147,483,647). In Position Control mode, the [Goal position(532)] cannot exceed this value. If a value greater than this limit is set, the Status Packet transmits a Data Limit Error through the Error field.

|   Unit    |            Range               |
|:---------:|:------------------------------:|
| 1 [pulse] | -2,147,483,648 ~ 2,147,483,647 |


