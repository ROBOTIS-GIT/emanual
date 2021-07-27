
#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenMANIPULATOR-X or to change the status of DYNAMIXEL of OpenMANIPULATOR.
{: .notice--info}

A list of service servers that open_manipulator_controller has.

##### /open_manipulator/goal_joint_space_path
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the angle of the target joint and the total time of the trajectory.

##### /open_manipulator/goal_joint_space_path_to_kinematics_pose
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_joint_space_path_to_kinematics_position
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_joint_space_path_to_kinematics_orientation
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [joint space]{: .popup}.
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path_position_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path_orientation_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory in the [task space]{: .popup}.
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_joint_space_path_from_present
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}.
- The user inputs the angle of the target joint to be changed and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path_from_present
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the task space.
- The user inputs the kinematics pose to be changed of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path_from_present_position_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}.
- The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_task_space_path_from_present_orientation_only
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. 
- The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

##### /open_manipulator/goal_tool_control
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- The user can use this service to move the tool of OpenMANIPULATOR.

##### /open_manipulator/set_actuator_state
- [open_manipulator_msgs/SetActuatorState]{: .popup}
- The user can use this service to control the state of actucators.   
- If the user set true at set_actuator_state valuable, the actuator will be enabled.  
- If the user set false at set_actuator_state valuable, the actuator will be disabled.

##### /open_manipulator/goal_drawing_trajectory
- [open_manipulator_msgs/SetDrawingTrajectory]{: .popup}
- The user can use this service to create a drawing trajectory.
- The user can create the circle, the rhombus, the heart, and the straight line trajectory.

##### /moveit/get_joint_position
- [open_manipulator_msgs/GetJointPosition]{: .popup}
- This service is used when using MoveIt! 
- The user can use this service to receives a joint position which is calculated by move_group.

##### /moveit/get_kinematics_pose
- [open_manipulator_msgs/GetKinematicsPose]{: .popup}
- This service is used when using MoveIt! 
- The user can use this service to receives a kinematics pose which is calculated by move_group.

##### /moveit/set_joint_position
- [open_manipulator_msgs/SetJointPosition]{: .popup}
- This service is used when using MoveIt!
- The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. 
- The user inputs the angle of the target joint and the total time of the trajectory.

##### /moveit/set_kinematics_pose
- [open_manipulator_msgs/SetKinematicsPose]{: .popup}
- This service is used when using MoveIt!
- The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. 
- The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/
[std_msgs/Float64]: /docs/en/popup/std_msgs_Float64_msg/
[std_msgs/Empty]: /docs/en/popup/std_msgs_Empty_msg/
[moveit_msgs/DisplayTrajectory]: /docs/en/popup/moveit_msgs_DisplayTrajectory_msg/
[moveit_msgs/MoveGroupActionGoal]: /docs/en/popup/moveit_msgs_MoveGroup_action/
[moveit_msgs/ExecuteTrajectoryActionGoal]: /docs/en/popup/moveit_msgs_ExecuteTrajectory_action/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs/String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
