
## [OpenCR Setup](#opencr-setup)

1. Connect the [OpenCR] to the Rasbperry Pi using the micro USB cable.

2. Install required packages on the Raspberry Pi to upload the [OpenCR] firmware.
  ```bash
$ sudo dpkg --add-architecture armhf
$ sudo apt-get update
$ sudo apt-get install libc6:armhf
  ```

3. Depending on the platform, use either `burger` or `waffle` for the **OPENCR_MODEL** name.
  ```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=burger
$ rm -rf ./opencr_update.tar.bz2
  ```

4. Download the firmware and loader, then extract the file.
  ```bash
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 
$ tar -xvf opencr_update.tar.bz2 
  ```

5. Upload firmware to the OpenCR.
  ```bash
$ cd ./opencr_update
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
  ```  

6. A successful firmware upload for TurtleBot3 Burger will look like below.  
  ![](/assets/images/platform/turtlebot3/opencr/shell01.png)

7. If firmware upload fails, try uploading with the recovery mode. Below sequence activates the recovery mode of OpenCR. Under the recovery mode, the `STATUS` led of [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Click here to expand more details about the firmware upload using **Arduino IDE**
{: .notice--success}
</summary>
Please be aware that [OpenCR] board manager **does not support Arduino IDE on ARM based SBC such as Raspberry Pi or NVidia Jetson**.  
In order to upload the [OpenCR] firmware using Arduino IDE, please follow the below instructions on your PC.
{: .notice--danger}

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

5. Enter below address in the `Additional Boards Manager URLs`.  
  ```bash
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
  ```  
  ![](/assets/images/platform/turtlebot3/preparation/ide1.png)

6. Open the TurtleBot3 firmware. Depending on your platform, please select the correct firmware.
  - Burger : ***File > Examples > turtlebot3 > turtlebot3_burger > turtlebot3_core***
  - Waffle/Waffle Pi : ***File > Examples > turtlebot3 > turtlebot3_waffle > turtlebot3_core***

7. Connect [OpenCR] to the PC and Select ***OpenCR > OpenCR Board*** from ***Tools > Board*** menu.

8. Select the [OpenCR] connected USB port from ***Tools > Port*** menu.

9. Upload the TurtleBot3 firmware sketch with `Ctrl` + `U` or the upload icon.  
  ![](/assets/images/platform/turtlebot3/opencr/o2.png)  
  ![](/assets/images/platform/turtlebot3/opencr/o3.png)

10. If firmware upload fails, try uploading with the recovery mode. Below sequence activates the recovery mode of OpenCR. Under the recovery mode, the `STATUS` led of [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)
</details>

### [OpenCR Test](#opencr-test)

**NOTE**: If the wheels do not move while performing OpenCR Test instruction, make sure to see "**[Setup DYNAMIXELs for TurtleBot3](/docs/en/platform/turtlebot3/faq/#setup-dynamixels-for-turtlebot3)**" section to update the DYNAMIXEL's configuration for use of TurtleBot3.
{: .notice}

You can use `PUSH SW 1` and `PUSH SW 2` buttons to see whether your robot has been properly assembled. This process tests the left and right DYNAMIXEL's and the [OpenCR] board.

![](/assets/images/platform/turtlebot3/opencr/opencr_models.png)

1. After assembling TurtleBot3, connect the power to [OpenCR] and turn on the power switch of OpenCR. The red `Power LED` will be turned on.
2. Place the robot on the flat ground in a wide open area. For the test, safety radius of 1 meter (40 inches) is recommended.
3. Press and hold `PUSH SW 1` for a few seconds to command the robot to move 30 centimeters (about 12 inches) forward.
4. Press and hold `PUSH SW 2` for a few seconds to command the robot to rotate 180 degrees in place.

[OpenCR]: /docs/en/parts/controller/opencr10/
