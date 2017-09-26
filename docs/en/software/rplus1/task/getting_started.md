---
layout: archive
lang: en
ref: rplus1_task_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus1/task/getting_started/
sidebar:
  title: R+ Task 1.0
  nav: "rplustask1"
---

# [Introduction](#introduction)

A `Task` is a set of motions to perform a certain actions. RoboPlus refers to the source code that specifies tasks to be executed by the robot as `Task Code`. The robot moves according to your task codes. `RoboPlus Task` is a software to make writing these task codes easier.

Task code files have a file extension _.tsk_, and the icon shown on the left.

`Note` Task files from newer versions are not compatible with older versions.
{: .notice}

![R+Task][R+task]

## [Install](#install)

`Download` [RoboPlus Task]
{: .notice--download}

RoboPlus is a software to create a customized programme for every ROBOTIS product.

### RoboPlus System Requirements
+ OS : Windows XP Service Pack 2 or above / Vista/ 7 (32/64bit)/8 (32/64bit)
+ 32bit(x86) or 64bit (x64) processor with over 800MHz
+ Graphic card with 3D acceleration
+ System memory over 512MB
+ Hard disk with the extra space of 500MB

![img_install][img_install]

`Note` To execute RoboPlus, .NET FrameWork 3.5 or higher version is required. When installing RoboPlus, if the automatic installation of .NET FrameWork fails, .NET FrameWork must be installed separately.
{: .notice}

### RoboPlus Install Failure

Most reason for installation failure is caused by .NET Framework install error. Please manually intsall Windows Installer 3.1 and .NET Framework 3.5

Windows installer and .NET Framework can be downloaded from [Microsoft Download Center].

`Download` [Windows installer 3.1], [.NET Framework 3.5]
{: .notice--download}


# [Getting Started](#getting-started)

## [Select Command](#select-command)

Double click on a blank line or click on the line and press enter.  Choose a command from the list of commands supported by the selected controller.

![select command][select-command]

 If the controller has not been selected yet, the program will ask you to choose the type of controller that will be used by the current program.

![select controller][select-controller]

## [Select Parameter](#select-parameter)

`Parameter` refers required fields or information  to execute commands. A question mark(?) indicates that a parameter has not been set.

![parameter][param]

After selecting a command, you must designate a parameter to complete the command line.

  1. Go to 'edit mode' by double clicking the mouse or pressing the enter key.
    ![edit][edit]

  2. Choose the parameter to create by pressing left/right arrow keys or by clicking on the question mark.
    ![select][select]

  3. Press enter or double click to see the parameter selection window.
    ![select-window][select-window]

  4. Choose the appropriate parameter. It is very important to learn and understand the functions of parameter.

## [Program Download](#program-download)

Download the task codes into your controller. You only have to download once, as the task codes is be saved inside of controller till you download a new task code over it.

1. Connect the controller before downloading the task code.
To download the task code, the controller must be connected to the PC. (Please refer to [controller information] on how to connect the controller to the PC.)

2. Select the correct COM port (if you know) or else use the `Automatic Search` function  to easily find out the appropriate port.

    ![port-select][port-select]

    If RoboPlus Task is unable to find a controller, the following error message will be shown.

    ![error-message][error-message]

    - Check if the controller is connected to the PC.
    - Check if the controller is turned on.
    - Check if the correct communication port was chosen.

3. If the program has an error, you must find the error and correct it. (See [rule check error messages])

    ![select download][download]

4. Select the download menu. If the downloading fails, it will automatically try again from the beginning.

    ![proceed download][download-run]

5. Execute the task code -> Your robot will move. Turn on the controller and execute the downloaded task code. (Please refer to [controller information] to learn how to execute the task code.)

### [Videos](#videos)

1. Download RoboPlus Program(for CM-100)

    <iframe width="560" height="315" src="https://www.youtube.com/embed/3mDP9BW-Q0E" frameborder="0" allowfullscreen></iframe>

2. Download RoboPlus Program(for CM-510/530)

    <iframe width="560" height="315" src="https://www.youtube.com/embed/dHCqPs1_2yY" frameborder="0" allowfullscreen></iframe>


## [Print on the Screen](#print-on-the-screen)

Controllers usually do not have display devices the way a PC has a monitor, so it is hard to keep track of what goes on in a controller.  Therefore, a "terminal" is used to "borrow" the PC's monitor.

![terminal][terminal]


### Open the Program Output Monitor

To see the output of the program, you must open the Program Output Monitor BEFORE executing the program. There are three ways to open the `Program Output Monitor`.

