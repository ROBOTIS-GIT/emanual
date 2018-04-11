---
layout: archive
lang: en
ref: op3_recovery
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/recovery/
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
---

<div style="counter-reset: h1 7"></div>

# [Recovery](#recovery)

## [OP3 Manual Installation](#op3-manual-installation)

### Overview
This chapter explains how to install software and configure ROBOTIS OP3.

### User Installation  

#### OS Installation  
  OS Installation  
 - Linux Mint 18.1 Xfce
  > Reference : [How to Install Linux Mint]

#### PC Setting
- WiFi Hotspot
 1. Click the Network icon from the bottom right corner of the system tray and select "Edit Connections...".
 2. In the Network Connections window, click Add button.
 3. In the Choose a Connection Type window, select Wi-Fi from the Hardware group.
 4. Click Create... button.
 5. Modify the Connection name to "OP3-Hotspot" in the new window.
 6. Change the SSID to "ROBOTIS-OP3-share" in the Wi-Fi tab.
 7. Select Hotspot Mode and click Save button.
 8. Close the Network Connections window.
 9. Click the Network icon from the bottom right corner of the system tray and select "Connect to Hidden Wi-Fi Network...".
 10. Select OP3-Hotspot for the Connection in the Hidden Wi-Fi network and click Connect button.


- Other Settings
    1. Increase real-time scheduling priority (rtprio) for current user group
        ```
        $ sudo bash -c 'echo "@robotis - rtprio 99" > /etc/security/limits.d/robotis-rtprio.conf'
        ```
    2. Add user to appropriate groups
        ```
        $ sudo usermod -aG dialout robotis
        ```


 - Server Settings
     - openssh Installation
     ```
     $ sudo apt install openssh-server
     ```
     - Desktop sharing
         1. Open a terminal window.
         2. Install dconf-editor with `$ sudo apt install dconf-editor` command.
         3. Run the editor with `$ dconf-editor` command.
         4. Go to org -> gnome -> desktop -> remote-access and uncheck require-encryption
         5. Execute `$ vino-preferences`
         6. In the Sharing section of the Desktop Sharing Preferences windows, apply followings
             1. Check on the Allow other users to view your desktop option.
             2. Check on the Allow other users to control your desktop option.
         7. In the Security section, apply followings  
             1. Uncheck the You must confirm each access to this machine option.
             2. Check on the Require the user to enter this password option and enter `111111`.
         8. Click Close button
         9. Reboot the system.

     - Samba
         1. Installation
             ```
             $ sudo apt install samba samba-common python-glade2 system-config-samba
             ```
         2. Configuration
             ```
             $ sudo touch /etc/libuser.conf
             $ sudo system-config-samba
             ```
             - Go to Preferences -> Samba Users...
                 1. Click `Add User` button
                 2. Select the Unix Username (ex : robotis)
                 3. Enter the Windows Username (ex : robotis)
                 4. Enter the Password (ex : 111111)
             - Click `Add Share` button
                 - In the Basic tab
                     1. Enter `/` in the Directory.
                     2. Check on the Writable / Visible option.
                 - In the Access tab
                     1. Select Only allow access to specific users
                     2. Select samba user

     - Apache(for web_setting_tool)
        1. Install web server(APACHE2)
            ```
            $ sudo apt install apache2
            ```
        2. Check the default page from a web browser  
            - http://10.42.0.1  



#### ROS Installation & Environment Setup
1. **ROS Installation**
    > Reference : [ROS Installation]  

2. **ROS Environment Setup**   
    > Reference : [ROS Environment and Network Settings]

#### Installing additional applications for ROBOTIS ROS Package   
 Prerequisites for ROBOTIS ROS package  
 - ROBOTIS-OP3 : libncurses5-dev, v4l-utils
   ```
   $ sudo apt install libncurses5-dev v4l-utils
   ```  
 - ROBOTIS-ROBOTIS-Optimization : scilab
   ```
   $ sudo apt install scilab
   ```   
 - ROBOTIS-Utility : madplay, mpg321  
   ```
   $ sudo apt install madplay mpg321
   ```
 - ETC : g++, git
   ```
   $ sudo apt install g++ git
   ```  

#### Installing ROS packages for ROBOTIS-OP3
- face_detection  
    ROS Package used for vision demo  
    ```
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/ROBOTIS-GIT/face_detection.git
    $ cd ~/catkin_ws
    $ catkin_make
    ```


