---
layout: archive
lang: en
ref: kit2
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/engineer/kit2_reference/
sidebar:
  title: ENGINEER Kit2
  nav: "kit2"
product_group: kit2
page_number: 4
---

<div style="counter-reset: h1 3"></div>

# [References](#references)

## [Setting Video Streaming on ROBOTIS ENGINEER App](#setting-video-streaming-on-robotis-engineer-app)

1. Turn on the controller and wait for the Raspberry Pi to boot up.
  
    **NOTE**: After about 70 seconds, the User LED will turn yellow with a beep sound.
    {: .notice}
    
    ![](/assets/images/edu/engineer/kit2/pi_booting.png)

2. Select Wi-Fi settings on the device where the app is installed..

3. Select Robotis_Rpi_XXXX in the network list. 

    ![](/assets/images/edu/engineer/kit2/kit2_wifi_01.png)
        
    **NOTE**: XXXX is 4 digit MAC address of the controller.
    {: .notice}

4. Enter `robotis0` to connect, when password input window appears.

    ![](/assets/images/edu/engineer/kit2/kit2_wifi_02.png)

5. Run the ENGINEER app and tap the Bluetooth icon in the top right corner to connect to the controller. Check if the icon turns green to confirm that Bluetooth is connected.  

    ![](/assets/images/edu/engineer/kit2/kit2_streaming_bluetooth.png)

6. If running the streaming service by selecting MAX-E2 or Commando, witch has the streaming function, one can control the robot by using the streaming function as shown below.

    ![](/assets/images/edu/engineer/kit2/kit2_streaming_select_example.png)
    > Selecting MAX-E2 or Commando. 
      
    ![](/assets/images/edu/engineer/kit2/kit2_streaming_select_example_02.png)
    > Video Streaming with the app.  

## [Raspberry Pi Update and Recovery](#raspberry-pi-update-and-recovery)

## [Raspberry Pi Update](#raspberry-pi-update-and-recovery)

You can update Raspberry Pi remotely when it needs. This feature will be available in the near future. 

## [Raspberry Pi and Recovery](#raspberry-pi-update-and-recovery)

If Raspberry Pi won't boot or isn't functioning properly, see the following instructions.

1. Download [Release.zip](https://www.robotis.com/service/download.php?no=1923) (Kit-Only Raspbian Image file **rpi_eng_image_ver_1.img** included).

2. Unzip the file. **rpi_eng_image_ver_1.img** file will be generated in a location where you extract.

3. Install a image writer, such as [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/), to write the file to a SD card before installing **rpi_eng_image_ver_1.img** on a Raspberry Pi board. 

4. Run the image writer from your PC. (In this instruction, Win32 Disk Imager is used.)

    ![](/assets/images/edu/engineer/kit2/run_win32diskimager.png)

5. Select the file you extracted earlier.

    ![](/assets/images/edu/engineer/kit2/select_rpi_image_extracted_01.png)

    ![](/assets/images/edu/engineer/kit2/select_rpi_image_extracted_02.png)

6. Select the device where the SD card is occupied. 

    ![](/assets/images/edu/engineer/kit2/select_sdcard_drive.png)

7. Click **Write** and wait for the write to complete.

    ![](/assets/images/edu/engineer/kit2/wait_write_complete.png)

8. Exit the imager and eject the SD card.

9. Insert the SD card to a SD card slot of the Raspberry Pi Zero that on CM-550.

11. Wait for the Raspberry Pi booting up. The booting will proceed around 3 times with a beep sound every booting. 
  
  **NOTE**: The booting takes about 3 minutes.
  {: .notice}

11. In order to check if the booting is successfully completed, scan the wifi address with your phone. From the network list, you will see the item Robotis_Rpi_xxxx (CM-550's Mac address). 
    
    **NOTE**: Mac address is marked on the CM-550 next to the power button. 
    {: .notice}
    
    ![](/assets/images/edu/engineer/kit2/rpi_wifi_scan_01.png)  
      > Wifi scan result before the Raspbian complete update.  

    ![](/assets/images/edu/engineer/kit2/rpi_wifi_scan_02.png)  
      > Wifi scan result after the Raspbian complete update.
    
12. Enter `robotis0` to connect, when password input window appears.

## [BLE Signal Setting](#ble-signal-setting)

The Bluetooth communication could be unstable if the signal strength of BLE slave module in the CM-550 is weak or interfered.  
The BLE signal strength can be adjusted by R+ Manager 2.0 in this case.

Please refer to the method to adjust CM-550 BLE signal strength for various situations.

{% capture ble_setting %}  

|   My CM-550   | Other CM-550  | BLE Signal Strength |
|:-------------:|:-------------:|:-------------------:|
| Unstable Link |  Stable Link  |      Increase       |
| Unstable Link | Unstable Link |      Increase       |
|  Stable Link  | Unstable Link |      Decrease       |
|  Stable Link  |  Stable Link  |      No Change      |

- If communication is unstable when using one CM-550 controller in the room, the signal strength might be weak. **Increase the BLE signal strength**.
- If communication is unstable when using multiple CM-550 controllers in the room, BLE signals could interrupt each other. **Increase the BLE signal strength of the unstable CM-550 or decrease the BLE signal strength of other stable CM-550**.
- If all CM-550 in the room are stable, **Maintain the BLE signal strength**.
{% endcapture %}
<div class="notice">{{ ble_setting | markdownify }}</div>

**NOTE** : The BLE signal strength and noise may differ by environment and the number of devices nearby.
{: .notice}

1. Turn off the BT-410 master or BT-410 Dongle that is paired to CM-550 BLE.  
  (BLE signal strength cannot be configured while CM-550 BLE is connected to the paired device)

2. Connect the USB cable from PC to CM-550 (5V USB will automatically turn on the controller even if the power switch is off).
3. Wait until the `MODE` button of CM-550 flickers every second.
4. Run R+ Manager 2.0.
5. Click the `Check for Updates` button to install the latest updates.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_02.png)  

6. Go to `ALL PRODUCTS` tab or use shortcut key(`Ctrl` + `A`).  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_04.png)

