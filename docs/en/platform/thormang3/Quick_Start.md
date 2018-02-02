---
layout: archive
lang: en
ref: thormang3_Quick_Start
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/Quick_Start/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

# [Quick Start](#quick-start)

## [Unpacking](#unpacking)

1. Open the case and remove the sponge. **Red dot** Direction of the robot’s head

    ![](/assets/images/platform/thormang3/thormang3_006.jpg)

2. Take out shock absorption sponge, Charger supply, Consumables box.

    ![](/assets/images/platform/thormang3/thormang3_007.jpg)

3. Close the case. The head should face up. **Red dot** Direction of the robot’s head

    ![](/assets/images/platform/thormang3/thormang3_008.jpg)

4. Open the box and hang the carabiners on the lift

    ![](/assets/images/platform/thormang3/thormang3_009.jpg)

    ![](/assets/images/platform/thormang3/thormang3_010.jpg)

5. Hang the i-bolt on the carabiners. Drag the upper body out of the case. **Yellow dot** Location of the i-bolt

    ![](/assets/images/platform/thormang3/thormang3_011.jpg)

6. The robot will come out naturally via the lift. Please use your hands to take out the robot’s legs.

    ![](/assets/images/platform/thormang3/thormang3_012.jpg)

7. Raise the lift and take out the battery charger box. **Yellow square** is the Battery charger box

    ![](/assets/images/platform/thormang3/thormang3_013.jpg)

    ![](/assets/images/platform/thormang3/thormang3_014.jpg)

## [Power On](#power-on)

1. Hang THORMANG on the lift. Raise THORMANG’s feet off the ground.

    ![](/assets/images/platform/thormang3/thormang3_015.jpg)

2. (Using power supply) Plug into the power supply(18V, over 10A) to provide power to pc cable.  
  Plug into the power supply(24V, over 30A) to provide power to body cable(Using Battery Pack instead of the power supply)  
  You can select either the power supply or battery pack to supply power on THORMANG.  
  If you want to use the battery pack, please follow the steps below.  
  - Ensure the battery packs are fully charged.
  - Open the battery compartment door (unscrew the thumbscrew) and insert the battery packs. Close and secure the compartment (screw the thumbscrew).
  - Connect battery connectors with two battery power connectors.

    ![](/assets/images/platform/thormang3/thormang3_016.jpg)

3. First, witch on three switches on the power board, and then turn on the MPC and PPC.

    ![](/assets/images/platform/thormang3/thormang3_017.jpg)

4. Release the E-stop button. If the E-stop button is pressed, the system is inactive.

    ![](/assets/images/platform/thormang3/thormang3_018.jpg)

## [Connect to THORMANG3](#connect-to-thormang3)

Open the network setting page of your computer and set the IP address of your computer to be in the same network with THROMANG3(Example: 10.17.3.xxx)

- Connection Information
  - MPC (Motion PC) IP Address : `10.17.3.30`
  - PPC (Perception PC) IP Address : `10.17.3.35`
  - MPC & PPC user name : `robotis`
  - MPC & PPC password : `111111`

### Example with SSH Client (Windows)
- Execute SSH client program (ex: PuTTY)
- Input THOR-MANG 3 MPC’s IP address : `10.17.3.30`
- Select SSH as a connection type and then open the connection.
- Input THOR-MANG 3 MPC’s user name : `robotis`

![](/assets/images/platform/thormang3/thormang3_019.jpg)

Input THOR-MANG 3 MPC’s password : `111111`
ROBOTIS recommends users to connect with THROMANG3 via SSH client.

### Example: SSH Client (Ubuntu)
- Open the terminal window.
- Type the following SSH command with the MPC’s user name and IP address : `$ ssh –l robotis 10.17.3.30`
- Input the MPC’s password : `111111`

![](/assets/images/platform/thormang3/thormang3_020.jpg)

### Example: VNC client (Windows)
- Execute VNC client program (e.g. Ultra VNC Viewer)
- Input the MPC’s IP address : `10.17.3.30`
- Input the MPC’s password : `111111`

![](/assets/images/platform/thormang3/thormang3_021.jpg)

## [Basic Operation](#basic-operation)

### Basic Manipulation Demo

1. Connect to the PPC with SSH client program (IP: 10.17.3.35)

    ```
    $ ssh 10.17.3.35 -l robotis (password: 111111)
    ```

2. The following command will execute the manipulation demo.

    ```
    $ rosrun thormang3_manipulation_demo thormang3_manipulation_demo
    ```

3. 5 commands are programmed and can be executed from  the terminal window.
  - demo 1 : go to initial pose (from base module)

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "ini_pose"
    ```

  - demo 2 : set manipulation module

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "set_mode"
    ```

  - demo 3 : go to manipulation base pose - Joint Space Control

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "base_pose"
    ```

  - demo 4 : move right arm (without torso) - Task Space Control

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "right_arm"
    ```

  - demo 5 : move left arm (with torso) - Task Space Control

    ```
    $ rostopic pub -1 /robotis/manipulation_demo/command std_msgs/String "left_arm"
    ```

