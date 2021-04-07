
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

### [Prepare microSD Card](#prepare-microsd-card)
You need a micro SD card reader to burn the OS image on your PC or laptop.

1. Download the proper `Ubuntu 20.04.1(Focal) Preinstalled Server` image for your SBC from the links below.
  - [Ubuntu 20.04.1(Focal) Preinstalled Server for Raspberry Pi3(arm64)](http://cdimage.ubuntu.com/ubuntu-server/focal/daily-preinstalled/current/){: .blank}

2. Unzip the downloaded image.

3. Burn the image file(`.img`) to the microSD card.
  - Use `Restore Disk Image` option in the `Disks` utility in Ubuntu.
  - Run the utility and select the restore image, then burn to the selected micro SD card.  
  ![](/assets/images/platform/turtlebot3/setup/ubuntu_disks_restore_img.png)
<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Other micro SD card burning methods?**
{: .notice--success}
</summary>
You can also use the [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/) that supports Windows, Linux, and Mac OSX.  
![](/assets/images/platform/turtlebot3/setup/rpi_imager.png)
</details>


### Boot Up the Raspberry Pi
1. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.
2. Connect input devices to the USB port of Raspberry Pi
3. Insert the microSD card.
4. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.

### Configure the Raspberry Pi
1. Log in with default username(`ubuntu`) and password(`ubuntu`). After logged in, system will ask you to change the password.

2. Open automatic update setting file.
  ```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
  ```

3. Edit to disable automatic update settings as below.
  ```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
  ```  
  Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.

4. Enter below command to configure the WiFi network setting.
  ```bash
$ sudo nano /etc/netplan/50-cloud-init.yaml
  ```

5. When the editor is opened, append below contents at the end of the file.  
  Replace the `WIFI_SSID` and `WIFI_PASSWORD` with your wifi SSID and password.  
  ![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)  
  Save the file with `Ctrl`+`S` and exit with `Ctrl`+`X`.

6. Apply all configuration for the renderers, and then reboot the Raspberry Pi.
  ```bash
$ sudo netplan apply
$ reboot
  ```

7. Set the `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask the `systemd` process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

8. Disable Suspend and Hibernation
  ```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  ```

9. Install and enable the SSH
  ```bash
$ sudo apt install ssh
$ sudo systemctl enable --now ssh
$ reboot
  ```

10. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. The default password is **ubuntu**.
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

### Install ROS Foxy Fitzroy

- [Official ROS 2 Foxy Installation Guide](https://index.ros.org/doc/ros2/Installation/Foxy/Linux-Install-Debians/)

1. Open a terminal on **SBC**

2. Update and upgrade your software
  ```bash
$ sudo apt update && sudo apt upgrade
  ```
3. Setup locale
  ```bash
$ sudo locale-gen en_US en_US.UTF-8
$ sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
$ export LANG=en_US.UTF-8
  ```
4. Setup sources
  ```bash
$ sudo apt update && sudo apt install curl gnupg2 lsb-release
$ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
$ sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
  ```
5. Install ROS 2 packages
  ```bash
$ sudo apt update
$ sudo apt install ros-foxy-ros-base
  ```

### Install ROS Packages

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

### Environment Setup

#### Domain ID Allocation
In DDS communication, `ROS_DOMAIN_ID` must be matched between **Remote PC** and **TurtleBot3** for wireless communication under the same network environment. Following commands shows how to assign a `ROS_DOMAIN_ID` to SBC in TurtleBot3.
- A default ID of **TurtleBot3** is set as `0`.  
- To configure the `ROS_DOMAIN_ID` of Remote PC and SBC in TurtleBot3 to `30` is recommendable.  

1. Open a terminal on **SBC**
2. Use the following commands.
  ```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
  ```

**WARNING** : Do not use an identical ROS_DOMAIN_ID with others in the same network. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}
