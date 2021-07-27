
**NOTE**:  
Please launch the [OpenMANIPULATOR-X Controller](#launch-controller) before running this section.
{: .notice--info}

Publish a topic message to check the OpenMANIPULATOR-X setting.

```bash
$ ros2 topic pub /option std_msgs/msg/String "data: print_open_manipulator_x_setting"
```

**Manipulator Description** will be printed on the terminal where the open_manipulator_controller is running.  
Current configuration of the OpenMANIPULATOR-X is displayed.  
Parameters related to the description is loaded from the open_manipulator.cpp in the open_manipulator_libs package.  
`~/robotis_ws/src/open_manipulator_x/open_manipulator_x_libs/src/open_manipulator_x.cpp`

```
  ----------<Manipulator Description>----------
  <Degree of freedom>
  4.000
  <Size of Components>
  5.000

  <Configuration of world>
  [Name]
  -World Name : world
  -Child Name : joint1
  [Static Pose]
  -Position :
  (0.000, 0.000, 0.000)
  -Orientation :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  [Dynamic Pose]
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)

  <Configuration of gripper>
  [Component Type]
    Tool
  [Name]
  -Parent Name : joint4
  [Actuator]
  -Actuator Name : tool_dxl
  -ID :  15
  -Joint Axis :
  (0.000, 0.000, 0.000)
  -Coefficient :  -0.015
  -Limit :
      Maximum : 0.010, Minimum : -0.010
  [Actuator Value]
  -Value :  0.008
  -Velocity :  0.000
  -Acceleration :  0.000
  -Effort :  0.000
  [Constant]
  -Relative Position from parent component :
  (0.130, 0.000, 0.000)
  -Relative Orientation from parent component :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Mass :  0.000
  -Inertia Tensor :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Center of Mass :
  (0.000, 0.000, 0.000)
  [Variable]
  -Position :
  (0.138, -0.005, 0.015)
  -Orientation :
  (-0.006, 0.043, 0.999
  0.000, 0.999, -0.043
  -1.000, 0.000, -0.006)
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)

  <Configuration of joint1>
  [Component Type]
    Active Joint
  [Name]
  -Parent Name : world
  -Child Name 1 : joint2
  [Actuator]
  -Actuator Name : joint_dxl
  -ID :  11
  -Joint Axis :
  (0.000, 0.000, 1.000)
  -Coefficient :  1.000
  -Limit :
      Maximum : 3.142, Minimum : -3.142
  [Actuator Value]
  -Value :  -0.043
  -Velocity :  0.000
  -Acceleration :  0.000
  -Effort :  0.000
  [Constant]
  -Relative Position from parent component :
  (0.012, 0.000, 0.017)
  -Relative Orientation from parent component :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Mass :  0.000
  -Inertia Tensor :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Center of Mass :
  (0.000, 0.000, 0.000)
  [Variable]
  -Position :
  (0.012, 0.000, 0.017)
  -Orientation :
  (0.999, 0.043, 0.000
  -0.043, 0.999, 0.000
  0.000, 0.000, 1.000)
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)

  <Configuration of joint2>
  [Component Type]
    Active Joint
  [Name]
  -Parent Name : joint1
  -Child Name 1 : joint3
  [Actuator]
  -Actuator Name : joint_dxl
  -ID :  12
  -Joint Axis :
  (0.000, 1.000, 0.000)
  -Coefficient :  1.000
  -Limit :
      Maximum : 1.571, Minimum : -2.050
  [Actuator Value]
  -Value :  -0.052
  -Velocity :  0.000
  -Acceleration :  0.000
  -Effort :  0.000
  [Constant]
  -Relative Position from parent component :
  (0.000, 0.000, 0.058)
  -Relative Orientation from parent component :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Mass :  0.000
  -Inertia Tensor :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Center of Mass :
  (0.000, 0.000, 0.000)
  [Variable]
  -Position :
  (0.012, 0.000, 0.075)
  -Orientation :
  (0.998, 0.043, -0.052
  -0.043, 0.999, 0.002
  0.052, 0.000, 0.999)
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)

  <Configuration of joint3>
  [Component Type]
    Active Joint
  [Name]
  -Parent Name : joint2
  -Child Name 1 : joint4
  [Actuator]
  -Actuator Name : joint_dxl
  -ID :  13
  -Joint Axis :
  (0.000, 1.000, 0.000)
  -Coefficient :  1.000
  -Limit :
      Maximum : 1.530, Minimum : -1.571
  [Actuator Value]
  -Value :  0.546
  -Velocity :  0.000
  -Acceleration :  0.000
  -Effort :  0.000
  [Constant]
  -Relative Position from parent component :
  (0.024, 0.000, 0.128)
  -Relative Orientation from parent component :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Mass :  0.000
  -Inertia Tensor :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Center of Mass :
  (0.000, 0.000, 0.000)
  [Variable]
  -Position :
  (0.029, -0.001, 0.204)
  -Orientation :
  (0.880, 0.043, 0.474
  -0.038, 0.999, -0.020
  -0.474, 0.000, 0.880)
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)

  <Configuration of joint4>
  [Component Type]
    Active Joint
  [Name]
  -Parent Name : joint3
  -Child Name 1 : gripper
  [Actuator]
  -Actuator Name : joint_dxl
  -ID :  14
  -Joint Axis :
  (0.000, 1.000, 0.000)
  -Coefficient :  1.000
  -Limit :
      Maximum : 2.000, Minimum : -1.800
  [Actuator Value]
  -Value :  1.083
  -Velocity :  0.000
  -Acceleration :  0.000
  -Effort :  -2.690
  [Constant]
  -Relative Position from parent component :
  (0.124, 0.000, 0.000)
  -Relative Orientation from parent component :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Mass :  0.000
  -Inertia Tensor :
  (1.000, 0.000, 0.000
  0.000, 1.000, 0.000
  0.000, 0.000, 1.000)
  -Center of Mass :
  (0.000, 0.000, 0.000)
  [Variable]
  -Position :
  (0.138, -0.005, 0.145)
  -Orientation :
  (-0.006, 0.043, 0.999
  0.000, 0.999, -0.043
  -1.000, 0.000, -0.006)
  -Linear Velocity :
  (0.000, 0.000, 0.000)
  -Linear acceleration :
  (0.000, 0.000, 0.000)
  -Angular Velocity :
  (0.000, 0.000, 0.000)
  -Angular acceleration :
  (0.000, 0.000, 0.000)
  ---------------------------------------------
```
