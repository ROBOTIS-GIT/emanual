{% capture notice_01 %}
**NOTE**:
- This instructions are supposed to be running on PC with ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before running the GUI Program.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

1. Launch the GUI program. The [OpenMANIPULATOR-X Controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) must be running on another terminal.
```bash
$ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
```

2. Click the `Timer Start` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI.png)  

3. Check the status of OpenMANIPULATOR-X.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI2.png)  

4. To manipulate OpenMANIPULATOR-X in the [joint space]{: .popup}, enter the joint angles and total time for the trajectory. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI3.png)  

5. To manipulate OpenMANIPULATOR-X in the [task space]{: .popup}, enter the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time for the trajectory. Then click the `send` button to start the motion.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI4.png)  

6. To create a drawing trajectory with OpenMANIPULATOR-X, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button to start drawing.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI5.png)  

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
