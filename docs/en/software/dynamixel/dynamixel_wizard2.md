---
layout: archive
lang: en
ref: dynamixel_wizard2
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_wizard2/
sidebar:
  title: DYNAMIXEL Wizard 2.0
  nav: "dynamixel_wizard2"
---

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_003.png)


# [Introduction](#introduction)

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_000.jpg)

**Software Download (v2.0.13)**  
[Windows](http://www.robotis.com/service/download.php?no=1670)  
[Linux](http://www.robotis.com/service/download.php?no=1671)  
[Mac](http://www.robotis.com/service/download.php?no=1760)  

## [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

DYNAMIXEL Wizard 2.0 is an optimized tool for managing DYNAMIXEL from various operating systems.
The following features are provided with DYNAMIXEL Wizard 2.0.

- DYNAMIXEL Firmware Update
- DYNAMIXEL Diagnosis
- DYNAMIXEL Configuration and Test
- DYNAMIXEL Data Plotting in Real-Time
- Generate & Monitor DYNAMIXEL Packets

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_001.png)

## [Supported Protocols](#supported-protocols)

- [Protocol 1.0]
- [Protocol 2.0]
- Modbus-RTU (DYNAMIXEL-P series only)

**NOTE**: [Compatibility Table]{: .popup}
{: .notice}

## [Supported OS](#supported-os)

- Windows 7 / 8.1 / 10 (32 bit and 64 bit)
- Linux
  - Ubuntu 18.04 (64 bit)
  - Ubuntu 16.04 (64 bit)
- MacOS 10.12 / 10.13 / 10.14 (64bit)

{% capture supported_platform %}
**WARNING**:
- DYNAMIXEL Wizard 2.0 is tested with a desktop and laptop only.
- Only x86 architectures support DYNAMIXEL Wizard 2.0.
{% endcapture %}
<div class="notice--warning">{{ supported_platform | markdownify }}</div>

## [Definition of Firmware](#definition-of-firmware)

Firmware is a fundamental program to operate the hardware device.
It is recommended to keep the firmware updated because it contains various communication regulations to exchange data with other devices such as computers or smartphones.
Although almost all ROBOTIS products are shipped with installed firmwares, new firmwares can be released for updated features or bug fixes.

## [Importance of Firmware Update](#importance-of-firmware-update)

- The new firmware may contain newly developed or updated features.
- The new firmware can be released to support software compatibility.
- The new firmware can be released to fix bugs.
- Updating the latest firmware may resolve functional issues.

## [Supported Products](#supported-products)

| DYNAMIXEL Series |                                                              |                                   |                                |                                |                 |
|:-----------------|:-------------------------------------------------------------|:----------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                                                     | [AX-12+/12A]                      | [AX-18F/18A]                   |                                |                 |
| **DX**           | [DX-113]                                                     | [DX-116]                          | [DX-117]                       |                                |                 |
| **RX**           | [RX-10]                                                      | [RX-24F]                          | [RX-28]                        | [RX-64]                        |                 |
| **EX**           | [EX-106+]                                                    |                                   |                                |                                |                 |
| **MX**           | [MX-12W]                                                     | [MX-28], [MX-28(2.0)]             | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                                                      | [XL330-M288]<br>[XL330-M077]      | [XL430-W250]                   | [2XL430-W250]                  |                 |
| **XC**           | [XC330-T288]<br>[XC330-T181]<br>[XC330-M288]<br>[XC330-M181] | [XC430-W150]<br/> [XC430-W240]    | [2XC430-W250]                  |                                |                 |
| **XM**           | [XM430-W210]<br/> [XM430-W350]                               | [XM540-W150]<br/> [XM540-W270]    |                                |                                |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350]                               | [XH430-V210]<br/> [XH430-V350]    | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **XD**           | [XD430-T350]<br/>[XD430-T210]                                | [XD540-T270-R]<br/>[XD540-T150-R] |                                |                                |                 |
| **XW**           | [XW430-T333]<br/> [XW430-T200]                               | [XW540-T140]<br/> [XW540-T260]    |                                |                                |                 |
| **PRO H**        | [H42-20-S300-R]                                              | [H54-100-S500-R]                  | [H54-200-S500-R]               |                                |                 |
| **PRO M**        | [M42-10-S260-R]                                              | [M54-40-S250-R]                   | [M54-60-S250-R]                |                                |                 |
| **PRO L**        | [L42-10-S300-R]                                              | [L54-30-S500-R]                   | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**     | [H42-20-S300-R(A)]                                           | [H54-100-S500-R(A)]               | [H54-200-S500-R(A)]            |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]                                           | [M54-40-S250-R(A)]                | [M54-60-S250-R(A)]             |                                |                 |
| **PH**           | [PH42-020-S300-R]                                            | [PH54-100-S500-R]                 | [PH54-100-S500-R]              |                                |                 |
| **PM**           | [PM54-060-S250-R]                                            | [PM54-040-S250-R]                 | [PM42-010-S260-R]              |                                |                 |
| **ETC**          | [RH-P12-RN]                                                  | [RH-P12-RN(A)]                    |                                |                                |                 |

