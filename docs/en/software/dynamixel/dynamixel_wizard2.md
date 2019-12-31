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

**Software Download(v2.0.5.1)**  
[Windows](http://www.robotis.com/service/download.php?no=1670)  
[Linux](http://www.robotis.com/service/download.php?no=1671)  
[Mac](http://www.robotis.com/service/download.php?no=1760)  

## [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

DYNAMIXEL Wizard 2.0 is an optimized tool for managing DYNAMIXEL's from various operating systems.
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
- [Compatibility Table]{: .popup}

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

| DYNAMIXEL Series |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **DX**           | [DX-113]                       | [DX-116]                       | [DX-117]                       |                                |                 |
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **RX**           | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **EX**           | [EX-106+]                      |                                |                                |                                |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL430-W250]                   |                                |                                |                 |
| **XM**           | [XM430-W210]                   | [XM430-W350]                   | [XM540-W150]                   | [XM540-W270]                   |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO L**        | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO+ H**       | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-100-S500-R]              |                                |                 |
| **PRO+ M**       | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |
| **ETC**          | [RH-P12-RN]                    | [RH-P12-RN(A)]                 |                                |                                |                 |



# [Software Installation](#software-installation)

## [Install: Windows](#install-windows)

1. Download the package file.
- [Windows Software Download(v2.0.5.1)](http://www.robotis.com/service/download.php?no=1670)  
2. Execute downloaded installation file.  
3. Click on `Next` button to proceed installation.

![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_01.png)

## [Install: Linux](#install-linux)

1. Download the package file.  
- [Linux Software Download(v2.0.5.1)](http://www.robotis.com/service/download.php?no=1671)  
2. Enter the following command to change the permission.

    ```c
    # sudo chmod 775 DynamixelWizard2Setup_x64
    ```

3. Run the install program.

    ```c
    # ./DynamixelWizard2Setup_x64
    ```

4. Click on `Next` button to proceed installation.

## [Install: Mac](#install-mac)

1. Download the package file.  
- [Mac Software Download(v2.0.5.1)](http://www.robotis.com/service/download.php?no=1760)
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

    **NOTE**: Read a contorl table of your DYNAMIXEL as the item can be different depending on a model and Operation Mode of DYNAMIXEL. 
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
        
    - Y-Axis: it adds Y-axis to a selected item. The Maximum is 9.    

      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_y_axis_01.png)
      
      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_y_axis_02.png)
      
    - Scale: When a certain number is set, a value of selected item of y-axis represents the value multiplied of item by the scale. 
  
      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_scale_01.png)
      
      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_scale_02.png)
      
    - Offset: It adds Offset to a selected item. Use the option to separate overlapped items on the graph such as `Present Position` and `Goal Position` 
     
      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_offset_01.png)
      
      ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_offset_02.png)
        
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
    - Zoom In : Drag an area to zoom in
      - `Shift` + `Select Area` : Zoom In on X axis only
      - `Ctrl` + `Select Area` : Zoom In on Y axis only
      - Use mouse wheel to undo / redo zoom level setting
    - While running the graph, use `Ctrl` + `Mouse Wheel` to adjust X axis length from 1 to 10 seconds.
    
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

Update firmware version of DYNAMIXEL, if you see its model name with a special charactor (\*), on the device list, in light grey.  
When positioning a mouse cursor on its model name, **Firmware update is available** will be shown up.  
  
![](/assets/images/sw/dynamixel/wizard2/wizard2_update_notification.png)

1. Go to `Tools` > `Firmware Update`

    **NOTE** : If there isn't any detected or connected device, `Firmware Update` will be disabled. Please scan DYNAMIXEL first.
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

2. Calibration will begin with a breif instruction.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_002.png)

3. During the calibration mode, DYNAMIXEL Wizard 2.0 cannot identify the model information of DYNAMIXEL, so correct model has to be selected manually. Selecting wrong model can cause malfunction or serious hardware damage.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_003.png)

4. The proper communication port that is connected to DYNAMIXEL has to be selected manually. If the port is in use, it has to be released first.

    **WARNING** : Only one DYNAMIXEL has to be connected to the port when calibrating DYNAMIXEL.
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_004.png)

5. Toggle the power of DYNAMIXEL to be detected from DYNAMIXEL Wizard 2.0.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_005.png)

6. If DYNAMIXEL is successfully detected, calibration firmware is installed. Please do NOT disconnect or turn off DYNAMIXEL.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_006.png)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_007.png)

7. Calibrate the first position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_008.png)

8. Calibrate the second position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_009.png)

9. Calibrate the third position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_010.png)

10. Calibrate the fourth position.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_011.png)

11. Clibration is completed.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_012.png)

## [Self Diagnosis](#self-diagnosis)

In order to find error in DYNAMIXEL, self diagnosis can be performed.

1. Go to `Tool` > `Self-Diagnosis`

    **NOTE** : If there isn't any detected or connected device, `Self-Diagnosis` will be disabled. Please scan DYNAMIXEL first.
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

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_009.png)

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
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
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
[PH42-020-S300-R]: /docs/en/dxl/pro_plus/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/pro_plus/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/pro_plus/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/pro_plus/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/pro_plus/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/pro_plus/pm42-010-s260-r/
[RH-P12-RN]: /docs/en/platform/rh_p12_rn/
[RH-P12-RN(A)]: /docs/en/platform/rh_p12_rna/
[Compatibility Table]: /docs/en/popup/faq_protocol_compatibility_table/
