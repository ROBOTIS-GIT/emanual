---
layout: popup
---

- File: `open_manipulator_msgs/SetActuatorState.srv`

- Service Definition
 ```c
string[]   joint_name
bool set_actuator_state
---
bool is_planned
```

- Description
This service controls the state of actucators.   

  - Request
    * `string[] joint_name`
&emsp;&emsp; The name of joints to control.

    * `bool set_actuator_state`
&emsp;&emsp; The state of joints to control.

  - Response
    * `bool is_planned`
&emsp;&emsp; Whether or not it is controlled.