# [Software Installation](#software-installation)

## [Install: Windows](#install-windows)

1. Download the package file.
- [Windows Software Download](http://www.robotis.com/service/download.php?no=1670)  
2. Execute downloaded installation file.  
3. Click on `Next` button to proceed installation.

![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_01.png)

## [Install: Linux](#install-linux)

1. Download the package file.  
- [Linux Software Download](http://www.robotis.com/service/download.php?no=1671)  
2. Enter the following command to change the permission.

    ```bash
    $ sudo chmod 775 DynamixelWizard2Setup_x64
    ```

3. Run the install program.

    ```bash
    $ ./DynamixelWizard2Setup_x64
    ```

4. Click on `Next` button to proceed installation.

5. After completing the installation, please add account id to dialout group in order to access the USB port. Replace the <your_account_id> in the command below to your actual user id.
    ```bash
    $ sudo usermod -aG dialout <your_account_id>
    ```

6. Reboot in order the changes to be effective.
    ```bash
    $ reboot
    ```

## [Install: Mac](#install-mac)

**NOTE**: Modern Mac OS supports app store installation only. 
{: .notice}

1. Download the package file.  
- [Mac Software Download](http://www.robotis.com/service/download.php?no=1760)
2. Right click on the downloaded dmg file and select `Open` from the mene.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_01.png)
3. Launch the `DynamixelWizard2Setup_x64` file.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_02.png)
4. If a warning message pops up, select `Open` to proceed installation.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_03.png)
5. Click `Next` to continue and follow the setup instruction.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_04.png)

# [Uninstall Software](#uninstall-software)

## [Uninstall: Windows](#uninstall-windows)

1. From Windows Settings, select Apps.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_02.png)

2. In the Apps & features tab, find `Dynamixel Wizard 2` and select `Uninstall`.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_03.png)

3. Select `Remove all components` and proceed by clicking `Next` button.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_04.png)

## [Uninstall: Linux](#uninstall-linux)

1. From the folder where DYNAMIXEL Wizard is installed, execute `maintenancetool`.

2. Select `Remove all components` and click `Next` to proceed.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_linux_03.png)

## [Uninstall: Mac](#uninstall-mac)

1. Go to `DYNAMIXEL2Wizard` from `Applications`.
2. Execute `maintenancetool` in DYNAMIXEL2Wizard folder.
3. Select `Remove all components` and click `Next` to proceed.

# [Menu Description](#menu-description)

## [Main Screen](#main-screen)

The main screen of software classifies the detected DYNAMIXEL's according to communication ports, baudrates, and products.
Detected DYNAMIXEL's can be tested by modifying control table values.

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_002.png)

## [Graph Window](#graph-window)

By selecting control table items to be plotted, values of the selected items will be drawn in the graph window in real time.
Please refer to [Basic Features > Graph] section for more details about selecting control table items.

![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_001.png)

## [Packet Window](#packet-window)

User can manually generate an Instruction packet for the selected protocol version.
Detailed packet data can be loaded by selecting a packet in the packet history.

![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_001.png)

# [Basic Features](#basic-features)

## [Connect DYNAMIXEL](#connect-dynamixel)

### [DYNAMIXEL Scan Options](#dynamixel-scan-options)

1. Go to `Tools` > `Options` or use shortcut key `F4`.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_011.png)

2. Select `Scan` from the left column menu to display scan options.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_options_001.png)

