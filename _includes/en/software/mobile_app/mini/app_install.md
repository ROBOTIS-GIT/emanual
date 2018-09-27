### Introduction & Installation
ROBOTIS-MINI uses a smart device to operate various motions.

#### System Requirements
- OS : Android2.3.3 (Gingerbread) or above
- Hardware : 1.2GHz Dual Core or above, RAM 1GB or above

Open the `Play Store` or `App Store` on the smart device. (Play Store is for Android Market App)  
Search for `ROBOTIS MINI` or `ROBOTIS` and select `MINI`, then click to install. An authorization request message may appear.

![](/assets/images/sw/mobile/mini_app_001.jpg)

### Bluetooth Connection
When the controller is turned on and the LED of the Bluetooth (BT-210) blinks, the robot and Bluetooth are successfully connected.

![](/assets/images/sw/mobile/mini_app_002.jpg)

### Connecting the robot with the app using Bluetooth

#### Execute the ROBOTIS-MINI app.
- Turn the robot on and run the ROBOTIS-MINI app on the smart device.
- If the Bluetooth option on smart device is turned off, a message to request a permission will appear. Select `Yes` to enable the Bluetooth.

![](/assets/images/sw/mobile/mini_app_003.png)

![](/assets/images/sw/mobile/mini_app_004.png)

**CAUTION** : If the smart device is configured as a `Client`, it will skip to the operation screen directly instead of the registering screen.  
Please refer to the [`App Setting`](#app-setting) section for Server/Client settings.
{: .notice--warning}

#### Check the Bluetooth (BT-210) connection
- From the list of `Registered Robot` look for the Bluetooth ID number connected to your robot. This number can be found on the top face of the Bluetooth module as shown in the image below.
- If the ID does not exists, select `Search New Robot` to register the new Bluetooth module.

![](/assets/images/sw/mobile/mini_app_005.jpg)

#### Enter Bluetooth PIN number
- You need to enter the PIN information to pair your smart device with the Bluetooth module. The default PIN number is `0000`.
- Enter `0000` and select `OK` to connect the robot. The image on the left will appear.

![](/assets/images/sw/mobile/mini_app_008.jpg)

### Assembly Check using the App
Select `Setting` option, then use `Actuator Test` feature to check the assembly. Once your smart device and ROBOTIS MINI are connected, the image of ROBOTIS MINI on the right will appear.

Tap on each ID while Bluetooth is connected. If there is no problems in the assembly, the Dynamixel LED will blink in red, green, then blue.

If you tap on an ID but the wrong Dynamixel LED lights up in the actual robot, there is an assembly problem. In this case, change the ID, or reassemble the joint by switching with the correct Dynamixel.

![](/assets/images/sw/mobile/mini_app_010.jpg)