1. Click the 'View Print of Program' on the Download Program window.
  ![output-monitor][output-monitor]

2. Click the `View Print of Program` button in the tool bar.
3. Press `F5` or click on `View Print of Program(V)` menu under Program(P).


### Print/Print with Carriage Return

Use the "Print" parameter in your task code to see desired values on the screen.

![task code][code]

Print : Print the value, then move the cursor to next line.

![print][print]

Print with New Line: Print out the value, and move the cursor to next line.

![newline][newline]

### Error : Please check the following

1. Values from the controller
    - A welcome screen is shown when the program starts
      ![start-message][start-message]

    - Error messages during program operation([Error Messages])
      ![error-code][error-code]

2. Values from task code : All decimal numbers between -32767 and +32767 can be displayed(Printing characters or custom messages is not possible).

    - To print numbers
      ![print-num][print-num]

    - To print values from sensors
      ![print-sensor][print-sensor]

### Clear Screen

You may erase everything on the screen.
![clear-screen][clear-screen]


## [Virtual Robot Control](#virtual-robot-control)

RoboPlus Task supports virtual robot control, which makes controlling of robot possible without a remote controller devices like RC-100. Click the appropriate button with the mouse or press the appropriate key.

![virtual-rc100][virtual-rc100]

Please refer to the table below to control the remote control with the  keyboard.

|Actual RC-100 Key|Key on the Keyboard|
| :---: | :---: |
|U|Arrow Key(↑)|
|D|Arrow Key(↓)|
|L|Arrow Key(←)|
|R|Arrow Key(→)|
|1|Number Key(1)|
|2|Number Key(2)|
|3|Number Key(3)|
|4|Number Key(4)|
|5|Number Key(5)|
|6|Number Key(6)|

[RoboPlus Task]: http://en.robotis.com/BlueAD/board.php?bbs_id=downloads
[Microsoft Download Center]: http://www.microsoft.com/downloads/Search.aspx?displaylang=ko
[Windows installer 3.1]: http://www.microsoft.com/downloads/details.aspx?FamilyID=889482fc-5f56-4a38-b838-de776fd4138c&DisplayLang=ko
[.NET Framework 3.5]: http://www.microsoft.com/downloads/details.aspx?FamilyID=d0e5dea7-ac26-4ad7-b68c-fe5076bba986&DisplayLang=ko
[controller information]: /docs/en/faq/controller_compatibility/
[rule check error messages]: /docs/en/software/rplus1/task/task_misc/#rule-check
[Error Messages]: /docs/en/software/rplus1/task/task_misc/#error-messages
[R+task]: /assets/images/sw/rplus1/task/roboplus_task_en_001.png
[img_install]: /assets/images/sw/roboplus_install_en.png
[select-command]: /assets/images/sw/rplus1/task/roboplus_task_en_002.png
[select-controller]: /assets/images/sw/rplus1/task/roboplus_task_en_003.png
[param]: /assets/images/sw/rplus1/task/roboplus_task_004.png
[edit]: /assets/images/sw/rplus1/task/roboplus_task_005.png
[select]: /assets/images/sw/rplus1/task/roboplus_task_006.png
[select-window]: /assets/images/sw/rplus1/task/roboplus_task_en_007.png
[port-select]: /assets/images/sw/rplus1/task/roboplus_task_en_008.png
[error-message]: /assets/images/sw/rplus1/task/roboplus_task_en_009.png
[download]: /assets/images/sw/rplus1/task/roboplus_task_en_010.png
[download-run]: /assets/images/sw/rplus1/task/roboplus_task_en_011.png
[terminal]: /assets/images/sw/rplus1/task/roboplus_task_en_012.png
[output-monitor]: /assets/images/sw/rplus1/task/roboplus_task_en_013.png
[monitor-btn]: /assets/images/sw/rplus1/task/monitor_btn.png
[code]: /assets/images/sw/rplus1/task/roboplus_task_en_014.png
[print]: /assets/images/sw/rplus1/task/roboplus_task_en_015.png
[newline]: /assets/images/sw/rplus1/task/roboplus_task_en_016.png
[start-message]: /assets/images/sw/rplus1/task/roboplus_task_en_017.png
[error-code]: /assets/images/sw/rplus1/task/roboplus_task_en_018.png
[print-num]: /assets/images/sw/rplus1/task/roboplus_task_en_019.png
[print-sensor]: /assets/images/sw/rplus1/task/roboplus_task_en_020.png
[clear-screen]: /assets/images/sw/rplus1/task/roboplus_task_en_021.png
[virtual-rc100]: /assets/images/sw/rplus1/task/virtual_rc100_en.png
