
## [OpenCR Setup](#opencr-setup)

Following commands set up the OpenCR port authorization for Raspberry Pi.

1. Open a terminal from **Raspberry Pi** with `Ctrl` + `Alt` + `T` and enter the commands below.
  ```bash
$ cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup 
$ sudo cp ./99-turtlebot3-cdc.rules /etc/udev/rules.d/ 
$ sudo udevadm control --reload-rules 
$ sudo udevadm trigger
  ```

2. Install Dependencies to Run 32bit Executables.
  ```bash
$ sudo dpkg --add-architecture armhf
$ sudo apt-get update
$ sudo apt-get install libc6:armhf
  ```

3. Depending on the platform, use either `burger` or `waffle` for the **OPENCR_MODEL** name.
  ```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=burger
$ cd && rm -rf opencr_update.tar.bz2
  ```

4. Download the firmware and loader, then extract the file.
  ```bash
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
$ tar -xjf ./opencr_update.tar.bz2
  ```

5. Upload firmware to the OpenCR.
  ```bash
$ cd ~/opencr_update
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
  ```

6. The following window shows you the result of a firmware upload of TurtleBot3 Burger to OpenCR.  
  Make sure `jump_to_fw` message is displayed on the bottom of the window. 
  ```bash
aarch64
arm
OpenCR Update Start..
opencr_ld_shell ver 1.0.0
opencr_ld_main
[  ] file name   	: burger.opencr
[  ] file size   	: 168 KB
[  ] fw_name     	: burger
[  ] fw_ver      	: V180903R1
[OK] Open port   	: /dev/ttyACM0
[  ]
[  ] Board Name  	: OpenCR R1.0
[  ] Board Ver   	: 0x17020800
[  ] Board Rev   	: 0x00000000
[OK] flash_erase 	: 0.96s
[OK] flash_write 	: 1.92s
[OK] CRC Check   	: 10E28C8 10E28C8 , 0.006000 sec
[OK] Download
[OK] jump_to_fw
  ```

7. If firmware upload fails, try uploading with the recovery mode. Below sequence activates the recovery mode of OpenCR. Under the recovery mode, the `STATUS` led of [OpenCR] will blink periodically.
  - Hold down the `PUSH SW2` button.
  - Press the `Reset` button.
  - Release the `Reset` button.
  - Release the `PUSH SW2` button.
  ![](/assets/images/parts/controller/opencr10/bootloader_19.png)
