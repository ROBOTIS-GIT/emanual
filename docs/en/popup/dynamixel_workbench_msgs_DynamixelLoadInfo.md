---
layout: popup
---

- File: `dynamixel_workbench_msgs/DynamixelLoadInfo.msg`

- Compact Message Definition
```c
    string device_name
    uint64 baud_rate
    float32 protocol_version
```

- Description
This message includes information to load DYNAMIXEL.

  - `string device_name`
&emsp;&emsp; The name of device as /dev/ttyUSB0

  - `uint64 baud_rate`
&emsp;&emsp; Baud rate of DYNAMIXEL

  - `float32 protocol_version`
&emsp;&emsp; Protocol version of DYNAMIXEL
