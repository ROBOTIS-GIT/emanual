---
layout: archive
lang: en
ref: turtlebot3_appendix_raspi_cam
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_raspi_cam/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 25"></div>

# [Appendix #Raspberry Pi Camera](#appendix-raspberry-pi-camera)

![](/assets/images/platform/turtlebot3/appendix_raspi_cam/Pi-Camera-front.jpg)

## [Overview](#overview)

[The Raspberry Pi Camera Module v2](https://www.raspberrypi.org/products/camera-module-v2/) replaced the original Camera Module in April 2016. The v2 Camera Module has a Sony IMX219 8-megapixel sensor (compared to the 5-megapixel OmniVision OV5647 sensor of the original camera).
The Camera Module can be used to take high-definition video, as well as stills photographs. It’s easy to use for beginners, but has plenty to offer advanced users if you’re looking to expand your knowledge. There are lots of examples online of people using it for time-lapse, slow-motion, and other video cleverness. You can also use the libraries we bundle with the camera to create effects.


## [Specifications](#specifications)


### [Hardware Specifications](#hardware-specifications)

| Items                          | Specifications                                                                            |
| ------------------------------ | ----------------------------------------------------------------------------------------- |
| Net price                      | $25                                                                                       |
| Size                           | Around 25 × 24 × 9 mm                                                                     |
| Weight                         | 3g                                                                                        |
| Still resolution               | 8 Megapixels                                                                              |
| Video modes                    | 1080p30, 720p60 and 640 × 480p60/90                                                       |
| Linux integration              | V4L2 driver available                                                                     |
| C programming API              | OpenMAX IL and others available                                                           |
| Sensor                         | [Sony IMX219](http://www.sony-semicon.co.jp/products_en/new_pro/april_2014/imx219_e.html) |
| Sensor                         | 3280 × 2464 pixels                                                                        |
| Sensor                         | 3.68 x 2.76 mm (4.6 mm diagonal)                                                          |
| Pixel size                     | 1.12 µm x 1.12 µm                                                                         |
| Optical size                   | 1/4"                                                                                      |
| Full-frame SLR lens equivalent | 35 mm                                                                                     |
| S/N ratio                      | 36 dB                                                                                     |
| Dynamic range                  | 67 dB @ 8x gain                                                                           |
| Sensitivity                    | 680 mV/lux-sec                                                                            |
| Dark current                   | 16 mV/sec @ 60 C                                                                          |
| Well capacity                  | 4.3 Ke-                                                                                   |
| Fixed focus                    | 1 m to infinity                                                                           |
| Focal length                   | 3.04 mm                                                                                   |
| Horizontal field of view       | 62.2 degrees                                                                              |
| Vertical field of view         | 48.8 degrees                                                                              |
| Focal ratio (F-Stop)           | 2.0                                                                                       |


### [Hardware features](#hardware-features)

| Available                                                                       | Implemented                                                                                |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| Chief ray angle correction                                                      | Yes                                                                                        |
| Global and rolling shutter                                                      | Rolling shutter                                                                            |
| Automatic exposure control (AEC)                                                | No - done by ISP instead                                                                   |
| Automatic white balance (AWB)                                                   | No - done by ISP instead                                                                   |
| Automatic black level calibration (ABLC)                                        | No - done by ISP instead                                                                   |
| Automatic 50/60 Hz luminance detection                                          | No - done by ISP instead                                                                   |
| Frame rate up to 120 fps                                                        | Max 90fps. Limitations on frame size for the higher frame rates (VGA only for above 47fps) |
| AEC/AGC 16-zone size/position/weight control                                    | No - done by ISP instead                                                                   |
| Mirror and flip                                                                 | Yes                                                                                        |
| Cropping                                                                        | No - done by ISP instead (except 1080p mode)                                               |
| Lens correction                                                                 | No - done by ISP instead                                                                   |
| Defective pixel cancelling                                                      | No - done by ISP instead                                                                   |
| 10-bit RAW RGB data                                                             | Yes - format conversions available via GPU                                                 |
| Support for LED and flash strobe mode                                           | LED flash                                                                                  |
| Support for internal and external frame synchronisation for frame exposure mode | No                                                                                         |
| Support for 2 × 2 binning for better SNR in low light conditions                | Anything output res below 1296 x 976 will use the 2 x 2 binned mode                        |
| Support for horizontal and vertical sub-sampling                                | Yes, via binning and skipping                                                              |
| On-chip phase lock loop (PLL)                                                   | Yes                                                                                        |
| Standard serial SCCB interface                                                  | Yes                                                                                        |
| Digital video port (DVP) parallel output interface                              | No                                                                                         |
| MIPI interface (two lanes)                                                      | Yes                                                                                        |
| 32 bytes of embedded one-time programmable (OTP) memory                         | No                                                                                         |
| Embedded 1.5V regulator for core power                                          | Yes                                                                                        |


### [Software features](#software-features)


| Software features             |                                                                                                                                                    |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Picture formats               | JPEG (accelerated), JPEG + RAW, GIF, BMP, PNG, YUV420, RGB888                                                                                      |
| Video formats                 | raw h.264 (accelerated)                                                                                                                            |
| Effects                       | negative, solarise, posterize, whiteboard, blackboard, sketch, denoise, emboss, oilpaint, hatch, gpen, pastel, watercolour, film, blur, saturation |
| Exposure modes                | auto, night, nightpreview, backlight, spotlight, sports, snow, beach, verylong, fixedfps, antishake, fireworks                                     |
| Metering modes                | average, spot, backlit, matrix                                                                                                                     |
| Automatic white balance modes | off, auto, sun, cloud, shade, tungsten, fluorescent, incandescent, flash, horizon                                                                  |
| Triggers                      | Keypress, UNIX signal, timeout                                                                                                                     |
| Extra modes                   | demo, burst/timelapse, circular buffer, video with motion vectors, segmented video, live preview on 3D models                                      |


### [Mechanical Drawing](#mechanical-drawing)

  - Camera Module v2 [PDF](https://www.raspberrypi.org/documentation/hardware/camera/rpi-cam-v2_1-dimensions.pdf)


Here is the detail specification document: [Raspberry Pi Camera Module v2 Datasheet](https://www.raspberrypi.org/documentation/hardware/camera/README.md)


## [Raspberry Pi Camera for TurtleBot3](#raspberry-pi-camera-for-turtlebot3)

The Raspberry Pi Camera Module v2 is applied on TurtleBot3 Waffle Pi.


![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models.png)


## [Introduction Video](#introduction-video)

The TurtleBot3 Waffle Pi uses Raspberry Pi Camera Module v2 as a default vision sensor. Check this video out that shows how Raspberry Pi Camera Module v2 can be used in TurtleBot3 Waffle Pi.


<iframe width="560" height="315" src="https://www.youtube.com/embed/AyZ5lcz5IzM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


## [User Guide](#user-guide)

[Raspberry Pi Camera packages](https://github.com/UbiquityRobotics/raspicam_node) enable the use of Raspberry Pi Camera Module v1.x and v2.x with ROS. Below table describes packages required to operate Raspberry Pi Camera. You will be guided to install these packaged in the next section.


| Package                                                                  | Description                                                          |
| ------------------------------------------------------------------------ | :------------------------------------------------------------------: |
| [Raspberry Pi Camera](https://github.com/UbiquityRobotics/raspicam_node) | Underlying library driver for communicating with Raspberry Pi Camera |


### [Installation](#installation)

**[TurtleBot]** Setting up the camera hardware

``` bash
$ sudo raspi-config
```


![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-1.png)


Select **3 Interfacing Options**


![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-2.png)


Select **P1 Camera**


![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-3.png)


Enable camera interface


![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-4.png)


Enable camera interface


![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-5.png)


After reboot Raspberry Pi ,to test that the system is installed and working, try the following command:


``` bash
$ raspistill -v -o test.jpg
```

The display should show a five-second preview from the camera and then take a picture, saved to the file *test.jpg*


**[TurtleBot]** The following commands will install relevant Raspberry Pi Camera packages on your ROS system.

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/UbiquityRobotics/raspicam_node.git
$ sudo apt-get install ros-kinetic-compressed-image-transport ros-kinetic-camera-info-manager
$ cd ~/catkin_ws && catkin_make
```

### [Run raspicam Node](#run-raspicam-node)

**[TurtleBot]** Run the following command

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

or

``` bash
$ roslaunch raspicam_node camerav2_1280x960.launch
```

While the raspicam node is running, you can view various data from Raspberry Pi Camera by launching rqt_image_view.

**Warning!** Before you run Rviz in Remote PC, check your Raspberry Pi 3 and Remote PC whether they are connected.
{: .notice--warning}

**[Remote PC]** Run the following command

``` bash
$ rqt_image_view
```

Once the gui application is appeared on the screen, you can select data topic name related to Raspberry Pi Camera from drop down menu at the top of the application.

## [References](#references)

- [Raspberry Pi Camera Module Specifications](https://www.raspberrypi.org/documentation/hardware/camera/README.md)
- [Hardware Configuration](https://www.raspberrypi.org/documentation/configuration/camera.md)
- [Software Configuration](https://www.raspberrypi.org/documentation/raspbian/applications/camera.md)
- [Getting Started](https://projects.raspberrypi.org/en/projects/getting-started-with-picamera)
- [ROS Node](https://github.com/UbiquityRobotics/raspicam_node)
- [Purchase](https://www.raspberrypi.org/products/camera-module-v2/)
