This section pertains to the commands for requesting Factory Reset, Reboot, and Clear functions within a Modbus Protocol firmware.  
These commands are not supported by the standard firmware. Below is a detailed explanation of each command, including its value range and description.


| Modbus Address |           Name            | Value range, descirption                                                                   |
| :------------: | :-----------------------: | :----------------------------------------------------------------------------------------- |
|     41001      | Factory Reset Instruction | 0x00FF (255): Initialize all values<br>0x0001 (1): Initialize all values except for the ID |
|     41002      |    Reboot Instruction     | Writing any value will cause a reboot                                                      |
|     41003      |     Clear Instruction     | 0x0100 (256): MT Initialization<br>0x0200 (512): Error Clear                               |
