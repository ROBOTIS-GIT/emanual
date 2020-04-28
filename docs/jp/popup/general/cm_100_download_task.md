---
layout: popup
---
# CM-100 Task Code Download Guide

## Preparation

1. Please open a task code file(\*.tsk) to download from RoboPlus Task.
  - You can open it by double-clicking.
  - You can open it by using the **open a file** function of RoboPlus Task.
  - You can open it with drag & drop in the RoboPlus task.

2. Connect the contorller([CM-100]) with your PC by using a [USB Downloader(LN-101)].
3. Connect 2 double AA batteries then turn the power for the controller (CM-100) on.

  ![img_01][img_01]

## Download

1. Connect the controller before downloading the task code. To download the task code, the controller must be connected to the PC. (Please refer to controller information for information on how to connect the controller to the PC.)

2. Select the correct COM port (if you know) or else use the "Automatic Search" function  to easily find out the appropriate port.

    ![img_02][img_02]

    If RoboPlus Task is unable to find a controller, the following error message will be shown.

    ![img_03][img_03]

  - Check if the controller is connected to the PC.
  - Check if the controller is turned on.
  - Check if the correct communication port was chosen.

3. Select the download menu.

    ![img_04][img_04]

    If the program has an error, you must find the error and correct it. (See [rule check error messages])

4. Download the program.

    ![img_05][img_05]

    If the downloading fails, it will automatically try again from the beginning.

5. Execute the task code -> Your robot will move. Turn on the controller and execute the downloaded task code.

[img_01]: /assets/images/edu/task_download_01.jpg
[img_02]: /assets/images/edu/task_download_02.png
[img_03]: /assets/images/edu/task_download_03.png
[img_04]: /assets/images/edu/task_download_04.png
[img_05]: /assets/images/edu/task_download_05.png
[CM-100]: /docs/en/parts/controller/cm-100/
[USB Downloader(LN-101)]: /docs/en/parts/interface/ln-101/
