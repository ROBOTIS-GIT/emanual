---
layout: popup
---

- File: `dynamixel_workbench_msgs/DynamixelCommand.srv`

- Service Definition
 ```c
    string command

    uint8 id
    string addr_name
    int32 value
    ---
    bool comm_result
```

- Description
This service passes the command to a Dynamixel

  - Request
    * `string command`
&emsp;&emsp; Single instruction which is not included in control table as ping, reboot, reset

    * `uint8 id`
&emsp;&emsp; ID of Dynamixel

    * `string addr_name`
&emsp;&emsp; Single control table item name as Goal_Position, Present_Position

    * `int32 value`
&emsp;&emsp; Value for write value on control table item

  - Response
    * `bool comm_result`
&emsp;&emsp; Whether communication is succeeded between pc to dynamixel.