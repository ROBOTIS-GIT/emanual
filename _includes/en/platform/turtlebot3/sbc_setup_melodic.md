
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
1. Download the `ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz` image for your SBC from the links below.
  - [Ubuntu 18.04.3 Preinstalled Server ARM64 for Raspberry Pi3](http://old-releases.ubuntu.com/releases/18.04.3/ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz)

2. Unzip the downloaded image.

3. Burn the image to the microSD card.
  - Use `Restore Disk Image` option in the `Disks` utility in Ubuntu.
  - Run the utility and select the restore image, then burn to the selected micro SD card.
<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read More about other micro SD card burning methods
{: .notice--success}
</summary>
- You can use the [etcher.io](https://etcher.io/) to burn the image.
- You can also use 'dd' command in Linux or use application 'win32 Disk Imager' in Windows. For a complete guide, refer to the instruction for [Linux](https://elinux.org/RPi_Easy_SD_Card_Setup#Using_the_Linux_command_line) or [Windows](https://elinux.org/RPi_Easy_SD_Card_Setup#Using_the_Win32DiskImager_program).
</details>


### Boot Up the Raspberry Pi
1. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.
2. Connect input devices to the USB port of Raspberry Pi
3. Insert the microSD card.
4. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.

### Configure the Raspberry Pi
1. Log in with default username(`ubuntu`) and password(`ubuntu`). After logged in, system will ask you whether you change the password or not.

2. Disable Automatic update
  ```bash
$ sudo nano /etc/apt/apt.conf.d/20auto-upgrades
  ```

3. Change the update settings as below.
  ```bash
APT::Periodic::Update-Package-Lists "0";
APT::Periodic::Unattended-Upgrade "0";
  ```

4. Enter below commands to open the WiFi network setting configuration.
  ```bash
$ sudo nano /etc/netplan/50-cloud-init.yaml
  ```

5. When the editor is opened, append below contents at the end of the file.  
  ![](/assets/images/platform/turtlebot3/setup/ros2_sbc_netcfg.png)

6. Reboot the Raspberry Pi.
  ```bash
$ sudo reboot
  ```

7. Set the `systemd` to prevent boot-up delay even if there is no network at startup. Run the command below to set mask the `systemd` process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

8. Disable Suspend and Hibernation
  ```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
  ```

9. Enable the SSH
  ```bash
$ sudo apt install ssh
$ sudo systemctl enable --now ssh
$ reboot
  ```

10. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. The default password is **ubuntu**.
  ```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
  ```

### Install ROS Melodic Morenia

Enter below commands to the terminal one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic_rp3.sh).  
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic_rp3.sh
$ chmod 755 ./install_ros_melodic_rp3.sh
$ bash ./install_ros_melodic_rp3.sh
```

If the above installation fails, please refer to [the official ROS1 Melodic installation guide](http://wiki.ros.org/melodic/Installation/Ubuntu).

### Install ROS Packages
1. Install and build TurtleBot3 packages.
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

2. USB Port Setting
  ```bash
$ rosrun turtlebot3_bringup create_udev_rules
  ```

### Network Configuration
1. Network configuration for ROS.
  ```bash
$ nano ~/.bashrc
  ```
2. Go to the end of file with `Ctrl`+`END` or `Alt`+`/`, then modify the IP adddresses of `ROS_MASTER_URI` and the `ROS_HOSTNAME`.
  ```bash
export ROS_MASTER_URI=http://{IP_ADDRESS_OF_REMOTE_PC}:11311
export ROS_HOSTNAME={IP_ADDRESS_OF_RASPBERRY_PI_3}
  ```
3. Save the file and exit the nano editor.
4. Apply changes with the command below.
  ```bash
$ source ~/.bashrc
  ```
  