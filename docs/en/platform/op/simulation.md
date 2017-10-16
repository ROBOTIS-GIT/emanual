---
layout: archive
lang: en
ref: op_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op/simulation/
sidebar:
  title: DARwIn-OP
  nav: "op"
---

<div style="counter-reset: h1 2"></div>

# [Simulation](#simulation)

DARWIN-OP 3D Simulator

![](/assets/images/platform/op/op_165.jpg)

## [Webots Installation](#webots-installation)

Determine whether you have 32-bit or 64-bit OS

### [Windows Version Check](#windows-version-check)

#### Windows 32-bit

1. Click on the `Start` button
2. Point to `Computer` and `right click` on it
3. Click on `Properties`

  ![](/assets/images/platform/op/op_166.gif)
 
4. Look for `System type`
5. It displays `32-bit Operation System`

This means you have 32-bit Windows

![](/assets/images/platform/op/op_167.gif)
 
#### Windows 64-bit

1. Click on the `Start` button
2. Point to `Computer` and `right click` on it
3. Click on `Properties`

  ![](/assets/images/platform/op/op_168.gif)
 
4. Look for `System type`
5. it displays 64-bit Operating System

This means you have 64-bit Windows

![](/assets/images/platform/op/op_169.gif)
 
#### Windows 32-bit vs 64-bit

Let’s find out another another way to indicate whether you have Windows 32-bit or Windows 64-bit
1. Click on the `Start` button
2. And click on `Computer` (left click this time)

  ![](/assets/images/platform/op/op_170.gif)

3. Click on (C:)
  - A : 64-bit Windows has 2 folders named Program Files (x86) and Program Files  
  On 64-bit Windows Webots is stored in Program Files (x86)

  ![](/assets/images/platform/op/op_171.gif)

  - B : 32-bit Windows only has Program Files  
  On 32-bit Windows Webots is stored in Program Files

  ![](/assets/images/platform/op/op_172.gif)


### [Install Webots](#install-webots)

#### Download Webots

1. Visit www.cyberbotics.com
2. Click on Download

  ![](/assets/images/platform/op/op_173.gif)
 
  - Option A : Click on the Windows logo
  - Option B : Click on Windows

  ![](/assets/images/platform/op/op_174.gif)
 
3. Click on the link for file

  ![](/assets/images/platform/op/op_175.gif)

This message will appear at the bottom of your web browser Click on Save to download file

![](/assets/images/platform/op/op_176.gif)

 
#### Install Webots (For 32-bit Windows)

