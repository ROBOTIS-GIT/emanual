
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

### [Prepare microSD Card](#prepare-microsd-card)
You need a micro SD card reader to burn the OS image on your PC or laptop.

1. Download Raspbian with ROBOTIS TurtleBot3 restore image.
  - [Download TurtleBot3 Raspbian image for Raspberry Pi 3B+](http://www.robotis.com/service/download.php?no=1738)
  - SHA256 (image_rpi_20190429.img): 7a868c275169b1f02c04617cc0cce9654fd8222623c78b22d0a27c73a9609398
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

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read More about **Raspberry Pi 4B**
{: .notice--success}
</summary>
In case you use Raspberry Pi 4B, you can use the restore image below. However, please note that this image may not compatible with Raspberry Pi 4B with 8GB RAM.
- [Download TurtleBot3 Raspbian image for Raspberry Pi 4B](https://www.robotis.com/service/download.php?no=1905)
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read More about **Intel Joule 570x**
{: .notice--success}
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