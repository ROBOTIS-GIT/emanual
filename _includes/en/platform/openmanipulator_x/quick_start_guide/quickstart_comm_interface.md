There are two communication interface hardware options available for controlling the OpenMANIPULATOR-X. Please select one of the below options.  
After completing this section, turn on the power switch and check if all DYNAMIXEL LED blink once.

<details open>
<summary>
![](/assets/images/icon_unfold.png) **Option 1(Recommended) : Use U2D2 as a communication interface**
</summary>

#### Connection
Connect micro USB (connected to PC), DYNAMIXEL's(OpenMANIPULATOR-X), and 12V Power to U2D2 and U2D2 power hub board as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_u2d2_setup2.png" width="800">

**NOTE** : Please refer to [U2D2 e-Manual](/docs/en/parts/interface/u2d2/) and [U2D2 power hub board e-manual](/docs/en/parts/interface/u2d2_power_hub/) for detailed connection of U2D2 and U2D2 power hub board.
{: .notice--info}

#### USB Latency Timer Setting
In Linux(Ubuntu platform) environment, USB latency time is set to 16ms by default. Follow the steps below to set the communication latency time to the lowest value (1ms) between DYNAMIXEL's and PC connected via USB.

Open a terminal window and run the roscore.

``` bash
$ roscore
```

**TIP**: You can open a new terminal window by pressing `ALT` + `CTRL` + `T`.
{: .notice}

While the roscore running, open a new terminal window and enter the following command to set usb latency time. The command below will set the USB latency to **1 ms**.

``` bash
$ rosrun open_manipulator_controller create_udev_rules
```

{% capture notice_01 %}
**TIP**: If you would like to see the current latency, enter the following command in the terminal.  

```bash
$ cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
```
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>
</details>


<details>
<summary>
![](/assets/images/icon_unfold.png) **Option 2 : Use OpenCR as a communication interface**
</summary>

This section describes how to set up OpenCR as a communication board between **ROS Packages** of PC and DYNAMIXEL's of OpenMANIPULATOR-X.  
If you want to operate OpenMANIPULATOR-X on embedded system (OpenCR) without ROS, see [OpenCR Setup](/docs/en/platform/openmanipulator_x/opencr_setup/#opencr-setup).

#### Connection

Connect micro USB (connected to PC), DYNAMIXEL's(OpenMANIPULATOR-X), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png" width="800">

#### Upload Source code

1. Set up the Arduino IDE for OpenCR ([Instructions](/docs/en/parts/controller/opencr10/#arduino-ide))

2. Connect OpenCR to the PC.

3. Open the example from `File > Examples > OpenCR > 10.Etc > usb_to_dxl`
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_utd_setup.png)  
  > Open the `usb to dxl` example.

4. Upload the example to OpenCR.  
  ![](/assets/images/platform/openmanipulator_x/upload_use_to_dxl.png)

5. When the upload is completed, the following comments are displayed in the log window.   
  ![](/assets/images/parts/controller/opencr10/downloader_01.png)  
  

{% capture note_03 %}
`FAQ`  
If upload fails, try with [Recovery Mode](/docs/en/parts/controller/opencr10/#recovery-mode)
1. Turn on the power of the OpenCR board.
2. Hold down the `PUSH SW2` button.
3. Press the `Reset` button.
4. Release the `Reset` button.
5. Release the `PUSH SW2` button.

The STATUS LED should blink every 100ms after entering Recovery Mode successfully.
{% endcapture %}
<div class="notice--warning">{{ note_03 | markdownify }}</div>

</details>