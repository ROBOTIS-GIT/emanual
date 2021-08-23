In order to control the simulated OpenMANIPULATOR-X, launch the [OpenManipulator control GUI](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program) or [Keyboard teleoperation](http://localhost:4000/docs/en/platform/openmanipulator_x/ros_operation/#keyboard)

- GUI Program
  ```bash
  $ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
  ```
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI.png)

- Keyboard Teleoperation
  ```bash
  $ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
  ```
  ```
  ---------------------------
  Control Your OpenMANIPULATOR-X!
  ---------------------------
  w : increase x axis in task space
  s : decrease x axis in task space
  a : increase y axis in task space
  d : decrease y axis in task space
  z : increase z axis in task space
  x : decrease z axis in task space

  y : increase joint 1 angle
  h : decrease joint 1 angle
  u : increase joint 2 angle
  j : decrease joint 2 angle
  i : increase joint 3 angle
  k : decrease joint 3 angle
  o : increase joint 4 angle
  l : decrease joint 4 angle

  g : gripper open
  f : gripper close

  1 : init pose
  2 : home pose

  q to quit
  ---------------------------
  Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
  Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
  ---------------------------
  ```