### Basic Walking Simple Demo

1. Connect to the PPC with SSH client program (IP: 10.17.3.35).

    ```
    $ ssh 10.17.3.35 -l robotis(password: 111111)   
    ```

2. The following command will execute the walking demo.

    ```
    $ rosrun thormang3_walking_demo thormang3_walking_demo   
    ```

3. 5 commands are programmed and can be executed from the terminal window.
  - demo 1 : go to initial pose (from base module)

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "ini_pose"
    ```

  - demo 2 : set manipulation module

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String "set_mode"
    ```

  - demo 3 : enable/disable balance algorithm – Balance ON / OFF

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “balance_on”  
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “balance_off”
    ```

  - demo 4 : walk forward – One step forward walking (balance should be turned on)

    ```
    $rostopic pub -1 /robotis/walking_demo/command std_msgs/String “forward”
    ```

  - demo 5 : walk backward – One step backward walking (balance should be turned on)

    ```
    $ rostopic pub -1 /robotis/walking_demo/command std_msgs/String “backward”
    ```

## [Power Off](#power-off)

1. Hang THORMANG on the lift

    ![](/assets/images/platform/thormang3/thormang3_022.jpg)

2. Press the E-Stop button(Turn off the DXL power)

    ![](/assets/images/platform/thormang3/thormang3_023.jpg)

3. After both PCs are turned off, switch off three switches on the power board.

    ![](/assets/images/platform/thormang3/thormang3_024.jpg)

## [Battery Charge](#battery-charge)

1. Connect all battery sockets in to the battery charger sockets.
  - Channel 1 connect the yellow jack
  - Channel 2 has a white terminal  
      - Connect the DC power supply to the battery charger.
      - Insert the AC plug of the DC power supply into the power socket.

      ![](/assets/images/platform/thormang3/thormang3_025.jpg)

2. Power on and check the settings. See the below images. The different settings to match the settings by pressing the button.

    ![](/assets/images/platform/thormang3/thormang3_026.jpg)

3. Connect the white male charging connector to the female connector of the battery. Connect the battery’s white balance connector to the cell balance connector(6 pin connector).

    ![](/assets/images/platform/thormang3/thormang3_027.jpg)

4. Connect the yellow male charging connector to the female connector of the battery.  
  Connect the battery’s white balance connector to the cell balance connector(7 pin connector).

      ![](/assets/images/platform/thormang3/thormang3_028.jpg)

5. Select channel A. Then, press and hold the START button when the cursor is on the “Charge” option. When the screen changes, press ENTER to start charging battery if configuration is fine.

    ![](/assets/images/platform/thormang3/thormang3_029.jpg)

6. Select channel A. Then, press and hold the START button when the cursor is on the “Charge” option. When the screen changes, press ENTER to start charging battery if configuration is fine.

    ![](/assets/images/platform/thormang3/thormang3_030.jpg)

7. Melody is played (when the battery is fully charged), press the ESC button and unplug all connectors.

  `Note` Each 4 channels can be charged independently.
  {: .notice}

## [Repacking](#repacking)

1. Put the battery charger box into the case.

    ![](/assets/images/platform/thormang3/thormang3_031.jpg)

2. Pack the robot by placing its feet first. Please be careful with the handling to prevent damage to the robot’s arm.

    ![](/assets/images/platform/thormang3/thormang3_032.jpg)

3. Bend the robot’s head forward. If the lift doesn’t go down, separate the lift and carabiners

    ![](/assets/images/platform/thormang3/thormang3_033.jpg)

4. Refer to the pictures: Put the sponge for arm and head protection.

    ![](/assets/images/platform/thormang3/thormang3_034.jpg)

5. Refer to the pictures for robot arm arrangement. Put the sponge for upper body and knee protection.

    ![](/assets/images/platform/thormang3/thormang3_035.jpg)

6. Cover the case with the sponge and close the lid.

    ![](/assets/images/platform/thormang3/thormang3_036.jpg)


[Install Ubuntu Desktop]: http://www.ubuntu.com/download/desktop/install-ubuntu-desktop
[DIR-806A Product Manual]: ftp://ftp.dlink.ru/pub/Router/DIR-806A/Data_sh/
[Install ROS]: http://wiki.ros.org/kinetic/Installation/Ubuntu
[Environment Setting Reference]: http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment
[ROS Network Setup Reference]: http://wiki.ros.org/ROS/NetworkSetup
[sbpl install instruction]: https://github.com/sbpl/sbpl
[Link]: http://techtidings.blogspot.kr/2012/01/problem-with-libglso-on-64-bit-ubuntu.html