7. Select `CM-550` from the product list.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_05.png)

8.  Click `Update & Test` button.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_06.png)

9. Click `Next` button.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_07.png)

10. Select the port where the controller is connected to.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_08.png)

11. Confirm the Baudrate (The default baudrate is fixed to 57600 bps).  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_09.png)

12. Once CM-550 controller is detected, click `Next`.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_10.png)

13. If the controller has the latest firmware, click `Next`, or else follow the update instruction on the screen to download the latest firmware.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_11.png)

14. Upon the successful connection, below control table will appear on the screen.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_12.png)

15. Scroll down until to find `BLE Signal Power` in the address `139`.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_13.png)

16. Select the `BLE Signal Power` on the right section of the control table and click `Save` button.  
  The bigger value will increase the signal strength.  

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_14.png)

    If the value of `BLE Signal Power` is marked on `UNKNOWN(0)`, please go back to step 1 and check if BT-410 Master or BT-410 Dongle module is turned off.
    {: .notice}

17. Confirm the changed `BLE Signal Power` value.  
  ![](/assets/images/edu/engineer/kit1/BLE_signal_power_15.png)

## [Setting Up the Robot](#setting-up-the-robot)

### [Check DYNAMIXEL Assembly](#check-dynamixel-assembly)
This function checks DYNAMIXEL ID and status of the ROBOTIS ENGINEER Kit.

1.  Launch the robot example from the main screen, and select `MOTOR` from the option menu.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. Select the joint ID from the screen. Check if the selected joint flinches while LED is turned on.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)

### [DYNAMIXEL Offset](#dynamixel-offset)
This function is used to adjust the pose of robot by calibrating offset values of DYNAMIXEL used in the ROBOTIS ENGINEERING KIT. Configured offset value will be saved in each DYNAMIXEL's.  
Please perform offset adjustment with a thorough understanding as it may cause unstable motions or hardware damages when improperly configured.

1. Launch the robot example from the main screen, and select `OFFSET` from the option menu.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

2.  Select the joint ID to adjust offset from the screen and adjust menu will appear.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

  - `+ / -` : Increase / Decrease the offset value.  
  - `Torque On / Off` : Toggle the torque of the selected joint.  
  - `OK / CANCEL` : Save / Cancel the changes in offset value.

3. Select `OK` to save the offset value. The confirmation message will appear.  
Select `OK` once again to save the offset value to robot.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

4. Below buttons will reset or reload offset values of each joint.  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

  - `Reset Offset` : When selected, the confirmation window will appear. Select [OK] to reset the offset value of all joint.  
  - `Initial Pose` : This button will reload the saved offset value. Incorrectly configured offset may be recovered with this button.

## [Download](#download)
All items (App, Assemly Manuals and Kit-Only Raspbian Image file) are available . 

