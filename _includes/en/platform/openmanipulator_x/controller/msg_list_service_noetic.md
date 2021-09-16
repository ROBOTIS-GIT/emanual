
#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenMANIPULATOR-X or to change the status of DYNAMIXEL of OpenMANIPULATOR.
{: .notice--info}

A list of service servers that open_manipulator_controller has.


##### /goal_joint_space_path
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the angle of the target joint and the total time of the trajectory.

##### /goal_joint_space_path_to_kinematics_pose
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_joint_space_path_to_kinematics_position
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_joint_space_path_to_kinematics_orientation
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_task_space_path
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_task_space_path_position_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_task_space_path_orientation_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_joint_space_path_from_present
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}.
- The user inputs the angle of the target joint to be changed and the total time of the trajectory.

##### /goal_task_space_path_from_present
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the task space.
- The user inputs the kinematics pose to be changed of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_task_space_path_from_present_position_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_task_space_path_from_present_orientation_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. 
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /goal_tool_control
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to move the tool of OpenMANIPULATOR.

##### /set_actuator_state
- [open_manipulator_msgs/SetActuatorState]{: .popup}
- The user can use this service to control the state of actucators.   
- If the user set true at set_actuator_state valuable, the actuator will be enabled.  
- If the user set false at set_actuator_state valuable, the actuator will be disabled.

##### /goal_drawing_trajectory
- [open_manipulator_msgs/SetDrawingTrajectory]{: .popup}
- The user can use this service to create a drawing trajectory.
- The user can create the circle, the rhombus, the heart, and the straight line trajectory.

[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/
[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
