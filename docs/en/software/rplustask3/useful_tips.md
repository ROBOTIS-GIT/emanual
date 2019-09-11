---
layout: archive
lang: en
ref: useful_tips
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/useful_tips/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 6
---

<div style="counter-reset: h1 6"></div>

# [Useful Tips](#useful-tips)

## [Search Variables/Functions](#search-variablesfunctions)

This is a feature to find the location where a variable or function has been used. It provides the option to change the name of each variable or function.

1. Click the "Variable (or Function)" button on the right. (There must be at least one variable or function.)
2. Select the target that you wish to find reference in the "Variables list (or Functions list)"
3. You can check the locations at which the selected variable (or function) has been used in the “Reference Results” field

    ![](/assets/images/sw/rplus_task3_en/motion_info_01.png)  

4. If you select one of the results in the “Reference Results” field, it will take you to the specific location within the source code.
5. If you click the "Rename" button at the top, you can change the name of the variable (or function) for the whole source code.

    ![](/assets/images/sw/rplus_task3_en/motion_info_02.png)  
    ![](/assets/images/sw/rplus_task3_en/motion_info_03.png)

## [Search Keyword](#search-keyword)

This is a function to search for components used in the program code.

1. Click the Search button at the bottom right.
2. Type the search word in the search bar that appears on top.  

    ![](/assets/images/sw/rplus_task3_en/motion_info_04.png)  

3. In the task code, the "search result" will be shown as a list below.
4. If you click on an item in the list, it will move to that line.  

    ![](/assets/images/sw/rplus_task3_en/motion_info_05.png)

## [Grammar/Compile Check](#grammarcompile-check)

In order to download the task code to the controller, it must go through a grammar check and compile process. If you try to download to the controller or click the "Error" button, it will run the grammar check and compile process automatically.

- **Grammar Check** : This is the process of examining whether the instructions used in the task code are compatible instructions with the controller, and whether there are any errors in the grammar.  
  All errors must be corrected before it can move on to the next step.
- **Compilation** : This is the process of converting the code that has finished grammar check into a machine language that the controller can interpret.  
  The number of variables, callback usage, and memory usage are examined during the compilation process.

![](/assets/images/sw/rplus_task3_en/motion_info_06.png)

## [Keyframe](#keyframe)

Combine `Ctrl` key when using `Insert` or `Delete` key to keep the time between keyframes when insert or delete key frame.  

### [Insert Keyframe](#insert-keyframe)

The following shows how to keep the time between keyframes by using `Ctrl` key with `Insert` key.  

![](/assets/images/sw/rplus_task3_en/motion_keyframe_insert.png)

### [Delete Keyframe](#delete-keyframe)

The following shows how to keep the time between keyframes by using `Ctrl` key with `Delete` key.  

![](/assets/images/sw/rplus_task3_en/motion_keyframe_delete.png)

### [Selective Keyframe Play](#selective-keyframe-play)

Press `Ctrl` key when selecting specific keyframes to play. Only selected keyframes will be played.

![](/assets/images/sw/rplus_task3_en/motion_keyframe_selected_play.png)

## [Play Music](#play-music)

Music can be played along with motion play.

- Click the `Insert Music` button and select the audio file.  
  ![](/assets/images/sw/rplus_task3_en/motion_musicplay.png)

- Click the `Music Play` button to play the music.  
  ![](/assets/images/sw/rplus_task3_en/motion_musicplay_03.png)

- Specify the music section to play.  
  ![](/assets/images/sw/rplus_task3_en/motion_musicplay_02.png)

- When playing motion, the music will also be played which is very handy when creating a dance motion.  


## [Create Custom Robot](#create-custom-robot)

1. Move to the Home tab and select the controller to use, and click on the `Add Joint` button.  
  ![](/assets/images/sw/rplus_task3_en/motion_user_01.png)  

2. Select the type of joint (motor) to use and set its ID. Click `Apply` to add the joint to the joint list.  
  ![](/assets/images/sw/rplus_task3_en/motion_user_02.png)  
  ![](/assets/images/sw/rplus_task3_en/motion_user_03.png)  

3. Once the joint list is completed and the new project is created, the custom robot will be shown on the screen.  
  Since it is difficult to analogize and display the actual custom robot on the 3D model, it will be helpful if the users frequently playback the motion on the actual robot (Sync Mode) to check on their status.  
  ![](/assets/images/sw/rplus_task3_en/motion_user_04.png)  