For 64-bit Windows, use `C:\Program Files (x86)\Webots\`
For 32-bit Windows, use `C:\Program Files\Webots\`
 
Once downloading is complete its time to install Webots  
Let’s find the installation file located in the downloads destination (normally the Downloads directory)
 
1. Click on the `Start` button
2. And click on `Computer` (left click this time)

  ![](/assets/images/platform/op/op_177.gif)
 
3. Under the Favorites option (upper left part of window)
4. Click on ‘Downloads’ and you will be moved to the Downloads directory

  ![](/assets/images/platform/op/op_178.gif)
 
  Move to the `Downloads` directory
 
5. find file
6. Double-click on file to begin installation

  ![](/assets/images/platform/op/op_179.gif)
 
  A security warning will appear.
 
7. Simply click on `Run` to begin installation

  ![](/assets/images/platform/op/op_180.gif)
 
8. Click on `Next`

  ![](/assets/images/platform/op/op_181.gif)
 
  From the Select Destination Location window.  
  Make sure the installation path reads `C:\Program Files\Webots`.  
  If not, then manually specify it to `C:\Program Files\Webots`.
 
9. Then click on Next

  ![](/assets/images/platform/op/op_182.gif)
 
  From Select Start Menu Folder window.  
  Make sure the destination folder reads `Cyberbotics`.  
  If not, then manually specify it to `Cyberbotics`.
 
10. Then click on Next

  ![](/assets/images/platform/op/op_183.gif)
 
  From the Ready to Install window.  
  The Destination location and Start Menu Folder are set.
 
11. click on Install

  ![](/assets/images/platform/op/op_184.gif)
  
  ![](/assets/images/platform/op/op_185.gif)
 
  Once the green bar is full, Completing the Webots Setup Wizard will appear
 
12. Click on Finish to finish installing Webots. You have now finished installing Webots

  ![](/assets/images/platform/op/op_186.gif)

### [Run Webots](#run-webots)

#### Running Webots

Once installation is complete the newly extracted folder will automatically pop up
 
Once installation is complete go to:
1. Click on the Start button
2. Go to My Computer

  ![](/assets/images/platform/op/op_187.gif)
 
  - WEBOTS_HOME is
    - 64-bit Windows  C:\Program Files (x86)\Webots\
    - 32-bit Windows  C:\Program Files\Webots\
 
3. Go to $WEBOTS_HOME/projects/robots/darwin-op/worlds
4. Pick any of the 4 ‘walk’ ‘symetry’ ‘visual_tracking’ or ‘soccer’ by double-clicking

  ![](/assets/images/platform/op/op_188.gif)
 
5. After double-clicking on the world file Webots will automatically start

  ![](/assets/images/platform/op/op_189.gif)

##### Webots GUI

![](/assets/images/platform/op/op_190.gif)

- Scene tree : Contains the elements of the simulation world
- 3D window : Contains the visual rendering of the scene tree
- Console : Command line window displaying output values
- Text editor : Displays text files such as robot programs
 
#### Creating a new project

Now that Webots is running you can create your own DARWIN-OP based simulation project.  
You may have noticed that the simulation automatically begins when Webots starts (the timer runs).  
The simulation must be stopped before creating a new project.
 
1. Click on the Stop button
2. Click on the Revert Simulation button
3. The simulation resets and you will see the model in an inactive state
4. Click on an empty line from the automatically opened controller file from the Text editor.
5. Make a small change (i.e. press the space bar on an empty line)
6. Click on the Save or Save As icon. A small window will pop up asking you save changes elwhere. Click on OK
7. Pick a place other than $WEBOTS_HOME (i.e. My Documents/my-webots-project)
8. Click on Copy and the set of files will copy to the assigned directory.
9. Finally click on Close.

![](/assets/images/platform/op/op_191.gif)

![](/assets/images/platform/op/op_192.gif)

![](/assets/images/platform/op/op_193.gif)

![](/assets/images/platform/op/op_194.gif)

#### Working with your project

Notice that the working directory contains a few separate subdirectories.  
“controllers” contains subdirectories, where each subdirectory contains the robot model’s program. There is no limit on the number of program subdirectories.  
“worlds” contains world file(s). There is no limit on the number of world files allowed inside this subdirectory.  
“doc” (new in Webots v7.1.x) contains documentation on cross-compilation feature that allows user to run Webots code on a real DARWIN-OP (please go to the cross-compilation for more details).  

![](/assets/images/platform/op/op_195.gif)

Go into the “controllers” subdirectory and there are a few that were automatically created when you created your working project.  
Each program subdirectory contains at least one cpp (C++) file that contains the main loop of the controller.  
You create separate subdirectories and write programs in languages other languages.

![](/assets/images/platform/op/op_196.gif)

You may write programs with any text editor or any IDE asides from the integrated text editor from Webots GUI if you wish.  
However, compiling and building the code will only work with the Webots GUI.

## [Cross Compile](#cross-compile)

### [Getting the Sources](#getting-the-sources)

#### Using this guide

This guide assumes you are familiar with Webots and requires some knowledge of Webots’ software APIs.
This guide assumes user familiarity with the terms controller and world
Please use this guide in conjunction with Webots user guide and reference guide.
You can download both guides from www.cyberbotics.com

![](/assets/images/platform/op/op_197.gif)
 
#### Getting the sources

1. Visit www.github.com
2. Click on Search tab
3. Input cross-compilation on the search bar
4. Click on the search button

  ![](/assets/images/platform/op/op_198.gif)

5. scroll and look for `darwinop/webots-cross-compilation`.

  ![](/assets/images/platform/op/op_199.gif)

Once in the source page you may download the source directly as a .zip file
 
6. Click on the zip button to download the source to your PC. Once downloaded decompress the file.

  ![](/assets/images/platform/op/op_200.gif)
 
The unzipped file will look something like this. Its now time to transfer these files to the real robot.

![](/assets/images/platform/op/op_201.gif)

### [Transferring the Sources](#transferring-the-sources)

Connect to DARWIN-OP via wired or wireless LAN
 
1. Click on the Start button
2. Go to My Computer

  ![](/assets/images/platform/op/op_202.gif)

The PC from DARWIN-OP can act as a Samba drive.
 
3. If connected via wired LAN access the PC by inputting `\\192.168.123.1`.  
  If connected via wifi then use the IP address assigned to DARWIN-OP from your router.  
  For more information on connecting to DARWIN-OP click [here](/en/platform/op/getting_started/#connect-to-op)

  ![](/assets/images/platform/op/op_203.gif)
 
4. Double click on “root directory”
5. You will be prompted to enter the username and password  
  User name: **darwin**  
  Password: **111111**

  ![](/assets/images/platform/op/op_204.gif)
 
  Once inside DARwin-OP’s SSD drive look for a directory named **darwin**.  
  This is the location of DARWIN-OP’s software (Framework library and C++ sources)
 
6. Double click on **darwin** directory

  ![](/assets/images/platform/op/op_205.gif)
 
  Once inside darwin directory you will see the usual subdirectories.
 
7. Create a subdirectory to transfer the cross-compilation sources. Let’s say **webots-sources**.
8. Transfer the unzipped contents cross-compilation sources to **webots-sources**.

  ![](/assets/images/platform/op/op_206.gif)
 
9. Transfer (copy) the unzipped contents cross-compilation sources to **webots-sources**.

  ![](/assets/images/platform/op/op_207.gif)

### [Setting Up the Sources](#setting-up-the-sources)

Open up a terminal window (either via remote desktop or SSH). For more information click [here](/en/platform/op/getting_started/#connect-to-op)  
Make sure you have root user privileges.  
Make sure to update DARWIN-OP’s Framework library to the latest version.
 
1. From the terminal window go to **webots-sources**
2. Merge the Modified DARWIN-OP Framework library with the default Framework by inputting  
  `cp –R ./resources/projects/robots/darwin-op/libraries/darwin/darwin/* /darwin`

  ![](/assets/images/platform/op/op_208.gif)

  After merging its time to recompile the Framework and default sources
 
3. Go to `/darwin/Linux/build` directory
4. Type **make clean;make**

  ![](/assets/images/platform/op/op_209.gif)
 
5. Go to `/darwin/Linux/project/demo` directory
6. Type **make distclean;make**

  ![](/assets/images/platform/op/op_210.gif)
 
7. Allow users without root user privileges to manipulate the contents of /darwin directory by entering  
  `chown darwin.darwin /darwin`

  ![](/assets/images/platform/op/op_211.gif)
 
8. Create a new directory in `/darwin/Linux/project/`  
  Lets say webots (mkdir webots)

9. go into the webots subdirectory (`cd webots`)

  ![](/assets/images/platform/op/op_212.gif)
 
10. In the newly-created webots sub-directory its time to copy **include**, **src**, **lib**, **transfer**, and **controllers** from webots-sources
  - For src: `cp –r /darwin/webots-sources/resources/projects/robots/darwin-op/libraries/manegers/src/ ./`
  - For include: `cp –r /darwin/webots-sources/resources/projects/robots/darwin-op/libraries/manegers/include/ ./`
  - For lib: `cp –r /darwin/webots-sources/resources/projects/robots/darwin-op/libraries/manegers/lib/ ./`
  - For transfer: `cp –r /darwin/webots-sources/resources/projects/robots/darwin-op/transfer/ ./`
  - For controllers: `cp –r /darwin/webots-sources/projects/robots/darwin-op/controllers/ ./`

  ![](/assets/images/platform/op/op_213.gif)
 
11. Type **ls** and there should be 5 directories

  ![](/assets/images/platform/op/op_214.gif)
 
12. Its time to compile the wrapper library. Go to transfer/lib subdirectory (`cd transfer/lib`)
13. Type **make** to compile and build the wrapper library

  ![](/assets/images/platform/op/op_215.gif)

14. Its time to compile the managers library. From the transfer/lib sub-directory go to webots/lib subdirectory (`cd ../../lib`)
15. Type **make –f Makefile.darwin-op** to compile and build the managers library.
16. Type **ls** and look for a file named managers.a

  ![](/assets/images/platform/op/op_216.gif)
 
Cross-compilation sources are now set. Its time to compile Webots controller files for the virtual model and run them in the real robot.

### [Compiling Webot controller](#compiling-webot-controller)

You can run the very same controller file used on the virtual model in the real robot
 
1. From the webots/lib subdirectory go to webots/controllers (`cd ../controllers`)
2. Type ls and there will be a list of sub-directories. Each directory contains the exact same controller (.cpp) file from the Webots simulator. Let’s have a look at “Soccer”

  ![](/assets/images/platform/op/op_217.gif)
 
  From the Soccer controller directory you may notice the pre-compiled contents are the same.  
  There is a: Soccer.cpp, Soccer.hpp, main.cpp, config.ini, Makefile, Makefile.darwin-op  
  Take a look at the controller sub-director from your DARWIN-OP Webots project for the simulator. Both contain exactly the same files.

  ![](/assets/images/platform/op/op_218.gif)
  
  ![](/assets/images/platform/op/op_219.gif)
  
  > Soccer.cpp in the real robot
  
  ![](/assets/images/platform/op/op_220.gif)

  > Soccer.cpp in Webots GUI
  
  The exact same code will run in both virtual model and real robot with as little differences as possible.
 
  You may have noticed there are 2 Makefiles. You can safely assume Makefile.darwin-op is the Makefile to compile Webots controller in the real robot.
 
3. To compile the controller in the real robot input the following command

  ```
  make –f Makefile.darwin-op
  ```
  
4. You should see an executable after completion.  
  “chmod 755 soccer” that is the executable file being soccer

  ![](/assets/images/platform/op/op_221.gif)
  
  Run the controller in Webots simulator first. Then do the same in the real robot
  - To run the Webots controller simply enter: `./soccer`
  - To end the program: Hold the `Control` key then press the `C` key
  - To run the Webots controller as a background process enter: `./soccer&`
  - To kill the soccer program running as a background process enter: `killall soccer`
  - To decompile the build then you would need to clean it by: `make clean –f Makefile.darwin-op`

### [Create & Run Custom Controller](#create-run-custom-controller)

Let’s say you want to modify the ‘walk’ controller, but you want to do so as a different controller from walk. You also want to expand robot control by adding side step functionality.
You want to do all the testing in Webots GUI (none in the real robot) before porting your code to the real robot.
 
1. Go to your DARWIN-OP Webots project directory
2. From the controllers sub-directory make a duplicate of the walk directory (and its contents) and let’s say my-walk.

  ![](/assets/images/platform/op/op_222.gif)
 
3. Go into your newly-created my-walk directory and do the following:
  - on every file change anything with 'walk' to 'my_walk'
  - rename `walk.cpp` and `walk.hpp` to `my_walk.cpp` and `my_walk.hpp`
  There may be some post-build files (.c, .d, exe) from the previous build of walk. Feel free to manually delete them
4. From the `worlds` subdirectory create duplicate of `walk.wbt` and rename it `my_walk.wbt`

  ![](/assets/images/platform/op/op_223.gif)
 
  Once you made all the changes for all files.  
  Start Webots by double-clicking on my_walk.wbt the simulation will begin with the previous walk controller loaded to the model. Stop the controller and revert the simulation.

5. From the text editor open the controller file (my-walk.cpp), and in the main loop (my-walk::run()) add 2 more cases as you see in the image below. 
  - Pressing the `A` key the model will sidestep to the left
  - Pressing the `S` key the model will sidestep to the right
 
  `Hint` setYAmplitude(double) deals with sidesteps

  ![](/assets/images/platform/op/op_224.gif)
 
  Save your changes.

6. From the scene tree expand the DARWIN-OP node. On controller change `walk` to `my walk`.  
  Save changes to the world

  ![](/assets/images/platform/op/op_225.gif)
 
After saving your world return to the text editor.  
Compile your new controller and run it in the simulator.  
You should be able to sidestep left and right in addition of being able to turn the model normally.

![](/assets/images/platform/op/op_226.gif)
 
Now its time to transfer `my_walk` to the real robot.  
The easiest way to do so is by accessing DARWIN-OP via Samba drive as done previously.  
Once inside go to: root directory  darwin  Linux  project  webots  controllers.  
Copy your `my_walk` directory from your Webots project to `controllers` directory in DARWIN-OP.

![](/assets/images/platform/op/op_227.gif)

There will be some post-build files (.o, .d, exe, etc) created during the simulation. Feel free to delete these as they are irrelevant in the real robot.  
You may choose to delete the **Makefile** as well because its not necessary in the real robot but must keep `Makefile.darwin-op`.

![](/assets/images/platform/op/op_228.gif)

Feel free to delete the highlighted files. They are not useful in the real robot
 
You can verify that the transfer process was OK by:
- Going to the `controllers` directory
- Type ls to see the contents
 
Then go to `my_walk` directory compile the controller (make –f Makefile.darwin-op)

![](/assets/images/platform/op/op_229.gif)

When executing this controller in particular do not use SSH client (PuTTY) instead use remote desktop (VNC). Otherwise the program will halt with a segmentation fault error.

![](/assets/images/platform/op/op_230.gif)

# [Maintenance](#maintenance)

## [Fuse Replacement](#fuse-replacement)

## [Hardware Maintenance](#hardware-maintenance)

## [Dynamixel Replacement](#dynamixel-replacement)

## [Controller Connection](#controller-connection)

## [Camera Connection](#camera-connection)

## [Self Maintenance Checklist](#self-maintenance-checklist)

## [Recovery](#recovery)

### [Recovery(Ubuntu 9.10)](#recovery-ubuntu-9-10)

#### Install Ubuntu 9.10

`Note` Reference: http://www.fit-pc2.com/wiki/index.php?title=Installing_Ubuntu_9.10
{: .notice}

1. Prepare Installation Media
  - You can use USB CD-ROM Drive or USB Flash drive (disk-on-key) as installation media
  - Download Ubuntu 9.10 Desktop installation
  - If you are using USB CD-ROM - burn downloaded image directly on CD.
  - If you are using USB Flash drive, 1GB would be enough. Download usb-creator to create bootable installation flash drive.
 
2. Installation of generic Ubuntu 9.10 Desktop
  - Standard Ubuntu installation - choose timezone, partitions, username, password etc.
  - Unplug USB CD-ROM / USB Flash drive and reboot
  - Login using previously selected username and password
  - Reference : https://help.ubuntu.com/9.10/installation-guide/i386/index.html
 
`Note` Please note that the command used in Linux operating system is case sensitive.
{: .notice}

3. Required system changes
  - Remember to enter sodu su at the command line to gain writing privelges otherwise file editing will not happen.
  - Add the following lines to /etc/apt/sources.list
  - In this case enter gedit /etc/apt/sources.list (if using gedit).

    ```
    ## Repository for fit-PC2 users provided by Compulab
    deb http://fit-pc2.com/download/ubuntu/dists/karmic binary/
    deb-src http://fit-pc2.com/download/ubuntu/dists/karmic source/
    ```
  
  - Connect DARWIN-OP to the internet via ethernet.
  - Refresh update manager
  
    ```
    $ sudo apt-get update
    ```

  - Install kernel image, kernel headers, graphic drivers and media player for HD playback:

    ```
    $ wget http://www.robotis.com/download/linux/darwin/linux-headers-2.6.31-34-fitpc2i-r1.deb
    $ wget http://www.robotis.com/download/linux/darwin/linux-image-2.6.31-34-fitpc2i-r1.deb
    $ sudo dpkg -i *.deb
    $ sudo apt-get install xserver-xorg-video-poulsbo mplayer-vaapi mplayer-skins
    ```

  - Don't restart here. Select "Restart Later".
  - (Optional) If you want to get the kernel source:

    ```
    $ wget http://www.robotis.com/download/linux/darwin/linux-source-2.6.31-34-fitpc2i-r1.deb
    ```

  - (Optional) You may install w32codecs, libdvdcss2 and other usefull packages from Medibuntu repository.
  - Comment out snd-hda-intel options in /etc/modprobe.d/alsa-base.conf

    ```
    # Power down HDA controllers after 10 idle seconds
    # options snd-hda-intel power_save=10 power_save_controller=N
    ```

  - Remove generic image and sources that are not fully compatible with fit-PC2i.

    ```
    $ sudo apt-get purge linux-generic linux-image-generic linux-headers-generic linux-image-$(uname -r) linux-headers-$(uname -r) && sudo apt-get autoremove
    ```

  - Restart fit-PC2i
  - Ubuntu 9.10 is now installed.
 
 
#### Additional Software Installation

After installing ubuntu 9.10 you must install the following softwares
 
- For Development
  - Install g++ compiler

    ```
    $ sudo apt-get install g++
    ```

  - Install Functions manuals

    ```
    $ sudo apt-get install manpages-dev
    ```

  - Install Libraries

    ```
    $ sudo apt-get install libjpeg62-dev libncurses5-dev
    ```

- For Connections
  - Install SSH server

    ```
    $ sudo apt-get install openssh-server
    ```

  - Install Samba server
    > On Ununtu's desktop go to Applications > Ubuntu Software Center and search for "samba"  
    > Download Samba and install it. Configure samba server.
  - Configure VNC server, Install FreeNX(https://help.ubuntu.com/community/FreeNX), etc..
 
#### Miscellaneous Utilities

- Subversion : Source code version control system client program

  ```
  $ sudo apt-get install subversion
  ```

- madplay : Decode and play MPEG audio FILE(s). (This program must be installed for demo program)

  ```
  $ sudo apt-get install madplay
  ```

- guvcview : a simple GTK+ interface for capturing and viewing video from devices supported by the Linux UVC driver.

  ```
  $ sudo apt-get install guvcview
  ```
 
#### CM-730 Firmware Installation

Refer to [Firmware Installer](#firmware-installer) section.

#### MX-28 settings

Refer to [Dynamixel Monitor](#dynamixel-monitor) section.
Use **reset all** command.

### [Recovery(Linux Mint 9)](#recovery-linux-mint-9)

#### Install Linux Mint 9

`Note` Reference: http://www.fit-pc.com/wiki/index.php/Installing_Linux_Mint_9
{: .notice}
 
1. Prepare Installation Media
  - You can use USB CD-ROM Drive or USB Flash drive (disk-on-key) as installation media
  - Download Linux Mint 9 "Isadora" - Gnome CD (32-bit)
  - If you are using USB CD-ROM - burn downloaded image directly on CD.
  - If you are using USB Flash drive, 1GB would be enough, use "Startup Disk Creator" utility to create LiveUSB.
 
2. Installation of generic Linux Mint 9
  - Standard Linux Mint installation: choose timezone, partitions, username, password etc.
  - Unplug USB CD-ROM / USB Flash drive and reboot
  - Login using previously selected username and password

  `Note` Please note that the command used in Linux operating system is case sensitive.
  {: .notice}

3. Required system changes
  - Remember to enter sodu su at the command line to gain writing privelges otherwise file editing will not happen.
  - Add the following lines to /etc/apt/sources.list
  - In this case enter gedit /etc/apt/sources.list (if using gedit).

    ```
    ## Repository for fit-PC2 users provided by Compulab
    deb http://fit-pc2.com/download/ubuntu/dists/lucid binary/
    deb-src http://fit-pc2.com/download/ubuntu/dists/lucid source/
    ```

  - Connect DARWIN-OP to the internet via ethernet.
  - Refresh update manager

    ```
    $ sudo apt-get update
    ```

  - Install kernel image, kernel headers, graphic drivers and media player for HD playback:

    ```
    $ wget
    http://www.robotis.com/download/linux/darwin/linux-headers-2.6.35.4-robotis_r1_i386.deb
    $ wget http://www.robotis.com/download/linux/darwin/linux-image-2.6.35.4-robotis_r1_i386.deb
    $ wget http://www.robotis.com/download/linux/darwin/xserver-xorg-video-poulsbo_1.5-1742_i386.deb
    $ sudo dpkg -i *.deb
    $ sudo update-initramfs -c -k 2.6.35.4-robotis
    $ sudo update-grub2
    $ sudo apt-get install mplayer-vaapi mplayer-skins
    ```

  - Don't restart here. Select "Restart Later".
  - (Optional) If you want to get the kernel source:

    ```
    $ wget http://www.robotis.com/download/linux/darwin/linux-source-2.6.35.4-robotis_r1_all.deb
    ```

  - Remove generic image and sources that are not fully compatible with fit-PC2i.

    ```
    $ sudo apt-get purge linux-generic linux-image-generic linux-headers-generic linux-image-$(uname -r) linux-headers-$(uname -r) && sudo apt-get autoremove
    ```
    
  - Restart fit-PC2i
  - Linux Mint 9 is now installed.
 
 
#### Additional Software Installation

After installing Linux Mint 9 you must install the following software
 
- For Development
  - Install g++ compiler
    
    ```
    $ sudo apt-get install g++
    ```
    
  - Install Functions manuals
    
    ```
    $ sudo apt-get install manpages-dev
    ```
    
  - Install Libraries
    
    ```
    $ sudo apt-get install libjpeg62-dev libncurses5-dev
    ```
 
- For Connections
  - Install SSH server
    
    ```
    $ sudo apt-get install openssh-server
    ```
    
  - Install Samba server
    > On Ununtu's desktop go to Applications > Ubuntu Software Center and search for "samba"
    > Download Samba and install it. Configure samba server.
  - Configure VNC server, Install FreeNX(https://help.ubuntu.com/community/FreeNX), etc..
 
#### Miscellaneous Utilities

- Subversion : Source code version control system client program
  
  ```
  $ sudo apt-get install subversion
  ```
  
- madplay : Decode and play MPEG audio FILE(s). (This program must be installed for demo program)
  
  ```
  $ sudo apt-get install madplay
  ```
  
- guvcview : a simple GTK+ interface for capturing and viewing video from devices supported by the Linux UVC driver.
  
  ```
  $ sudo apt-get install guvcview
  ```

#### CM-730 Firmware Installation

Refer to [Firmware Installer](#firmware-installer) section.

#### MX-28 settings

Refer to [Dynamixel Monitor](#dynamixel-monitor) section.
Use **reset all** command.


### [Clonezilla Recovery](#clonezilla-recovery)

You can recover the operating system in DARWIN-OP via Clonezilla. The recovery software is the same as the factory-default preinstalled with DARWIN-OP.

`Note` Download the recovery image from [here](http://sourceforge.net/projects/darwinop/files/Software/Main%20Controller/Recovery%20USB/)
{: .notice}
 
- Choose recovery image  
  - Check DARWIN-OP SSD capacity before downloading the corresponding image
 
- How to check DARWIN-OP’s SSD capacity  
  - Turn on DARWIN-OP and press the ‘F2’ key to enter the BIOS menu.  
  - From the menu enter Primary Master(4GB NANDrive(PM))

    ![](/assets/images/platform/op/op_036.jpg)
 
  - Check the capacity as shown below. Then download a matching image.

|SSD Capacity 3.6GB|SSD Capacity 4GB|
|:---:|:---:|
|![](/assets/images/platform/op/op_037.jpg)|![](/assets/images/platform/op/op_038.jpg)|
 
#### NEW: Create Recovery USB

1. Create a Clonezilla Live USB via Tuxboot (http://tuxboot.org/download/files-on-sf.php)

  ![](/assets/images/platform/op/op_039.jpg)
  ![](/assets/images/platform/op/op_040.jpg)

  Oldfiles folder -> 2.0.1-5 folder select and download clonezilla-live-2.0.1-5-i486.iso
  
  ![](/assets/images/platform/op/op_041.jpg)
  ![](/assets/images/platform/op/op_042.jpg)
 
  Select pre-downloaded and look for the file clonezilla-live-2.0.1-5-i486.iso;then click OK

  ![](/assets/images/platform/op/op_043.jpg)

  Once complete click on Exit

  ![](/assets/images/platform/op/op_044.jpg)
 
2. Place the image under /home/partimag of your thumbdrive. That is copy into the directory DARwIn_Recovery_2012-03-19
 
#### OLD: USB Flash Memory Preparation

Go to http://clonezilla.org/liveusb.php for instructions on Clonezilla live USB flash.
The provided image file is located in the directory
 
*/DARwIn_Recovery_date of recovery creation (yyy-mm-dd)* from the USB thumbdrive
 
