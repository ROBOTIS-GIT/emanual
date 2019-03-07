---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/opencr_operation/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

<div style="counter-reset: h1 10"></div>

# [[OpenCR] Operation](#opencr-operation)

## [Upload Controller](#upload-controller)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_arduino.png)

Upload the example source to OpenCR.

**Tip**: If an error of `cmd_read_board_name fail: 0xF020` occurs constantly during upload, please refer to [OpenCR e-manual](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#firmware-recovery-mode) to enter the firmware recovery mode and upload the source code again after entering mode.
.
{: .notice--success}

## [GUI Program](#gui-program)

### [Processing Setup](#processing-setup)

Download Processing and load OpenCR board on it

- [Download Processing](https://processing.org/download/)

Open Processing and Go to `Tools` → `Add Tool..`. Search `ControlP5` and install it.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_1.png)

Download processing source code for OpenManipulator.

``` bash
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_processing.git
```

Open processing source code file
(`open_manipulator_processing` → `Chain` → `Chain.pde`) on Processing IDE, and Run it.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_2.png)

### [Control Interface](##control-interface)

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

The user can use processing program to manipulate the OpenManipulator.  
  To manipulate the OpenManipulator, click the toggle button to `CONTROLLER ON`.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_3.png)  

  The user can manipulate the OpenManipulator in the [joint space]{: .popup}.  
  Set the joint angles. Then click the `SEND JOINT ANGLE` button. And set the gripper parameter. Then click the `SET GRIPPER` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_4.png)  

  The user can manipulate the OpenManipulator in the ([task space]{: .popup}). Click the `TASK SPACE CONTROL` button to change the tab.  
  Click the desired direction button to manipulate the OpenManipulator.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_5.png)

### [Hand guiding](#hand-guiding)

The user can make the demonstration using hand guiding function.  

  <iframe width="560" height="315" src="https://www.youtube.com/embed/9mE9QgAro8A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  1. Click the `HAND GUIDING` button to change the tab.
  2. Holds the OpenManipulator by hand and click the toggle button to `TORQUE OFF`.   
  3. Move the OpenManipulator to the desired pose by hand.
  4. Click the `SAVE JOINT POSE` to save the present pose.
  5. Repeat step 3 and 4 to create the demonstration.
  6. Click the toggle button to `TORQUE ON`
  7. Click the `MOTION START` button to start the saved poses.

  Click the toggle button to `MOTION REPEAT ON` if you want to repeat the demonstration.  
  The total time of the trajectory between saved poses is the same as 2 seconds.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_6.png)

## [Teleoperation RC100](#teleoperation-rc100)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  The settings for [ROBOTIS RC-100B][rc100] controller is included in the OpenCR firmware for OpenManipulator. This controller can be used with the Bluetooth module [BT410][bt410].    
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_teleop.png)



[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
