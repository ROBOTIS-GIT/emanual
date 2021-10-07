
#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenMANIPULATOR-X controller, you can use [rqt](http://wiki.ros.org/rqt) GUI tool. Rqt is a Qt-based framework for GUI development in ROS environment. Rqt allows users to easily read topics. Various information such as topic name, type, bandwidth, Hz and value are shown on the Topic monitor plugin of rqt.

```bash
$ rqt
```
![](/assets/images/platform/openmanipulator_x/ros2_rqt_om_foxy.png)

**TIP**: If the Topic Monitor is not shown, select the `plugin` > `Topics` > `Topic Monitor`.
{: .notice--success}

Unchecked Topics will not be monitored. To monitor topics, select the checkbox.  

![](/assets/images/platform/openmanipulator_x/ros2_foxy_rqt_1.png)

If you would like to see more details about a specific topic, click on the ▶ icon next to the checkbox to expand.  

![](/assets/images/platform/openmanipulator_x/ros2_foxy_rqt_2.png)


#### [Published Topic List](#published-topic-list)

A list of topics that the open_manipulator_controller publishes.

##### /states
- [open_manipulator_msgs/msg/OpenManipulatorState]{: .popup}  
- The message indicating the status of OpenMANIPULATOR.  
- ***"open_manipulator_actuator_state"*** indicates whether actuators are enabled `ACTUATOR_ENABLE` or disabled `ACTUATOR_DISABLE`.  
- ***"open_manipulator_moving_state"*** indicates whether OpenMANIPULATOR-X is moving along the trajectory `IS_MOVING` or stopped `STOPPED`.

##### /joint_states
- [sensor_msgs/msg/JointState]{: .popup}
- The message indicating the states of joints of OpenMANIPULATOR-X.
- ***"name"*** indicates joint component names.
- ***"effort"*** shows current consumption of each DYNAMIXEL.
- ***"position"*** and ***"velocity"*** indicates angles and angular velocities of joints.

##### /kinematics_pose
- [open_manipulator_msgs/msg/KinematicsPose]{: .popup}
- The message that indicates a pose (position and orientation) in [task space]{: .popup}.
- ***"Position"*** indicates the x, y and z values of the center of the end-effector (tool).
- ***"Orientation"*** indicates the rotation of the end-effector (tool) in quaternion.


#### [Subscribed Topic List](#published-topic-list)

A list of topics that the open_manipulator_controller subscribes.

##### /option
- [std_msgs/msg/String]{: .popup}
- This topic is used when setting the OpenMANIPULATOR-X options.
- ***"print_open_manipulator_setting"*** requests the open_manipulator_controller to display "Manipulator Description".

[sensor_msgs/msg/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/msg/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/msg/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs/msg/String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
