---
layout: popup
---

```
robotis_op3:

  # Publish all joint states -----------------------------------

  joint_state_controller:
    type: joint_state_controller/JointStateController
    publish_rate: 50

  # Position Controllers ---------------------------------------

  # Left Leg ---------------------------------------------------

  l_hip_yaw_position:
    type: effort_controllers/JointPositionController
    joint: l_hip_yaw
    pid: {p: 50.0, i: 0.0, d: 0.0}

  l_hip_roll_position:
    type: effort_controllers/JointPositionController
    joint: l_hip_roll
    pid: {p: 50.0, i: 0.0, d: 0.0}

  l_hip_pitch_position:
    type: effort_controllers/JointPositionController
    joint: l_hip_pitch
    pid: {p: 50.0, i: 0.0, d: 0.0}

  l_knee_position:
    type: effort_controllers/JointPositionController
    joint: l_knee
    pid: {p: 50.0, i: 0.0, d: 0.0}

  l_ank_roll_position:
    type: effort_controllers/JointPositionController
    joint: l_ank_roll
    pid: {p: 50.0, i: 0.0, d: 0.0}

  l_ank_pitch_position:
    type: effort_controllers/JointPositionController
    joint: l_ank_pitch
    pid: {p: 50.0, i: 0.0, d: 0.0}

  # Right Leg ---------------------------------------------------

  r_hip_yaw_position:
    type: effort_controllers/JointPositionController
    joint: r_hip_yaw
    pid: {p: 50.0, i: 0.0, d: 0.0}

  r_hip_roll_position:
    type: effort_controllers/JointPositionController
    joint: r_hip_roll
    pid: {p: 50.0, i: 0.0, d: 0.0}

  r_hip_pitch_position:
    type: effort_controllers/JointPositionController
    joint: r_hip_pitch
    pid: {p: 50.0, i: 0.0, d: 0.0}

  r_knee_position:
    type: effort_controllers/JointPositionController
    joint: r_knee
    pid: {p: 50.0, i: 0.0, d: 0.0}

  r_ank_roll_position:
    type: effort_controllers/JointPositionController
    joint: r_ank_roll
    pid: {p: 50.0, i: 0.0, d: 0.0}

  r_ank_pitch_position:
    type: effort_controllers/JointPositionController
    joint: r_ank_pitch
    pid: {p: 50.0, i: 0.0, d: 0.0}

  # Left Arm ---------------------------------------------------

  l_sho_pitch_position:
    type: effort_controllers/JointPositionController
    joint: l_sho_pitch
    pid: {p: 10.0, i: 0.0, d: 0.0}

  l_sho_roll_position:
    type: effort_controllers/JointPositionController
    joint: l_sho_roll
    pid: {p: 10.0, i: 0.0, d: 0.0}

  l_el_position:
    type: effort_controllers/JointPositionController
    joint: l_el
    pid: {p: 10.0, i: 0.0, d: 0.0}

  # Right Arm ---------------------------------------------------

  r_sho_pitch_position:
    type: effort_controllers/JointPositionController
    joint: r_sho_pitch
    pid: {p: 10.0, i: 0.0, d: 0.0}

  r_sho_roll_position:
    type: effort_controllers/JointPositionController
    joint: r_sho_roll
    pid: {p: 10.0, i: 0.0, d: 0.0}

  r_el_position:
    type: effort_controllers/JointPositionController
    joint: r_el
    pid: {p: 10.0, i: 0.0, d: 0.0}

  # Head ---------------------------------------------------

  head_pan_position:
    type: effort_controllers/JointPositionController
    joint: head_pan
    pid: {p: 5.0, i: 0.0, d: 0.0}

  head_tilt_position:
    type: effort_controllers/JointPositionController
    joint: head_tilt
    pid: {p: 5.0, i: 0.0, d: 0.0}
  ```
