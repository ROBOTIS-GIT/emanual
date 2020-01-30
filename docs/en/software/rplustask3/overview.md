---
layout: archive
lang: en
ref: overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 1
---

# [Introduction](#introduction)

![](/assets/images/sw/rplus_task3/task3_001.png)

R+ Task 3.0 is an integrated software tool that combines R+ Task 2.0 and R+ Motion 2.0.

- **TASK**  
In computer science, a task generally means a set of relevant activities to complete the work at hand. In RoboPlus terms, a task code is a source code programmed for a robot to complete a task.  
A robot operates according to the task code created by the user, and the RoboPlus Task is a program that helps the user to write task code easily. Task code has different file extensions based on RoboPlus software version. Please see below table.

| Software Version | Task File Extension |
|:----------------:|:-------------------:|
|  RoboPlus Task   |         tsk         |
|   R+ Task 2.0    |        tskx         |
|   R+ Task 3.0    |        tsk3         |

The Task files are not backward compatible, but lower version files can be converted to tsk3 with R+ Task 3.0.

- **MOTION**  
Motion is a necessary set of position and speed data for DYNAMIXEL, which eventually becomes a valid movement for a robot.  
In order to make the robot move, the correct Motion project file must exist for the robot. Motion project file has different file extensions based on RoboPlus software version. Please see below table.

| Software Version | Motion File Extension |
|:----------------:|:---------------------:|
| RoboPlus Motion  |          mtn          |
|  R+ Motion 2.0   |         mtnx          |
|   R+ Task 3.0    |         mtn3          |

The Motion files are not backward compatible, but lower version files can be converted to mtn3 with R+ Task 3.0.

## [Compatible Controllers](#compatible-controllers)

- [CM-5]
- [CM-50]
- [CM-100]
- [CM-150]
- [CM-200]
- [CM-510]
- [CM-530]
- [CM-550]
- [CM-700]
- [OpenCM7.0]
- [OpenCM9.04]

**[Controller Compatibility Table]**
{: .notice}

# [Getting Started](#getting-started)

## [Software Download](#software-download)

- [R+Task 3.0 Windows Installer](http://www.robotis.com/service/download.php?no=1774)
- [R+Task 3.0 Android App](https://play.google.com/store/apps/details?id=com.robotis.task3)

## [Menu Descriptions](#menu-descriptions)

1. Home Tab  
  The following image is the initial screen at start up, which includes default examples, file and settings menu.

    ![](/assets/images/sw/rplus_task3/task3_002.png)

2. Programming Tab  
  The following image shows the task code programming screen, which provides programming toolbar, source view, outline menu, device and download menu.

    ![](/assets/images/sw/rplus_task3/task3_003.png)

3. Debugging Tab  
  The following image shows task code debugging screen, which provides the output monitor and virtual remote controller functions.

    ![](/assets/images/sw/rplus_task3/task3_004.png)

4. Motion Unit Tab  
  User can select the example motion or create custom motion in User Robot Project.

    ![](/assets/images/sw/rplus_task3/task3_002.png)  
    ![](/assets/images/sw/rplus_task3/task3_005.png)

5. Motion Tab  
  User can select motion units play them.

    ![](/assets/images/sw/rplus_task3/task3_006.png)

6. Motion Download Tab  
  Selected motions can be downloaded to the controllers in this tab.

    ![](/assets/images/sw/rplus_task3/task3_007.png)


[Controller Compatibility Table]: /docs/en/parts/controller/controller_compatibility/
[CM-50]: /docs/en/parts/controller/cm-100/
[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-5]: /docs/en/parts/controller/cm-5/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[CM-700]: /docs/en/parts/controller/cm-700/
[OpenCM7.0]: /docs/en/parts/controller/opencm7/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
