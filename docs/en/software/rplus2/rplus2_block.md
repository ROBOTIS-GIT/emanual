---
layout: archive
lang: en
ref: rplus2_block
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus2/rplus2_block/
sidebar:
  title: R+ Block
  nav: "rplus2_block"
---

# [Introduction](#introduction)

Roboplus Block is a coding education platform that inherits block coding method of Google's Blockly.

## [Supported Products](#supported-products)
- ROBOTIS OLLO K
- ROBOTIS PLAY 700

## [Supported Parts](#supported-parts)

### [Controllers](#controllers)
- CM-50

### [Communication Modules](#communication-modules)
- [BT-210]
- [BT-410]

# [Getting Started](#getting-started)

## [R+ Block Install](#r-block-install)

### [Minimum Requirements](#minimum-requirements)
- OS Version : Android 5.0(Lollipop) or above
- H/W : Devices with Bluetooth (Bluetooth 2.0 or 4.0)

### [Download and Setup](#download-and-setup)

Launch the Google Play from smart device. (Google Play is a substitute for Android Market)  
Search for `R+ Block` on Google Play.

![](/assets/images/sw/rplus2/block/block_search.png)
> Searching `ROBOTIS` will also find R+Block

![](/assets/images/sw/rplus2/block/block_install.png)
> Install

### [Connect to Robot](#connect-to-robot)

