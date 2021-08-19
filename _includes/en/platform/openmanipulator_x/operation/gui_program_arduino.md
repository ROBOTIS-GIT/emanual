{% capture note_01 %}
- The GUI for Arduino example is provided with the Processing.
- Please refer to the [Launch Controller](/docs/en/platform/openmanipulator_x/quick_start_guide_basic_operation/#launch-controller) in the Basic Operation section.
{% endcapture %}
<div class="notice--warning">{{ note_01 | markdownify }}</div>

### [Control Interface](##control-interface)

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

1. To manipulate the OpenMANIPULATOR, click the toggle button to `CONTROLLER ON`.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_3.png)

2. The user can manipulate the OpenMANIPULATOR-X in the [joint space]{: .popup}.  
  Set the joint angles. Then click the `SEND JOINT ANGLE` button. And set the gripper parameter. Then click the `SET GRIPPER` button.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_4.png)

3. The user can manipulate the OpenMANIPULATOR-X in the [task space]{: .popup}.  
  Click the `TASK SPACE CONTROL` button to change the tab.  
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



[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/