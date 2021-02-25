
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>

## [SBC Setup](#sbc-setup)

{% capture warning_01 %}
**WARNING**
- This SBC Setup section is specifically written for **Raspberry Pi 3B+** which is the current official TurtleBot3 SBC.
- This process may take long time. Please do not use battery while following this section.
- An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

### [Prepare microSD Card](#prepare-microsd-card)
You need a micro SD card reader to burn the OS image on your PC or laptop.

1. Download the proper `Ubuntu 20.04.1 Preinstalled Server` image for your SBC from the links below.
  - [Ubuntu 20.04.1 Preinstalled Server for Raspberry Pi3](http://cdimage.ubuntu.com/ubuntu-server/focal/daily-preinstalled/current/)

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
$ sudo reboot
  ```

9. After rebooting the Raspberry Pi, if you wish to work from the Remote PC using SSH, use below command from the remote PC terminal. The default password is **ubuntu**.
  ```bash
$ ssh ubuntu@{IP Address of Raspberry PI}
  ```

### Install ROS Noetic Ninjemys

Enter below commands to the terminal one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic_rp3.sh).  
```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic_rp3.sh
$ chmod 755 ./install_ros_noetic_rp3.sh
$ bash ./install_ros_noetic_rp3.sh
```

If the above installation fails, please refer to [the official ROS1 Noetic installation guide](http://wiki.ros.org/noetic/Installation/Ubuntu).

### Install ROS Packages
1. Install and build TurtleBot3 packages.
  ```bash
$ sudo apt install ros-noetic-rosserial-python ros-noetic-tf
$ sudo apt install ros-noetic-hls-lfcd-lds-driver
$ sudo apt install ros-noetic-turtlebot3-msgs
$ sudo apt install ros-noetic-dynamixel-sdk
$ cd ~/catkin_ws/src/
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws/src/turtlebot3
$ rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
$ cd ~/catkin_ws && catkin_make -j1
$ source ~/.bashrc
  ```

2. Install dependencies using rosdep.
  ```bash
$ sudo apt install python3-rosdep2 ros-noetic-rosbash
$ cd ~/catkin_ws && rosdep update && rosdep install --from-paths src --ignore-src -r -y
  ```

3. USB Port Setting
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
  