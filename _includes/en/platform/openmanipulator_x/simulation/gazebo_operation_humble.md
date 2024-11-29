In order to control the simulated OpenMANIPULATOR-X, launch the [OpenManipulator control GUI](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program) or [Keyboard teleoperation](/docs/en/platform/openmanipulator_x/ros_operation/#keyboard)

- GUI Program
  ```bash
  $ ros2 launch open_manipulator_x_gui open_manipulator_x_gui.launch.py
  ```
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI.png)

- Keyboard Teleoperation
  ```bash
  $ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop
  ```  
  
  ```
  [INFO] [1732869286.738207239] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO START SERVER
  [INFO] [1732869286.738351481] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO STOP SERVER
  [INFO] [1732869286.738367129] [servo_keyboard_input]: call 'moveit_servo' start srv.
  [INFO] [1732869286.738923809] [servo_keyboard_input]: SUCCESS to start 'moveit_servo'
  Reading from keyboard
  ---------------------------
  Joint Control Keys:
    1/q: Joint1 +/-
    2/w: Joint2 +/-
    3/e: Joint3 +/-
    4/r: Joint4 +/-
  Use o|p to open/close the gripper.
  'ESC' to quit.
  ```