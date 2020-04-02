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
page_number: 3
---

<div style="counter-reset: h1 2"></div>

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


[CM-550 eManual]: /docs/en/parts/controller/cm-550/
[2XL430-W250 eManual]: /docs/en/dxl/x/2xl430-w250/
[R+ Task 3.0]: /docs/en/software/rplustask3/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[R+ Motion 2.0]: /docs/en/software/rplus2/motion/
[Operating Mode]: /docs/en/parts/controller/cm-550/#operating-mode
