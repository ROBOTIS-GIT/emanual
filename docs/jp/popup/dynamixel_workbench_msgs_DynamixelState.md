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
&emsp;&emsp; Model name of DYNAMIXEL

  - `uint8 id`
&emsp;&emsp; ID of DYNAMIXEL

  - `int32 present_position`
&emsp;&emsp; Present position of DYNAMIXEL

  - `int32 present_velocity`
&emsp;&emsp; Present velocity of DYNAMIXEL

  - `uint16 present_current`
&emsp;&emsp; Present current or load of DYNAMIXEL
