---
layout: popup
---

- File: `dynamixel_workbench_msgs/DynamixelState.msg`

- Compact Message Definition
```c
    string name
    uint8  id

    int32  present_position
    int32  present_velocity
    int16  present_current
```

- Description
This message includes basic data of dynamixel

  - `string model_name`
&emsp;&emsp; Model name of Dynamixel

  - `uint8 id`
&emsp;&emsp; ID of Dynamixel

  - `int32 present_position`
&emsp;&emsp; Present position of Dynamixel

  - `int32 present_velocity`
&emsp;&emsp; Present velocity of Dynamixel

  - `uint16 present_current`
&emsp;&emsp; Present current or load of Dynamixel