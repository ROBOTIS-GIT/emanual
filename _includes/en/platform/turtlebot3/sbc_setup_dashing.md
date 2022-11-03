
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

### [Download SBC OS Image](#download-sbc-os-image)
Download the correct image file for your hardware and ROS version.  
ROS2 Dashing requires Ubuntu 18.04.  

{% capture download_01 %}
[![](/assets/images/icon_download.png) **Download for Rasbperry Pi 4** `ubuntu-18.04.4-preinstalled-server-arm64+raspi4.img.xz` OS image](http://old-releases.ubuntu.com/releases/18.04.4/){: .blank}
{% endcapture %}
<div class="notice--success">{{ download_01 | markdownify }}</div>

{% capture download_02 %}
[![](/assets/images/icon_download.png) **Download for Raspberry Pi 3B+** `ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz` OS image](http://old-releases.ubuntu.com/releases/18.04.3/){: .blank}
{% endcapture %}
<div class="notice--success">{{ download_02 | markdownify }}</div>

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

### Boot Up the Raspberry Pi
1. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.
2. Connect input devices to the USB port of Raspberry Pi
3. Insert the microSD card.
4. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.
5. Login with ID `ubuntu` and PASSWORD `ubuntu`.  
  Once logged in, the system will request to change the password.

HDMI cable has to be connected before powering the Raspberry Pi, or else the HDMI port of the Raspberry Pi will be disabled.
{: .notice--warning}

### Configure the Raspberry Pi
1. Open automatic update setting file.
  ```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
  ```

2. Edit to disable automatic update settings as below.
  ```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
  ```  
  Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.

3. Enter below command to configure the WiFi network setting.
  ```bash
$ sudo nano /etc/netplan/50-cloud-init.yaml
  ```

4. When the editor is opened, append below contents at the end of the file.  
  Replace the `WIFI_SSID` and `WIFI_PASSWORD` with your wifi SSID and password.  
  ![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  
  Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.

5. Apply all configuration for the renderers, and then reboot the Raspberry Pi.
  ```bash
$ sudo netplan apply
$ reboot
  ```

6. Set the `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask the `systemd` process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

7. Disable Suspend and Hibernation
  ```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  ```

8. Install and enable the SSH
  ```bash
$ sudo apt install ssh
$ sudo systemctl enable --now ssh
$ reboot
  ```

9. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. The default password is **ubuntu**.
  ```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
  ```

### [Add Swap Space](#add-swap-space)
1. Enter the command below to create 2GB swap space.  
  ```bash
$ sudo swapoff /swapfile
$ sudo fallocate -l 2G /swapfile
$ sudo chmod 600 /swapfile
$ sudo mkswap /swapfile
$ sudo swapon /swapfile
$ sudo nano /etc/fstab
  ```
  You can ignore below error when entering `swapoff /swapfile` command.  
```bash
swapoff: /swapfile: swapoff failed: No such file or directory
```

2. When the editor opens the fstab file, append below contents at the end of the file.
  ```bash
/swapfile swap swap defaults 0 0
  ```

3. Check if 2GB of swap space is correctly configured.
```bash
$ sudo free -h
                 total        used        free      shared  buff/cache   available
Mem:           912M         97M        263M        4.4M        550M        795M
Swap:          2.0G          0B        2.0G
```
{% capture ubuntu_blog %}
Please refer to the Ubuntu Blog below for more useful information.  
- [Improving Security with Ubuntu](https://ubuntu.com/blog/steps-to-maximise-robotics-security-with-ubuntu)
- [Improving User Experience of TurtleBot3 Waffle Pi](https://ubuntu.com/blog/building-a-better-turtlebot3)
- [How to set up TurtleBot3 Waffle Pi in minutes with Snaps](https://ubuntu.com/blog/how-to-set-up-turtlebot3-in-minutes-with-snaps)
{% endcapture %}
<div class="notice--success">{{ ubuntu_blog | markdownify }}</div>

### Install ROS 2 Dashing Diademata

**Reference**: [Official ROS 2 Dashing Installation Guide](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)
{: .notice}

1. Open a terminal on **SBC**

2. Setup locale
  ```bash
$ sudo apt update && sudo apt install locales
$ sudo locale-gen en_US en_US.UTF-8
$ sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
$ export LANG=en_US.UTF-8
  ```
3. Setup sources
  ```bash
$ sudo apt update && sudo apt install curl gnupg2 lsb-release
$ sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
  ```
4. Install ROS 2 packages
  ```bash
$ sudo apt update
$ sudo apt install ros-dashing-ros-base
  ```

5. Install and Build ROS Packages.
```bash
$ sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential
$ sudo apt install ros-dashing-hls-lfcd-lds-driver
$ sudo apt install ros-dashing-turtlebot3-msgs
$ sudo apt install ros-dashing-dynamixel-sdk
$ mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
$ git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/turtlebot3_ws/src/turtlebot3
$ rm -r turtlebot3_cartographer turtlebot3_navigation2
$ cd ~/turtlebot3_ws/
$ echo 'source /opt/ros/dashing/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
$ colcon build --symlink-install --parallel-workers 1
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```

6. USB Port Setting for OpenCR
```bash
$ sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

7. ROS Domain ID Setting
In ROS2 DDS communication, `ROS_DOMAIN_ID` must be matched between **Remote PC** and **TurtleBot3** for communication under the same network environment. Following commands shows how to assign a `ROS_DOMAIN_ID` to SBC in TurtleBot3.
- A default ID of **TurtleBot3** is `30`.  
- Configuring the `ROS_DOMAIN_ID` of Remote PC and SBC in TurtleBot3 to `30` is recommended.  

```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```

**WARNING** : Do not use an identical ROS_DOMAIN_ID with others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}

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
$ cd ~/turtlebot3_ws/src
$ git clone -b dashing-devel https://github.com/ROBOTIS-GIT/ld08_driver.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

2. Export the LDS_MODEL to the bashrc file. Depending on your LDS model, use `LDS-01` or `LDS-02`.
```bash
$ echo 'export LDS_MODEL=LDS-02' >> ~/.bashrc
$ source ~/.bashrc
```