3. Select Protocol Type, communication ports, baudrates, and the range of ID to scan. Click `OK` to confirm the selection.
  Selecting less option reduces time to scan DYNAMIXEL.

### [Scan DYNAMIXEL](#scan-dynamixel)

1. Go to `Device` > `Scan` to start searching connected DYNAMIXEL's.

    **NOTE** : If Open failed is shown up, please check whether communication port is connected at the **Main Toolbar** or not, then button `Disconnect` to avoid port collision.
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_012.png)

2. Detected DYNAMIXEL's are listed on the left column.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_001.png)

## [DYNAMIXEL Control Table](#dynamixel-control-table)

1. Detected DYNAMIXEL's are classified according to communication ports, baudrates, and products. Select a group or device to run the test.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_002.png)

2. `Factory Reset` button in the Sub Menu on the right column will reset DYNAMIXEL to factory status(ID and Baudrate will not be reset).  
  `Reboot` button will soft reset DYNAMIXEL.  
  `Torque` switch will toggle the Torque of DYNAMIXEL.  
  `LED` switch will toggle the LED of DYNAMIXEL.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_003.png)

3. Click the `Torque` button to enable DYNAMIXEL Torque.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_torque_on.png)  

4. Select `Goal Position` or `Goal Velocity` item in the control table in the middle column.

    **NOTE**: Read the control table of your DYNAMIXEL as the item can be different depending on the model and Operating Mode of the DYNAMIXEL.
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_004.png)     

5. Position controlling interface will appear on the buttom right corner of the program.

    **WARNING** : Please be cautious when changing values as DYNAMIXEL can rotate or move.
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_004.png)  
    - When selecting `Position control` from Operation Mode, you can use a virtual dial controller
    - Control a horn of DYNAMIXEL by using the controller.
    - Input values into the input window.  
    - When selecting `Velocitiy control`/`Current control`/`PWM control` from Operation Mode, you can use a virtual joypad.
    - Move a horn to CW / CCW by using the controller.
    - Input values into the input window to increase (or decrease) the speed of a horn of DYNAMIXEL.
    - More information on the virtual controller is available at [Modifying Control Value](#modifying-control-values)

6. `Communication Status` on the buttom left corner represents communication status between PC and DYNAMIXEL's.

7. The `Packet Status` section indicates the status of responded packet from DYNAMIXEL.

8. The `Hardware Alarm` section in the Device Status indicates hardware error status of DYNAMIXEL.

9. Please refer to e-Manual of each product for more information regarding the Control Table.

10. Below options in the Control Table allow items to be grouped or ungrouped.
  - Group : Selected items can be grouped and folded or unfolded.
  - Ungroup : Ungroup the selected group.

## [Graph](#graph)

### [Graph Options](#graph-options)

1. Go to `Tools` > `Options`

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_011.png)

2. Select `Graph` from the left column menu to display scan options.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_002.png)

3. Click `>>` button to add item. (`<<` can remove item)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_003.png)

4. Double-click a color of a item to call `Read Item Settings` box.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004.png)
5. Diverse option can be used.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_1.png)
    
    **NOTE**: `Scale`and `Offset` are no longer appearing at the option box above, from the latest version of software. Adjust these factors at the [Graph Window](#graph-window) in real time. (See the additional explanation at Y-Axis below)
    {: .notice}

    - Y-Axis: it adds Y-axis to a selected item. The Maximum is 10.    

      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_y_axis_02.png)
      - `Scale`: Adjust scale of axis at the Graph Window (Main Axsis, Secondary Axis) using a mouse wheel.  
      - `Offset`: Adjust Offset by dragging the desired axis up and down at the Graph Window (Main Axsis, Secondary Axis).  

5. Communication interval can be set between 1 ~ 1000ms. Smaller interval will display refined graph.

    **NOTE** : The actual communication interval can differ by baudrate and the hardware spec of the PC.
    {: .notice}

6. In order to optimize the graph drawing speed, check the option to read selected items only.

    **NOTE** : Checking this option will only refresh selected items in the Control Table.
    {: .notice}

7. Click `OK` to confirm changes.

### [Start Plotting](#start-plotting)

1. Go to `View` > `Graph` to display the graph window.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_013.png)

