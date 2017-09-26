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

# [Preparation](#preparation)
1. Please open a task code file(*.tsk) to download from RoboPlus Task.
  - You can open it by double-clicking.
  - You can open it by using an 'open a file' function of RoboPlus Task.
  - You can open it by dragging & dropping  it to  the RoboPlus task with mouse.

2. Connect the contorller([CM-100]) with your PC by using a [USB Downloader(LN-101)].
3. Connect 2 double AA batteries then turn the power for the controller (CM-100) on.

  ![img_01][img_01]

# [Download](#download)

1. Connect the controller before downloading the task code. To download the task code, the controller must be connected to the PC. (Please refer to controller information for information on how to connect the controller to the PC.)

2. Select the correct COM port (if you know) or else use the "Automatic Search" function  to easily find out the appropriate port. .

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

# [Videos](#videos)

## Download RoboPlus Program (for CM-100)

<iframe width="560" height="315" src="https://www.youtube.com/embed/3mDP9BW-Q0E" frameborder="0" allowfullscreen></iframe>

## setting up the port

<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>

[CM-100]: /docs/en/parts/controller/cm_100/
[USB Downloader(LN-101)]: /docs/en/parts/interface/ln_101/
[rule check error messages]: /docs/en/software/rplus1/task/task_misc/#rule-check

[img_01]: /assets/images/edu/task_download_01.jpg
[img_02]: /assets/images/edu/task_download_02.png
[img_03]: /assets/images/edu/task_download_03.png
[img_04]: /assets/images/edu/task_download_04.png
[img_05]: /assets/images/edu/task_download_05.png
