
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>

## [SBC Setup](#sbc-setup)

{% capture warning_01 %}
**WARNING**
- This process may take long time. Please do not use battery while following this section.
- An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.
- In order to use the webOS Robotics Platform, please refer to [webOS Robotics Platform](https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions) instruction. Packages will be cross-compiled using OpenEmbedded on a higher performance PC and an image file is created.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

{% capture info_01 %}
TurtleBot3 Hardware is compatible with Jetson Nano SBC.  
Please refer to the video below in order to set up the Jetson Nano for TurtleBot3.  
The [Jetson Nano Developer Kit setup](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit) must be completed first.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fGEq_0aWpoA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
{% endcapture %}
<div class="notice--success">{{ info_01 | markdownify }}</div>

### [Prepare microSD Card and Reader](#prepare-microsd-card-and-reader)
If you PC do not have a microSD slot, please use a microSD card reader to burn the recovery image.  
![](/assets/images/platform/turtlebot3/setup/micro_sd_reader.png)

### [Download TurtleBot3 SBC Image](#download-turtlebot3-sbc-image)
Download the correct image file for your hardware and ROS version.  
Melodic version images are created based on Ubuntu 18.04.  

{% capture download_01 %}
[![](/assets/images/icon_download.png) **Download** `Raspberry Pi 3B+` ROS Melodic image](https://www.robotis.com/service/download.php?no=2011){: .blank}

**SHA256** : 312e1a5ad78447b901ae401ba31b2aaf94c1c760bdcafc60e2312df14e342640
{% endcapture %}
<div class="notice--success">{{ download_01 | markdownify }}</div>

{% capture download_02 %}
[![](/assets/images/icon_download.png) **Download** `Raspberry Pi 4B (2GB or 4GB)` ROS Melodic image](https://www.robotis.com/service/download.php?no=2065){: .blank}

**SHA256** : 676bbcfc27fc6990bdf1e026247008f0525d344ccfaa106dca6c53d0bf7f4de8
- Please note that this image may not compatible with Raspberry Pi 4B with 8GB RAM.
{% endcapture %}
<div class="notice--success">{{ download_02 | markdownify }}</div>

{% capture download_03 %}
[![](/assets/images/icon_download.png) **Download** `Raspberry Pi 4B (2GB or 4GB)` ROS Melodic image(Raspberry Pi OS based)](https://www.robotis.com/service/download.php?no=1905){: .blank}

**SHA256** : 73546c63d3056bfc5538acc187f54dab6c1601096df320e60e0842bcb1b03d34

- ROS Melodic recovery image based on Ubuntu 18.04 above is recommended.
- Please note that this image may not compatible with Raspberry Pi 4B with 8GB RAM.
{% endcapture %}
<div class="notice--success">{{ download_03 | markdownify }}</div>

The recovery image files can be modified without a prior notice.
{: .notice}

### [Unzip the downloaded image file](#unzip-the-downloaded-image-file)
Extract the `.img` file and save it in the local disk.

### Burn the image file
You can use various image burning tools.  
For example, `Raspberry Pi Imager` or Linux `Disks` utility can be used.  
Choose your preferred tool to burn the image to microSD.

#### Raspberry Pi Imager
Please refer to [this article](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/) to find more information about Raspberry Pi Imager.

{% capture download_rpi_imager %}
[![](/assets/images/icon_download.png) **Download** Raspberry Pi Imager from raspberrypi.org](https://www.raspberrypi.org/software/){: .blank}
{% endcapture %}
<div class="notice--success">{{ download_rpi_imager | markdownify }}</div>

![](/assets/images/platform/turtlebot3/setup/rpi_imager.gif)  
1. Click `CHOOSE OS`.  
2. Click `Use custom` and select the extracted `.img` file from local disk.  
3. Click `CHOOSE STORAGE` and select the microSD.  
4. Click `WRITE` to start burning the image.

#### Disks Utility
`Disks` utility is included in the recent Ubuntu Desktop. Search for "Disks" and launch the app.  

![](/assets/images/platform/turtlebot3/setup/disks.gif)  
1. Select the microSD card in the left panel.  
2. Select `Restore Disk Image` option.  
3. Open the `.img` file from local disk.  
4. Click `Start Restoring...` > `Restore` button.

### Resize the Partition
In order to reduce the size of recovery image file and to decrease the time to burn the image onto microSD, the recovery partition is minimized.  
Please resize the partition to use the unallocated space.

**Be aware of selecting an incorrect disk or a partition. Partitioning a system disk of your PC may cause a serious system malfunction.**
{: .notice--danger}

[![](/assets/images/icon_download.png) Download or install GParted GUI tool](https://gparted.org/download.php){: .blank}

![](/assets/images/platform/turtlebot3/setup/gparted.gif)  
1. Select microSD card from the menu (mounted location may vary by system).  
2. Right click on the yellow partition.  
3. Select `Resize/Move` option.  
4. Drag the right edge of the partition to all the way to the right end.  
5. Click `Resize/Move` button.  
6. Click the `Apply All Operations` green check button at the top.

### Configure the WiFi Network Setting

{% include en/platform/turtlebot3/ros_gpg_key_expiration_incident.md %}

1. Open a terminal window with `Alt`+`Ctrl`+`T` and go to the netplan directory in the microSD card.  
Start editing the `50-cloud-init.yaml` file with a superuser permission `sudo`.  
```bash
$ cd /media/$USER/writable/etc/netplan
$ sudo nano 50-cloud-init.yaml
```  
When the editor is opened, replace the `WIFI_SSID` and `WIFI_PASSWORD` with your wifi SSID and password.  
![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  
Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  
![](/assets/images/platform/turtlebot3/setup/network_setup.gif)  

If "No such file or directory" is returned, make sure the microSD is mounted to the system.
{: .notice--warning}

2. Boot Up the Raspberry Pi  
  a. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.  
  b. Connect input devices to the USB port of Raspberry Pi.  
  c. Insert the microSD card.  
  d. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.  
  e. Login with ID `ubuntu` and PASSWORD `turtlebot`.

HDMI cable has to be connected before powering the Raspberry Pi, or else the HDMI port of the Raspberry Pi will be disabled.
{: .notice--warning}

### ROS Network Configuration
Please follow the instructions below on the **SBC (Raspberry Pi)**.
1. Confirm the WiFi IP address.
  ```bash
$ ifconfig
  ```

2. Edit the `.bashrc` file.
  ```bash
$ nano ~/.bashrc
  ```

3. Find the `ROS_MASTER_URI` and `ROS_HOSTNAME` setting section, then modify the IP adddresses accordingly.
  ```bash
export ROS_MASTER_URI=http://{IP_ADDRESS_OF_REMOTE_PC}:11311
export ROS_HOSTNAME={IP_ADDRESS_OF_RASPBERRY_PI_3}
  ```

4. Save the file with `Ctrl` + `S` and exit the nano editor with `Ctrl` + `X`.

5. Apply changes with the command below.
  ```bash
$ source ~/.bashrc
  ```  
![](/assets/images/platform/turtlebot3/setup/ros1_sbc_netcfg.gif)

### NEW LDS-02 Configuration

|LDS-01|LDS-02|
|:---:|:---:|
|![](/assets/images/platform/turtlebot3/appendix_lds/lds_small.png)|![](/assets/images/platform/turtlebot3/appendix_lds/lds_ld08_small.png)|

The TurtleBot3 LDS has been updated to LDS-02 since 2022 models.  
Please follow the instructions below on the **SBC (Raspberry Pi)** of TurtleBot3.

1. Install the LDS-02 driver and update TurtleBot3 package
```bash
$ sudo apt update
$ sudo apt install libudev-dev
$ cd ~/catkin_ws/src
$ git clone -b develop https://github.com/ROBOTIS-GIT/ld08_driver.git
$ cd ~/catkin_ws/src/turtlebot3 && git pull
$ cd ~/catkin_ws && catkin_make
```

2. Export the LDS_MODEL to the bashrc file. Depending on your LDS model, use `LDS-01` or `LDS-02`.
```bash
$ echo 'export LDS_MODEL=LDS-01' >> ~/.bashrc
$ source ~/.bashrc
```

**This is it! Now you are done with SBC setup :)**  
Next Step : [OpenCR Setup](/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup)
{: .notice--success}

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Manual SBC Setup Instructions**
</summary>
Please be aware that this manual setup takes a lot more time than burning the recovery image file, but allows flexible choice of package installation. **This instruction is not recommended for the beginners**.

1. ![](/assets/images/icon_download.png) Download the `ubuntu-18.04.4-preinstalled-server-arm64+raspi3.img.xz` image on your PC.
  - [Ubuntu 18.04.4 Preinstalled Server ARM64 for Raspberry Pi3](http://old-releases.ubuntu.com/releases/18.04.4/){: .blank}

2. Extract the downloaded file.

3. Burn the `.img` file to the microSD card. You can use various image burning tools.  
  For example, `Raspberry Pi Imager` or Linux `Disks` utility can be used. Choose your preferred tool to burn the image to microSD.  
  ![](/assets/images/platform/turtlebot3/setup/rpi_imager.gif)  
  a. Click `CHOOSE OS`.  
  b. Click `Use custom` and select the extracted `.img` file from local disk.  
  c. Click `CHOOSE STORAGE` and select the microSD.  
  d. Click `WRITE` to start burning the image.

4. Boot Up the Raspberry Pi  
  a. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.  
  b. Connect input devices to the USB port of Raspberry Pi.  
  c. Insert the microSD card.  
  d. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.

5. Configure the Raspberry Pi  
  a. Log in with default username(`ubuntu`) and password(`ubuntu`). After logged in, system will ask you to change the password.  
  b. Open automatic update setting file.  
  ```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
  ```

6. Change the update settings as below.
  ```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
  ```
  a. Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  

7. Enter below command to configure the WiFi network setting.
```bash
$ sudo nano /etc/netplan/50-cloud-init.yaml
```

8. When the editor is opened, append below contents at the end of the file.  
  Replace the `WIFI_SSID` and `WIFI_PASSWORD` with your wifi SSID and password.  
  ![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  
  Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.

9. Reboot the Raspberry Pi.
  ```bash
$ sudo reboot
  ```

10. Set the `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask the `systemd` process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

11. Disable Suspend and Hibernation
  ```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  ```

12. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. The default password is **ubuntu**.
  ```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
  ```

13. Install ROS Melodic Morenia
Enter below commands to the terminal one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic_rpi.sh).  
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic_rpi.sh
$ chmod 755 ./install_ros_melodic_rpi.sh
$ bash ./install_ros_melodic_rpi.sh
```
If the above installation fails, please refer to [the official ROS Melodic installation guide](http://wiki.ros.org/melodic/Installation/Ubuntu).

14. Install and Build ROS Packages.
  ```bash
$ sudo apt install ros-melodic-rosserial-python ros-melodic-tf
$ mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src
$ sudo apt install ros-melodic-hls-lfcd-lds-driver
$ sudo apt install ros-melodic-turtlebot3-msgs
$ sudo apt install ros-melodic-dynamixel-sdk
$ git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws/src/turtlebot3
$ rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
$ cd ~/catkin_ws/
$ echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
$ cd ~/catkin_ws && catkin_make -j1
$ echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
  ```

15. USB Port Setting
```bash
$ rosrun turtlebot3_bringup create_udev_rules
```

16. ROS Network Configuration
Confirm the WiFi IP address and edit the `.bashrc` file
  ```bash
$ nano ~/.bashrc
  ```

17. Modify the IP adddresses of `ROS_MASTER_URI` and the `ROS_HOSTNAME`.
```bash
export ROS_MASTER_URI=http://{IP_ADDRESS_OF_REMOTE_PC}:11311
export ROS_HOSTNAME={IP_ADDRESS_OF_RASPBERRY_PI_3}
```

18. Save the file and exit the nano editor.

19. Apply changes with the command below.
```bash
$ source ~/.bashrc
```

</details>


{% capture ubuntu_blog %}
Please refer to the Ubuntu Blog below for more useful information.  
- [Improving Security with Ubuntu](https://ubuntu.com/blog/steps-to-maximise-robotics-security-with-ubuntu)
- [Improving User Experience of TurtleBot3 Waffle Pi](https://ubuntu.com/blog/building-a-better-turtlebot3)
- [How to set up TurtleBot3 Waffle Pi in minutes with Snaps](https://ubuntu.com/blog/how-to-set-up-turtlebot3-in-minutes-with-snaps)
{% endcapture %}
<div class="notice--success">{{ ubuntu_blog | markdownify }}</div>
