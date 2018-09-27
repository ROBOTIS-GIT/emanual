**NOTE** : The ROBOTIS-MINI app uses smart device’s functions such as the button, gesture (sensor), voice recognition, and messenger to play motions.
{: .notice}

- **Button** : Use the buttons on your screen to operate the ROBOTIS-MINI.
- **Gesture** : Move the smart device to make particular gestures of the ROBOTIS-MINI.
- **Voice Recognition** : Use the voice recognition feature of the ROBOTIS-MINI to respond to your voice.
- **Messenger** : Use another smart device to control the ROBOTIS-MINI. It can be connected to another smart device and send commands by a text message.
- **Remote Controller** : Displays a virtual remote controller on the screen for easier controlling for fighting games and soccer games.

Stop Motion, Initial Position, and Stand Up are 3 basic buttons on the `Run` tab.

![](/assets/images/sw/mobile/mini_app_013.jpg)
![](/assets/images/sw/mobile/mini_app_014.jpg)

Below are the functions of each button.
- `Stop Motion` : This button calls on the Motion #0. If this button is pressed during a motion, ROBOTIS-MINI stops after playing current motion unit.
- `Initial Pose` : This button calls on the Motion #1, which is the initial position command. If Motion #1 is modified, it will play the modified motion in Motion #1.
- `Stand Up` : This button calls on the Motion #2, which is the stand up command.  If Motion #2 has been modified, it will run on the modified command.

**NOTE** : When the robot is playing a motion, all other motions except the `Stop Motion` will be ignored.
{: .notice}

### Control with Buttons
In order to Add/Edit/Delete/Arrange buttons, use the `Edit` tab.

- Edit Button Row

  - Add a button row : Press the `Add Button` button in the `Edit` tab to add a new line at the top row.

    ![](/assets/images/sw/mobile/mini_app_015.jpg)
    ![](/assets/images/sw/mobile/mini_app_016.jpg)
    ![](/assets/images/sw/mobile/mini_app_017.jpg)

  - Change button row order : Touch the right side of the row then drag up or down to move the row.

    ![](/assets/images/sw/mobile/mini_app_018.jpg)
    ![](/assets/images/sw/mobile/mini_app_019.jpg)
    ![](/assets/images/sw/mobile/mini_app_020.jpg)

  - Delete button row : Touch the right side of the row then slide to the left to delete the row.

    ![](/assets/images/sw/mobile/mini_app_021.jpg)
    ![](/assets/images/sw/mobile/mini_app_022.jpg)
    ![](/assets/images/sw/mobile/mini_app_023.jpg)

- Edit Button

  - Edit Button : Touch `+` to add a new button. Touch other existing command buttons to edit.

    ![](/assets/images/sw/mobile/mini_app_024.jpg)
    ![](/assets/images/sw/mobile/mini_app_025.jpg)
    ![](/assets/images/sw/mobile/mini_app_026.jpg)

  - The Motion Page Number is the number of the designated motions downloaded on the robot.
  - If a Motion Page Number is not designated, the button name will be shown in light gray.
  - If both Button Name and Motion Page Number are blank, the button will not appear on the `Run` tab.

