
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>

## [SBC Setup](#sbc-setup)

{% capture warning_01 %}
**WARNING**
- This SBC Setup section is specifically written for **Raspberry Pi 3B+** which is the current official TurtleBot3 SBC.
- This process may take long time. Please do not use battery while following this section.
- An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.
- In order to use the webOS Robotics Platform, please refer to [webOS Robotics Platform](https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions) instruction. Packages will be cross-compiled using OpenEmbedded on a higher performance PC and an image file is created.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

### [Prepare microSD Card and Reader](#prepare-microsd-card-and-reader)
If you PC do not have a microSD slot, please use a microSD card reader to burn the recovery image.  
![](/assets/images/platform/turtlebot3/setup/micro_sd_reader.png)

### [Download TurtleBot3 SBC Image](#download-turtlebot3-sbc-image)
Download the correct image file for your hardware and ROS version.  
Foxy version images are created based on Ubuntu 20.04.  

- [![](/assets/images/icon_download.png) **Raspberry Pi 3B+** ROS2 Foxy image(Ubuntu 20.04 based)](https://www.robotis.com/service/download.php?no=2058){: .blank}
  - **SHA256** : e1916b75573e3944c72552664ee1e32e9be32a026bd5b4323d0a4b5778243a1e

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

[![](/assets/images/icon_download.png) Download Raspberry Pi Imager from raspberrypi.org](https://www.raspberrypi.org/software/){: .blank}

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

### ROS2 Network Configuration
In ROS2 DDS communication, `ROS_DOMAIN_ID` must be matched between **Remote PC** and **TurtleBot3** for communication under the same network environment.  
The default ROS Domain ID for TurtleBot3 is set to `30` in the ***.bashrc*** file.  
Please modify the ID to avoid any conflict when there are identical ID in the same network.

```
ROS_DOMAIN_ID=30 #TURTLEBOT3
```

**WARNING** : Do not use an identical ROS_DOMAIN_ID with others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}

**This is it! Now you are done with SBC setup :)**  
Next Step : [OpenCR Setup](/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup)
{: .notice--success}


<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Manual SBC Setup Instructions**
</summary>
Please be aware that this manual setup takes a lot more time than burning the recovery image file, but allows flexible choice of package installation. **This instruction is not recommended for the beginners**.

1. ![](/assets/images/icon_download.png) Download the latest `Ubuntu 20.04 server` image for your SBC from the link below.
  - [Ubuntu 20.04 Server 64-bit](https://ubuntu.com/download/raspberry-pi){: .blank}

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

8. When the editor is opened, enter below contents to the file.  
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

12. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. Make sure to use the password you set in `Step 5`.
  ```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
  ```

13. Install ROS2 Foxy Fiztroy  
Enter below commands to the Raspberry Pi terminal one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy_rp3.sh).  
```bash
$ sudo apt update
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy_rp3.sh
$ chmod 755 ./install_ros2_foxy_rp3.sh
$ bash ./install_ros2_foxy_rp3.sh
```
If the above installation fails, please refer to [the official ROS2 Foxy installation guide](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html).

14. Install and Build ROS Packages.
  ```bash
$ sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential
$ sudo apt install ros-foxy-hls-lfcd-lds-driver
$ sudo apt install ros-foxy-turtlebot3-msgs
$ sudo apt install ros-foxy-dynamixel-sdk
$ mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
$ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/turtlebot3_ws/src/turtlebot3
$ rm -r turtlebot3_cartographer turtlebot3_navigation2
$ cd ~/turtlebot3_ws/
$ echo 'source /opt/ros/foxy/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
$ colcon build --symlink-install --parallel-workers 1
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
  ```

15. USB Port Setting for OpenCR
```bash
$ sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

16. ROS Domain ID Setting
In ROS2 DDS communication, `ROS_DOMAIN_ID` must be matched between **Remote PC** and **TurtleBot3** for communication under the same network environment. Following commands shows how to assign a `ROS_DOMAIN_ID` to SBC in TurtleBot3.
- A default ID of **TurtleBot3** is `30`.  
- Configuring the `ROS_DOMAIN_ID` of Remote PC and SBC in TurtleBot3 to `30` is recommended.  

```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```

**WARNING** : Do not use an identical ROS_DOMAIN_ID with others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}
</details>

{% capture ubuntu_blog %}
Please refer to the Ubuntu Blog below for more useful information.  
- [Improving Security with Ubuntu](https://ubuntu.com/blog/steps-to-maximise-robotics-security-with-ubuntu)
- [Improving User Experience of TurtleBot3 Waffle Pi](https://ubuntu.com/blog/building-a-better-turtlebot3)
- [How to set up TurtleBot3 Waffle Pi in minutes with Snaps](https://ubuntu.com/blog/how-to-set-up-turtlebot3-in-minutes-with-snaps)
{% endcapture %}
<div class="notice--success">{{ ubuntu_blog | markdownify }}</div>
