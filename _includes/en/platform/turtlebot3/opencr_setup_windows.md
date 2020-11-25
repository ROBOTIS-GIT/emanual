
## [OpenCR Setup](#opencr-setup)

Please be aware that [OpenCR] board manager **does not support Arduino IDE on ARM based SBC such as Raspberry Pi or NVidia Jetson**.  
In order to upload the [OpenCR] firmware using Arduino IDE, please follow the below instructions on your PC.
{: .notice--danger}

1. Install Arduino IDE.
  - [Download the latest Arduino IDE](https://www.arduino.cc/en/software)

2. After completing the installation, run Arduino IDE.

3. Press `Ctrl` + `,` to open the Preferences menu

4. Enter below address in the `Additional Boards Manager URLs`.  
  ```bash
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
  ```  
  ![](/assets/images/platform/turtlebot3/preparation/ide1.png)

5. Open the TurtleBot3 firmware. Depending on your platform, please select the correct firmware.
  - Burger : ***File > Examples > turtlebot3 > turtlebot3_burger > turtlebot3_core***
  - Waffle/Waffle Pi : ***File > Examples > turtlebot3 > turtlebot3_waffle > turtlebot3_core***

6. Connect [OpenCR] to the PC and Select ***OpenCR > OpenCR Board*** from ***Tools > Board*** menu.

7. Select the [OpenCR] connected USB port from ***Tools > Port*** menu.

8. Upload the TurtleBot3 firmware sketch with `Ctrl` + `U` or the upload icon.  
  ![](/assets/images/platform/turtlebot3/opencr/o2.png)  
  ![](/assets/images/platform/turtlebot3/opencr/o3.png)

9. If firmware upload fails, try uploading with the recovery mode. Below sequence activates the recovery mode of OpenCR. Under the recovery mode, the `STATUS` led of [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)


### [OpenCR Test](#opencr-test)

You can use `PUSH SW 1` and `PUSH SW 2` buttons to see whether your robot has been properly assembled. This process tests the left and right DYNAMIXEL's and the [OpenCR] board.

![](/assets/images/platform/turtlebot3/opencr/opencr_models.png)

1. After assembling TurtleBot3, connect the power to [OpenCR] and turn on the power switch of OpenCR. The red `Power LED` will be turned on.
2. Place the robot on the flat ground in a wide open area. For the test, safety radius of 1 meter (40 inches) is recommended.
3. Press and hold `PUSH SW 1` for a few seconds to command the robot to move 30 centimeters (about 12 inches) forward.
4. Press and hold `PUSH SW 2` for a few seconds to command the robot to rotate 180 degrees in place.

[OpenCR]: /docs/en/parts/controller/opencr10/
