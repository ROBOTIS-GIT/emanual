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
    * `joint_name`
&emsp;&emsp; The name of joints to control.

    * `set_actuator_state`
&emsp;&emsp; The state of joints to control.

  - Response
    * `is_planned`
&emsp;&emsp; Whether or not it is controlled.

