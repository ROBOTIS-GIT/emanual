Users can adjust the Home position by setting Home Offset(20). The Homing Offset value is added to the Present Position(132).
Present Position(132) = Actual Position + Homing Offset(20).

|Unit|Value Range|Description|
| :---: | :---: | :---: |
|about 0.088 [&deg;]|-1,044,479 ~ 1,044,479<br />(-255 ~ 255[rev])|4,096 resolution|

**NOTE** : In case of the Position Control Mode(Joint Mode) that rotates less than 360 degrees, any invalid Homing Offset(20) values will be ignored(valid range : -1,024 ~ 1,024).
{: .notice}