2. Click `Start` button in the graph window to start plotting data.

    **WARNING** : If there isn't any detected or connected device, `Start` button will be disabled. Please scan DYNAMIXEL first.
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_001.png)

3. After start plotting, enable Torque first then change `Goal Position` to see how `Present Position` data is plotted in real time.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_005.png)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_006.png)

4. Disable the plotting graph by clicking the certain item on the right side of the graph window.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_004.png)

5. Use the features to control graph window.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_002.png)

    - Start/Stop : Start/Stop plotting
    - Reset : Reset zoom level
    - Capture : Save current graph window to an image file
    - Save : Save plotted data to CSV file
    - Load : Load CSV file
    - Enable/Disable Item : Click items on the right to toggle visibility
    - Zoom : Drag an area to zoom 
      - `Shift` + `Select Area` : Zoom In on X axis only
      - `Ctrl` + `Select Area` : Zoom In on Y axis only
      - `Ctrl` + `Mouse Wheel`: Zoom In / Out.
    - While running the graph, use `Shift` + `Mouse Wheel` to adjust X axis length from 1 to 10 seconds.

## [Packet](#packet)

1. Go to `View` > `Packet` to display the packet window.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_014.png)

2. Set the communication port and baudrate then click `Open` to open the port.
  Once the port is successfully opened, DYNAMIXEL protocol minitoring on the port will begin.

    **NOTE** : If Open failed is shown up, please check whether communication port is connected at the **Main Toolbar** or not, then button `Disconnect` to avoid port collision.  
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_002.png)

3. Select Protocol Type and instruction to use.
  In this example, `Write` instruction for Protocol Type `2.0` is selected.

    **NOTE** : Protocol Type can be different depending on a model of DYNAMIXEL. Confirm [Protocol Type](/docs/en/popup/faq_protocol_compatibility_table){: .popup} of your DYNAMIXEL.
    {: .notice}


    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_003.png)

4. Specific data can be written on the instuction as shown below.
  In this example, LED will be turned on by writing `1` to LED control address.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_004.png)

    - Control Table address of LED : 65
    - Length of the LED data[Byte] : 1
    - Value to turn on the LED : 1

5. Assembled packet can be found at `Packet Details` section in the bottom of packet window.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_005.png)

6. Transmit the assembled packet with `Send` button.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_006.png)


## [Firmware Update](#firmware-update)

When your connected DYNAMIXEL has a firmware update available an asterisk **(\*)** will be displayed next to the model name on the device list.  
When positioning your mouse cursor over the model name, **Firmware update is Available** will also be displayed as a tooltip.

![](/assets/images/sw/dynamixel/wizard2/wizard2_update_notification.png)

1. Go to `Tools` > `Firmware Update`

    **NOTE** : If no DYNAMIXELS are detected, the `Firmware Update` option will not be available. 
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_015.png)

2. Firmware update will begin with a breif instruction. Please do NOT disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_001.png)

3. Click `Next` to begin firmware update. Be careful not to disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_002.png)

4. Confirm the firmware update result.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_004.png)

## [Firmware Update All](#firmware-update-all)

1. Go to `Tools` > `Firmware Update All`

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_016.png)

2. Select all or desired DYNAMIXEL's, then click `Next` button.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_001.png)

3. Firmware of selected DYNAMIXEL's are updated.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_002.png)

4. Wait until update is completed for all DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_003.png)

## [Firmware Recovery](#firmware-recovery)

1. Go to `Tools` > `Firmware Recovery`

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_017.png)

2. Firmware recovery will begin with a breif instruction. Please do **NOT** disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_001.png)

3. During the firmware recovery mode, DYNAMIXEL Wizard 2.0 cannot identify the model information of DYNAMIXEL, so correct model has to be selected manually. Selecting wrong model can cause malfunction or serious hardware damage.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_002.png)

4. Select a desired firmware version.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_003.png)

5. The proper communication port that is connected to DYNAMIXEL has to be selected manually. If the port is in use, it has to be released first.

    **WARNING** : Only one DYNAMIXEL should be connected to the port when recoverying DYNAMIXEL firmware.
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_004.png)

6. Toggle the power of DYNAMIXEL to be detected from DYNAMIXEL Wizard 2.0.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_005.png)

