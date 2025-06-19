### Launch MoveIt
```bash
ros2 launch open_manipulator_moveit_config omy_f3m_moveit.launch.py
```

### Launch the OpenMANIPULATOR GUI
```bash
ros2 launch open_manipulator_gui omy_f3m_gui.launch.py
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
<img src="/assets/images/platform/omy/OMY_GUI1.png" width="700"/>

2. Check the status of OMY.  
<img src="/assets/images/platform/omy/OMY_GUI2.png" width="700"/>

3. To manipulate OMY in the [joint space]{: .popup}, enter the joint angles and total time for the trajectory. Then click the `send` button to start the motion.  
<img src="/assets/images/platform/omy/OMY_GUI3.png" width="700"/>

4. To manipulate OMY in the [task space]{: .popup}, enter the kinematics pose of the OMY end-effector(tool) in the [task space]{: .popup}. Then click the `send` button to start the motion.  
<img src="/assets/images/platform/omy/OMY_GUI4.png" width="700"/>

5. Create a task constructor with OMY.  
- Click the `Read task` button to prepare for saving tasks.  
(You can create or modify the pre-saved joint values in the **robot_joint_log.csv** file. The file's load path can be checked in the terminal when the GUI node is launched.)  
- Adjust the manipulator's posture and save it by clicking `Save pose`.  
- Save multiple postures to complete the preparation.  
<img src="/assets/images/platform/omy/OMY_GUI5.png" width="700"/>

6. Press the `Play` button to make the manipulator move sequentially according to the saved tasks. Completed tasks will have their status changed to <span style="color: green; font-weight: bold;">Done</span>  
<img src="/assets/images/platform/omy/OMY_GUI6.png" width="700"/>

#### OMY GUI Demo
<img src="/assets/images/platform/omy/omy_f3m_gui.gif" width="700"/>

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
