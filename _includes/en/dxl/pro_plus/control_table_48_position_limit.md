These values limit maximum and minimum positions for Position Control Mode within the range of 1 rotation(-303,750 ~ 303,750). Therefore, Goal Position(564) should not exceed the limit range. Attempting to write an invalid value will fail and set the Limit Error Bit in the error field of the Status Packet.

|   Unit    |    Value Range     |
|:---------:|:------------------:|
| 1 [pulse] | -501,923 ~ 501,923 |

**NOTE** : Max Position Limit(48) and Min Position Limit(52) are NOT used in Extended Position Control Mode.
{: .notice}
