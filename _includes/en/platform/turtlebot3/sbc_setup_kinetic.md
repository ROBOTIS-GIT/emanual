
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

If you are using **Intel Joule**, please refer to [Intel Joule Setup][joule_setup]{: .popup} instruction.
{: .notice--danger}

### [Prepare microSD Card and Reader](#prepare-microsd-card-and-reader)
If you PC do not have a microSD slot, please use a microSD card reader to burn the recovery image.  
![](/assets/images/platform/turtlebot3/setup/micro_sd_reader.png)

### [Download TurtleBot3 SBC Image](#download-turtlebot3-sbc-image)
Download the correct image file for your hardware and ROS version.  
Kinetic version images use Raspberry Pi OS(Raspbian OS).  

- [![](/assets/images/icon_download.png) **Raspberry Pi 3B+** ROS1 Kinetic image](http://www.robotis.com/service/download.php?no=1738){: .blank}
  - **SHA256** : eb8173f3727db08087990b2c4e2bb211e70bd54644644834771fc8b971856b97

Raspberry Pi 4 does not support Ubuntu 16.04 nor Debian Jessie, therefore, ROS1 Kinetic is not available for Raspberry Pi 4.
{: .notice--warning}

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
`Disks` utility is included in recent Ubuntu Desktop. Search for "Disks" and launch the app.  

![](/assets/images/platform/turtlebot3/setup/disks.gif)  
1. Select the microSD card in the left panel.  
2. Select `Restore Disk Image` option.  
3. Open the `.img` file from local disk.  
4. Click `Start Restoring...` > `Restore` button.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Instructions for Intel Joule 570x**
</summary>
In case you use Intel Joule 570x, please follow the instructions below.  
Intel Joule is discontinued in 2017, and additional support is unavailable.

1. Download Ubuntu 16.04 image for Intel® Joule™  
  - [Download Ubuntu 16.04 for Intel® Joule™](http://people.canonical.com/~platform/snappy/tuchuck/desktop-final/tuchuck-xenial-desktop-iso-20170317-0.iso)

2. Create a bootable USB with the downloaded image.
3. Install Ubuntu from the USB
</details>

### Boot Up the Raspberry Pi
1. Connect the HDMI cable of the monitor to the HDMI port of Raspberry Pi.
2. Connect input devices to the USB port of Raspberry Pi
3. Insert the microSD card.
4. Connect the power (either with USB or OpenCR) to turn on the Raspberry Pi.

### Configure the Raspberry Pi

{% include en/platform/turtlebot3/ros_gpg_key_expiration_incident.md %}

1. After Raspbian OS is up and running, connect to the WiFi network that is connected with the PC.
2. Find the assigned IP address for Raspberry Pi with the command below. Usually wireless IP address for Raspberry Pi can be found under the `wlan0` section.
  ```bash
$ ifconfig
  ```
3. From your PC, open the terminal and connect to the Raspberry Pi with its IP address.  
  The default password is set as **turtlebot**.  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```
4. Once logged in to the Raspberry Pi, execute the commands below to sync time.  
  ```bash
$ sudo apt-get install ntpdate
$ sudo ntpdate ntp.ubuntu.com
  ```
5. Load Raspberry Pi configuration interface.
  ```bash
$ sudo raspi-config
  ```
6. Select `Advanced Options` > `Expand Filesystem` and exit.
7. Network configuration for ROS
  ```bash
$ nano ~/.bashrc
  ```
8. Go to the end of file with `Ctrl`+`END` or `Alt`+`/`, then modify the IP adddresses of `ROS_MASTER_URI` and the `ROS_HOSTNAME`.
  ```bash
export ROS_MASTER_URI=http://{IP_ADDRESS_OF_REMOTE_PC}:11311
export ROS_HOSTNAME={IP_ADDRESS_OF_RASPBERRY_PI_3}
  ```
9. Save the file and exit the nano editor.
10. Apply changes with the command below.
  ```bash
$ source ~/.bashrc
  ```

[joule_setup]: /docs/en/popup/turtlebot3/joule_setup
