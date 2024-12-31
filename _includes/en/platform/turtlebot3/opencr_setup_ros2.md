
## [OpenCR Setup](#opencr-setup)

1. Connect the [OpenCR] to the Rasbperry Pi using a micro USB cable.  
![](/assets/images/platform/turtlebot3/opencr/opencr_setup.png)  
2. Install the required packages on the Raspberry Pi in order to upload the [OpenCR] firmware.  
**[Turtlebot3 SBC]**  
  ```bash  
$ sudo dpkg --add-architecture armhf  
$ sudo apt-get update  
$ sudo apt-get install libc6:armhf  
  ```  

3. Depending on your specific model, specify either `burger` or `waffle` for the **OPENCR_MODEL** name.  
**[Turtlebot3 SBC]**  
  ```bash  
$ export OPENCR_PORT=/dev/ttyACM0  
$ export OPENCR_MODEL=burger_noetic  
$ rm -rf ./opencr_update.tar.bz2  
  ```  

4. Download the firmware and required loader, then extract the file to prepare for upload.
**[Turtlebot3 SBC]**  
  ```bash  
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2   
$ tar -xvf opencr_update.tar.bz2 
  ```  

5. Upload firmware to the OpenCR.  
**[Turtlebot3 SBC]**  
  ```bash  
$ cd ./opencr_update  
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr  
  ```  

6. A successful firmware upload for the TurtleBot3 Burger will look like this:  
  ![](/assets/images/platform/turtlebot3/opencr/shell01.png)

7. If the firmware upload fails, try uploading again through recovery mode according to the following instructions. While in recovery mode, the `STATUS` led of the [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)


<details>
<summary>
![](/assets/images/icon_unfold.png) Click here to expand more details about firmware uploads using the **Arduino IDE**
</summary>
Please be aware that the [OpenCR] board manager **does not support Arduino IDE on ARM based SBCs such as Raspberry Pi or NVidia Jetson**.  
In order to upload the [OpenCR] firmware using the Arduino IDE, please follow the below instructions on your PC.
{: .notice--danger}

1. If you are using Linux, please configure the USB ports for OpenCR use. For other operating systems (OSX or Windows), you can skip this step.
  ```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
$ sudo apt install libncurses5-dev:i386
  ```
  
2. Install Arduino IDE.
  - [Download the latest Arduino IDE](https://www.arduino.cc/en/software)

3. After completing installation, run the Arduino IDE.

4. Press `Ctrl` + `,` to open the Preferences menu

5. Enter the below address in the `Additional Boards Manager URLs`.  
  ```bash
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
  ```  
  ![](/assets/images/platform/turtlebot3/preparation/ide1.png)

6. Open the TurtleBot3 firmware. Please select the correct firmware, depending on your specific model .
  - Burger : ***File > Examples > turtlebot3 > turtlebot3_burger > turtlebot3_core***
  - Waffle/Waffle Pi : ***File > Examples > turtlebot3 > turtlebot3_waffle > turtlebot3_core***

7. Open the `turtlebot3_core_config.h` and uncomment the **NOETIC_SUPPORT** definition on line 21.

8. Connect the [OpenCR] to the PC and Select ***OpenCR > OpenCR Board*** from the ***Tools > Board*** menu.

9. Select the USB port with the [OpenCR] connected from the ***Tools > Port*** menu.

10. Upload the TurtleBot3 firmware sketch with `Ctrl` + `U` or the upload icon.  
  ![](/assets/images/platform/turtlebot3/opencr/o2.png)  
  ![](/assets/images/platform/turtlebot3/opencr/o3.png)

11. If the firmware upload fails, try uploading again through recovery mode according to the following instructions. While in recovery mode, the `STATUS` led of the [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)
</details>

### [OpenCR Test](#opencr-test)

**NOTE**: If the wheels do not move while performing the OpenCR Test, refer to the"**[TurtleBot3 DYNAMIXEL setup instructions](/docs/en/platform/turtlebot3/faq/#setup-dynamixels-for-turtlebot3)**" to update the DYNAMIXEL's configuration.
{: .notice}

You can use `PUSH SW 1` and `PUSH SW 2` buttons to see whether your robot has been properly assembled. This process tests the left and right DYNAMIXEL configurations and the [OpenCR] board firmware.

![](/assets/images/platform/turtlebot3/opencr/opencr_models.png)

1. After assembling the TurtleBot3, connect power to the [OpenCR] and turn on the power switch. The red `Power LED` will be turned on.
2. Place the robot on flat ground in a wide open area. For the test, a safety radius of 1 meter (40 inches) is recommended.
3. Press and hold `PUSH SW 1` for a few seconds to command the robot to move 30 centimeters (about 12 inches) forward.
4. Press and hold `PUSH SW 2` for a few seconds to command the robot to rotate 180 degrees in place.

[OpenCR]: /docs/en/parts/controller/opencr10/
