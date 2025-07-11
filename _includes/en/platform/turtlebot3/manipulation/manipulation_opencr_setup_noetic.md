
{% capture notice_01 %}
**NOTE**: To use the OpenMANIPULATOR-X, you will need to upload dedicated firmware to the OpenCR by using either a **shell script** or the **Arduino IDE**.

1. The **[Shell script](#shell-script)** is recommended as it uses a pre-built binary file.
2. The **[Arduino IDE](#arduino-ide)** builds from the provided source code and uploads the generated binary file. The OpenCR Arduino board manager does not support ARM based processors such as Raspberry Pi or Jetson Nano.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING**  
Please connect all DYNAMIXEL servos to the OpenCR before uploading the OpenCR firmware.
{: .notice--warning}


After the OpenMANIPULATOR is properly mounted on the TurtleBot3, the OpenCR firmware needs to be updated to control the connected DYNAMIXELs. Please follow the firmware update instructions below.

1. Download the OpenCR firmware file to the Raspberry Pi (SBC) and upload the correct firmware with the following commands.  
**[TurtleBot3 SBC]**  
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3_noetic
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2
$ tar -xvf opencr_update.tar.bz2
$ cd ./opencr_update
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```

2. When the firmware is completely uploaded, you will see a text string on the terminal: **jump_to_fw**

{% capture notice_01 %}
**DANGER**

**Please be aware of pinch hazards between the OpenMANIPULATOR joints!!!**

When the firmware is successfully uploaded, the OpenCR board will reboot and **the OpenMANIPULATOR-X will move to it's initial pose**.  
It is recommended to put the OpenMANIPULATOR-X in a similar pose as the below image to avoid any physical damage during the initial movement.

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)
{% endcapture %}

<div class="notice--danger">{{ notice_01 | markdownify }}</div>

### [Arduino IDE](#arduino-ide)

Please be aware that OpenCR board manager **does not support Arduino IDE on ARM based SBC such as Raspberry Pi or NVidia Jetson**.  
In order to upload the OpenCR firmware using Arduino IDE, please follow the below instructions on your PC.
{: .notice--danger}

<details>
<summary>
![](/assets/images/icon_unfold.png) Click here to expand more details about the firmware upload using **Arduino IDE**
</summary>

1. If you are using Linux, please configure the USB port for OpenCR. For other OS(OSX or Windows), you can skip this step.
  ```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo apt install libncurses5-dev:i386
  ```
2. Install Arduino IDE.
  - [Download the latest Arduino IDE](https://www.arduino.cc/en/software)

3. After completing the installation, run Arduino IDE.

4. Press `Ctrl` + `,` to open the Preferences menu

5. Enter the below address in the `Additional Boards Manager URLs`.  
  ```bash
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
  ```  
  ![](/assets/images/platform/turtlebot3/preparation/ide1.png)

6. Open the TurtleBot3 with OpenMANIPULATOR firmware.
  - TurtleBot3 with OpenMANIPULATOR : ***File > Examples > turtlebot3 > turtlebot3_with_open_manipulator > turtlebot3_with_open_manipulator_core***

7. Uncomment `#define NOETIC_SUPPORT` on `turtlebot3_with_open_manipulator_core.h`, and save it.

8. Connect OpenCR to the PC and Select ***OpenCR > OpenCR Board*** from ***Tools > Board*** menu.

9. Select the OpenCR's USB port from ***Tools > Port*** menu.

10. Upload the TurtleBot3 firmware sketch with `Ctrl` + `U` or the upload icon.  
  ![](/assets/images/platform/turtlebot3/quick_start/opencr_setup/o2.png)  
  ![](/assets/images/platform/turtlebot3/quick_start/opencr_setup/o3.png)

11. If firmware upload fails, try uploading through recovery mode. The following sequence activates the recovery mode of OpenCR. When in recovery mode, the `STATUS` led of the OpenCR will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)
</details>