## [Change 3D Robot](#change-3d-robot)

The Motion file is created and edited based on the initial 3D robot that was selected. Users can change the 3D robot while in the midst of a project, while maintaining the motion file data.  
The guide below is an example of changing the 3D robot from `MAX-E1` to `Dr.R`.

1. Move to the Home tab, and click on the `3D Robot` button on the left.

    ![](/assets/images/sw/rplus_task3_en/motion_3d_01.png)

2. Click on the `Change 3D Robot` button on the bottom, and select the robot to be change into.

    ![](/assets/images/sw/rplus_task3_en/motion_3d_02.png)

3. Once the 3D robot is changed, the window will automatically change.
4. If there are unnecessary joints it is recommended to delete them. Move to the Home tab again and click on the `3D Robot` button. (If there are no joints to delete, please skip the step 5)  
5. Select the motors to delete, and click on the `Remove Joint` button to delete. Once you are done with deleting, click the `Apply` button.

    ![](/assets/images/sw/rplus_task3/motion_3d_03.png)

6. The unnecessary joints are now deleted.

    ![](/assets/images/sw/rplus_task3/motion_3d_04.png)

## [Pose Mirroring](#pose-mirroring)

The 3D Robot’s joints have a horizontally symmetrical matching joint on the opposite side, based on the vertical center line drawn below.  
The Mirroring function uses this symmetry for mirroring or exchanging the pose on the opposite side.

  ![](/assets/images/sw/rplus_task3/motion_mirror_01.png)

### Pose Symmetry

1. For Pose Symmetry, users must first select the joints that will be the basis for the opposite side.
2. Click on the `Mirroring` button.

    ![](/assets/images/sw/rplus_task3_en/motion_mirror_02.png)

3. The selected joints’ values will now be entered (mirrored) onto the horizontally symmetrical joint on the opposite side.

    ![](/assets/images/sw/rplus_task3_en/motion_mirror_03.png)

### Pose Exchange

1. For Pose Exchange, users must select the joints that will be the basis for exchanging, and also select the corresponding joints that will receive the values from the basis joints.
2. Click on the `Mirroring` button.

    ![](/assets/images/sw/rplus_task3_en/motion_mirror_04.png)

3. The selected joints will now have their values exchanged with each other.

    ![](/assets/images/sw/rplus_task3_en/motion_mirror_05.png)

## [Edit Motion Index Number](#edit-motion-index-number)

The Motion Index Number is used when a motion data has to be called in RoboPlus Task.  
The Index Number of the Motion data downloaded on the controller must match the Index Number used for calling in Task.

1. Move to the `Motion Download` tab, select a Motion Group for editing its Index Number, and click on the `Edit Motion Group` button.

    ![](/assets/images/sw/rplus_task3_en/motion_call_01.png)

2. Select the Motion Number you would like to edit the Index (or Exit Index) number for, change the number, and click the `Enter` key.

    ![](/assets/images/sw/rplus_task3_en/motion_call_02.png)

3. If a duplicate number is already present, a message will be shown as below, and the user must select how to proceed. If the Exit Index is not inputted, a random number will be assigned.

    ![](/assets/images/sw/rplus_task3_en/motion_call_03.png)

## [Copy Motion Data](#copy-motion-data)

1. Open the Motion file with the data to copy.  
    ![](/assets/images/sw/rplus_task3_en/motion_copy_01.png)
2. Open the Motion Unit List and select the unit to copy. Use `Ctrl` + `C` shortcut to copy the motion.  
    ![](/assets/images/sw/rplus_task3_en/motion_copy_02.png)
3. Open the target motion file to paste the motion and open the Motion Unit List to paste the motion by pressing `Ctrl` + `V`.  
    ![](/assets/images/sw/rplus_task3_en/motion_copy_04.png)

**NOTE** Multiple R+ Task 3.0 can be run to copy and paste the motions.
{: .notice--info}

