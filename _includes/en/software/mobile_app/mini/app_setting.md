The ‘Setting’ is located on the top right corner of your device and below are the explanations for the menus.

### Server/Client Setting

This setting is for controlling one ROBOTIS-MINI with many smart devices. One smart device will be set as Server to connect directly with the ROBOTIS-MINI, and the other smart devices will be set as Client to send commands to the Server. The Server will receive the commands sent from the Clients, then send the commands to ROBOTIS-MINI to make it perform a motion.
{: .notice}

By using the server/client setting, the user can hold one smart device in each hand to control the ROBOTIS-MINI. The left hand device may perform gestures for left motions, and the right hand device may perform gestures for right motions.

This function cannot be used under mobile network connection (3G/4G/LTE). The smart devices that are set under server and client setting must be connected in the same network.

1) They can be connected to the same router, or 2) One device may have its Wi-Fi hotspot function turned on, with the other devices connected to this hotspot

![](/assets/images/sw/mobile/mini_app_060.png)


- Server/Client Setting

  Only the smart device set as Server will be connected to the ROBOTIS-MINI via Bluetooth, so the smart devices set as Client will not show the registered robot list when the App is run.
  - The IP Address of the smart device will be shown when Server is selected.
  - Input this address into the Client smart devices and select the Test button.
  - If set correctly, the Server smart device will show the message ‘Test’ when the Client performs the test.

    ![](/assets/images/sw/mobile/mini_app_061.jpg)
    ![](/assets/images/sw/mobile/mini_app_062.jpg)
    ![](/assets/images/sw/mobile/mini_app_063.jpg)

    How to set your portable  Wi-Fi hotspot : The setting method and images can be different from those illustrated below.

  - Go into the following setting menu in your smart device; System – Wireless & networks – Tethering & portable hotspot – and check ‘Portable Wi-Fi hotspot’.

    ![](/assets/images/sw/mobile/mini_app_064.jpg)
    ![](/assets/images/sw/mobile/mini_app_065.jpg)

  - You can change the name of the smart device to be displayed on the other devices under the ‘Set up Wi-Fi hotspot’ setting.

    ![](/assets/images/sw/mobile/mini_app_066.jpg)
    ![](/assets/images/sw/mobile/mini_app_067.jpg)

    When using this function, all Server and Client devices will connect to the internet (data communication) using the Server  device (set as the hotspot), so please take caution of your data package usage.
    {: .notice}


### Motion Sound Setting

Users can add a sound file to be played when a certain motion number is performed. With this function, users can play a music on the smart device while performing dance motions.
{: .notice}

Select ‘Add sound’ to input the specific motion number and register the sound file to be played. Registered sound files can be played, edited, or deleted from the sound list.

![](/assets/images/sw/mobile/mini_app_068.jpg)
![](/assets/images/sw/mobile/mini_app_069.jpg)
![](/assets/images/sw/mobile/mini_app_070.jpg)
![](/assets/images/sw/mobile/mini_app_071.jpg)

### Motion File Setting

‘Motion page number’ is the numbers that are given to the motions in the motion group.
Users can save time on checking each motion page number by registering the motion files in the ‘Motion file setting’.
{: .notice}

Once a motion file is registered, the ‘list’ button will be shown on the ‘add command’ window. Select the ‘list’ button to show the list of motion pages in the motion file. Select one of the motion pages shown, then its motion name and motion page number will be automatically inputted on the screen.

The default value is set to the basic motion file provided with the ROBOTIS-MINI.

![](/assets/images/sw/mobile/mini_app_072.jpg)
![](/assets/images/sw/mobile/mini_app_073.jpg)
![](/assets/images/sw/mobile/mini_app_074.jpg)

Once a motion file is registered, the ‘list’ button will be shown on the ‘add command’ window. Select the ‘list’ button to show the list of motion pages in the motion file. Select one of the motion pages shown, then its motion name and motion page number will be automatically inputted on the screen.

![](/assets/images/sw/mobile/mini_app_075.jpg)
![](/assets/images/sw/mobile/mini_app_076.jpg)
![](/assets/images/sw/mobile/mini_app_077.jpg)

### Accessibility Setting

Accessibility Setting is required to use the ‘Messenger’ function of the ROBOTIS-MINI App. The App must be able to access the message received through the messenger to verify that it is a correct command registered in the command list.
{: .notice}

