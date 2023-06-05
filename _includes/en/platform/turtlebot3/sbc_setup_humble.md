
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

### [Prepare microSD Card and Reader](#prepare-microsd-card-and-reader)
If you PC do not have a microSD slot, please use a microSD card reader to burn the recovery image.  
![](/assets/images/platform/turtlebot3/setup/micro_sd_reader.png)

The microSD card reader is not included in the TurtleBot3 package.
{: .notice--warning}

### Install Raspberry Pi Imager
Download the `Raspberry Pi Imager` to install Ubuntu Server 22.04 for Raspberry Pi.  
If the Raspberry Pi Imager is already installed, update to the latest version.  
Please refer to [this article](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/) to find more information about Raspberry Pi Imager.

{% capture download_rpi_imager %}
[![](/assets/images/icon_download.png) **Download** Raspberry Pi Imager from raspberrypi.org](https://www.raspberrypi.org/software/){: .blank}
{% endcapture %}
<div class="notice--success">{{ download_rpi_imager | markdownify }}</div>

### Install Ubuntu 22.04
1. Run Raspberry Pi Imager
2. Click `CHOOSE OS`.  
3. Select `Other gerneral-purpose OS`.  
4. Select `Ubuntu`.  
5. Select `Ubuntu Server 22.04.5 LTS (64-bit)` that support RPi 3/4/400.
6. Click `CHOOSE STORAGE` and select the micro SD card.
7. Click `WRITE` to install the Ubuntu.

### Configure the Raspberry Pi

HDMI cable must be connected before powering the Raspberry Pi, or else the HDMI port of the Raspberry Pi will be disabled.
{: .notice--warning}

1. Boot Up the Raspberry Pi  
  a. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.  
  b. Connect input devices to the USB port of Raspberry Pi.  
  c. Insert the microSD card.  
  d. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.  
  e. Login with ID `ubuntu` and PASSWORD `ubuntu`. Once logged in, you'll be asked to change the password.

2. Open the network configuration file with the command below.  
```bash
$ sudo nano /writable/etc/netplan/50-cloud-init.yaml
```  

3. When the editor is opened, edit the content as below while replacing the `WIFI_SSID` and `WIFI_PASSWORD` with your actual wifi SSID and password.  
![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  

4. Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  


5. Enter the command below to edit automatic update setting file.  
```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

6. Change the update settings as below.
```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
```

7. Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.  

8. Set the `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask the `systemd` process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

9. Disable Suspend and Hibernation
```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

10. Reboot the Raspberry Pi.
```bash
$ reboot
```

11. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. Make sure to use the password you set in `Step 1`.
```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
```

12. Install ROS2 Humble Hawksbill  
Follow the instruction in [the official ROS2 Humble installation guide](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html).

13. Install and Build ROS Packages.  
Building the `turtlebot3` package may take longer than an hour. Please use the SMPS to ensure the system is always powered.
```bash
$ sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential
$ sudo apt install ros-humble-hls-lfcd-lds-driver
$ sudo apt install ros-humble-turtlebot3-msgs
$ sudo apt install ros-humble-dynamixel-sdk
$ sudo apt install libudev-dev
$ mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
$ git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ git clone -b ros2-devel https://github.com/ROBOTIS-GIT/ld08_driver.git
$ cd ~/turtlebot3_ws/src/turtlebot3
$ rm -r turtlebot3_cartographer turtlebot3_navigation2
$ cd ~/turtlebot3_ws/
$ echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
$ colcon build --symlink-install --parallel-workers 1
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```

14. USB Port Setting for OpenCR
```bash
$ sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

15. ROS Domain ID Setting
In ROS2 DDS communication, `ROS_DOMAIN_ID` must be matched between **Remote PC** and **TurtleBot3** for communication under the same network environment. Following commands shows how to assign a `ROS_DOMAIN_ID` to SBC in TurtleBot3.
- A default ID of **TurtleBot3** is `30`.  
- Configuring the `ROS_DOMAIN_ID` of Remote PC and SBC in TurtleBot3 to `30` is recommended.  

```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```

**WARNING** : Do not use an identical ROS_DOMAIN_ID with others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}

### LDS Configuration
The TurtleBot3 LDS has been updated to LDS-02 since 2022.  
If you have purchased TurtleBot3 after 2022, please use `LDS-02` for the LDS_MODEL.

|LDS-01|LDS-02|
|:---:|:---:|
|![](/assets/images/platform/turtlebot3/appendix_lds/lds_small.png)|![](/assets/images/platform/turtlebot3/appendix_lds/lds_ld08_small.png)|

Depending on your LDS model, use `LDS-01` or `LDS-02`.
```bash
$ echo 'export LDS_MODEL=LDS-02' >> ~/.bashrc
```

Apply changes with the command below.
```bash
$ source ~/.bashrc
```

**This is it! Now you are done with SBC setup :)**  
Next Step : [OpenCR Setup](/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup)
{: .notice--success}


{% capture ubuntu_blog %}
Please refer to the Ubuntu Blog below for more useful information.  
- [Improving Security with Ubuntu](https://ubuntu.com/blog/steps-to-maximise-robotics-security-with-ubuntu)
- [Improving User Experience of TurtleBot3 Waffle Pi](https://ubuntu.com/blog/building-a-better-turtlebot3)
- [How to set up TurtleBot3 Waffle Pi in minutes with Snaps](https://ubuntu.com/blog/how-to-set-up-turtlebot3-in-minutes-with-snaps)
{% endcapture %}
<div class="notice--success">{{ ubuntu_blog | markdownify }}</div>
