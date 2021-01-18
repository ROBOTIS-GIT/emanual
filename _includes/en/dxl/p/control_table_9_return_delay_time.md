If the DYNAMIXEL receives an Instruction Packet, it will return the Status Packet after the time of the set Return Delay Time(9).  
 
Note that the range of values is 0 to 254 (0XFE) and its unit is 2 [μsec]. For instance, if the Return Delay Time(9) is set to ‘10’, the Status Packet will be returned after 20[μsec] when the Instruction Packet is received.

|   Unit   | Value Range |                         Description                         |
|:--------:|:-----------:|:-----------------------------------------------------------:|
| 2 [μsec] |   0 ~ 254   | Default Value: ‘250’(500 [μs]) <br> Maximum Value: 508 [μs] |


**WARNING** : Modebus-RTU dose not support Return Delay Time(9).    
{: .notice--warning}
