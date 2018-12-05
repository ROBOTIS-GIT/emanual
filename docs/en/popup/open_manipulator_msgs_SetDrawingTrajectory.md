---
layout: popup
---

- File: `open_manipulator_msgs/SetDrawingTrajectory.srv`

- Service Definition
 ```c
string drawing_trajectory_name
float64[] param
float64 path_time
---
bool is_planned
```

- Description
This service creates a drawing trajectory.

  - Request
    * `drawing_trajectory_name`
&emsp;&emsp; The name of the drawing trajectory type. (line, circle, heart, rhombus)

    * `param`
&emsp;&emsp; Parameters required for the drawing trajectory generation.

    * `path_time`
&emsp;&emsp; Total time of the trajectory.

  - Response
    * `is_planned`
&emsp;&emsp; Whether the path is created.