7. If DYNAMIXEL is successfully detected, wizard begins firmware recovery. Please do **NOT** disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_006.png)

8. Confirm the firmware recovery result.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_007.png)

# [Advanced Features](#advanced-features)

## [ID Inspection](#id-inspection)

<iframe width="560" height="315" src="https://www.youtube.com/embed/B0x1PEISavw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> DYNAMIXEL Tips \| Use ID Inspector to Change Overlapping IDs with Ease

{% capture supported_dynamixel %}
**Supported DYNAMIXEL**
- [DYNAMIXEL-X](/docs/en/dxl/x/) (Firmware **v45** or **above**, For X330 Series: Firmware **v46** or **above**) 
- [DYNAMIXEL-P](/docs/en/dxl/p/) (Firmware **v12** or **above**)
- XL-320 is not supported
{% endcapture %}

As the DYNAMIXEL can be distinguished by its own ID in packet communication with your main controller, the ID assigned on DYNAMIXEL has to be unique. 

If there are overlapping ID in your application, communication between the main controller and DYNAMIXELs or scanning DYANMIXEL via DYNAMIXEL Wizard 2.0 will be failed.  

The `ID Inspection` resolves the overlapping ID although they remain wired. For more details, watch a tutorial video above or read through the following instructions. 

<div class="notice">{{ supported_dynamixel | markdownify }}</div>

1. Go to `Tool` > `ID Inspection`

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step1_01.png)   

2. Select your right USB port and Baud rates, and click on `Scan`

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step1_02.png)  

3. Once DYNAMIXEL scan is started, state of scanning DYNAMIXEL is displayed.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step2_01.png)  

    **Note**: Perform [Firmware Recovery](#firmware-recovery) if you fail to scan any DYNAMIXEL.
    {: .notice}

4. Click on `Next` for "ID Setting"

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step2_02.png)  

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step3_01.png)  


5. Select an item (colored red) and assign new ID from the right box to resolve ID overlapping.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step3_02.png)  

    **Note** : If you select any item in the list, the DYNAMIXEL will blink once.
    {: .notice}

6. If new ID are saved to the items of DYNAMIXEL, it will be colored green. Once completed, click on `Apply`.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step4_01.png)  

7. Click on `Finish` to exit the `ID Inspection` window.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step4_02.png)  

8. Confirm the DYNAMIXEL Wizard 2.0 scans DYNAMIXELs successfully.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_done.png)  


## [Backup and Restore](#backup-and-restore)

<iframe width="560" height="315" src="https://www.youtube.com/embed/CFinASETHiQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> DYNAMIXEL Tips \| EEPROM and RAM Data Restoring Using Backup Funcion

Data in both EEPROM and RAM (Specific items only) can be stored inside DYNAMIXEL using `Backup` function.

This can be useful if the DYNAMIXEL are reset after the [Firmware Recovery](#firmware-recovery) or any situation in data reset.  

The stored data by `backup` can be restored in using `Restore EEPROM`.

See the available items in Control Table for data backup, 
- All Data in EERPOM
- Velocity P.I Gains
- Position P.I.D Gains
- Feedforward 1st & 2nd Gains
- Profile Acceleration
- Profile Velocity
- Indirect Addresses (Except DYNAMIXEL-P Series)

**Note**: Be sure to set the **Restore RAM** bit of the `Startup Configuration(60)` address in order to restore the RAM data on startup.
{: .notice}

<div class="notice">{{ supported_dynamixel | markdownify }}</div>

## [Control Table Backup](#control-table-backup)

1. Connect and [Scan DYNAMIXEL](#scan-dynamixel).

2. Make sure to turn off the Torque of DYNAMIXEL. Otherwise, backup will fail.

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_torque_off.png)
    
3. Select `Tool` > `Control Table` > `Backup` 

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_click_backup.png)
    
4. Check if the `Backup Ready(147)` address is set to `1` after backup.  

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_backup_enabled.png)

### [Restoring EEPROM Area](#restoring-eeprom-area)

1. Go to `Tool` > `Control Table` > `Restore EEPROM`

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_click_restore.png)

2. DYNAMIXEL will be rebooted and restore the EEPROM settings.

### [Restoring RAM Area](#restoring-ram-area)