Once this function is activated, the ROBOTIS-MINI App can access the received messages that show up on the smart device’s notification bar.

So, if this function is deactivated, the ROBOTIS-MINI App won’t be able to access and read the commands sent via messenger, so the robot will not be able to carry out the command.

Unlike the Server/Client setting, this function uses the messenger as a media of sending the command, so the smart device (not connected to the ROBOTIS-MINI) sending the message to the main smart device (connected to the ROBOTIS-MINI) doesn’t have to be connected in the same network.

The user must activate the ‘ROBOTIS-MINI’ on the accessibility setting list to activate this function.

![](/assets/images/sw/mobile/mini_app_078.jpg)
![](/assets/images/sw/mobile/mini_app_079.jpg)
![](/assets/images/sw/mobile/mini_app_080.jpg)
![](/assets/images/sw/mobile/mini_app_081.jpg)

### Gesture Margin of Error Setting

This setting is used to adjust the gesture recognition rate when using the Gesture function. Setting the margin of error tolerance range low will require more precise gesture movement. Setting the range high will improve gesture recognition but will be more sensitive to other similar movements.
{: .notice}

Please refer to ‘Operating ROBOTIS-MINI’ for more information on the Gesture function.

![](/assets/images/sw/mobile/mini_app_082.jpg)
![](/assets/images/sw/mobile/mini_app_083.jpg)


### Actuator Test
Touch ‘Setting” then “Actuator Test’ to check your assembly. Once your smart device and ROBOTIS-MINI are connected, the image of ROBOTIS-MINI on the far right will appear. Tap on each of the ID, and if the Bluetooth is connected and there is no problems in the actuators, the joint’s LED will blink in red, green, then blue.

If you tap an ID but the wrong joint lights up on the actual robot, there is an assembly problem. In this case, change the ID, or reassemble the joint into the correct position.

![](/assets/images/sw/mobile/mini_app_084.jpg)
![](/assets/images/sw/mobile/mini_app_085.jpg)
![](/assets/images/sw/mobile/mini_app_086.jpg)

### Motion Offset

Offset refers to the difference of standard value. Even when assembling the same type of robots, minor deviations exist between each of their respective motors, resulting in the final posture to be slightly different between them. Adjusting the motion offset value will compensate the deviated amount to perform motions more accurately.
{: .notice}

- ROBOTIS-MINI Initial Position
  Going into the ‘Motion Offset’ menu will read the saved offset value in the ROBOTIS-MINI, and ROBOTIS-MINI will move into its initial pose (with the offset applied). The initial pose of ROBOTIS-MINI looks like the image below.

  ![](/assets/images/sw/mobile/mini_app_087.png)
  ![](/assets/images/sw/mobile/mini_app_088.png)
  ![](/assets/images/sw/mobile/mini_app_089.png)

If a joint’s position is not as shown on the image and is crooked, use the torque ON/OFF function of the joint to adjust the joint into its correct initial position.

`Caution` Please hold up the ROBOTIS-MINI to accurately check the position of the joints.Checking the position with the ROBOTIS-MINI on the ground may cause its legs or waist joints to alter.
{: .notice--warning}

Touch an ID to turn the respective joint’s torque OFF, and you will be able to physically move the joint. The image shown on the screen shows how the correct standard position of the joint should be.

Refer to the image to move the joint to its correct position, and select ‘Okay’ to turn the torque back ON. The app will read the adjusted value of the position to calculate and show the offset value on the screen.

![](/assets/images/sw/mobile/mini_app_090.jpg)
![](/assets/images/sw/mobile/mini_app_091.jpg)
![](/assets/images/sw/mobile/mini_app_092.jpg)

If it is difficult to position the joint into an accurate position, touch (hold) the ID number long to go into a precise setting mode from the smart device. This way, users will be able to precisely adjust the joint position using the slide bar displayed on the screen.

![](/assets/images/sw/mobile/mini_app_093.jpg)
![](/assets/images/sw/mobile/mini_app_094.jpg)

  - Touching the ‘offset reset’ button on the top will return all offset value to ‘0’.
  - Touching the ‘initial position’ will delete all offset value in adjustment, and return the initial position to the offset value that was saved in the ROBOTIS-MINI.

  Applying the changed offset to the ROBOTIS-MINI requires downloading. Touch the download button on the top right to download the value to the ROBOTIS-MINI controller.

### Initialize
This functions returns the settings for the Button/Gesture/Voice to it’s default setting.
