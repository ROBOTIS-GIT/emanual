
{% capture notice_01 %}
**NOTE**: To use OpenMANIPULATOR-X, you need to upload a firmware into OpenCR by using either **shell script** or **Arduino IDE**.

1. **[Shell script](#shell-script)** is highly recommended to upload the firmware as it uses a pre-built binary file
2. **[Arduino IDE](#arduino-ide)**, which builds the provided source code and uploads the generated binary file, can be used to modify TurtleBot3's fimrware.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING** : Be sure to connect all DYNAMIXEL's with OpenCR before OpenCR Setup. Otherwise, it may cause unexpected errors for Raspberry Pi.
{: .notice--warning}

<!-- ### [Shell Script](#shell-script)
**[TurtleBot3]**
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
``` -->

After OpenMANIPULATOR is properly mounted on TurtleBot3, you need to update firmware inside the board to control all DYNAMIXEL’s using OpenCR board. Follow the provided instructions.

1. **[TurtleBot3 SBC]** Upload a firmware into Raspberry Pi (SBC) with the following commands.

```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2
$ tar -xvf opencr_update.tar.bz2
$ cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
```

2. When the firmware is completely uploaded, you will see a text string at the terminal: **jump_to_fw**

{% capture notice_01 %}
**WARNING**: When the firmware is completely uploaded, OpenCR board will reboot, and the pose of OpenMANIPULATOR-X changes its pose to the initial pose. Thus, to avoid possible pysical damage by the robot, be sure to make the same pose of the robot as the one in the image before uploading the firmware to OpenCR.  
![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)
{% endcapture %}

<div class="notice--warning">{{ notice_01 | markdownify }}</div>

### [Arduino IDE](#arduino-ide)

Maintenance for Arduino IDE firmware upload is in progress.
{: .notice}

<!-- **[Remote PC]**
- Before you following step, please setup Arduino IDE.

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

- OpenCR firmware (or the source) for TurtleBot3 with OpenMANIPULATOR is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.

- Go to `File` → `Examples` → `TurtleBot3` → `turtlebot3_with_open_manipulator` → `turtlebot3_with_open_manipulator_core`.

![](/assets/images/platform/turtlebot3/manipulation/upload_core.png)

- Click `Upload` button to upload the firmware to OpenCR.

![](/assets/images/platform/turtlebot3/manipulation/upload_core_1.png)

**NOTE**: If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR and try to upload the firmware again.
{: .notice--info}

**TIP**: The DYNAMIXEL ids can be changed in [`open_manipulator_driver.h`][manipulator_id] in turtlebot3_with_open_manipulator folder
{: .notice--success}

- When firmware upload is completed, `jump_to_fw` text string will be printed on the screen. -->