- robot_upstart  
    ROS Package that automatically executes basic demo of ROBOTIS-OP3  
    - Installation  
        ```   
        $ sudo apt install ros-kinetic-robot-upstart  
        ```  
    - [Setting for automatic startup]


- usb_cam  
    ROS Package for USB Camera  
    ```
    $ cd ~/catkin_ws/src
    $ git clone https://github.com/bosch-ros-pkg/usb_cam.git
    $ cd ~/catkin_ws
    $ catkin_make
    $ sudo apt install v4l-utils
    ```


- qt_ros
    ```
    $ sudo apt install ros-kinetic-qt-ros
    ```      

- [humanoid_navigation]  
    Package for footstep planner.
    - Install prerequisite packages
      ```
      $ sudo apt-get install ros-kinetic-map-server
      $ sudo apt-get install ros-kinetic-humanoid-nav-msgs
      $ sudo apt-get install ros-kinetic-nav-msgs
      $ sudo apt-get install ros-kinetic-octomap
      $ sudo apt-get install ros-kinetic-octomap-msgs
      $ sudo apt-get install ros-kinetic-octomap-ros
      $ sudo apt-get install ros-kinetic-octomap-server
      ```  

    - Install library from sources
        * sbpl  

          > Reference : [https://github.com/sbpl/sbpl]

    - Install humanoid_navigation
        ```
        $ cd ~/catkin_ws/src
        $ git clone https://github.com/ROBOTIS-GIT/humanoid_navigation.git
        $ cd ~/catkin_ws
        ```  
    - [rosbridge_server], [web_video_server]    
      Packages for web_setting_tool  
      ```
      $ sudo apt install ros-kinetic-rosbridge-server ros-kinetic-web-video-server
      ```

#### [Installing ROBOTIS ROS Packages](#installing-robotis-ros-packages)  

 - ROBOTIS ROS Packages
   -  [DynamixelSDK] : SDK for Dynamixel  
   -  [ROBOTIS-Framerowk] : The package to use ROS (Robot Operating System) for robots assembled with ROBOTIS products.  
   -  [ROBOTIS-Framerowk-msgs] : Messages used in the ROBOTIS-Framework  
   -  [ROBOTIS-Math] : basic calculation related to transformation and trajectory functions  
   -  [ROBOTIS-OP3] : ROS packages running in the ROBOTIS-OP3  
   -  [ROBOTIS-OP3-Demo] : ROBOTIS-OP3 uses this package when running a demonstration
   -  [ROBOTIS-OP3-msgs] : This package contains ROS messages that are used for ROBOTIS-OP3
   -  [ROBOTIS-OP3-Tools] : This package contains useful tools for ROBOTIS-OP3
   -  [ROBOTIS-OP3-Common]
   -  ROBOTIS-Utility   
   -  ROBOTIS-Optimization

 - How to install ROBOTIS ROS packages
   - Download sources from Github.  
      ```
      $ cd ~/catkin_ws/src
      $ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Math.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Utility.git
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Optimization.git
      ```

   - Build downloaded sources.  
      ```
      $ cd ~/catkin_ws
      $ catkin_make
      ```

#### ETC Setting   
- Configure web_setting_tool  
    1. Copy files from ROBOTIS-OP3-Tools folder to the web server folder : github
        ```
        $ cd ~/catkin_ws/src/ROBOTIS-OP3-Tools/op3_web_setting
        $ sudo cp -r ./html /var/www
        ```   
    2. Check the default page from a web browser  
        - http://10.42.0.1  
        ![](/assets/images/platform/op3/op3_web_setting_01.png)
    3. [How to use Web Setting Tool]  

- Configure Shutdown Sound  
    1. Create `/etc/init.d/shutdown-snd` file.   
        Create the above file with a text editor.  
        ```
        $ sudo xed /etc/init.d/shutdown-snd
        ```
    2. Append below information to the file and save.  
        ```
        #! /bin/sh
        /usr/bin/madplay "/usr/share/sounds/byebye.mp3"
        ```
    3. Add execution permission to the file.  
        ```
        $ sudo chmod +x /etc/init.d/shutdown-snd
        ```
    4. Copy shutdown mp3 to `/usr/share/sounds/` folder.  
    5. Create a service for the shutdown sound.
        1. Create `/etc/systemd/system/shutdown_sound.service` file  
            Create the above file with a text editor.    
            ```
            $ sudo xed /etc/systemd/system/shutdown_sound.service
            ```
        2. Append below information to the file and save.  
            ```
            [Unit]
            Description=shutdown sound
            After=network.target

            [Service]
            Type=oneshot
            ExecStart=/bin/true
            ExecStop=/etc/init.d/shutdown-snd
            RemainAfterExit=yes

            [Install]
            WantedBy=multi-user.target
            ```

        3. Register the Service and execute
            ```
            $ systemctl daemon-reload
            $ systemctl enable /etc/systemd/system/shutdown_sound.service --now
            ```

- Configure Power Button for shutdown
    1. Go to Start Button -> Settings -> Power Manager.
    2. Go to General -> Buttons -> When power button is pressed and change the option to "Shutdown".    

## [Recovery of ROBOTIS-OP3](#recovery-of-robotis-op3)

### Overview
This chapter explains how to recover ROBOTIS-OP3 softwares using recovery USB image.


### CloneZilla recovery  
Clonezilla is used to recover ROBOTIS-OP3 with the image file in the provided USB.  

> Reference : [e-manual]

#### How to make a recovery USB media  
- Format a USB drive(at least 4GB space should be available)  
- Download the ROBOTIS-OP3 Recovery image  
  - Latest version : clonezilla-live-ROBOTIS-OP3_Recovery_180402.zip   
  - `Download` [sourceforge.net]   
- Extract the compressed file to the root folder of the USB drive. The folder structure looks like below.
  ```
  .
  |-- boot
  |   `-- grub
  |-- EFI
  |   |-- boot
  |   `-- images
  |-- home
  |   `-- partimag
  |       `-- ROBOTIS-OP3_transcend
  |-- live
  |-- syslinux
  `-- utils
  ```

#### How to recover ROBOTIS-OP3
- Go to boot manager : Press **F10**  
	![](/assets/images/platform/op3/op3_recovery_01.jpg)  
- Select the boot device : Recovery USB media  
	![](/assets/images/platform/op3/op3_recovery_02.jpg)  
- Select the image : clonezilla live with img ROBOTIS-OP3_Transcend (Default settings, VGA 1024x768)  
	![](/assets/images/platform/op3/op3_recovery_03.jpg)  
- Confirm to continue : enter `y`  
	![](/assets/images/platform/op3/op3_recovery_04.jpg)  
- Confirm to continue : enter `y`  
	![](/assets/images/platform/op3/op3_recovery_05.jpg)  
- Check the progress  
	![](/assets/images/platform/op3/op3_recovery_06.jpg)  
- Turn off or reboot ROBOTIS-OP3  
	![](/assets/images/platform/op3/op3_recovery_08.jpg)  


### File
* clonezilla-live-ROBOTIS-OP3_Recovery_180402.zip  
    * `Download` [sourceforge.net]  


[How to Install Linux Mint]: https://www.linuxmint.com/documentation/user-guide/Cinnamon/english_18.0.pdf
[ROBOTIS-OP3]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3
[ROBOTIS-OP3-Demo]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-demo
[ROBOTIS-OP3-msgs]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-msgs
[ROBOTIS-OP3-Tools]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-tools
[ROBOTIS-OP3-Common]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-common
[ROS Environment and Network Settings]: /docs/en/platform/common/op3_robot_operating_system/#op3-robot-operating-system
[Setting for automatic startup]: /docs/en/platform/op3/getting_started/#how-to-kill-the-demo-program
[e-manual]: /docs/en/platform/op/maintenance/#clonezilla-recovery
[sourceforge.net]: https://sourceforge.net/projects/darwinop/files/Software/Main%20Controller/Recovery%20USB/clonezilla-live-ROBOTIS-OP3_Recovery_180402.zip/download

[ROS Installation]: /docs/en/platform/op3/recovery/#installing-robotis-ros-packages
[DynamixelSDK]: /docs/en/software/robotis_framework_packages/#dynamixelsdk
[ROBOTIS-Framerowk]: /docs/en/software/robotis_framework_packages/#robotis-framework
[ROBOTIS-Framerowk-msgs]: /docs/en/software/robotis_framework_packages/#robotis-framework-msgs
[ROBOTIS-Math]: /docs/en/platform/common/robotis_math/#robotis-math

[humanoid_navigation]: /docs/en/platform/thormang3/thormang3_ros_packages/#humanoid_navigation
[https://github.com/sbpl/sbpl]: https://github.com/sbpl/sbpl
[rosbridge_server]: http://wiki.ros.org/rosbridge_server
[web_video_server]: http://wiki.ros.org/web_video_server
[How to use Web Setting Tool]: /docs/en/software/robotis_framework_packages/#how-to-use-web-setting-tool