##### Boot Sequence

Connect the USB thumbdrive into a USB port power on DARWIN-OP and press the F2 key to access Phoenix(tm) Setup Utility (DARWIN-OP's PC system BIOS).  
Select the "Boot" tab and in "Boot order" select USB CDROM as top priority.  
After boot selection go to the "Exit" tab and select Exit Saving Changes, pick yes.
 
##### Operating System Recovery with Clonezilla

1. The first option from Clonezilla: Select default menu  
  Clonezilla live (Default settings, VGA 800x600)
2. Choose language: English (default)  
  en_US.UTF-8 English
3. Configuring console-data: keymap. Select the default option from the menu  
  Don't touch keymap
4. Start Clonezilla: Select the default option from the menu  
  Start_Clonezilla Start Clonezilla
5. Clonezilla: Select the following  
  device-image work with disks or partitions using images
6. Mount Clonezilla image directory: this is the partition where Clonezilla will perform recovery  
  local_dev Use local device (Ex: hard drive, USB drive)  
  Press the "ENTER" key after selection.
7. Clonezilla - Opensource Clone System (OCS) | Mode: Select the following  
  sdb1 3925MB_vfat(In_USB_DISK_)_usb-SMI_USB_DISK_AA00000000001154-0:1  
  Ensure you see the term "sdb1" and "vfat" along with the size if your USB thumbdrive.
8. Clonezilla - Opensource Clone System (OCS) : "/" Select default menu  
  / Top_directory_in_the_local_device   
  Press "Enter" to continue......
9. Clonezilla - Opensource Clone System (OCS) : Select default menu  
  Beginner Beginner mode: Accept the default options
10. Clonezilla: Select mode: Select the following  
  restoredisk Restore_an_image_to_local_disk
11. Clonezilla - Opensource Clone System (OCS) | Mode: restoredisk
12. Clonezilla - Opensource Clone System (OCS) | Mode: restoredisk : Select the destination partition  
  sda 4096MB_4GB_NANDrive__ata-4GB_NANDrive_0000000000R1Y19998XU  
  < Press "Enter" to continue...... > Press the "ENTER" key  
  < Are you sure you want to continue? ? > press the Y key  
  < Let me ask you again, Are you sure you want to continue? ? > confirm by pressing the Y key.
13. Partclone: after completeing restoration  
  < Press "Enter" to continue...... > press the "ENTER" key.
14. You can either power off or reboot> Make sure you remove the USB thumbdrive. after making your selection.
 
##### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/7Zsd73VSTDw" frameborder="0" allowfullscreen></iframe>

#### NEW: USB Flash Memory Preparation

1. Select either of the following
  - From Mount Clonezilla image directory select
    > skip and pick Use existing /home/partimag (writable device. E.g. hard disk/USB drive)
  - From Clonezilla: Select mode
    > select restoredisk pick Restore_an_image_to_local_disk
2. Then press Enter
 
##### USB Flash Memory Preparation
Go to http://clonezilla.org/liveusb.php for instructions on Clonezilla live USB flash.  
The provided recovery image file is located in the directory:  
**/home/partimag/DARwIn_Recovery_[date of recovery creation(yyyy-mm-dd)]**  
From the USB thumbdrive.
 
##### Boot Sequence
Connect the USB thumbdrive into a USB port.  
Power on DARWIN-OP and press the F2 key to access Phoenix(tm) Setup Utility (DARWIN-OP’s PC system BIOS). Select the “Boot” tab and in “Boot order”. Select USB HDD as top priority.  
After boot selection go to the “Exit” tab and select “Exit Saving Changes”, pick Yes.
 
##### Operating System Recovery with Clonezilla
1. The first option from Clonezilla: Select the default option from the menu
  - Clonezilla live (Default settings, VGA 800x600)
2. Choose language: English (default)
  - en_US.UTF-8 English
3. Configuring console-data: Select the default option from the menu
  - Don’t touch keymap
4. Start Clonezilla: Select the default option from the menu
  - Start_Clonezilla  Start Clonezilla
5. Clonezilla: Select the default option from the menu
  - device-image  work with disks or partitions using images
6. Mount Clonezilla image directory: Select the following
  - skip Use existing /home/partimag (Writable device. E.g. hard disk/USB drive)
  - < Press “Enter” to continue……> : Press “Enter” key
7. Clonezilla – Opensource Clone System (OCS) : Select the default option from the menu
  - Beginner Beginner mode: Accept the default options
8. Clonezilla: Select mode: Select the following
  - restoredisk  Restore_an_image_to_local_disk
9. Clonezilla – Opensource Clone System (OCS) | Mode: restoredisk : Choose the image file to restore
  - Ex) DARwIn_Recovery_2012-03-19  2012-0316-1405_sda
