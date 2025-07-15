In order to control the simulated OpenMANIPULATOR-X, launch the [OpenMANIPULATOR-X control GUI](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program) or [Keyboard teleoperation](/docs/en/platform/openmanipulator_x/ros_operation/#keyboard)  
Click to view detailed instructions.

- GUI Program

  **Terminal 1** - Launch the Gazebo simulation:
  ```bash
  $ ros2 launch open_manipulator_bringup open_manipulator_x_gazebo.launch.py
  ```

  **Terminal 2** - Launch MoveIt configuration:
  ```bash
  $ ros2 launch open_manipulator_moveit_config open_manipulator_x_moveit.launch.py use_sim:=true
  ```

  **Terminal 3** - Launch GUI program:
  ```bash
  $ ros2 launch open_manipulator_gui open_manipulator_x_gui.launch.py
  ```
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI.png)

- Keyboard Teleoperation

  **Terminal 1** - Launch the Gazebo simulation:
  ```bash
  $ ros2 launch open_manipulator_bringup open_manipulator_x_gazebo.launch.py
  ```

  **Terminal 2** - Launch teleoperation:
  ```bash
  $ ros2 run open_manipulator_teleop open_manipulator_x_teleop
  ```

  ```
  [INFO] [1751512149.624709736] [keyboard_controller]: Waiting for /joint_states...
  [INFO] [1751512149.625639191] [keyboard_controller]: Waiting for initial joint states...
  [INFO] [1751512149.626929914] [keyboard_controller]: Received joint states: [-0.05982525065917969, -0.9157865293212891, 0.8517752421836835, 0.0], Gripper: 0.0
  [INFO] [1751512149.627527555] [keyboard_controller]: Ready to receive keyboard input!
  [INFO] [1751512149.627527555] [keyboard_controller]: Use 1/q, 2/w, 3/e, 4/r for joints 1-4, o/p for gripper. Press ESC to exit.
  ``` 