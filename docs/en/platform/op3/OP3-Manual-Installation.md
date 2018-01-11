### 1. Overview
This chapter explains how to install software and configure ROBOTIS OP3.


### 2. User Installation  
#### 2.1 OS Installation  
  OS Installation  
 - Linux Mint 18.1 Xfce
  > Reference : [How to Install Linux Mint](https://www.linuxmint.com/documentation/user-guide/Cinnamon/english_18.0.pdf)  

#### 2.2 PC Setting
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


#### 2.3 ROS Installation & Environment Setup
1. **ROS Installation**
    > Reference : [ROS Installation](http://wiki.ros.org/kinetic/Installation/Ubuntu)  

2. **ROS Environment Setup**   
    > Reference : [ROS Environment and Network Settings](OP3-Robot-Operating-System#4-setup)  

#### 2.4 Installing additional applications for ROBOTIS ROS Package   
 Prerequisites for ROBOTIS ROS package  
  - ROBOTIS-OP3 : libncurses5-dev, v4l-utils
    ```
    $ sudo apt install libncurses5-dev
    ```  
  - ROBOTIS-Utility : madplay, mpg321  
    ```
    $ sudo apt install madplay mpg321
    ```
  - ETC : g++, git
    ```
    $ sudo apt install g++ git
    ```  

#### 2.5 Installing ROS packages for ROBOTIS-OP3
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
    - [Setting for automatic startup](OP3-How-to-kill-the-demo-program#31-start-demo-program-on-start)


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

#### 2.6 Installing ROBOTIS ROS packages  
 - ROBOTIS ROS Packages
   -  [DynamixelSDK](https://github.com/ROBOTIS-GIT/DynamixelSDK/wiki) : SDK for Dynamixel  
   -  [ROBOTIS-Framerowk](ROBOTIS-Framework-Documents) : The package to use ROS (Robot Operating System) for robots assembled with ROBOTIS products.  
   -  [ROBOTIS-Framerowk-msgs](ROBOTIS-Framework-Documents) : Messages used in the ROBOTIS-Framework  
   -  [ROBOTIS-Math](robotis_math) : basic calculation related to transformation and trajectory functions  
   -  [ROBOTIS-OP3](ROBOTIS-OP3) : ROS packages running in the ROBOTIS-OP3  
   -  [ROBOTIS-OP3-Demo](ROBOTIS-OP3-Demo) : ROBOTIS-OP3 uses this package when running a demonstration
   -  [ROBOTIS-OP3-msgs](ROBOTIS-OP3-msgs) : This package contains ROS messages that are used for ROBOTIS-OP3
   -  [ROBOTIS-OP3-Tools](ROBOTIS-OP3-Tools) : This package contains useful tools for ROBOTIS-OP3
   -  [ROBOTIS-OP3-Common](ROBOTIS-OP3-Common)
   -  ROBOTIS-Utility   

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
      ```

   - Build downloaded sources.  
      ```
      $ cd ~/catkin_ws
      $ catkin_make
      ```

#### 2.8 ETC Setting  
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





[&lt;&lt; Back](OP3-User's-Guide)
