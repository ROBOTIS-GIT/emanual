---
layout: archive
lang: en
ref: mmotion
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus_mobile/mmotion/
sidebar:
  title: R+ m.Motion
  nav: "rplusmmotion"
---

# [Getting Started](#getting-started)

- [Downlaod Android App](https://play.google.com/store/apps/details?id=com.robotis.motion)
  - Minimum System Requirements
    - Android 2.3 or higher
    - Hardware : 1.2GHz dual-core CPU, 1GB RAM, Bluetooth
  - Supports : BT-410 (Android 4.4 or higher), BT-210, BT-110

- [Download iOS APP](https://itunes.apple.com/kr/app/r%2b-m.motion/id955358210?mt=8)
  - Minimum System Requirements
    - iOS 8.0 or higher
    - Hardware : iPhone 4S, iPod 5G, iPad mini, iPad 2 or higher
  - Supports : BT-410

## Menu Description

![](/assets/images/sw/mobile/mobile_motion_01.gif)

1. Editing tab per step
2. Connection status of robot
3. Menu bar
4. Workspace

![](/assets/images/sw/mobile/mobile_motion_02.gif) 

1. 3D robot viewer
2. Timeline (motion unit)
3. Timeline menu bar
4. Pose table
5. Pose menu bar

![](/assets/images/sw/mobile/mobile_motion_03.gif) 

1. 3D robot viewer
2. Flow chart (motion)
3. Flow chart menu bar

# [Practice](#practice)

## [Connect to Robot](#connect-to-robot)

![](/assets/images/sw/mobile/mobile_motion_04.gif)

> Click the connect button to open the connection window.

![](/assets/images/sw/mobile/mobile_motion_05.gif)
 
1. Enter the last 2 digits (number/letter) of the Bluetooth to search for.
2. Click the `OK` button.

![](/assets/images/sw/mobile/mobile_motion_06.gif)

1. Click on the “Refresh” button.
2. Click on the robot’s Bluetooth address.
3. Click the “Connect” button

![](/assets/images/sw/mobile/mobile_motion_07.gif)
 
1. Enter 0000 for the PIN code.
2. Proceed with the connection (This process is skipped if the Bluetooth device is already connected).

![](/assets/images/sw/mobile/mobile_motion_08.gif)

> Wait while the smart device connects with the robot.

![](/assets/images/sw/mobile/mobile_motion_09.gif)
 
> The connection status lights up when connection is successful.

## [Open Project](#open-project)

![](/assets/images/sw/mobile/mobile_motion_10.gif)

1. Go to the Home tab.
2. Click the open button on the tool bar to open a project.

![](/assets/images/sw/mobile/mobile_motion_11.gif)
 
1. Select a motion file saved in the smart device.
2. Click the OK button to proceed.

![](/assets/images/sw/mobile/mobile_motion_12.gif)

> Wait while the project opens.

## [Motion Playback](#motion-playback)

![](/assets/images/sw/mobile/mobile_motion_13.gif)

1. Go to the Motion Unit tab
2. Click on the Motion Unit menu

![](/assets/images/sw/mobile/mobile_motion_14.gif)
 
1. Select a Motion Unit to playback.
2. Click OK

![](/assets/images/sw/mobile/mobile_motion_15.jpg)
 
> Click on the play button on the top

![](/assets/images/sw/mobile/mobile_motion_16.jpg)
 
> Check the 3D robot to see whether the selected motion unit performs well.

![](/assets/images/sw/mobile/mobile_motion_17.jpg)
 
1. Click on the “Sync Mode” button.
2. Play the Motion Unit to see if the 3D robot and the real robot perform well.

## [Motion Editing](#motion-editing)

![](/assets/images/sw/mobile/mobile_motion_18.jpg)

1. Click on the Motion Unit list.
2. Click on the “New Motion“ button.

![](/assets/images/sw/mobile/mobile_motion_19.gif)

1. Enter the name of the new Motion Unit
2. Click the OK button to create a new and empty motion unit.

![](/assets/images/sw/mobile/mobile_motion_20.gif)

1. Select the newly created Motion file.
2. Clicking the OK button will close the list.

![](/assets/images/sw/mobile/mobile_motion_21.gif)

1. Click on the 3D robot’s joint to select the target for adjustment.
2. You may click on additional joints for multi-selecting the joints.
3. Click on the Torque OFF button to disable the torque on the motors.

![](/assets/images/sw/mobile/mobile_motion_22.jpg)

> Use your hand to move the joints with the disabled torque.

![](/assets/images/sw/mobile/mobile_motion_23.gif)

1. Push the torque ON button
2. The 3D model will now mimic the pose of the actual robot.

![](/assets/images/sw/mobile/mobile_motion_24.gif)

1. Drag the timeline cursor to the 25th frame.
2. Click the button to insert a key frame. (This process will save the robot’s pose on the 25th frame.)

![](/assets/images/sw/mobile/mobile_motion_25.gif)

1. Move to the 51st frame on the timeline.
2. Turn off the torque.

![](/assets/images/sw/mobile/mobile_motion_26.jpg)

> Make a pose by moving the motors with the torque off.

![](/assets/images/sw/mobile/mobile_motion_27.jpg)

1. Click the button to turn the torque on.
2. The 3D model will now mimic the pose of the real robot.
3. Click the insert button to save the pose as the 51st key frame.

![](/assets/images/sw/mobile/mobile_motion_28.jpg)

1. Repeating the same process, save new poses (key frames) on the 0.6 sec., 0.8 sec., and 1 sec. position.

![](/assets/images/sw/mobile/mobile_motion_29.jpg)

1. Click the sync mode button.
2. Play the motion unit to see if the robot performs the motion well.

## [Motion Download](#motion-download)

![](/assets/images/sw/mobile/mobile_motion_35.gif)

1. Move to the motion download tab.
2. Click the “New Motion Group” button to create a new motion group.

![](/assets/images/sw/mobile/mobile_motion_36.jpg)
 
1. Enter the name of the new motion group to be created.
2. Click the OK button.

![](/assets/images/sw/mobile/mobile_motion_37.jpg)
 
1. Select the motions to be added on the motion group list.
2. Click the “Add Motion” button.
3. The memory is calculated based on the motions that are added from steps 1~2.
4. Click the OK button once completed.

![](/assets/images/sw/mobile/mobile_motion_38.jpg)
 
1. Select the motion group that was just created.
2. Click the “Download Motion Group” button.

![](/assets/images/sw/mobile/mobile_motion_39.jpg)

> Stand by while the motion group is being downloaded.

## [Save Motion Project](#save-motion-project)

![](/assets/images/sw/mobile/mobile_motion_40.gif)

1. Move to the Home tab.
2. Click the “Save As” button.

![](/assets/images/sw/mobile/mobile_motion_41.jpg)
 
1. Enter the name of the project file to save.
2. Click the OK button.

![](/assets/images/sw/mobile/mobile_motion_42.gif)
 
1. Check the log message.
2. The saved motion file’s name is displayed on the top left corner.

# [FAQ](#faq)

1. Which products are supported?
  > PREMIUM, STEM, SMART, ROBOTIS MINI, and other products with CM-200, CM-530, OpenCM9.04C, AX series, MX series, and XL-320.
 
2. Which 3D models are supported?
  > Out of the supported products, all robot examples that use Motion.
 
3. Can more 3D models or motors be added apart from the ones provided?
  > Users can add in more motors (the motor will be added just on the screen, not specifically onto the robot).
  > Planned to support 3D created models from R+ Design to be imported into R+ Motion.

4. Can the MTN file be converted to an MTNX file?
  > Yes, the motion data can be converted, but the 3D model is not supported (will be supported later).
 
5. Can the MTNX file be converted to an MTN file?
  > No, and there is no plan to support it.
 
6. The Motion file won’t play properly after editing it.
  > After editing, you must download the motion group again.
 
7. The controller won’t connect properly.
  > Please try turning OFF the controller then ON again. If you’re using CM-200, try turning it OFF, hold the power button for 2~3 sec. to stop the task, then try again.
