---
layout: archive
lang: en
ref: motion_programming
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/motion_programming/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 5
---

<div style="counter-reset: h1 5"></div>

# [Motion Programming](#motion-programming)

The motion file includes position data of each joint to move the robot, and the data structure of a motion file is described in the image below.

![](/assets/images/sw/rplus_task3/motion_construction.png)

1. Key-Frame  
It is a combination of pose and time on timeline, to express WHAT (pose) to show WHEN (time). For example, if a `Hello` pose is saved at the Key-Frame on 13 second in the timeline, the robot will start to move into the `Hello` pose as the timeline approaches 13 seconds.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_01.png)

2. Motion Unit  
It is a group of Key-Frames placed in the timeline to show a continuous movement.  
As seen on the image below the `Salute` motion unit has the `Salute Start` Key-Frame on 11.2 second, and `Salute End` Key-Frame on 13.2 second. The continuous movement (Motion Unit) will be a Salute motion.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_02.png)

3. Motion  
Motion is a group of Motion Units to express long movements, such a dancing motions.  
As seen in the image below, the `MartialArt` Motion is a link (group) of the Motion Units `MartialArtReady`, `MartialArt`, and `InitPose`.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_03.png)

4. Motion Group  
Users must select the specific Motions to download to the robot, while checking the available space on the robot.  
The list comprised of the selected Motions is called the **Motion Group**. The bar on the right displays the amount of space the Motion Group will take up on the robot’s controller.  
On the image below, the `main` Motion Group takes up 12.6% of the controller memory space.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_04.png)

5. 3D Robot  
The 3D robot is the simulator which motion data can be applied to. It is also active even when an actual robot is not connected, so users can easily check and playback the motion they are creating.  
Users are required to select a 3D robot when creating a motion file, and may also use the `Change 3D Robot` menu.  
The image below is an example showing the same motion data opened on different 3D robots.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_05.png)

## [Open Project](#open-project)

1. Click `Open` button in the home tab.  
  ![](/assets/images/sw/rplus_task3/motion_open_01.png)
2. Select the motion project file to open.  
3. Click `Open` button.  
  ![](/assets/images/sw/rplus_task3/motion_open_02.png)


## [Connect to Robot](#connect-to-robot)

1. Click the `Connect` button on the bottom.  
  ![](/assets/images/sw/rplus_task3/motion_port_01.png)

2. Select the port the robot is connected to, and click the `Connect` button.  
  ![](/assets/images/sw/rplus_task3/motion_port_02.png)  

3. If port is not detected, click `Refresh` button.  
  ![](/assets/images/sw/rplus_task3/motion_port_02_1.png)

4. When connection is successful, the port number and baud rate will be shown.  
  ![](/assets/images/sw/rplus_task3/motion_port_03.png)

## [Create New Motion Unit](#create-new-motion-unit)

Motion Unit is the link of poses placed on the timeline, to create a motion. The links between the poses are interpolated, like a fade in/out function.

1. Select the Motion Examples tab.  
  ![](/assets/images/sw/rplus_task3/motion_ex_01.png)

2. Select the desired product from the Product tab.   
  ![](/assets/images/sw/rplus_task3/motion_ex_02.png)

3. Click the Motion Unit list.  
  ![](/assets/images/sw/rplus_task3/motion_ex_03.png)

4. Name the new Motion Unit and click the “Apply” button.  
  ![](/assets/images/sw/rplus_task3/motion_ex_04.png)
  
5. Select the newly created Motion Unit and click the “Apply” button.  
  ![](/assets/images/sw/rplus_task3/motion_ex_05.png)

## [Edit Motion Unit](#edit-motion-unit)

### [Using 3D Robot](#using-3d-robot)

This section explains how to edit Motion Units when an actual robot is not available. Users will edit the 3D robot’s pose and save the pose on the timeline to create Motion Units.

1. Click anywhere on the timeline to select a time.  
2. Select joint ID 3.  
  ![](/assets/images/sw/rplus_task3/motion_ex_06.png)

3. Use the “Positioning” menu on the bottom right to rotate the selected joints. Try creating a pose by moving the robot’s arm joints.  
  ![](/assets/images/sw/rplus_task3/motion_ex_07.png)

4. Click the “Insert Key-Frame” button on the top right to insert the created pose on the timeline.  
  ![](/assets/images/sw/rplus_task3/motion_ex_08.png)

5. Again, click on another spot on the timeline and click the “Insert Key-Frame” button to insert the same pose again.  
  ![](/assets/images/sw/rplus_task3/motion_ex_09.png)

6. Then, change the 3D robot’s pose the click the “Save Key-Frame” (same button as Insert Key-Frame) to overwrite the previous pose.  
  ![](/assets/images/sw/rplus_task3/motion_ex_10.png)

7. Repeat step 1 through 6 to create a connected motion.  
  ![](/assets/images/sw/rplus_task3/motion_ex_10_1.png)  
  ![](/assets/images/sw/rplus_task3/motion_ex_10_2.png)  
  ![](/assets/images/sw/rplus_task3/motion_ex_10_3.png)  

8. Click the `Play` button on the toolbar to playback the created Motion Unit. The poses created will be played back in the order they were placed on the timeline.  
  ![](/assets/images/sw/rplus_task3/motion_ex_10_4.png)  


### [Using Actual Robot](#using-actual-robot)

This time, an actual robot will be used to edit a Motion Unit. Users will set the pose using the actual robot, and save the pose onto the timeline.