1. Set the **Restore RAM** bit of the `Startup Configuration` as below.

   ![](/assets/images/sw/dynamixel/wizard2/backup/backup_enable_restore_ram.png)
       
2. The data in specific RAM area(listed below) will be restored when DYNAMIXEL is rebooted.
    - Velocity P.I Gains
    - Position P.I.D Gains
    - Feedforward 1st & 2nd Gains
    - Profile Acceleration
    - Profile Velocity
    - Indirect Addresses (Except for DYNAMIXEL-P Series)
   
### [Save and Load Backup File](#save-and-load-backup-file)

Save and Load backup data of EEPROM field as .ctd file. Utilizing "Save and Load Backup File" reduces the consuming time tasks of DYNAMIXEL configuration, and loewer the possibility of configuration error.

**NOTE**: Saved backup file(.cd) can be used between the same DYNAMIXEL models.
{: .notice}

![](/assets/images/sw/dynamixel/wizard2/backup/backup_save_ctd.png)

When loading backup data from .ctd file, it provides restoring options to ignore restoring particular data at EEPROM field. 

![](/assets/images/sw/dynamixel/wizard2/backup/backup_load_01.png)

The resulting log shows the restored item. 

![](/assets/images/sw/dynamixel/wizard2/backup/backup_load_02.png)   
   
## [Modifying Control Values](#modifying-control-values)

1. Drag or slide the interface (Moderately changes value)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_005.png)

2. Mouse wheel scroll (Slightly changes value)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_006.png)

3. Directional keys (Finely changes value)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_007.png)

4. Enter the value

    **NOTE** : Press `Enter` key to apply the value.
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_008.png)

## [Firmware Information](#firmware-information)

Firmware version, release date, update note can be found here.

1. Go to `Help` > `About Dynamixel Firmware`

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_009.png)

2. Firmware version, release date, update note of the selected DYNAMIXEL can be found.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_010.png)

## [Calibration](#calibration)

If the horn is misaligned after gear set replacement or reassembly, please perform calibration.

1. Go to `Tool` > `Calibration`

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_001.png)
    
    **NOTE**: `Calibration` itme will be disabled at the menu for non-supported DYNAMIXEL such as [AX Series](/docs/en/dxl/#ax-series)
    {: .notice}
    
    **WARNING** : Only one DYNAMIXEL has to be connected to the port when calibrating DYNAMIXEL.
    {: .notice--warning}    

2. Calibration will begin with a breif instruction.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_002.png)

3. Toggle the power of DYNAMIXEL to be detected from DYNAMIXEL Wizard 2.0.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_005.png)

4. If DYNAMIXEL is successfully detected, calibration firmware will start being installed. Please do NOT disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_006.png)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_007.png)

5. Calibrate the first position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_008.png)

6. Calibrate the second position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_009.png)

7. Calibrate the third position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_010.png)

8. Calibrate the fourth position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_011.png)

9. Clibration is completed.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_012.png)

## [Self Diagnosis](#self-diagnosis)

In order to find error in DYNAMIXEL, self diagnosis can be performed.

1. Go to `Tool` > `Self-Diagnosis`

    **NOTE** : `Self-Diagnosis` item will be disabled at the menu for non-suppored DYNAMIXEL such as [RX Series](/docs/en/dxl/#rx-series)
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_001.png)

2. Self diagnosis will begin with a breif instruction.

    **WARNING** : DYNAMIXEL will be factory reset during self diagnosis.
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_002.png)

3. Confirm the model name and firmware version of DYNAMIXEL to perform diagnosis.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_003.png)

4. Check the hardware error status of DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_004.png)

5. Check the operating temperature of DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_005.png)

6. Check the input voltage of DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_006.png)

7. Check if the LED on DYNAMIXEL is blinking.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_007.png)

8. Check if DYNAMIXEL horn is at the center.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_008.png)

9. Proceed to performance test. 

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_009_position.png){: width="400px"}
    > **Position Test** : Goal Position represents red line and Present Position represents green line.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_009_velocity.png){: width="400px"}
    > **Velocity Test** : Safe area represents a green zone. 

10. Confirm the self diagnosis result.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_010.png)

## [Graph Optimization](#graph-optimization)

In order to use the minimum communication interval(1 [ms]), please follow the instruction below.

### [USB Latency Setting](#usb-latency-setting)

