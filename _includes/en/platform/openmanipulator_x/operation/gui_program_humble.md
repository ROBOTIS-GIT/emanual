{% capture notice_01 %}
**NOTE**:
- This instructions are supposed to be running on PC with ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before running the GUI Program.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

1. Before Launch the GUI program, the [OpenMANIPULATOR-X Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) must be running on another terminal. Plus launch moveit_core using this command in the new terminal.
```bash
$ ros2 launch open_manipulator_x_moveit_config moveit_core.launch.py
```

2. Launch the GUI program. 
```bash
$ ros2 launch open_manipulator_x_gui open_manipulator_x_gui.launch.py
```

3. Click the `Timer Start` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI2.png)  

4. Check the status of OpenMANIPULATOR-X.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI3.png)  

5. To manipulate OpenMANIPULATOR-X in the [joint space]{: .popup}, enter the joint angles and total time for the trajectory. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI4.png)  

6. To manipulate OpenMANIPULATOR-X in the [task space]{: .popup}, enter the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup}. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI5.png)  

7. Create a task constructor with OpenMANIPULATOR-X.  
7.1. Click the `Read task` button to prepare for saving tasks.  
7.2. Adjust the manipulator's posture and save it by clicking `Save pose`.  
7.3. Save multiple postures to complete the preparation.   
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI6.png)  

Press the `Play` button to make the manipulator move sequentially according to the saved tasks. Completed tasks will have their status changed to <span style="color: green; font-weight: bold;">Done</span>
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI7.png)  


[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
