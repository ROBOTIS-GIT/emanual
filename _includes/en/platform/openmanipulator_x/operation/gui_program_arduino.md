
### Launch Processing

{% capture warning_02 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_02 | markdownify }}</div>

{% capture openmanipulator_configuration %}
**WARNING** : Please refer to below default DYNAMIXEL configuration for OpenMANIPULATOR-X chain if you have a custom manipulator.

|  Joint  | ID | Baudrate |
|:-------:|:--:|:--------:|
|    1    | 11 |  1 Mbps  |
|    2    | 12 |  1 Mbps  |
|    3    | 13 |  1 Mbps  |
|    4    | 14 |  1 Mbps  |
| Gripper | 15 |  1 Mbps  |

{% endcapture %}
<div class="notice--warning">{{ openmanipulator_configuration | markdownify }}</div>

**WARNING** : OpenCR 1.0 must be connected to OpenMANIPULATOR-X before launching Processing.
Press `Reset Button` of OpenCR 1.0 to enable torque for OpenMANIPULATOR-X.
{: .notice--warning}

1. Connect OpenCR to PC with a micro USB cable, and connect OpenMANIPULATOR-X to OpenCR, then supply 12V Power to OpenCR as shown below.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup.png)  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png)

2. Turn on the OpenCR 1.0 power switch.

3. Press the `Reset Button` of OpenCR 1.0 and check if OpenMANIPULATOR-X is torque enabled(stiff joints).

4. Open the downloaded processing file in Processing IDE : `open_manipulator_processing` > `Chain` > `Chain.pde`.  
  ![](/assets/images/platform/openmanipulator_x/processing_open1.png)  
  ![](/assets/images/platform/openmanipulator_x/processing_open2.png)  
  ![](/assets/images/platform/openmanipulator_x/processing_run.png)

5. Run the processing source code, and the following graphical GUI will be displayed.

    ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_2.png)

{% capture notice_01 %}
`FAQ`  
If the processing console displays an error message and the GUI does not run normally, check the following:
- Check if ControlP5 is properly installed.
- Check if the graphics driver is installed properly.
- Check if the Java library is properly installed.
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>

### Processing Control Interface

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

The user can use processing program to manipulate the OpenMANIPULATOR.

  To manipulate the OpenMANIPULATOR, click the toggle button to `CONTROLLER ON`.

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_3.png)


  The user can manipulate the OpenMANIPULATOR-X in the [joint space]{: .popup}.
  Set the joint angles. Then click the `SEND JOINT ANGLE` button. And set the gripper parameter. Then click the `SET GRIPPER` button.
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_4.png)

  The user can manipulate the OpenMANIPULATOR-X in the [task space]{: .popup}. Click the `TASK SPACE CONTROL` button to change the tab.
  Click the desired direction button to manipulate the OpenMANIPULATOR.

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_5.png)

### [Hand Guiding](#hand-guiding)

The user can make the demonstration using hand guiding function.

  <iframe width="560" height="315" src="https://www.youtube.com/embed/9mE9QgAro8A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  1. Click the `HAND GUIDING` button to change the tab.
  2. Holds the OpenMANIPULATOR-X by hand and click the toggle button to `TORQUE OFF`.
  3. Move the OpenMANIPULATOR-X to the desired pose by hand.
  4. Click the `SAVE JOINT POSE` to save the present pose.
  5. Repeat step 3 and 4 to create the demonstration.
  6. Click the toggle button to `TORQUE ON`
  7. Click the `MOTION START` button to start the saved poses.

  Click the toggle button to `MOTION REPEAT ON` if you want to repeat the demonstration.
  The total time of the trajectory between saved poses is the same as 2 seconds.

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_6.png)