#### Windows

1. Open `Device Manager`. Go to `Ports` item and right click on the relative serial port to select `Properties`.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_008_en.png)

2. In the Properties window, go to `Port Settings` tab and click `Advanced` button.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_009_en.png)

3. Set the `Latency Timer (msec)` to `1ms` and click `OK` to confirm the change.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_010_en.png)

#### Linux

1. Execute below commands to configure the `latency_timer` to `1ms`.

    ```c
    # cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    16
    # echo 1 > /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    # cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    1
    ```

### [DYNAMIXEL Setting](#dynamixel-setting)

1. Open the graph options window to set `Interval` to `1ms`. Then, mark on the `Read only selected item for Speed` option.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_005.png)

2. Set the baudrate of DYNAMIXEL to maximum and set `Return Delay Time` to `0`.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_007.png)

[Basic Features > Graph]: #graph
[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[EX-106+]: /docs/en/dxl/ex/ex-106+/
[DX-113]: /docs/en/dxl/dx/dx-113/
[DX-116]: /docs/en/dxl/dx/dx-116/
[DX-117]: /docs/en/dxl/dx/dx-117/
[RX-10]: /docs/en/dxl/rx/rx-10/
[RX-24F]: /docs/en/dxl/rx/rx-24f/
[RX-28]: /docs/en/dxl/rx/rx-28/
[RX-64]: /docs/en/dxl/rx/rx-64/
[MX-12W]: /docs/en/dxl/mx/mx-12w/
[MX-28]: /docs/en/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64]: /docs/en/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106]: /docs/en/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/en/dxl/mx/mx-106-2/
[XL320]: /docs/en/dxl/x/xl320/
[XL330-M288]: /docs/en/dxl/x/xl330-m288/
[XL330-M077]: /docs/en/dxl/x/xl330-m077/
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
[2XL430-W250]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150]: /docs/en/dxl/x/xc430-w150/
[XC430-W240]: /docs/en/dxl/x/xc430-w240/
[2XC430-W250]: /docs/en/dxl/x/2xc430-w250/
[XC330-T288]: /docs/en/dxl/x/xc330-t288
[XC330-T181]: /docs/en/dxl/x/xc330-t181
[XC330-M288]: /docs/en/dxl/x/xc330-m288
[XC330-M181]: /docs/en/dxl/x/xc330-m181
[XM430-W210]: /docs/en/dxl/x/xm430-w210/
[XM430-W350]: /docs/en/dxl/x/xm430-w350/
[XH430-W210]: /docs/en/dxl/x/xh430-w210/
[XM540-W150]: /docs/en/dxl/x/xm540-w150/
[XM540-W270]: /docs/en/dxl/x/xm540-w270/
[XH430-W350]: /docs/en/dxl/x/xh430-w350/
[XH430-V210]: /docs/en/dxl/x/xh430-v210/
[XH430-V350]: /docs/en/dxl/x/xh430-v350/
[XH540-W150]: /docs/en/dxl/x/xh540-w150/
[XH540-W270]: /docs/en/dxl/x/xh540-w270/
[XH540-V150]: /docs/en/dxl/x/xh540-v150/
[XH540-V270]: /docs/en/dxl/x/xh540-v270/
[XD540-T270-R]: /docs/en/dxl/x/xd540-t270
[XD540-T150-R]: /docs/en/dxl/x/xd540-t150
[XD430-T350-R]: /docs/en/dxl/x/xd430-t350
[XD430-T210-R]: /docs/en/dxl/x/xd430-t210
[XW430-T200]: /docs/en/dxl/x/xw430-t200/
[XW430-T333]: /docs/en/dxl/x/xw430-t333/
[XW540-T140]: /docs/en/dxl/x/xw540-t140/
[XW540-T260]: /docs/en/dxl/x/xw540-t260/
[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/en/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/en/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/en/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/en/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/en/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/en/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/en/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/en/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/en/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/en/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/en/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/en/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/en/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/en/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/en/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/p/pm42-010-s260-r/
[RH-P12-RN]: /docs/en/platform/rh_p12_rn/
[RH-P12-RN(A)]: /docs/en/platform/rh_p12_rna/
[Compatibility Table]: /docs/en/popup/faq_protocol_compatibility_table/
