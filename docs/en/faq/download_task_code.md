---
layout: archive
lang: en
ref: download_task_code
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/download_task_code/
sidebar:
  title: Download Task Code
  nav: "download_task_code"
---

# [Download Task Code](#download-task-code)

## [CM-5](#cm-5)

{% include en/edu/bioloid/download_task.md %}

## [CM-100](#cm-100)

### Preparation
1. Please open a task code file(\*.tsk) to download from RoboPlus Task.
  - You can open it by double-clicking.
  - You can open it by using the **open a file** function of RoboPlus Task.
  - You can open it with drag & drop in the RoboPlus task.

2. Connect the contorller([CM-100]) with your PC by using a [USB Downloader(LN-101)].
3. Connect 2 double AA batteries then turn the power for the controller (CM-100) on.

  ![img_01][img_01]

### Download

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

## [CM-150](#cm-150)

### Preparation
1. R+Task 2.0 software must be installed on the PC.  
   [R+Task 2.0 Download]

2. Open the Task Code file(\*.tsk) from R+Task 2.0.

3. Connect the battery(LBS-041) to the controller(CM-150) and turn on the controller.

4. Connect the controller(CM-150) and the PC using a micro USB cable.

  ![tcdown0][tcdown0]

### Download
1. Check if PC and the controller are connected with a micro USB cable.

2. Check if the Controller(CM-150) is powered on.

3. Select Device `1` as shown below.

    ![tcdown_en1][tcdown_en1]

4. Select discovered device `2` from the list and click `3` confirm button.
  - If the device does not appear in the list, check step 1 and 2.

    ![tcdown_en2][tcdown_en2]

5. Select Download `4` as shown below.

    ![tcdown_en3][tcdown_en3]

6. When task code download is completed, a success message will appear.

    ![tcdown_en4][tcdown_en4]

    ![tcdown_en5][tcdown_en5]


# [Videos](#videos)

## Download RoboPlus Program (for CM-100)

<iframe width="560" height="315" src="https://www.youtube.com/embed/3mDP9BW-Q0E" frameborder="0" allowfullscreen></iframe>

## Setting Up the Port

<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>

[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[USB Downloader(LN-101)]: /docs/en/parts/interface/ln-101/
[rule check error messages]:/docs/en/software/rplus1/task/task_misc/#rule-check
[R+Task 2.0 Download]: http://en.robotis.com/service/downloadpage.php?ca_id=10

[img_01]: /assets/images/edu/task_download_01.jpg
[img_02]: /assets/images/edu/task_download_02.png
[img_03]: /assets/images/edu/task_download_03.png
[img_04]: /assets/images/edu/task_download_04.png
[img_05]: /assets/images/edu/task_download_05.png
[tcdown0]: /assets/images/faq/tcdown0.jpg
[tcdown_en1]: /assets/images/faq/tcdown_en1.jpg
[tcdown_en2]: /assets/images/faq/tcdown_en2.jpg
[tcdown_en3]: /assets/images/faq/tcdown_en3.jpg
[tcdown_en4]: /assets/images/faq/tcdown_en4.jpg
[tcdown_en5]: /assets/images/faq/tcdown_en5.jpg
