
{% capture notice_01 %}
**NOTE**: To use OpenMANIPULATOR-X, you need to upload a firmware into OpenCR by using either **shell script** or **Arduino IDE**.

1. **[Shell script](#shell-script)** is highly recommended to upload the firmware as it uses a pre-built binary file
2. **[Arduino IDE](#arduino-ide)** builds from the provided source code and uploads the generated binary file.  
The OpenCR Arduino board manager does not support ARM based processors such as Raspberry Pi or Jetson Nano.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING**  
Please connect all DYNAMIXEL modules to the OpenCR before uploading the OpenCR firmware.
{: .notice--warning}


After OpenMANIPULATOR-X is properly mounted on TurtleBot3, the OpenCR firmware needs to be updated to control connected DYNAMIXEL. Please follow the firmware update instructions below.

1. **[TurtleBot3 SBC]** Download the OpenCR firmware file on Raspberry Pi (SBC) and upload the correct firmware with the following commands.
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=turtlebot3_manipulation
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
$ tar -xvf opencr_update.tar.bz2
$ cd ./opencr_update
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```

2. When the firmware is successfully uploaded to the OpenCR, **jump_to_fw** will appear on the terminal.

### [Arduino IDE](#arduino-ide)

Please be aware that OpenCR board manager **does not support Arduino IDE on ARM based SBC such as Raspberry Pi or NVidia Jetson**.  
In order to upload the OpenCR firmware using Arduino IDE, please follow the below instructions on your PC.
{: .notice--danger}

<details>
<summary>
![](/assets/images/icon_unfold.png) Click here to expand more details about the firmware upload using **Arduino IDE**
</summary>

1. If you are using Linux, please configure the USB port for OpenCR. For other OS(OSX or Windows), you can skip to the step 2 "Install Arduino IDE".
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

5. Enter below addresses in the `Additional Boards Manager URLs`.  
  ```bash
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
  ```  
  ![](/assets/images/platform/turtlebot3/preparation/ide1.png)

6. Select `Sketch > Include Library > Manage Libraries...` to install the DYNAMIXEL2Arduino library.
  ![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

7. Search for `DYNAMIXEL2Arduino` from the Library Manager and install the library.
  ![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

8. Open the `TurtleBot3 Manipulation` example.
  - ***File > Examples > turtlebot3 > turtlebot3_manipulation > turtlebot3_manipulation***

9. Connect the micro USB of the OpenCR to the PC and select ***Tools > Board > OpenCR > OpenCR Board*** from Arduino IDE.

10. Select the port connected to the OpenCR from ***Tools > Port*** menu.

11. Upload the TurtleBot3 firmware sketch with `Ctrl` + `U` or the upload icon.  
  ![](/assets/images/platform/turtlebot3/opencr/o3.png)

12. If firmware upload fails, try uploading the firmware under the recovery mode. Below sequence activates the recovery mode of OpenCR and the `STATUS` led of OpenCR will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.

  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)
</details>