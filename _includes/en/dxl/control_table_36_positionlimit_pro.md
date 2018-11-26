These values limit maximum and minimum desired positions.  
The Goal Position(596) can't exceed these values.  
Attempting to write an exceeding value will fail and result in receiving a Limit Error Bit from the Status Packet.  
The position value range is -2,147,483,648 ~ 2,147,483,647 while the position limit value ranges are vary by products, so please refer to below table.  
In `Extended Position Control Mode`, these limits will be ignored.

|             Model Name             | Limit Value Range  |
|:----------------------------------:|:------------------:|
| H54-200-S500-R<br />H54-100-S500-R | -250,961 ~ 250,961 |
|           H42-20-S300-R            | -151,875 ~ 151,875 |
|  M54-60-S250-R<br />M54-40-S250-R  | -125,708 ~ 125,708 |
|           M42-10-S260-R            | -131,593 ~ 131,593 |
|           L54-50-S290-R            | -103,846 ~ 103,846 |
|  L54-50-S500-R<br />L54-30-S500-R  | -180,692 ~ 180,692 |
|           L54-30-S400-R            | -144,197 ~ 144,197 |