10. Clonezilla – Opensource Clone System (OCS) | Mode: restoredisk : Choose the target disk
  - Sda 4096MB_4GB_NANDrive__ata-4GB_NANDrive_0000000000R1Q199982a
  - < Press “Enter” to continue …… > : Press “Enter” key
  - < Are you sure you want to continue? ? (y/n) > : Press ‘Y’ key and Press “Enter” key
  - < Let me ask you again. Are you sure you want to continue? ? (y/n) > : Press ‘Y’ key and Press “Enter” key
11. Starting to restore image to device. Wait until done.
12. After completing restoration
  - < Press “Enter” to continue…> : Press “Enter” key.
13. Now you can choose to: Choose 0 or 1
  - (0) Poweroff
  - (1) Reboot
14. Make sure you remove the USB thumbdrive, and reboot the DARWIN-OP.



# [References](#references)

## [Brochure](#brochure)

## [Specifications](#specifications)

### [Hardware Specifications](#hardware-specifications)

### [Software Specifications](#software-specifications)

## [Software Update Info](#software-update-info)

### [Framework Release Note](#framework-release-note)

Framework source code download : [SourceForge DARWIN-OP framework](https://sourceforge.net/projects/darwinop/files/Software/Main%20Controller/Source%20Code/)
 
#### Ver 1.6.0 - 2013.04.11

- New Additions
  - Webots controller can be compiled into DARwin-OP.
  - DARWIN-OP can be controller from Webots GUI.
  - MX28.cpp, Camera.cpp added to ensure compatibility with Webots.

- Modifications
  - CM730, Image, Imgprocess, LinuxCamera, JointData, Action, Kinematics added Webots functionality
  - MX28.h values now reside in MX28.cpp
  - Camera.h values now reside in Camera.cpp
 
#### Ver 1.5.0 - 2012.03.19

- New Additions
  - FSR firmware has been added.
  - FSR tutorial has been adde

- Modifications
  - LinuxMotionTimer has been changed to use clock_nanosleep function.
 
#### Ver 1.4.0 - 2012.01.16

- Modifications
  - MX-28 firmware updated.
  - Stand-up motion changed.
  - Cannot change the camera gain/exposure value from a web page bug fixed.
  - offset tuner 'set' command bug fixed.
 
#### Ver 1.3.0 - 2011.09.20

- New Additions
  - offset_tuner added.
  - web-based walk_tuner added.

- Modifications
  - CM-730 firmware updated.
  - roboplus support 4096 resolution(MX-28 firmware ver 27 or higher).
  - dxl_monitor : can change baudrate (control table addr 4)
  - Get-up motion changed.
  - read_write tutorial : left arm P gain value changed. (1 -> 8)
 
#### Ver 1.2.0 - 2011.06.01

- New Additions
  - BulkRead instruction added.
  - Support for FSR sensor.

- Modifications
  - Actuator Model name changed (RX-28M -> MX-28)
  - MX-28 firmware updated.
  - dxl_monitor : can change ID (control table addr 3)
  - Get-up motion changed.
  - Sensor calibration routine changed. (use standard deviation)
  - demo & walk_tuner share the config.ini file. (/darwin/Data/config.ini)
  - action_editor : command line bug fixed. (can't input space or number)  
    linux terminal backspace bug fixed.
  - walk_tuner : linux terminal backspace bug fixed.
  - read_write : at the start, torque off the right arm.
  - firmware installer : seperate firmware of the controller and actuator
 
#### Ver 1.1.0 - 2011.04.08

- New Additions
  - firmware_installer : CM-730 & RX-28M firmware installer

- Modifications
  - CM-730 firmware updated. (ver 0x11)
  - RX-28M firmware updated (ver 0x1B)
  - Action class : type casting bug fixed.
  - dxl_monitor : CM-730 control table dump bug fixed.
  - action_editor : command line first char backspace bug fixed. / save command bug fixed.
  - walk_tuner : command line first char backspace bug fixed.
  - some minor bug fixed.
 
#### Ver 1.0.1 - 2011.03.28

- Modifications
  - LinuxCM730 class : move semaphore initial code to constructor
  - action_script : stand-up motion page number changed from 16 to 1
  - demo : at the start of soccer mode, reset the gyro sensor calibration
  - Some walking parameters changed.
  - action_editor : page 255 access problem fixed.
  - Walking class : Y move amplitude bug fixed.
 
#### Ver 1.0.0 - 2011.02.01

- First Release

### [CM-730 Firmware Release Note](#cm-730-firmware-release-note)

CM-730 Firmware source code download : [SourceForge CM730 Firmware](https://sourceforge.net/projects/darwinop/files/Software/Sub%20Controller/)
 
#### Ver 19 (0x13) - 2011.08.26

- New Additions
  - Reset Instruction added.

- Modifications
  - Baudrate bug fixed.
  - Increase TX/RX LED turn on time.
  - Mic. Control table address changed. (67 -> 53)
  - Battery alarm bug fixed.
  - Read / Bulk Read Instruction process routine optimized.
 
#### Ver 18 (0x12) - 2011.04.26

- New Additions
  - BulkRead instruction added.

- Modifications
  - LED bug fixed.
 
#### Ver 17 (0x11) - 2011.04.08

- New Additions
  - Low battery alarm added.

- Modifications
  - USB recognition method changed (interrupt -> polling)
 
#### Ver 16 (0x10) - 2011.02.28

- First Release

### [MX-28 Firmware Release Note](#mx-28-firmware-release-note)

Dynamixel firmware is **NOT** an open source software.
 
#### Ver 30 (0x1E) - 2012.01.05

- New Additions
  - The new hardware was applied.
  - added self-calibration algorithms.
  - added calibration data protection algorithms.

- Modifications
  - CPU main clock was updated to 72MHz.
  - fixed EEPROM bug.
 
#### Ver 29 (0x1D) - 2011.05.18

- Modifications
  - Wheel mode bug fixed.
 
#### Ver 28 (0x1C) - 2011.05.02

- Modifications
  - PID Resolution 4 times increase.
  - P gain default value changed. (8 -> 32)
 
#### Ver 27 (0x1B) - 2011.04.11

- New Additions
  - PID Control

- Modifications
  - Resolution changed from 1024 to 4096.
 
#### Ver 26 (0x1A) - 2011.02.28

- First Release

### [FSR Firmware Release Note](#fsr-firmware-release-note)

FSR firmware is **NOT** an open source software.
 
#### Ver 17 (0x11) - 2012.03.08

- First Release


## [Links](#links)
