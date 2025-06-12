### Launch MoveIt core
```bash
ros2 launch open_manipulator_moveit_config moveit_core.launch.py
```

### Launch the OpenMANIPULATOR GUI
```bash
ros2 launch open_manipulator_gui open_manipulator_y_gui.launch.py
```

### Explore GUI Features
**Basic Controls**
- `Start Timer`: Activates the system.
- `Robot Status`: Displays current manipulator state.
- `Init Pose`: Moves the manipulator to a vertical position.
- `Home Pose`: Moves the manipulator to a compact, safe position.
- `Gripper Open/Close`: Opens or closes the gripper.

**Task Execution**
- `Joint Space Tab`: Adjust individual joint angles.
- `Task Space Tab`: Control the end-effector position.
- `Task Constructor Tab`
  - `Read Task`: View saved poses.
  - `Save Pose`: Save current state.
  - `Rap`: Set task repetition (1–999).
  - `Play`: Execute saved tasks.
  - `Stop`: Halt operations.
  - `Reset Task`: Clear saved tasks.

**Explore GUI Features**
1. Click the `Timer Start` button.
![](/assets/images/platform/omy/OMY_GUI1.png)

2. Check the status of OMY.
![](/assets/images/platform/omy/OMY_GUI2.png)

3. To manipulate OMY in the [joint space]{: .popup}, enter the joint angles and total time for the trajectory. Then click the `send` button to start the motion.
![](/assets/images/platform/omy/OMY_GUI3.png)

4. To manipulate OMY in the [task space]{: .popup}, enter the kinematics pose of the OMY end-effector(tool) in the [task space]{: .popup}. Then click the `send` button to start the motion.
![](/assets/images/platform/omy/OMY_GUI4.png)

5. Create a task constructor with OMY.  
- Click the `Read task` button to prepare for saving tasks.  
(You can create or modify the pre-saved joint values in the **robot_joint_log.csv** file. The file's load path can be checked in the terminal when the GUI node is launched.)  
- Adjust the manipulator's posture and save it by clicking `Save pose`.  
- Save multiple postures to complete the preparation.
![](/assets/images/platform/omy/OMY_GUI5.png)

6. Press the `Play` button to make the manipulator move sequentially according to the saved tasks. Completed tasks will have their status changed to <span style="color: green; font-weight: bold;">Done</span>
![](/assets/images/platform/omy/OMY_GUI6.png)

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
