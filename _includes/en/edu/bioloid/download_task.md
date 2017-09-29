If you want to use RoboPlus program for [CM-5] (the controller used for Bioloid Beginner/Comprehensive Kits), you must update the firmware. Please refer to [Firmware Update] of RoboPlus Manager on how to update firmware.

### Preparation

1. Call the task code(*.tsk) from RoboPlus Task.
  - You can open it by double-clicking the task code file.
  - You can open it using Open File function of RoboPlus Task.
  - You can open it by dragging & dropping on RoboPlus Task.
2. Connect the PC and the Controller with [USB2Dynamixel].
3. Turn on the power of the controller.

![CM-5_to_PC-01](/assets/images/parts/controller/cm-5/cm_5_connect_pc_01.png)

### Download

1. Connect the controller before downloading the task code.
  To download the task code, the controller must be connected to the PC(Please refer to controller information for information on how to connect the controller to the PC).

2. Select the correct COM port (if you know) or else use the "Automatic Search" function  to easily find out the appropriate port. .

  ![CM-5_to_PC-02](/assets/images/parts/controller/cm-5/cm_5_connect_pc_02.png)

  If RoboPlus Task is unable to find a controller, the following error message will be shown.
  - Check if the controller is connected to the PC. (See controller information on how to connect the controller.)
  - Check if the controller is turned on.
  - Check if the correct communication port was chosen.

3. Select the download menu.

  ![CM-5_to_PC-03](/assets/images/parts/controller/cm-5/cm_5_connect_pc_03.png)

  If the program has an error, you must find the error and correct it. (See "rule check error messages")

4. Download the program.

  ![CM-5_to_PC-04](/assets/images/parts/controller/cm-5/cm_5_connect_pc_04.png)

  If the downloading fails, it will automatically try again from the beginning.

5. Execute the task code and your robot will move.
  Turn on the controller and execute the downloaded task code(Please refer to each controller information to learn how to execute the task code).

[CM-5]: /docs/en/parts/controller/cm-5/
[Firmware Update]: ???
[USB2Dynamixel]: /docs/en/parts/interface/usb2dynamixel/