The robot can be connected to the smart device with Bluetooth.  
[How to connect with Bluetooth](#bluetooth)

## [Main Screen](#main-screen)

The screen of R+Block looks like below.

![](/assets/images/sw/rplus2/block/menu.png)

1. [Product and Workspace Name](#change-product)
2. [Play Button](#play)
3. [Stop Button](#stop)
4. [Save Button](#save)
5. [Optional Menu Button](#optional-menu)
6. [Block Level](#block-level)
7. [Block Group](#block-level)
8. [Workspace](#block-level)
9. [Undo Button](#undoredo)
10. [Redo Button](#undoredo)
11. [Trash Bin](#deleting-block)

# [Basic Features](#basic-features)

## [Product Name](#product-name)
Tapping the Product and Workspace Name area will allow to select the R+Block compatible ROBOTIS products.

![](/assets/images/sw/rplus2/block/change_product.png)

## [Block Level](#block-level)
When tapping the `Block Level` selection area, available blocks for the selected product will be listed.  
Depending on the selected block level, block groups and available blocks in the groups can be changed.

![](/assets/images/sw/rplus2/block/change_blocklevel.png)

## [Selecting Block](#selecting-block)
Tapping the block group will display available blocks in the group.  
These blocks can be drag and dropped onto the workspace area, and more blocks can be found by swiping up and down.

![](/assets/images/sw/rplus2/block/block_select.png)

## [Start Block](#start-block)
There is only one `Start` block in the code, and the blocks attached to the Start block will run.

![](/assets/images/sw/rplus2/block/block_start_01.png)

The orange marker will appear when a selected block can be attached to another block.

![](/assets/images/sw/rplus2/block/block_start_02.png)

In the below screen, `Move Forward` block is attached to the `Start` block. When the robot is connected to the code, `Move Forward` block will be executed.

![](/assets/images/sw/rplus2/block/block_start_03.png)

If the `Move Forward` block is separated from the `Start` block as shown below, it will not be executed.

![](/assets/images/sw/rplus2/block/block_start_04.png)

## [Deleting Block](#deleting-block)
Drag and drop a block group or a block on the trash bin to delete.

![](/assets/images/sw/rplus2/block/block_trash.png)

Open the trash bin and select deleted block in order to recycle the block.  
User can browse deleted blocks by swiping to the left and right.

![](/assets/images/sw/rplus2/block/block_trash_01.png)

## [Zoom In/Out](#zoom-inout)
Pinch gesture on the workspace area will allow to zoom in or out the screen.

![](/assets/images/sw/rplus2/block/block_zoom.png)

## [Context Menu](#context-menu)
Select and hold a block to pop up the context menu with more features such as `Duplicate Block` and `Delete Block`.  
Below shows how to use context menu for the selected block.

When selecting a block, all connected lower level blocks are selected together.  
Below screen shows when `1 Second` block is selected.  
As a result, the lower level `Stop` block is also selected in a gray colored block.

![](/assets/images/sw/rplus2/block/block_add_01.png)

Holding down on the selected block for a few seconds will display the context menu as shown below.

![](/assets/images/sw/rplus2/block/block_add_02.png)

### [Duplicate Block](#duplicate-block)
Below example shows how to copy the selected block with context menu.  
Select and hold the `1 Second` block until context menu pops up.  
In the context menu, select `Duplicate Block`.

![](/assets/images/sw/rplus2/block/block_copy_01.png)

As shown in the below screen, selected block is duplicated on top of the original block.

![](/assets/images/sw/rplus2/block/block_copy_02.png)

### [Disable Block](#disable-block)
Select `Disable Block` from the context menu of the selected block.

![](/assets/images/sw/rplus2/block/block_hide_01.png)

The hidden block will be marked as light gray colored block.  
Even if the hidden block is attached to the `Start` block, it will not be executed.

![](/assets/images/sw/rplus2/block/block_hide_02.png)

### [Enable Block](#enable-block)
In order to enable the hidden block, select `Enable Block` so that the block can be executed again.

### [Delete Block](#delete-block)
Blocks not only can be deleted by drag and dropping to the trash bin, but also can be deleted by selecting `Delete Block` in the context menu.

![](/assets/images/sw/rplus2/block/block_delete.png)  

## [Undo/Redo](#undoredo)
`Undo` and `Redo` buttons help users to revert changes in blocks.  
If undo or redo is enabled, the button will be activated as shown below.

![](/assets/images/sw/rplus2/block/block_undoredo.png)

## [Play](#play)
Tap the `Play` button to run the code.  
If a robot is not connected, bluetooth connection screen will appear as shown below.  

If there is a paired bluetooth module, tap on `REPEATED ATTEMPT` to connect to the bluetooth module.  
If R+ Block is running for the first time, tap on `DEVICE SELECT` to search for a robot with bluetooth module.

![](/assets/images/sw/rplus2/block/block_run_01.png)

Enter the last two characters of the device address written on the bluetooth module and tap the `SCAN` button.  
If bluetooth device is found, select the bluetooth module to connect then tap the `Play` button again.

![](/assets/images/sw/rplus2/block/block_run_02.png)

If the robot is connected, "Waiting..." message will appear on the screen.

![](/assets/images/sw/rplus2/block/block_run_03.png)

As soon as the block starts to play, "Running..." message will appear on the screen.  
Currently running block can be identified by the red colored block.

![](/assets/images/sw/rplus2/block/block_run_04.png)

If bluetooth connection is unsuccessful, make sure that the bluetooth module on the robot is blinking before retry connection.  
In order to disconnect the bluetooth, either turn off the robot or go to `Optional Menu` > `Settings` and select `Bluetooth`.

## [Stop](#stop)
Tap the `Stop` button to stop executing the code while "Running..." or tap the `X` button on the top right corner of workspace.

![](/assets/images/sw/rplus2/block/block_stop.png)

## [Save](#save)
This button will save the code in the workspace. The code can also be saved from `Optional Menu` > `Workspace` > `Save`.

![](/assets/images/sw/rplus2/block/block_save.png)

## [Quit](#quit)
To display the exit menu for the program, press `Back` button of the Android devices.

![](/assets/images/sw/rplus2/block/block_quit.png)

### [Cancel](#cancel)
Cancel exiting the program.

### [Exit](#exit)
Terminate the program without saving the code.

### [Save & Exit](#save--exit)
Save the code and terminate the program.

# [Optional Menu](#optional-menu)
`Optional Menu` button contains extend menu such as `Settings`, `Workspace`, `Task` and more.

![](/assets/images/sw/rplus2/block/block_option_menu.png)

## [Settings](#settings)
`Bluetooth`, `e-Manual`, `Version Information` can be found.

![](/assets/images/sw/rplus2/block/block_option_setting.png)

### [Bluetooth](#bluetooth)
This option allows to configure, modify or disconnect the bluetooth module.  
In order to search for the bluetooth module, the last two characters have to be entered before beginning scan.

![](/assets/images/sw/rplus2/block/block_option_bluetooth.png)

### [e-Manual](#e-manual)
Online manual can be found.

![](/assets/images/sw/rplus2/block/block_option_emanual.png)

### [Version Info](#version-info)
Current version of the program can be found.

![](/assets/images/sw/rplus2/block/block_option_version.png)

## [Workspace](#workspace)
Save, load, clear or create a new workspace from this menu.

![](/assets/images/sw/rplus2/block/block_option_project.png)

### [Save](#save)
Saves current workspace.

![](/assets/images/sw/rplus2/block/block_option_save_01.png)
> Enter the name and tap `OK` button.

![](/assets/images/sw/rplus2/block/block_option_save_02.png)
> The name of workspace is displayed in the top.

If the workspace is already saved, current workspace name will appear when saving.  
In order to change the name, enter the new name for the workspace.

### [Load](#load)
Loads saved workspace.

![](/assets/images/sw/rplus2/block/block_option_load.png)

### [Clear](#clear)
Clears all the blocks in the workspace.  
Workspace name and `Start` block will remain.

![](/assets/images/sw/rplus2/block/block_option_erase.png)

### [New](#new)
Create a new workspace.

![](/assets/images/sw/rplus2/block/block_option_create_01.png)
> Enter the workspace name and tap `OK` button.

![](/assets/images/sw/rplus2/block/block_option_create_02.png)

### [Delete](#delete)
Lists up the saved workspace. To delete the workspace, select and hold the workspace file.

![](/assets/images/sw/rplus2/block/block_option_delete.png)

## [Task](#task)
The code can be converted to Task code and be downloaded.

![](/assets/images/sw/rplus2/block/block_option_task.png)

This requires R+Task. If R+Task is not installed, Google Play will appear on the screen.

![](/assets/images/sw/rplus2/block/block_option_task_search.png)
> Enter `ROBOTIS` and search for `R+m.Task2` in the Google Play

![](/assets/images/sw/rplus2/block/block_option_task_install.png)
> Install R+m.Task2

### [Convert](#convert)
The block code will be converted to Task code.  
Additional code can be programmed from R+m.Task2 app and be compiled for error.  
Please refer to R+m.Task2 app manual for downloading Task code to the robot.

![](/assets/images/sw/rplus2/block/block_option_convert.png)

Converted Task code is saved in below location of Android device.

### [Download](#download)
Converted code can be downloaded directly to the robot without displaying on R+m.Task2 app.  
After downloading the code to the robot, the robot does not need to be connected to the R+Block to run the code.  
Downloaded code will run as soon as the robot is turned on.

![](/assets/images/sw/rplus2/block/block_option_download.png)


[BT-210]: /docs/en/parts/communication/bt-210/
[BT-410]: /docs/en/parts/communication/bt-410/
