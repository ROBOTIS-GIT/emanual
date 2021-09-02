{% capture notice_01 %}
**NOTE**
- Autorace package is mainly developed on `Ubuntu 20.04` with `ROS1 Noetic Ninjemys`.
- Autorace package is mainly tested under the Gazebo simulation.
- To simulate given examples properly, complete [Simulation](/docs/en/platform/turtlebot3/simulation/). 
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

**Tip**: If you have actual TurtleBot3, you can perform up to **[Lane Detection](#lane-detection)** from our Autonomus Driving package. For more details, clcik expansion note (![](/assets/images/icon_unfold.png)**Click to expand:** ) at the end of content in each sub section. 
{: .notice--success}

The contents in e-Manual are subject to be updated without a prior notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

### [Prerequisites](#prerequisites)

`Remote PC`

- ROS 1 Noetic installed Laptop or desktop PC.
- This instruction is based on Gazebo simulation, but can be ported to the actual robot later.

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Prerequisites for use of actual TurtleBot3**
</summary>

### [What you need for Autonomous Driving](#what-you-need-for-autonomous-driving)

`TurtleBot3 Burger`

- It is the basic model to use AutoRace packages for the autonomous driving on ROS.
- Provided source codes, AutoRace Packages, are made based on TurtleBot3 Burger.

`Remote PC`

- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

`Raspberry Pi camera module with a camera mount`

- You can use a different module if ROS supports it.
- Source codes provided to calibrate the camera are created based on ([Fisheye Lens](https://www.waveshare.com/rpi-camera-g.htm)) module.

`AutoRace tracks and objects`

- Download 3D CAD files for AutoRace tracks, Traffic signs, traffic lights and other objects at [ROBOTIS_GIT/autorace](https://github.com/ROBOTIS-GIT/autorace_track).
- Download a refree system at [ROBOTIS-GIT/autorace_referee](https://github.com/ROBOTIS-GIT/autorace_referee)
</details>

### [Install Autorace Packages](#install-autorace-packages)

1. Install the AutoRace 2020 meta package on `Remote PC`.
```bash
$ cd ~/catkin_ws/src/
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt install ros-noetic-image-transport ros-noetic-cv-bridge ros-noetic-vision-opencv python3-opencv libopencv-dev ros-noetic-image-proc
```

<details>
<summary>
![](/assets/images/icon_unfold.png) **Click to expand : Autorace Package Installation for an actual TurtleBot3**
</summary>

<!-- ### [Autorace Package Installation for an actual TurtleBot3](#autorace-package-installation-for-an-actual-turtlebot3) -->

The following instructions describes how to install packages and to calibrate camera.

1. Install AutoRace package on both `Remote PC` and `SBC`.
```bash
$ cd ~/catkin_ws/src/
$ git clone -b feature-raspicam https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on `SBC`.
    - Create a swap file to prevent lack of memory in building OpenCV. 

        ```bash
        $ sudo fallocate -l 4G /swapfile
        $ sudo chmod 600 /swapfile
        $ sudo mkswap /swapfile
        $ sudo swapon /swapfile
        ```

    - Install required dependencies. 
        ```bash
        $ sudo apt-get update
        $ sudo apt-get install build-essential cmake gcc g++ git unzip pkg-config
        $ sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libgtk2.0-dev libcanberra-gtk* libxvidcore-dev libx264-dev python3-dev python3-numpy python3-pip libtbb2 libtbb-dev libdc1394-22-dev libv4l-dev v4l-utils libopenblas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran libhdf5-dev libprotobuf-dev libgoogle-glog-dev libgflags-dev protobuf-compiler
        ```

    * Build with opencv & opencv_contrib

        ```bash
        $ cd ~
        $ wget -O opencv.zip https://github.com/opencv/opencv/archive/4.5.0.zip
        $ wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.5.0.zip

        $ unzip opencv.zip
        $ unzip opencv_contrib.zip

        $ mv opencv-4.5.0 opencv
        $ mv opencv_contrib-4.5.0 opencv_contrib
        ```

    * Create cmake file.

        ```bash
        $ cd opencv
        $ mkdir build
        $ cd build
        $ cmake -D CMAKE_BUILD_TYPE=RELEASE \
                -D CMAKE_INSTALL_PREFIX=/usr/local \
                -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
                -D ENABLE_NEON=ON \
                -D BUILD_TIFF=ON \
                -D WITH_FFMPEG=ON \
                -D WITH_GSTREAMER=ON \
                -D WITH_TBB=ON \
                -D BUILD_TBB=ON \
                -D BUILD_TESTS=OFF \
                -D WITH_EIGEN=OFF \
                -D WITH_V4L=ON \
                -D WITH_LIBV4L=ON \
                -D WITH_VTK=OFF \
                -D OPENCV_ENABLE_NONFREE=ON \
                -D INSTALL_C_EXAMPLES=OFF \
                -D INSTALL_PYTHON_EXAMPLES=OFF \
                -D BUILD_NEW_PYTHON_SUPPORT=ON \
                -D BUILD_opencv_python3=TRUE \
                -D OPENCV_GENERATE_PKGCONFIG=ON \
                -D BUILD_EXAMPLES=OFF ..
        ```

    * It will take an hour or two to build.
    
        ```bash
        $ cd ~/opencv/build
        $ make -j4
        $ sudo make install
        $ sudo ldconfig
        $ make clean
        $ sudo apt-get update
        ```

    * Turn off Raspberry Pi, take out the microSD card and edit the config.txt in system-boot section. add start_x=1 before the enable_uart=1 line.

        ```bash
        $ sudo apt install ffmpeg
        $ ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 0:0:2 -frames 1 capture_test.jpg
        ```

    * Install additional dependent packages
    
        ```bash
        $ sudo apt install ros-noetic-cv-camera
        ```

3. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt install ros-noetic-image-transport ros-noetic-image-transport-plugins ros-noetic-cv-bridge ros-noetic-vision-opencv python3-opencv libopencv-dev ros-noetic-image-proc ros-noetic-cv-camera ros-noetic-camera-calibration 
```

</details>
