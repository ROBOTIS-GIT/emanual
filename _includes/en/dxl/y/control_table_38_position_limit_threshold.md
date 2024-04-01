The threshold for determining the Position Limit Reached Error. If the value of the [Present Position(552)] is outside the range of ([Max Position Limit(76)] + Position Limit Threshold(38)) ~ ([Min Position Limit(84)] -  Position Limit Threshold(38)), a Position Limit Reached Error occurs. If this value is ‘0’, Position Limit Reached Error is disabled.

|   Value    |  Description                                              |
|:----------:|:---------------------------------------------------------:|
| 0(Default) | Position Limit Reached Error Disabled                     |
| 1 ~ 32767  | Position Limit Reached Error Enabled<br />Unit: 1 [Pulse] |


