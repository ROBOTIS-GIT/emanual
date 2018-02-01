Goal torque (604) can be used to set a target torque and this value cannot exceed Torque Limit(30).
When the Operating Mode(11) is set other than Torque Control Mode, Goal Torque will be used to limit the torque.
However, if Goal Torque is set to '0', Torque Limit(30) will be used to limit the torque. (Please refer to the block diagram of Position Gain or Velocity Gain)
The relationship between torque, current, and goal torque is shown below.

|Model|Formula|
| :---: | :---: |
|PRO 54 | A = V * 33,000 / 2,048<br />A : Current[mA]<br />V : Present Current/Goal Torque |
|PRO 42 | A = V * 8,250 / 2,048<br />A : Current[mA]<br />V : Present Current/Goal Torque |
