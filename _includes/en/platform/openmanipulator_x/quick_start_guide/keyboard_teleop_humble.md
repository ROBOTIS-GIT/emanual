
Open a terminal and execute the servo launch file below; MoveIt Servo provides real-time, smooth, and responsive control for robotic manipulators in joint or Cartesian space.
```bash
$ ros2 launch open_manipulator_x_moveit_config servo.launch.py
```  


Open another terminal and enter below command.  
```bash
$ ros2 run open_manipulator_x_teleop open_manipulator_x_teleop
```

You will see the interface below in the terminal window after a successful launch, and you can now easily control the OM-X using the keyboard.

```
[INFO] [1732776371.215661501] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO START SERVER
[INFO] [1732776371.216112752] [servo_keyboard_input]: SUCCESS TO CONNECT SERVO STOP SERVER
[INFO] [1732776371.216172872] [servo_keyboard_input]: call 'moveit_servo' start srv.
[INFO] [1732776371.283417067] [servo_keyboard_input]: SUCCESS to start 'moveit_servo'
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
