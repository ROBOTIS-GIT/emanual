---
layout: popup
---

- File: `humanoid_nav_msgs/PlanFootsteps.srv`

- Message Definition

  ```
  geometry_msgs/Pose2D start
  geometry_msgs/Pose2D goal
  ---
  bool result
  humanoid_nav_msgs/StepTarget[] footsteps
  float64 costs
  float64 final_eps
  float64 planning_time
  int64 expanded_states

  ```
- Compact Message Definition

  ```
  geometry_msgs/Pose2D start
  geometry_msgs/Pose2D goal
  bool result
  humanoid_nav_msgs/StepTarget[] footsteps
  float64 costs
  float64 final_eps
  float64 planning_time
  int64 expanded_states

  ```