{% capture motion_01 %}
**CAUTION** : When copying data between Motion files
- Data that can be copied : joint value, Key-Frame, Motion Unit, and Motion.
- If a data with the same name already exists in the new (blank) project, the data will not copy.
- Copying must be proceeded in the order of Motion Unit -> Motion. If a Motion is copied without copying any Motion Units, an empty Motion will be pasted.
{% endcapture %}
<div class="notice--warning">{{ motion_01 | markdownify }}</div>

## [Edit Offset](#edit-offset)

1. Move to the `Home` tab and click on the `Offset` button.  
    ![](/assets/images/sw/rplus_task3_en/motion_offset_01.png)  
2. Connect the robot. (Refer to [Connect to Robot](#connect-to-robot))  
3. Turn on the Sync Mode.  
    ![](/assets/images/sw/rplus_task3_en/motion_offset_02.png)  
4. Set the initial pose, check the robot, and edit the offset pose.  
    ![](/assets/images/sw/rplus_task3_en/motion_offset_03.png)  
5. The ideal offset is when the actual robot’s pose is identical to the initial pose.  
6. Adjust the offset so the actual robot’s pose matches the 3D robot’s initial pose.
7. Click on the `Download Offsets` button to save the offset onto the robot’s controller.  
    ![](/assets/images/sw/rplus_task3_en/motion_offset_04.png)  
8. The difference between the initial pose and the offset pose will be applied as the offset. (Offset pose – Initial pose = Offset)


## [Convert Files](#convert-files)

![](/assets/images/sw/rplus2/motion/motion_40.gif)

**R+ Task 3.0** can convert **R+ Motion 1.0** and **R+ Motion 2.0** files into \*.mtn3 file.   
In order to use \*.mtn or \*.mtnx files in R+ Task 3.0, they have to be converted to \*.mtn3 as below.

**CAUTION** Converting mtn or mtnx files into mtn3 could modify the size of the file and motion numbers. Please check motion number after converting the file.
{: .notice--warning}

1. Run R+ Task 3.0 and click `Open` button.  

    ![](/assets/images/sw/rplus_task3_en/motion_trans_01.png)

2. Select the mtn or mtnx file to convert.

   ![](/assets/images/sw/rplus_task3_en/motion_trans_02.png)

3. The below message will appear to confirm the file conversion. Click `OK`.

    ![](/assets/images/sw/rplus_task3_en/motion_trans_03.png)

4. Select the 3D robot to use the motion file and click `OK`.

    ![](/assets/images/sw/rplus_task3_en/motion_trans_04.png)

5. Save the converted mtn3 file.

    ![](/assets/images/sw/rplus_task3_en/motion_trans_05.png)

## [Control 3D Camera](#control-3d-camera)

1. Hold the right mouse button and drag to rotate the point of view.

    ![](/assets/images/sw/rplus_task3/motion_angle_01.png)

2. Press the `Home` key or scroll up the mouse wheel to zoom in.

    ![](/assets/images/sw/rplus_task3/motion_angle_02.png)

3. Press the `End` key or scroll down the mouse wheel to zoom out.

    ![](/assets/images/sw/rplus_task3/motion_angle_03.png)

4. Press the `Page Down` key to lower the point of view.

    ![](/assets/images/sw/rplus_task3/motion_angle_04.png)

5. Press the `Page Up` key to heighten the point of view.

    ![](/assets/images/sw/rplus_task3/motion_angle_05.png)


## [Display Angle](#display-angle)

Click the `Angle Value` button to display the angle of each joint.

![](/assets/images/sw/rplus_task3_en/motion_anglemark_01.png)  
![](/assets/images/sw/rplus_task3_en/motion_anglemark_02.png)

## [Background Image](#background-image)

When creating a `User Robot Project`, a background image can be displayed in order to deploy DYNAMIXEL.  

1. Click the `Insert landscape` button and select the file to apply.  
  ![](/assets/images/sw/rplus_task3_en/motion_background_01.png)  

2. DYNAMIXEL can be deployed over the image to help identifying joint.  
  ![](/assets/images/sw/rplus_task3_en/motion_background_02.png)  

3. Click the `DYNAMIXEL Relocation` icon to hold DYNAMIXEL at current location.  
  ![](/assets/images/sw/rplus_task3_en/motion_background_03.png)  

## [Initial Pose](#initial-pose)

Click the `Set Initial Pose` button to set all joint to initial position.  
![](/assets/images/sw/rplus_task3_en/motion_position_init.png)
