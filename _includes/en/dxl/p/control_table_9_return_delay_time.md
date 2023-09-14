Following the receipt of an instruction packet, a DYNAMIXEL servo will return a status packet after the configured Return Delay Time(9) has elapsed.
 
The range of acceptable values includes 0 to 254 (0XFE) with each unit representing a 2μsec delay. For example, if Return Delay Time(9) is set to ‘10’, a status packet will be returned after a 20μsec delay when an instruction packet is received.

| Unit  | Value Range |                         Description                            |
|:-----:|:-----------:|:--------------------------------------------------------------:|
| 2μsec |   0 ~ 254   | Default Value: ‘250’(500 [μs]) <br> Maximum Value: 508 [μs]    |


**WARNING** : Modbus-RTU communication does not support the Return Delay Time(9) feature. 
{: .notice--warning}
