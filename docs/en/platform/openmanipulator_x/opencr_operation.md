---
layout: archive
lang: en
ref: openmanipulator_x_opencr_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/opencr_operation/
sidebar:
  title: OpenManipulator-X
  nav: "openmanipulator_x"
---

<div style="counter-reset: h1 10"></div>

# [[OpenCR] Operation](#opencr-operation)

## [Upload Controller Program](#upload-controller-program)

Find example source codes.

Go to `Examples` > `OpenManipulator` > `example` > `Chain` > `open_manipulator_chain` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_arduino.png)

Upload the example source to OpenCR.

![](/assets/images/platform/openmanipulator_x/upload_chain_example.png)

When the upload is completed, the following comments are displayed in the log window.

![](/assets/images/parts/controller/opencr10/downloader_01.png)

{% capture openmanipulator_configuration %}
**WARNING** : Please refer to below default DYNAMIXEL configuration for OpenManipulator-X chain if you have a custom manipulator.

|  Joint  | ID | Baudrate |
|:-------:|:--:|:--------:|
|    1    | 11 |  1 Mbps  |
|    2    | 12 |  1 Mbps  |
|    3    | 13 |  1 Mbps  |
|    4    | 14 |  1 Mbps  |
| Gripper | 15 |  1 Mbps  |

{% endcapture %}
<div class="notice--warning">{{ openmanipulator_configuration | markdownify }}</div>

**TIP** : If an error of `cmd_read_board_name fail: 0xF020` occurs constantly during upload, please refer to [OpenCR e-Manual] to enter the firmware recovery mode and upload the source code again after entering mode.
{: .notice--success}

## [Setup Processing(GUI)](#setup-processinggui)

1. Download Processing from blow link and install.

    - **Download Processing** : [https://processing.org/download/](https://processing.org/download/)

2. Launch Processing and go to `Tools` > `Add Tool..`.

    ![](/assets/images/platform/openmanipulator_x/processing_add_tools.png)

3. Search for `ControlP5` and install it.

    ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_1.png)

4. Download processing source code for OpenManipulator.

    ```bash
    $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_processing.git
    ```


### [Launch Processing(GUI)](#launch-processinggui)

**WARNING** : OpenCR1.0 must be connected to OpenMANIPULATOR-X before launching Processing.
Press `Reset Button` of OpenCR1.0 to enable torque for OpenMANIPULATOR-X.
{: .notice--warning}

1. Connect USB cable and power supply to OpenCR1.0.

2. Turn on the OpenCR1.0 switch.

3. Press `Reset Button` of OpenCR1.0 and check DYNAMIXELs of OpenMANIPULATOR-X are torque enabled.

4. Search downloaded processing file from **Folder where you downloaded the source code** > `open_manipulator_processing` > `Chain` > `Chain.pde` and open it on Processing IDE.

    **NOTE**: Upload **OpenCR OpenManipulator example** to OpenCR before running **Processing example**.
    {: .notice--info}

    ![](/assets/images/platform/openmanipulator_x/processing_open1.png)

    ![](/assets/images/platform/openmanipulator_x/processing_open2.png)

    ![](/assets/images/platform/openmanipulator_x/processing_run.png)

5. Run the processing source code, and the following graphical GUI will be displayed.

    ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_2.png)

{% capture notice_01 %}
**Tip**: If the processing console displays an error message and the GUI does not run normally, check the following:
- Check if ControlP5 is properly installed.
- Check if the graphics driver is installed properly.
- Check if the Java library is properly installed.

If you have checked the above and it does not work normally, I recommend running it in a different OS environment (Windows, mac, linux).
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

### [Control Interface](##control-interface)

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

The user can use processing program to manipulate the OpenManipulator.
 To manipulate the OpenManipulator, click the toggle button to `CONTROLLER ON`.   
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_3.png)


  The user can manipulate the OpenManipulator-X in the [joint space]{: .popup}.
  Set the joint angles. Then click the `SEND JOINT ANGLE` button. And set the gripper parameter. Then click the `SET GRIPPER` button.
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_4.png)

  The user can manipulate the OpenManipulator-X in the [task space]{: .popup}. Click the `TASK SPACE CONTROL` button to change the tab.
  Click the desired direction button to manipulate the OpenManipulator.

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_5.png)

### [Hand guiding](#hand-guiding)

The user can make the demonstration using hand guiding function.

  <iframe width="560" height="315" src="https://www.youtube.com/embed/9mE9QgAro8A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  1. Click the `HAND GUIDING` button to change the tab.
  2. Holds the OpenManipulator-X by hand and click the toggle button to `TORQUE OFF`.
  3. Move the OpenManipulator-X to the desired pose by hand.
  4. Click the `SAVE JOINT POSE` to save the present pose.
  5. Repeat step 3 and 4 to create the demonstration.
  6. Click the toggle button to `TORQUE ON`
  7. Click the `MOTION START` button to start the saved poses.

  Click the toggle button to `MOTION REPEAT ON` if you want to repeat the demonstration.
  The total time of the trajectory between saved poses is the same as 2 seconds.         
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_6.png)

## [Teleoperation RC100](#teleoperation-rc100)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  The settings for [ROBOTIS RC-100B] controller is included in the OpenCR firmware for OpenManipulator. This controller can be used with the Bluetooth module [BT410].
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_chain_processing_teleop.png)



[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR e-Manual]: /docs/en/parts/controller/opencr10/#firmware-recovery-mode
[ROBOTIS RC-100B]: /docs/en/parts/communication/rc-100/
[BT410]: /docs/en/parts/communication/bt-410/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