1. Click the `Connect` button on the bottom left to connect to the robot. ([Connect to Robot](#connect-to-robot))  
2. Create a new Motion Unit. ([Create New Motion Unit](#create-new-motion-unit))  
3. Select all the joints, and click on the `Torque Off` button to turn the actual robot’s torque off (`Ctrl` + `A` to select all joints)  
  ![](/assets/images/sw/rplus_task3/motion_sync_01.png)
4. Move the actual robot to create the pose to save, click `Torque On`, then click `Read Robot Pose` (the 3D robot will mimic the actual robot’s pose).  
  ![](/assets/images/sw/rplus_task3/motion_sync_03.png)  
  ![](/assets/images/sw/rplus_task3_kr/motion_sync_04.png)
5. Click anywhere on the timeline and click the `Insert Key-Frame` button to add the pose onto the timeline.  
  ![](/assets/images/sw/rplus_task3/motion_sync_05.png)  
6. Again, click on another spot on the timeline and click the `Insert Key-Frame` button to insert the same pose again.  
  ![](/assets/images/sw/rplus_task3/motion_sync_06.png)  
7. Click `Torque Off` to turn the actual robot’s torque off.  
  ![](/assets/images/sw/rplus_task3/motion_sync_08.png)  
8. Move the actual robot to create the pose to save, click `Torque On`, then click `Read Robot Pose`.  
  ![](/assets/images/sw/rplus_task3/motion_sync_09.png)  
  ![](/assets/images/sw/rplus_task3_kr/motion_sync_10.png)  
9. Click the `Save Key-Frame` button to overwrite the second pose with the new pose.
10. Click the `Sync Mode` button on the bottom to activate it. (When activated, the 3D robot’s pose is automatically inputted to the actual robot)
11. Click the `Play` button on the toolbar to playback the created Motion Unit. The poses created will be played back in the order they were placed on the timeline.

## [Create New Motion](#create-new-motion)

Motion is a set of Motion Units linked together. Users can also change the number of repetitions for each Motion Unit or set the playback speed to efficiently create long dance motions.  
In order to use a motion in a Task code, a Motion (set of Motion Units) must be created.

1. Move to the Motion tab, and click on the list on the toolbar.

    ![](/assets/images/sw/rplus_task3/motion_new_01.png)

2. Click the `New Motion` button on the list.
3. Enter a name for the new Motion and click the `Apply` button.

    ![](/assets/images/sw/rplus_task3/motion_new_02.png)

4. Select the newly created Motion and click on the `Apply` button.

    ![](/assets/images/sw/rplus_task3/motion_new_03.png)

## [Edit Motion](#edit-motion)

This section will describe how to insert the Motion Units in an empty Motion, and how to edit the playback parameters.

1. Click on the `Insert Motion Unit` button on the top right.

    ![](/assets/images/sw/rplus_task3/motion_edit_01.png)  

2. Select the Motion Unit to insert and click on the `Play Parameters` tab.

    ![](/assets/images/sw/rplus_task3/motion_edit_02.png)

3. In the Play Parameters tab, users can edit the Motion Unit’s playback speed, repetition number, and Index Number. For now, don’t change any setting and just click `Apply`.

    ![](/assets/images/sw/rplus_task3/motion_edit_03.png)

4. Check the Motion Unit that is inserted and click the `Play` button to check the Motion.

    ![](/assets/images/sw/rplus_task3/motion_edit_04.png)

5. Double-click on the inserted Motion Unit to change it into a different Motion Unit, or change the Play Parameters.
6. Double-click on the `Green Arrow` to insert another Motion Unit to be played back after the current Motion Unit.
7. Double-click on the `Red Arrow` to insert a Motion Unit to be played where there is an interruption.

    ![](/assets/images/sw/rplus_task3/motion_edit_05.png)

8. Double-Click on the `Green Arrow` and insert the `InitPose` Motion Unit.

    ![](/assets/images/sw/rplus_task3/motion_edit_06.png)

9. Let’s playback the completed Motion.

    ![](/assets/images/sw/rplus_task3/motion_edit_07.png)

## [Create New Motion Group](#create-new-motion-group)

The Motion Group must be created to download motions onto the robot. The Motion Group is a group of selected Motions to be downloaded on the robot.

1. Move to the `Motion Download` tab and click on the `New Motion Group` button.

    ![](/assets/images/sw/rplus_task3/motion_group_01.png)

2. Enter the name for the new Motion Group and click `Apply`.

    ![](/assets/images/sw/rplus_task3/motion_group_02.png)

3. Out of the Motion Candidate List, select the Motions to be inserted into the new Motion Group, and click on the `Add Motion` button.  
    The bar on the right will update in real-time to display the storage space status. Click `Apply` to create the Motion Group.

    ![](/assets/images/sw/rplus_task3/motion_group_03.png)

## [Download Motion](#download-motion)

1. Out of the list of Motion Groups, select the Motion Group to download onto the robot. Please make sure to check that the Motion Group size doesn’t exceed the space available on the robot.

    ![](/assets/images/sw/rplus_task3/motion_download_01.png)

2. Click on the `Motion Group Download` button the download onto the robot. The download progress will be shown on the center of the screen.

    ![](/assets/images/sw/rplus_task3/motion_download_02.png)

### [Download Precautions](#download-precautions)

Motions in the motion project can be selected grouped into a motion group, and one of the motion groups can be downloaded to the controller.

![](/assets/images/sw/rplus_task3/motion_download_03.png)

The memory gauge on the right shows expected memory usage of selected motion group.  
Motions in the motion group will be assigned with numbers and this number can be used to call a specific motion from the task code.

**CAUTION** If a motion is played with the actual robot while editing motion and motion units, previously downloaded motion data will be erased from the controller.
{: .notice--warning}

## [Save Motion](#save-motion)

After completing motion edit, click the save icon on the top right corner or use `Ctrl` + `S` shortcut to save.

![](/assets/images/sw/rplus_task3/motion_save.png)  