### [Download App](#download-app)
The ENGINEER KIT2 shares R+Task 3.0 and ENGIEER app with the ENGINEER KIT 1. If these app and software are not installed on your PC or a smart device, see [App Installation](/docs/en/edu/engineer/kit1/#app-installation) and install the app and software.

### [Download Robot Examples](#download-robot-examples)

- CM-550 controller is initially programmed with Kit2 example.  
- The `Complete Example` includes `MAX-E2`, `Commando`, `Scorpi` examples.

| Examples                       | Python (.py)                                                                   | Motion (.mtn)                                                                   |
|:-------------------------------|:-------------------------------------------------------------------------------|:--------------------------------------------------------------------------------|
| MAX-E2                         | [01_ENG2_Max_E2_PY.py](https://www.robotis.com/service/download.php?no=1915)   | [01_ENG2_Max_E2_MO.mtn3](https://www.robotis.com/service/download.php?no=1916)  |
| Commando                       | [02_ENG2_Commando_PY.py](https://www.robotis.com/service/download.php?no=1917) | Only Python File is used                                                        |
| Scorpi                         | [03_ENG2_Scorpi_PY.py](https://www.robotis.com/service/download.php?no=1919)   | [03_ENG2_Scorpi_MO.mtn3](https://www.robotis.com/service/download.php?no=1918)  |
| AutoBot  (Additional Eaxmples) | [04_ENG2_Autobot_PY.py](https://www.robotis.com/service/download.php?no=1920)  | [04_ENG2_Autobot_MO.mtn3](https://www.robotis.com/service/download.php?no=1921) |
| Strider  (Additional Eaxmples) | [05_ENG2_Strider_PY.py](https://www.robotis.com/service/download.php?no=1922)  | Only Python File is used                                                        |

### [Download Assembly Manual](#download-assembly-manual)
Download the assembly manuals from the following table.

|             Model              | Download                                                                                              |
|:------------------------------:|:------------------------------------------------------------------------------------------------------|
|             MAX-E2             | [ROBOTIS_ENGINEER_KIT2_MAX-E2_EN_ver2014.pdf](https://www.robotis.com/service/download.php?no=1929)   |
|            Commando            | [ROBOTIS_ENGINEER_KIT2_Commando_EN_ver2014.pdf](https://www.robotis.com/service/download.php?no=1930) |
|             Scorpi             | [ROBOTIS_ENGINEER_KIT2_Scorpi_EN_ver2014.pdf](https://www.robotis.com/service/download.php?no=1931)   |
| AutoBot  (Additional Eaxmples) | [ROBOTIS_ENGINEER KIT2_Autobot_EN_ver2018.pdf](https://www.robotis.com/service/download.php?no=1981)  |
| Strider  (Additional Eaxmples) | [ROBOTIS_ENGINEER KIT2_Strider_EN_ver2018.pdf](https://www.robotis.com/service/download.php?no=1982)  |


### [Download a MARKER for Commando](#download-a-marker-for-commando)

Download [MARKER for Commando](https://www.robotis.com/service/download.php?no=1933).

![](/assets/images/edu/engineer/kit2/marker_for_commando.png)

## [Self Checklist](#self-checklist)

1. Why the robot does not turn on?  
  > Please check the battery level and connection.  

2. How can I check the battery level?  
  > Please refer to [Battery Level Check](#battery-level-check) section.

3. I keep hearing the alarm from the robot.  
  > If the battery level is too low, battery warning alarm sounds. Please refer to [Charging Battery](#charging-battery) section.

4. The robot motion seems awkward.  
  > The robot may not assembled properly. Please check the robot assembly and [Check DYNAMIXEL Assembly](#check-dynamixel-assembly) section.

5. The robot turns on with the adapter, but not with the battery.  
  > Please check the Fuse on the bottom of CM-550 controller. Please refer to [Fuse Replacement](#fuse-replacement) section.

## [Charging Battery](#charging-battery)

{% include en/edu/engineer/battery_charge.md %}

## [Battery Level Check](#battery-level-check)

{% include en/edu/engineer/charge_level.md %}

## [Fuse Replacement](#fuse-replacement)

{% include en/parts/controller/fuse_cm-550.md %}

## [Drawings](#drawings)

Download 3D printing files (STL) from the following table.

**NOTE**: When printing out 3D model files, it is recommended to use under 10 % infill density, in order to decrease the weight of the robot.
{: .notice}

|             Model             | Download                                                                            |
|:-----------------------------:|:------------------------------------------------------------------------------------|
|          Parts List           | [ENG2_3D_Printing_Parts_List](https://www.robotis.com/service/download.php?no=1972) |
|            MAX-E2             | [1. MAX-E2_STL.zip](https://www.robotis.com/service/download.php?no=1951)           |
|           Commando            | [2. COMMANDO_STL.zip](https://www.robotis.com/service/download.php?no=1952)         |
|            Scorpi             | [3. SCORPI_STL.zip](https://www.robotis.com/service/download.php?no=1953)           |
| AutoBot (Additional Eaxmples) | [4. AUTOBOT_STL.zip](https://www.robotis.com/service/download.php?no=1954)          |
| Strider (Additional Eaxmples) | [5. STRIDER_STL.zip](https://www.robotis.com/service/download.php?no=1955)          |

{% include en/dxl/download_center_notice.md %}

[CM-550 eManual]: /docs/en/parts/controller/cm-550/
[2XL430-W250 eManual]: /docs/en/dxl/x/2xl430-w250/
[R+ Task 3.0]: /docs/en/software/rplustask3/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[R+ Motion 2.0]: /docs/en/software/rplus2/motion/
[Operating Mode]: /docs/en/parts/controller/cm-550/#operating-mode
