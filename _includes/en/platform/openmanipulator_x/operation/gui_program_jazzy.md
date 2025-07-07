{% capture notice_01 %}
**NOTE**:
- Make sure ROS 2 Jazzy dependencies are installed before performing these instructions
- [Install ROS Packages](/docs/en/platform/openmanipulator_x/quick_start_guide/#install-ros-packages)
- Docker installation is recommended for ROS 2 Jazzy
- If you are using the Docker environment, make sure you are inside the container before running these commands. Use `./docker/container.sh enter` to enter the container.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Launch the GUI program for OMX with ROS 2 Jazzy.

**Terminal 1** - Launch the hardware controller:
```bash
$ ros2 launch open_manipulator_bringup omx.launch.py
```

**Terminal 2** - Launch MoveIt configuration:
```bash
$ ros2 launch open_manipulator_moveit_config omx_moveit.launch.py
```

**Terminal 3** - Launch the GUI program:
```bash
$ ros2 launch open_manipulator_gui omx_gui.launch.py
```

3. Click the `Timer Start` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI2.png)  

4. Check the status of OMX.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI3.png)  

5. To manipulate OMX in the [joint space]{: .popup}, enter the joint angles and total time for the trajectory. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI4.png)  

6. To manipulate OMX in the [task space]{: .popup}, enter the kinematics pose of the OMX end-effector(tool) in the [task space]{: .popup}. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI5.png)  

7. Create a task constructor with OMX.  
7.1. Click the `Read task` button to prepare for saving tasks.  
 (You can create or modify the pre-saved joint values in the **robot_joint_log.csv** file. The file's load path can be checked in the terminal when the GUI node is launched.)  
7.2. Adjust the manipulator's posture and save it by clicking `Save pose`.  
7.3. Save multiple postures to complete the preparation.   
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI6.png)  

Press the `Play` button to make the manipulator move sequentially according to the saved tasks. Completed tasks will have their status changed to <span style="color: green; font-weight: bold;">Done</span>
![](/assets/images/platform/openmanipulator_x/OpenManipulator_x_GUI7.png)  

The GUI will provide an interface for controlling the manipulator.

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/ 