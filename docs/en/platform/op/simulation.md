---
layout: archive
lang: en
ref: op_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op/simulation/
sidebar:
  title: ROBOTIS OP
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

### [Compiling Webot Controller](#compiling-webot-controller)

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

When executing this `controller` in particular do not use SSH client (PuTTY) instead use remote desktop (VNC). Otherwise the program will halt with a segmentation fault error.

![](/assets/images/platform/op/op_230.gif)
