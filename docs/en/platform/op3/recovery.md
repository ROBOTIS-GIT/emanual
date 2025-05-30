---
layout: archive
lang: en
ref: op3_recovery
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/recovery/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 8
---

<style>body {counter-reset: h1 7 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Recovery](#recovery)

## [OP3 Manual Installation](#op3-manual-installation)

### Overview
This chapter explains how to manually install and configure the main software of the ROBOTIS-OP3.

### User Installation  

#### OS Installation  
  OS Installation  
 - Linux Mint 22 Xfce
  > Reference : [How to Install Linux Mint]

#### PC Setup
- WiFi Hotspot
 1. Right-click on the Network icon in the system tray at the bottom right corner of your screen and select `Edit Connections...`.
 2. In the `Network Connections` window, click Add(+) button.
 3. In the `Choose a Connection Type` window, select `Wi-Fi` from the Hardware group.
 4. Click `Create...` button.
 5. Modify the `Connection name` to `OP3-Hotspot` in the new window.
 6. Change the SSID to `ROBOTIS-OP3-Share` in the Wi-Fi tab.
 7. Select `Hotspot` Mode and click `Save` button.
 8. Close the `Network Connections` window.
 9. Click the Network icon from the bottom right corner of the system tray and select `Connect to Hidden Wi-Fi Network...`.
 10. Select `OP3-Hotspot` for the `Connection` in the `Hidden Wi-Fi network` and click the `Connect` button.


- Other Settings
    1. Increase real-time scheduling priority (rtprio) for current user's group
        ```sh
        $ sudo bash -c 'echo "@robotis - rtprio 99" > /etc/security/limits.d/robotis-rtprio.conf'
        ```
    2. Add user to appropriate groups
        ```sh
        $ sudo usermod -aG dialout,video,audio robotis
        ```
    3. Configure USB latency timer to 1ms at startup  
        - create a udev rules file  
            ```sh
            $ sudo nano /etc/udev/rules.d/50-latency-timer.rules
            ```   
        - add the following rule to the file
            ```sh
            ACTION=="add", SUBSYSTEM=="usb-serial", DRIVER=="ftdi_sio", ATTR{latency_timer}="1"
            ```
        - reload udev rules
            ```sh
            $ sudo udevadmin control --reload-rules
            $ sudo udevadmin trigger
            ```


 - Server Settings
     - openssh Installation
        ```sh
        $ sudo apt install openssh-server
        ```
     - Desktop sharing
         1. Vino Installation and configuration 
            ```sh
            $ sudo apt install vino
            $ gsettings set org.gnome.Vino require-encryption false
            $ gsettings set org.gnome.Vino prompt-enabled false
            $ gsettings set org.gnome.Vino authentication-methods "['vnc']"
            $ gsettings set org.gnome.Vino vnc-password $(echo -n '111111'|base64)
            ```
         2. `Start` → `Session and Startup` → `Application Autostart` → `Add` button  
            - `Name` : Desktop Sharing
            - `Description` : vnc server
            - `Command` : /usr/lib/vino/vino-server --sm-disable
            - `Trigger` : on login
         3. `OK` button
         4. logout & login

     - Samba
         1. Installation
             ```sh
             $ sudo apt install -y samba samba-common
             ```
         2. Create a samba user  
             ```sh  
             $ sudo smbpasswd -a robotis
             [sudo] password for robotis: 111111
             New SMB password: 111111
             Retype new SMB password: 111111
             ```  
         3. Append the following to the `/etc/samba/smb.conf` file  
             ```ini  
             [root directory]
                 comment = Root Directory
                 path = /
                 browseable = yes
                 read only = no
                 writable = yes
                 create mask = 0755
                 directory mask = 0755
                 valid users = @robotis
             ```  
         4. Restart service  
             ```sh
             $ sudo service smbd restart
             ``` 

     - Apache(for web_setting_tool)
        1. Install web server(APACHE2)
            ```sh
            $ sudo apt install apache2
            ```
        2. Check the default page from a web browser  
            - http://10.42.0.1  



#### ROS Installation & Environment Setup
1. **ROS Installation**
    > Reference : [ROS Installation]  

2. **ROS Environment Setup**   
    > Reference : [ROS Environment and Network Settings]

#### DDS Middleware and Network tuning
 - Change DDS Middleware
   - Install CycloneDDS
     ```sh
     $ sudo apt install ros-jazzy-rmw-cyclonedds-cpp
     ```
   - Append the following to your `~/.bashrc` file:
     ```bash
     export ROS2_WS='robotis_ws'
     source /opt/ros/jazzy/setup.bash
     source ~/$ROS2_WS/install/local_setup.bash

     export ROS_DOMAIN_ID=1
     export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
     export CYCLONEDDS_URI=file:///home/robotis/.ros/cyclonedds.xml
     ```
 - Tuning for large messages  
   DDS implementations are not designed to handle large messages (such as images). Therefore, it is necessary to tune them and the network parameters to prevent data loss and system overloading.  
     
   - Increase the minimum socket receive buffer and maximum size of messages for CycloneDDS  
     Create the CycloneDDS configuration file:
      ```sh
      $ nano ~/.ros/cyclonedds.xml
      ```
      ```xml
      <?xml version="1.0" encoding="UTF-8" ?>
      <CycloneDDS xmlns="https://cdds.io/config" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://cdds.io/config https://raw.githubusercontent.com/eclipse-cyclonedds/cyclonedds/master/etc/cyclonedds.xsd">
        <Domain id="any">
          <General>
            <Interfaces>
              <NetworkInterface name="lo" />
            </Interfaces>
            <AllowMulticast>false</AllowMulticast>
            <MaxMessageSize>65500B</MaxMessageSize>
          </General>
          <Internal>
            <SocketReceiveBufferSize min="10MB"/>
            <Watermarks>
              <WhcHigh>500kB</WhcHigh>
            </Watermarks>
          </Internal>
          <Discovery>
            <ParticipantIndex>auto</ParticipantIndex>
            <MaxAutoParticipantIndex>100</MaxAutoParticipantIndex>
            <Peers>
              <Peer Address="127.0.0.1"/>
            </Peers>
          </Discovery>
        </Domain>
      </CycloneDDS>
      ```
   - Create a network configuration file:
       ```sh
       $ sudo nano /etc/sysctl.d/10-cyclone-max.conf
       ```
       ```ini
       # IP fragmentation settings
       net.ipv4.ipfrag_time=3  # in seconds, default is 30 s
       net.ipv4.ipfrag_high_thresh=33554432  # 32 MiB, default is 4 MiB

       # Increase the maximum receive buffer size for network packets
       net.core.rmem_max=134217728  # 128 MiB, default is 208 KiB
       ```
   - Save the file and reboot. Validate the sysctl settings, after a reboot:
       ```sh
       $ sysctl net.core.rmem_max net.ipv4.ipfrag_time net.ipv4.ipfrag_high_thresh
       net.core.rmem_max = 134217728
       net.ipv4.ipfrag_time = 3
       net.ipv4.ipfrag_high_thresh = 33554432
       ```

#### [Installing ROBOTIS ROS Packages](#installing-robotis-ros-packages)  

 - ROBOTIS ROS Packages
   -  [DYNAMIXEL SDK] : SDK for DYNAMIXEL  
   -  [ROBOTIS-Framework] : The ROS (Robot Operating System) package for robots assembled with ROBOTIS products.  
   -  [ROBOTIS-Framework-msgs] : Messages used in the ROBOTIS-Framework  
   -  [ROBOTIS-Math] : basic calculation related to transformation and trajectory functions  
   -  [ROBOTIS-OP3] : ROS packages running on the ROBOTIS-OP3  
   -  [ROBOTIS-OP3-Common]
   -  [ROBOTIS-OP3-Demo] : ROBOTIS-OP3 demonstration package.
   -  ROBOTIS-OP3-ETC : : This package contains a modified version of the usb_cam driver and face_detection used for the ROBOTIS-OP3
   -  [ROBOTIS-OP3-msgs] : This package contains the ROS messages that are used for the ROBOTIS-OP3
   -  [ROBOTIS-OP3-Tools] : This package contains useful tools for the ROBOTIS-OP3
   -  ROBOTIS-Utility : This package contains the audio player for the ROBOTIS-OP3  

 - How to install ROBOTIS ROS packages
   - Download sources from Github.  
      ```
      $ mkdir -p ~/robotis_ws/src
      $ cd ~/robotis_ws/src
      $ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git --branch=jazzy
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Math.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-ETC.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Tools.git --branch=jazzy-devl
      $ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Utility.git --branch=jazzy-devl
      ```

#### Installing additional applications for ROBOTIS ROS Package   
 - update package list
   ```
   $ sudo apt update
   ```
 - install python3-rosdep  
   ```
   $ sudo apt install python3-rosdep
   ```
 - initialize rosdep and update the rosdep database
   ```
   $ sudo rosdep init
   $ rosdep udpate
   ```
 - use rosdep to install dependencies
   ```
   $ cd ~/robotis_ws
   $ rosdep install --from-paths src --ignore-src -r -y --os=ubuntu:noble
   ```
   - `--from-paths src` : specifies the source directory where your ROS packages are located.
   - `--ignore-src` : ignores packages within the source directory itself.
   - `-r` : resolves dependencies recursively.
   - `-y` : automatically answers "yes" to all prompts.  
 - install additional packages  
   - for ROBOTIS-Utility : madplay, mpg321
        ```
        $ sudo apt install -y madplay mpg321
        ```
   - ETC.
        ```
        $ sudo apt install -y ros-jazzy-xacro ros-jazzy-imu-tools python3-pydantic
        ```

#### Build downloaded ROBOTIS ROS packages.   
```
$ cd ~/robotis_ws
$ colcon build --symlink-install && source ~/.bashrc
```


#### ETC Setting   
- Configure web_setting_tool  
    1. Copy files from ROBOTIS-OP3-Tools folder to the web server folder : github
        ```
        $ cd ~/robotis_ws/src/ROBOTIS-OP3-Tools/op3_web_setting_tool
        $ sudo cp -r ./html /var/www
        ```   
    2. Check the default page from a web browser  
        - http://10.42.0.1  
        ![](/assets/images/platform/op3/op3_web_setting_01.png)
    3. [How to Use the Web Setting Tool]  

- Configure Shutdown Sound  
    1. Create `/etc/init.d/shutdown-snd` file.   
        Create the above file with a text editor.  
        ```sh
        $ sudo xed /etc/init.d/shutdown-snd
        ```
    2. Append the following information to the file and save.  
        ```sh
        #! /bin/sh
        /usr/bin/madplay "/usr/share/sounds/byebye.mp3"
        ```
    3. Add execution permission to the file.  
        ```sh
        $ sudo chmod +x /etc/init.d/shutdown-snd
        ```
    4. Copy shutdown mp3 to `/usr/share/sounds/` folder.  
       ```sh
       $ sudo cp ~/robotis_ws/src/ROBOTIS-OP3-Demo/op3_demo/data/mp3/Bye\ bye.mp3 /usr/share/sounds/byebye.mp3
       ```
    5. Create a service for the shutdown sound.
        1. Create the `/etc/systemd/system/shutdown_sound.service` file  
            ```sh
            $ sudo xed /etc/systemd/system/shutdown_sound.service
            ```
        2. Append the below information to the file and save.  
            ```conf
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
    1. Go to Start Button > `Settings` > `Power Manager`.
    2. Go to `General` > `Buttons` > `When power button is pressed` and change the option to `Shutdown`.    

- Running the demo at the startup  
    > Reference : [Running the demo at the startup]



## [Recovery of ROBOTIS-OP3](#recovery-of-robotis-op3)

### Overview
This chapter explains how to recover the ROBOTIS-OP3 software using the recovery USB image.

### CloneZilla recovery  
Clonezilla can be used to recover the ROBOTIS-OP3 software from the image file in the provided backup USB.  

#### How to creat a recovery USB media  
- Format a USB drive (8GB or more space is required)  
- Go to [sourceforge.net] and download a recovery image file. 

**NOTE**: The required image file may differ depending on the generation of the installed SBC. Be sure to check the following table and download the appropriate image file for your NUC PC.
{: .notice}

| Recovery Image List                                        | Description                      |
|:-----------------------------------------------------------|:---------------------------------|
| *clonezilla-live-ROBOTIS-OP3_Recovery_250GB_250226.zip*    | OP3 Rev.3 only (SSD 250GB)       |
| *clonezilla-live-ROBOTIS-OP3_Recovery_181019(NUC_7th).zip* | OP3 Rev.2 only (NUC7)            |
| *clonezilla-live-ROBOTIS-OP3_Recovery_180402.zip*          | Latest version for NUC 6 only    |
| *clonezilla-live-ROBOTIS-OP3_Recovery_171013.zip*          | Older image for NUC 6 only       |
    
    
- Extract the zipped folder to the root folder of the USB drive. The folder structure is as follows. 
  ```
  .
  ├── .disk
  ├── [BOOT]
  ├── boot
  │   └── grub
  ├── EFI
  │   └── boot
  ├── home
  │   └── partimag
  │       └── ROBOTIS-OP3_Recovery_250GB_25xxxx
  ├── live
  ├── syslinux
  └── utils
      ├── linux
      ├── mbr
      ├── win32
      └── win64
  ```

#### How to recover ROBOTIS-OP3

1. Go to boot manager : Press **F10**  
	![](/assets/images/platform/op3/op3_recovery_01_nuc10.jpg)  
2. Select the boot device : Recovery USB media  
	![](/assets/images/platform/op3/op3_recovery_02_nuc10.jpg)  
3. Select the image : `Clonezilla live (VGA 800x600)`  
	![](/assets/images/platform/op3/op3_recovery_03_nuc10.jpg)  
4. Recovery will automatically start, and the PC will turn off when it's done.  
	![](/assets/images/platform/op3/op3_recovery_04_nuc10.jpg)  


[How to Install Linux Mint]: https://linuxmint-installation-guide.readthedocs.io/en/latest/index.html
[ROS Installation]: /docs/en/platform/common/op3_robot_operating_system/#how-to-install-ros
[ROS Environment and Network Settings]: /docs/en/platform/common/op3_robot_operating_system/#setup
[Setting for automatic startup]: /docs/en/platform/op3/getting_started/#how-to-kill-the-demo-program
[sourceforge.net]: https://sourceforge.net/projects/darwinop/files/Software/Main%20Controller/Recovery%20USB/

[humanoid_navigation]: /docs/en/platform/thormang3/thormang3_ros_packages/#humanoid_navigation
[How to Use the Web Setting Tool]: /docs/en/platform/op3/tutorials/#how-to-use-web-setting-tool

[Running the demo at the startup]: /docs/en/platform/op3/getting_started/#running-the-demo-at-startup

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/recovery_rev2.md %}
</section>

[https://github.com/sbpl/sbpl]: https://github.com/sbpl/sbpl
[rosbridge_server]: http://wiki.ros.org/rosbridge_server
[web_video_server]: http://wiki.ros.org/web_video_server

[DYNAMIXEL SDK]: /docs/en/software/robotis_framework_packages/#dynamixelsdk
[ROBOTIS-Framework]: /docs/en/software/robotis_framework_packages/#robotis-framework
[ROBOTIS-Framework-msgs]: /docs/en/software/robotis_framework_packages/#robotis-framework-msgs
[ROBOTIS-Math]: /docs/en/platform/common/robotis_math/#robotis-math

[e-manual]: /docs/en/platform/op3/recovery/#recovery-of-robotis-op3

[ROBOTIS-OP3]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3
[ROBOTIS-OP3-Common]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-common
[ROBOTIS-OP3-Demo]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-demo
[ROBOTIS-OP3-msgs]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-msgs
[ROBOTIS-OP3-Tools]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-tools

