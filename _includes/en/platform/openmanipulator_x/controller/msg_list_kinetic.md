
**NOTE**:  
Please launch the [OpenMANIPULATOR-X Controller](#launch-controller) before running this section.
{: .notice--info}

The controller uses **topic** and **service** to control and check the status of OpenMANIPULATOR-X.

### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenMANIPULATOR-X controller, you can use [rqt](http://wiki.ros.org/rqt) GUI tool. Rqt is a Qt-based framework for GUI development in ROS environment. Rqt allows users to easily read topics. Various information such as topic name, type, bandwidth, Hz and value are shown on the Topic monitor plugin of rqt.

```bash
$ rqt
```
 <img src="/assets/images/platform/openmanipulator_x/rqt_om.png" width="1000">

**TIP**: If the Topic Monitor is not shown, select the `plugin` > `Topics` > `Topic Monitor`.
{: .notice--success}

Unchecked Topics will not be monitored. To monitor topics, select the checkbox.  

 <img src="/assets/images/platform/openmanipulator_x/rqt_1.png" width="1000">

If you would like to see more details about a specific topic, click on the ▶ icon next to the checkbox to expand.  

 <img src="/assets/images/platform/openmanipulator_x/rqt_2.png" width="1000">


#### [Published Topic List](#published-topic-list)

A list of topics that the open_manipulator_controller publishes.

![](/assets/images/platform/openmanipulator_x/topic_monitor.png)

##### /open_manipulator/states
- [open_manipulator_msgs/OpenManipulatorState]{: .popup}  
- The message indicating the status of OpenMANIPULATOR.  
- ***"open_manipulator_actuator_state"*** indicates whether actuators are enabled `ACTUATOR_ENABLE` or disabled `ACTUATOR_DISABLE`.  
- ***"open_manipulator_moving_state"*** indicates whether OpenMANIPULATOR-X is moving along the trajectory `IS_MOVING` or stopped `STOPPED`.

##### /joint_states
- [sensor_msgs/JointState]{: .popup}
- The message indicating the states of joints of OpenMANIPULATOR-X.
- ***"name"*** indicates joint component names.
- ***"effort"*** shows current consumption of each DYNAMIXEL.
- ***"position"*** and ***"velocity"*** indicates angles and angular velocities of joints.

##### /open_manipulator/gripper/kinematics_pose
- [open_manipulator_msgs/KinematicsPose]{: .popup}
- The message that indicates a pose (position and orientation) in [task space]{: .popup}.
- ***"Position"*** indicates the x, y and z values of the center of the end-effector (tool).
- ***"Orientation"*** indicates the rotation of the end-effector (tool) in quaternion.

##### /open_manipulator/joint#_position/command
- [std_msgs/Float64]{: .popup}
- The messages to publish goal position of each joint to gazebo simulation node.
- `joint#` identifies the name of each joint.
- The messages will be published when the controller is launched with the `use_platform:=false` option.

##### /rviz/moveit/update_start_state
- [std_msgs/Empty]{: .popup}
- The message to update start state of MoveIt! trajectory.
- This message will be published when the controller is launched with the `use_moveit:=true` option.

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

#### [Subscribed Topic List](#published-topic-list)

A list of topics that the open_manipulator_controller subscribes.

##### /open_manipulator/option
- [std_msgs/String]{: .popup}
- This topic is used when setting the OpenMANIPULATOR-X options.
- ***"print_open_manipulator_setting"*** requests the open_manipulator_controller to display "Manipulator Description".

##### /move_group/display_planned_path
- [moveit_msgs/DisplayTrajectory]{: .popup}
- This topic subscribes a planned joint trajectory published from MoveIt!.

##### /move_group/goal
- [moveit_msgs/MoveGroupActionGoal]{: .popup}
- This topic subscribes a planning option data published from MoveIt!

##### /execute_trajectory/goal
- [moveit_msgs/ExecuteTrajectoryActionGoal]{: .popup}
- This topic subscribes states of trajectory execution published from MoveIt!

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}


### [Service](#service)

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
