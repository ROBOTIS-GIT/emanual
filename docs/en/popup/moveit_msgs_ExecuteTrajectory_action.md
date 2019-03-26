---
layout: popup
---

- File : `moveit_msgs/ExecuteTrajectory.action`

- Action Definition

  ```c
    RobotTrajectory trajectory
    ---
    MoveItErrorCodes error_code
    ---
    string state
  ```


- Description

  The trajectory to execute `RobotTrajectory trajectory`

  Error code - encodes the overall reason for failure `MoveItErrorCodes error_code`

  The internal state that the move group action currently is in `string state`