- Use the motion file setting to input motion call numbers  
  If you define the motion file in the [`Motion File Setting`](/docs/en/edu/mini/#motion-file-setting) in the app setting, you can load motion lists with the `List` in the top right corner of the button editing screen.

  Select desired motion from the list to automatically fill up the Button Name and Motion Page Number.

  ![](/assets/images/sw/mobile/mini_app_027.jpg)
  ![](/assets/images/sw/mobile/mini_app_028.jpg)
  ![](/assets/images/sw/mobile/mini_app_029.jpg)

### Control with Gestures
The `Gesture` tab uses the acceleration sensor of the smart device to command the robot to do certain motions. For example, if the user draws an O or X when holding the smart device, the robot will either walk or sit down based on the assigned motion. This works when the smart device is held straight up 90 degrees to the ground.

- Move the robot by holding your smart device and making a gesture.

  ![](/assets/images/sw/mobile/mini_app_030.png)

- While touching the center of the screen, tilt the smart device to operate the robot.
  - Basic buttons beneath the Slope option can also be used to operate the robot.

  Touch the `Slope` button at the bottom of the screen to check motions designated by tilting the smart device.
  {: .notice}

  ![](/assets/images/sw/mobile/mini_app_031.jpg)
  ![](/assets/images/sw/mobile/mini_app_032.jpg)

  Touch the `Edit` button to add, edit, or delete gestures. Training the gesture will increase the recognition accuracy. Also, the basic gestures for `Slope` can be edited.

- Register Gestures
  - Touch `Add Gesture` button to add gestures.
  - Enter the gesture name, motion page number and description.
  - Touch `Ready` button and move the smart device at a steady speed.

  ![](/assets/images/sw/mobile/mini_app_033.jpg)
  ![](/assets/images/sw/mobile/mini_app_034.jpg)
  ![](/assets/images/sw/mobile/mini_app_035.jpg)

  - When the gesture is done there will be a beep sound along with a short vibration and a message saying **Gesture xxx learned** will appear.

  ![](/assets/images/sw/mobile/mini_app_036.jpg)
  ![](/assets/images/sw/mobile/mini_app_037.jpg)

  - Touch `OK` to add the gesture.

    > If you do not hear the “Beep” sound, please check the media volume.

    > When adding gestures, if you have already set the motion project file, the `List` button will appear for easy access to add motions.

- Edit Gesture
  - To edit a gesture touch the `Edit` button.
  - Use the same method when adding gestures to edit and finalize by touching `OK`

- Delete Gesture
  - Touch the right side of the line then slide to the left to delete.

- Edit Button
  - Touch the command you want to edit.
  - Maximum 3 buttons(1 row) can be added in the Button section of the bottom of the screen.

- Edit Slope
  - Touch `Slope` at the bottom to edit screen.
  - 4 pre-defined directions can be used in the Slope section.
  - Touch the direction button to edit the name and motion page number.

  ![](/assets/images/sw/mobile/mini_app_038.jpg)
  ![](/assets/images/sw/mobile/mini_app_039.jpg)
  ![](/assets/images/sw/mobile/mini_app_040.jpg)

  The pre-defined directions are defined by the smart device in the right hand as shown below.
  {: .notice}

  ![](/assets/images/sw/mobile/mini_app_041.png)


- What is the Gesture Training?

  Use the gesture training feature to increase the recognition accuracy of registered gestures.
  - Touch `Train` for the gesture you would like to train.
  - Touch `Ready` and make a bigger gesture or tilt the smart device and/or make different gestures.
  - When the gesture is done there will be a beep sound along with a short vibration and a message saying **Gesture xxx learned** will appear.
  - Repeat above steps to train the motion.

### Operate with Voice Recognition

**NOTE** : ROBOTIS-MINI uses Google's voice recognition.
{: .notice}

Touch the microphone icon in the center of screen then speak(input) the command. To use this function, you must have an internet connected smart device.

![](/assets/images/sw/mobile/mini_app_042.jpg)
![](/assets/images/sw/mobile/mini_app_043.jpg)
![](/assets/images/sw/mobile/mini_app_044.jpg)

Touch the ‘Edit’ button to add, edit, or delete any voice command.

- Add Voice Command
  - Touch the ‘Add Voice Command’ to add a command.
  - After deciding the command and motion number, touch the ‘Okay’ button.

  ![](/assets/images/sw/mobile/mini_app_045.jpg)
  ![](/assets/images/sw/mobile/mini_app_046.jpg)
  ![](/assets/images/sw/mobile/mini_app_047.jpg)

- Edit Voice Command
  - Select the voice command of the gesture to edit and touch “Edit

- Delete Voice Command
  - Touch the right side of the line then drag left to delete.

- Voice Recognition Training Function?

  Use the registered voice command to increase the chances of getting the right command by training it using the icon marked below.
  - Select the voice command to ‘Train.’
  - Say the word after touching the MIC icon on your screen.
  - When the voice is recognized, the word most similar will appear.

  ![](/assets/images/sw/mobile/mini_app_048.jpg)
  ![](/assets/images/sw/mobile/mini_app_049.jpg)
  ![](/assets/images/sw/mobile/mini_app_050.jpg)

- Touch the ‘Okay’ button to register the most similar word to the relevant voice command.

**CAUTION** : To delete a command added during the training, delete the voice command first and then re-register.
{: .notice--warning}

`Voice Recognition Test` To check whether the registered voice command is recognized properly, use the MIC icon under the ‘Edit’ tab to test the word. This does not operate the robot.
{: .notice}


### Operate with Messenger

Your robot can be controlled using the various Messengers in your smart device. [Does not work on all Messengers.] To receive commands via Messenger, you must have internet access to your smart device.

![](/assets/images/sw/mobile/mini_app_051.jpg)

Messenger, uses the notification bar of your smart device to check whether the command corresponds to the message then runs the command if it is the same.
Messenger uses the registered voice commands.

**CAUTION** : Your **Accessibility Setting** for the ROBOTIS-MINI  App must be enabled(Please refer to the ROBOTIS-MINI App Accessibility Setting). If your exact message is not displayed in the notification bar, you may not have access to your robot via Messenger.
{: .notice--warning}

### Operate with Remocon

- Use the buttons displayed  in the figure below to control ROBOTIS-MINI.
- The buttons on the left are used for movement and will activate the same pre-set motions in both modes.
- The numbered buttons on the right [1~6] activate different motions in Soccer Mode (offense/defense) and different motions in Fight Mode. Over both modes, a total of 18 motions can be assigned to the buttons. When a motion is not assigned to a button, the button will be blue.
- Switch between Soccer Mode or Fight Mode by tapping the button in the red rectangle in the figure below.

![](/assets/images/sw/mobile/mini_app_052_en.png)

- Soccer Mode
  - 2 available modes : Defense and Offense

  ![](/assets/images/sw/mobile/mini_app_053_en.png)

  - Default buttons motions for Offense are Left Block (1), Right Block (2), Block 1 (3), Block 2(4); for Defense, the default motion buttons are Left Kick, Right Kick, Left Side Kick, and Right Side Kick.

- Fight Mode
  - The default button settings for Fight Mode are Left Attack(1), Right Attack(2), Front Attack(3).

  ![](/assets/images/sw/mobile/mini_app_054_en.png)

- Exit
  - Click on the “X” icon in the upper right hand corner to close the remocon screen.

  ![](/assets/images/sw/mobile/mini_app_055_en.png)

- Run & Edit
  - To control your ROBOTIS-MINI, click on the Run tab then, click on the numbered buttons

  ![](/assets/images/sw/mobile/mini_app_056_en.png)

- To edit robot motions, click the Edit tab. Then click on a specific motion to edit it.

  ![](/assets/images/sw/mobile/mini_app_058_en.png)
  ![](/assets/images/sw/mobile/mini_app_059_en.png)
