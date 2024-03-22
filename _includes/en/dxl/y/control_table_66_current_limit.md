This is the limit value of the target current value. The [Goal Current(526)] cannot be set to a value greater than the Current Limit(66). If a value greater than this limit is set, the Status Packet transmits a Data Limit Error through the Error field.


| Unit     | Range     | Description                                                                |
| :------: | :-------: | :------------------------------------------------------------------------: |
| 0.01 [A] | 0 ~ 2,000 | 1,000 = 10[A], 10[A] current limit<br />2,000 = 20[A], 20[A] current limit |

**Note** : If you continuously apply a current to the motor exceeding the rated 10[A], an Overload Error will occur. Only use currents exceeding the rated value for momentary periods.
{: .notice}