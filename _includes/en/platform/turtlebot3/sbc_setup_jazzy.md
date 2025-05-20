## [SBC Setup](#sbc-setup)

{% capture warning_01 %}
**WARNING**
- This process may take long time. Do not attempt to complete setup on battery power, connect your SBC to a wall power supply.
- **An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.**
- In order to use the webOS Robotics Platform, please refer to [webOS Robotics Platform](https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions) for further instructions. Packages will be cross-compiled using OpenEmbedded on a higher performance PC and an image file created for installation on the SBC.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

### [Prepare microSD Card and Reader](#prepare-microsd-card-and-reader)
If your PC does not have a microSD slot, please use a microSD card reader to burn the recovery image.  
![](/assets/images/platform/turtlebot3/setup/micro_sd_reader.png)

The microSD card reader is not included in the TurtleBot3 package.
{: .notice--warning}

### Install Raspberry Pi Imager
Download the `Raspberry Pi Imager` to install Ubuntu Server 24.04 for Raspberry Pi.  
If the Raspberry Pi Imager is already installed, update to the latest version.  
Please refer to [this article](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/) to find more information about Raspberry Pi Imager.

{% capture download_rpi_imager %}
[![](/assets/images/icon_download.png) **Download** Raspberry Pi Imager from raspberrypi.org](https://www.raspberrypi.org/software/){: .blank}
{% endcapture %}
<div class="notice--success">{{ download_rpi_imager | markdownify }}</div>
  
<details>
<summary>

![](/assets/images/icon_unfold.png) **Click here to expand more details about How to install Raspberry Pi Imager.**
</summary>  
Install either the `deb` or `apt` rpi-imager release.

1. `deb`  
Download deb file  
![](/assets/images/platform/turtlebot3/sbc_setup/sbc_setup1.png)  
  ```bash
$ cd Downloads
$ sudo dpkg -i imager_[you_rversion]_amd64.deb #check the file name downloaded
  ```  
If you have any dependency errors, use the following command to force the install.
  ```bash
$ sudo apt-get install -f
$ rpi-imager
  ```    
2. `apt`

```bash
$ sudo apt install rpi-imager
$ rpi-imager
```
  
</details> 
  
### Install Ubuntu 24.04
1. Run Raspberry Pi Imager
2. Click `CHOOSE OS`.  
3. Select `Other gerneral-purpose OS`.  
4. Select `Ubuntu`.  
5. Select `Ubuntu Server 24.04.2 LTS (64-bit)` that support RPi 3/4/400.  
(Choose Server OS, not desktop OS)  
![](/assets/images/platform/turtlebot3/sbc_setup/sbc_setup_jazzy.png)  
6. Click `CHOOSE STORAGE` and select the micro SD card.
7. Click `Next` to install Ubuntu.  
8. Click `Edit Setting` for wifi and ssh setting.  
![](/assets/images/platform/turtlebot3/sbc_setup/sbc_config_set.png)  
9. Set `username and password`, `Configure wireless LAN`, `Wireless LAN country`. And activate `Enable SSH` with `Use password authenication` in SERVIES tab.  
![](/assets/images/platform/turtlebot3/sbc_setup/sbc_config_set2.png)
![](/assets/images/platform/turtlebot3/sbc_setup/sbc_config_set3.png)  
10. By completing this configuring setup process, the following Wi-Fi configuration steps (up to step 4) can be skipped.  

### Configure the Raspberry Pi

The HDMI cable must be connected before powering on the Raspberry Pi, or the HDMI port of the Raspberry Pi will be disabled.
{: .notice--warning}

1. Boot Up the Raspberry Pi  
  \* [More information about where to connect HDMI, power and input devices is available here](https://www.raspberrypi.com/documentation/computers/getting-started.html)  
  a. Connect the HDMI cable to the HDMI port of Raspberry Pi.  
  b. Connect input devices (generally keyboard) to the USB port of the Raspberry Pi.  
  c. Insert the microSD card into Raspberry Pi.  
  d. Connect the power (either USB or OpenCR) to turn on the Raspberry Pi.  
  e. Login with ID `ubuntu` and PASSWORD `ubuntu`. Once logged in, you'll be asked to change the password.  
  ![](/assets/images/platform/turtlebot3/sbc_setup/sbc_setup3.png)  

2. Open the network configuration file with the command below.  
**[TurtleBot3 SBC]**  
```bash
$ sudo nano /etc/netplan/50-cloud-init.yaml
```  

3. Edit the content to match the image below while replacing `WIFI_SSID` and `WIFI_PASSWORD` with your actual wifi SSID and password.  
![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  

4. Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  


5. Enter the command below to edit the automatic update settings file.  
**[TurtleBot3 SBC]**  
```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

6. Change the update settings to match those below.  
**[TurtleBot3 SBC]**  
```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
```

7. Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  

8. Set `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask for the `systemd` process using the following command.  
**[TurtleBot3 SBC]**  
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

9. Disable Suspend and Hibernation  
**[TurtleBot3 SBC]**  
```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

10. Reboot the Raspberry Pi.  
**[TurtleBot3 SBC]**  
```bash
$ sudo reboot
```

11. After rebooting the Raspberry Pi, if you wish to work from a Remote PC using SSH, use the command below from the remote PC terminal. Make sure to use the password you set in `Step 1`.  
**[Remote PC]**  
```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click here to expand more details about how to connect through ssh**
</summary>

1. Edit the SSH configuration files  
**[TurtleBot3 SBC]**  
```bash
$ sudo nano /etc/ssh/sshd_config.d/50-cloud-init.conf
```  
![](/assets/images/platform/turtlebot3/sbc_setup/sshd_config2.png)  
2. Install net-tools and check your ip.  
**[TurtleBot3 SBC]**  
```bash
$ reboot
$ sudo apt update
$ sudo apt install net-tools
$ ifconfig
```  
![](/assets/images/platform/turtlebot3/sbc_setup/sshd_config3.png)  
3. Enter the command below on the `remote PC` and use your `password` for the Ubuntu system.  
**[Remote PC]**  
```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
```  
</details>

## Install packages on Raspberry PI

<details>
<summary>
![](/assets/images/icon_unfold.png) **If you are using the TurtleBot3 2GB, make sure to create swap memory for building packages.** Otherwise, you may run out of memory and package building may fail.
</summary>
- Create 2GB swap memory.
**[TurtleBot3 SBC]**  
```bash
$ sudo fallocate -l 2G /swapfile
$ sudo chmod 600 /swapfile
$ sudo mkswap /swapfile
$ sudo swapon /swapfile
```
- The following command ensures that the swap file is automatically activated when the system is rebooted.  
```bash
$ echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```
- Check swap memory.  
```bash
$ free -h
```  
![](/assets/images/platform/turtlebot3/sbc_setup/swap.png)
</details>

1. Install ROS 2 Jazzy Jalisco  
**[TurtleBot3 SBC]**  
Follow the instructions from [the official ROS 2 Jazzy installation guide](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debians.html).  Installing ROS-Base(Bare Bones) is recommended.

2. Install and Build ROS Packages.  
Building the `turtlebot3` package may take longer than an hour. Please use a wall plug power supply to ensure the system is always powered.  
**[TurtleBot3 SBC]**  
```bash
$ sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential
$ sudo apt install ros-jazzy-hls-lfcd-lds-driver
$ sudo apt install ros-jazzy-turtlebot3-msgs
$ sudo apt install ros-jazzy-dynamixel-sdk
$ sudo apt install libudev-dev
$ mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/turtlebot3.git
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/ld08_driver.git
$ cd ~/turtlebot3_ws/src/turtlebot3
$ rm -r turtlebot3_cartographer turtlebot3_navigation2
$ cd ~/turtlebot3_ws/
$ echo 'source /opt/ros/jazzy/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
$ colcon build --symlink-install --parallel-workers 1
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```

3. USB Port Settings for OpenCR  
**[TurtleBot3 SBC]**  
```bash
$ sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

4. ROS Domain ID Setting
In ROS 2 DDS communication, `ROS_DOMAIN_ID` must match between the **Remote PC** and **TurtleBot3** for communication in the same network environment.The following commands show how to assign a `ROS_DOMAIN_ID` to the SBC of the TurtleBot3.
- The default ID of the **TurtleBot3** is `30`.
- Configuring the `ROS_DOMAIN_ID` for the Remote PC and SBC of the TurtleBot3 to `30` is recommended.  
**[TurtleBot3 SBC]**  
```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```

**WARNING** : Do not use an identical ROS_DOMAIN_ID to others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}

### LDS Configuration
The TurtleBot3 LDS has been updated to the LDS-02 since 2022.  
If you have purchased a TurtleBot3 after 2022, please use `LDS-02` for your LDS_MODEL.

|LDS-01|LDS-02|
|:---:|:---:|
|![](/assets/images/platform/turtlebot3/appendix_lds/lds_small.png)|![](/assets/images/platform/turtlebot3/appendix_lds/lds_ld08_small.png)|

Depending on your LDS model, use `LDS-01` or `LDS-02`.  
**[TurtleBot3 SBC]**  
```bash
$ echo 'export LDS_MODEL=LDS-02' >> ~/.bashrc
```

Apply changes with the command below.  
**[TurtleBot3 SBC]**  
```bash
$ source ~/.bashrc
```

### [Raspberry Pi Camera](#raspberry-pi-camera)
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/Pi-Camera-front.jpg)

Introducing the use of the RPi camera with TurtleBot3. There are various ways to publish the output of a RPi camera as a topic.  
One method is to use the `camera-ros` package, and another method is to use the `v4l2-camera` package.  

<details>
<summary>
![](/assets/images/icon_unfold.png) **Method 1. Using the camera-ros package**  
</summary>

This method is suitable for Raspberry Pi cameras using the libcamera stack. It is ideal for projects that demand high-quality imaging and fine-tuned control over camera settings. For more information about camera_ros, see the [camera_ros documentation](https://docs.ros.org/en/ros2_packages/jazzy/api/camera_ros/).

1. Install `camera-ros`, `ros-jazzy-image-transport-plugins`, `v4l-utils`.  
**[TurtleBot3 SBC]**  
```bash
$ sudo apt-get install ros-jazzy-camera-ros ros-jazzy-image-transport-plugins v4l-utils
```
- `camera-ros`: A package that publishes camera output as a topic.
- `ros-jazzy-image-transport-plugins`: Converts image_raw to compressed images for smoother transmission.  
- `v4l-utils`: A utility that assists with connection.

2. Run camera_node.  
**[TurtleBot3 SBC]**  
```bash
$ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=320 -p height:=240
```

</details>

<details>
<summary>
![](/assets/images/icon_unfold.png) **Method 2. Using the v4l2-camera package**
</summary>

This method is better suited for USB cameras and legacy Raspberry Pi camera setups. It relies on the V4L2 (Video4Linux2) framework, making it simpler to set up and compatible with a broader range of devices. For more information about v4l2_camera, see the [v4l2_camera documentation](https://docs.ros.org/en/jazzy/p/v4l2_camera/).

1. Install `ros-jazzy-v4l2-camera`, `raspi-config`, `ros-jazzy-image-transport-plugins`, `v4l-utils`.  
**[TurtleBot3 SBC]**  
```bash
$ sudo apt-get install ros-jazzy-v4l2-camera raspi-config ros-jazzy-image-transport-plugins v4l-utils
```
- `ros-jazzy-v4l2-camera`: A package that publishes camera output as a topic.
- `raspi-config`: A tool for configuring camera device connections on Raspberry Pi.  
- `ros-jazzy-image-transport-plugins`: Converts image_raw to compressed images for smoother transmission.  
- `v4l-utils`: A utility that assists with connection.

2. Run raspi-config.   
`v4l2-camera` package uses the legacy driver. So we must configure the use of the legacy driver. If this step is completed, the camera node of the camera-ros package will no longer be able to detect the camera. To use the camera-ros package after this step, you must disable the legacy driver again.  
**[TurtleBot3 SBC]**  
```bash
$ sudo raspi-config
```
Select `Interface Options`.  
![](/assets/images/platform/turtlebot3/sbc_setup/rpi_config1.png)  
Select  `I1` and set enable legacy camera support. This allows the use of the legacy driver, `bcm2835 MMAL`.
![](/assets/images/platform/turtlebot3/sbc_setup/rpi_config2.png)  

3. Reboot the System  
**[TurtleBot3 SBC]**  
```bash
$ sudo reboot
```

4. You can check camera_name by this command.  
**[TurtleBot3 SBC]**  
```bash
$ v4l2-ctl --list-devices
```
In this case, camera name is **mmal_service_16.1**.  
![](/assets/images/platform/turtlebot3/sbc_setup/camera_name.png)  

5. Run v4l2_camera_node.  
**[TurtleBot3 SBC]**  
```bash
$ ros2 run v4l2_camera v4l2_camera_node --ros-args -p image_size:=[320,240]
```

</details>  

<div class="notice--success">
**NOTE**  
To optimize camera data transmission speed, try the following methods.
- Use `/camera/image_raw/compressed`  
Subscribing directly to the `/camera/image_raw` topic can cause significant latency if the network is slow or bandwidth is limited. You can select `/camera/image_raw/compressed` in *rqt_image_view*.

- Adjust Resolution  
Higher resolutions require more bandwidth, which can cause lag. So, lowering the resolution can reduce latency and improve performance. 
</div>

> **Camera calibration**  
If you plan to use advanced vision features like camera calibration, you can find the detailed instructions [here](/docs/en/platform/turtlebot3/appendix_raspi_cam/#camera-calibration).  

> **Trouble Shooting**  
If the error message `Unable to open camera calibration file` appears, check the solution [here](/docs/en/platform/turtlebot3/appendix_raspi_cam/#trouble-shooting).  

{% capture ubuntu_blog %}
Please refer to the Ubuntu Blog posts below for more useful information.  
- [Improving Security with Ubuntu](https://ubuntu.com/blog/steps-to-maximise-robotics-security-with-ubuntu)
- [Improving User Experience of TurtleBot3 Waffle Pi](https://ubuntu.com/blog/building-a-better-turtlebot3)
- [How to set up TurtleBot3 Waffle Pi in minutes with Snaps](https://ubuntu.com/blog/how-to-set-up-turtlebot3-in-minutes-with-snaps)
{% endcapture %}
<div class="notice--primary">{{ ubuntu_blog | markdownify }}</div>

**This is it! Now you are done with SBC setup :)**  
Next Step : [OpenCR Setup](/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup)
{: .notice--primary}
