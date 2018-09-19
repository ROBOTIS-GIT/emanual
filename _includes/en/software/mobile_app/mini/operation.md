The ROBOTIS-MINI app uses the smart device’s functions such as the button, gesture (sensor), voice recognition, and messenger to execute the motions.
{: .notice}

- Button : Use the buttons on your screen to operate the ROBOTIS-MINI
- Gesture : Use the smart device to make particular gestures on the ROBOTIS-MINI
- Voice Recognition : Use the voice recognition function for the ROBOTIS-MINI to respond to your voice.
- Messenger : Use another smart device to control the ROBOTIS-MINI. It can be connected to a different smart device using Messenger by sending commands.
- Remocon : Remote Controller : Displays a virtual remote controller on the screen for easier controlling of fighting games and soccer games.

Stop Motion, Initial Position, and Stand Up are 3 basic buttons on the “Run” tab.

![](/assets/images/sw/mobile/mini_app_013.jpg)
![](/assets/images/sw/mobile/mini_app_014.jpg)

Below are the functions of each button.
- Stop Motion : This button calls on the Motion #0 to execute endless loop motion. To stop motions, simply press this button to stop after the current motion is done executing.
- Initial Position : This buttons call on the Motion #1, which is the initial position command.  If Motion #1 has been modified, it will run on the modified command.
- Stand Up : This buttons call on the Motion #2, which is the stand up command.  If Motion #2 has been modified, it will run on the modified command.

When the robot is executing a motion, all other motions except the ‘Stop Motion’ will be ignored.
{: .notice}

### Control with Buttons
Touch a registered button in the ‘Button’ tab to activate a motion. Touch the ‘’Edit’ tab to Add/Edit/Delete/ and change the location of the button.

- Edit Button Line

  Add button line : Press the ‘Add Button’ button in the “Edit’ tab to add a new line to the top line.

  ![](/assets/images/sw/mobile/mini_app_015.jpg)
  ![](/assets/images/sw/mobile/mini_app_016.jpg)
  ![](/assets/images/sw/mobile/mini_app_017.jpg)

  Change button line order : Touch the right side of the line then drag up or down to move the line.

  ![](/assets/images/sw/mobile/mini_app_018.jpg)
  ![](/assets/images/sw/mobile/mini_app_019.jpg)
  ![](/assets/images/sw/mobile/mini_app_020.jpg)

  Delete button line : Touch the right side of the line then drag left to delete a line.

  ![](/assets/images/sw/mobile/mini_app_021.jpg)
  ![](/assets/images/sw/mobile/mini_app_022.jpg)
  ![](/assets/images/sw/mobile/mini_app_023.jpg)

- Edit Button

  Edit Button Data : Touch  ‘+’ to add a new button. Touch other existing command buttons to edit.

  ![](/assets/images/sw/mobile/mini_app_024.jpg)
  ![](/assets/images/sw/mobile/mini_app_025.jpg)
  ![](/assets/images/sw/mobile/mini_app_026.jpg)

  - The motion numbers are the numbers of the designated motions downloaded on the robot.
  - If a motion number is not designated, the button name will be shown in light gray.
  - If the button name and motion number are both deleted, it will not appear on the “Run” tab.

  Use the motion file setting to input motion call numbers : If you designate the motion file to use under ‘Motion File Setting’ in the app setting, you will see the ‘List’  in the top right corner in the button editing screen. Touch this ‘List’ to see the entire list.

  Select the desired motion from the list to automatically input a button name and number.

  ![](/assets/images/sw/mobile/mini_app_027.jpg)
  ![](/assets/images/sw/mobile/mini_app_028.jpg)
  ![](/assets/images/sw/mobile/mini_app_029.jpg)

### Control with Gestures
The ‘Gesture’ tab uses the acceleration sensor of the smart device to enable the robot to do certain motions. For example if the user draws an O or X holding the smart device, the robot will either walk or sit down based on the motion designated.  This works with the smart device held straight up 90 degrees from the ground.

- Move the robot by holding onto your smart device and making a gesture.

  ![](/assets/images/sw/mobile/mini_app_030.png)

- Press down on the center of the screen and tilt the smart device to operate the robot.
- When touching the basic buttons in the screen below, it will operate the robot instead of moving to the ‘Button’ tab.

  Touch ‘Tilt’ at the bottom of the screen to check the movements designated by the tilts.
  {: .notice}

  ![](/assets/images/sw/mobile/mini_app_031.jpg)
  ![](/assets/images/sw/mobile/mini_app_032.jpg)

  Touch the top ‘Edit' to add, edit, or delete gestures or use the ‘Train Gesture’ function to increase recognition rate. Also, the basic gestures for ‘Tilt’ can be edited.

- Register Gestures
  - Touch ‘Add Gesture’ button to add gestures.
  - Input the gesture name, motion number and explanation.
  - Touch ‘Ready’ and move the smart device in your hand at a steady speed to make a gesture.

  ![](/assets/images/sw/mobile/mini_app_033.jpg)
  ![](/assets/images/sw/mobile/mini_app_034.jpg)
  ![](/assets/images/sw/mobile/mini_app_035.jpg)

  - When the movement is done there will be a ‘beep’ sound along with a short vibration and a message saying ‘Gesture learned ‘ will appear. Touch ‘Okay’

  ![](/assets/images/sw/mobile/mini_app_036.jpg)
  ![](/assets/images/sw/mobile/mini_app_037.jpg)

  - Touch ‘Okay’ to add the gesture.

    > If you do not hear the “Beep” sound, please check the media volume.

    > When adding gestures, if you have already set the motion project file under ‘Setting’ the ‘List’ button will appear for easy access to add motions.

- Edit Gesture
  - To edit a gesture touch the ‘Edit’ button.
  - Use the same method when adding gestures to edit and finalize by touching ‘Okay’

- Delete Gesture
  - Touch the right side of the line then drag left to delete.

- Edit Button
  - Touch the command you wish to change to edit the command.
  - The buttons on the bottom of the screen can add up to max 3 buttons. (1 line)

- Edit Tilt
  - Touch ‘Tilt’ at the bottom to edit the motion.
  - Only the pre-designated 4 directions can be used under the ‘Tilt’  function.
  - Touch the direction to edit the name and number of the motion.

  ![](/assets/images/sw/mobile/mini_app_038.jpg)
  ![](/assets/images/sw/mobile/mini_app_039.jpg)
  ![](/assets/images/sw/mobile/mini_app_040.jpg)

  The pre-designated directions below should be held in your right hand 90 degrees straight from the ground to move forward, backward, left, and right.
  {: .notice}

  ![](/assets/images/sw/mobile/mini_app_041.png)


- Gesture Training Function?

  Use the gesture training function to increase the chances of recognizing registered gestures.
  - Touch ‘Train’ for the gesture you would like to train.
  - Touch ‘Ready’ and make a bigger gesture or tilt the smart device and/or make different gestures.
  - When the movement is done there will be a ‘beep’ sound along with a short vibration and a message saying ‘Gesture XXXXX learned ‘ will appear. Touch ‘Okay’
  - Use the same method to change similar movements for repeated studying.

### Operate with Voice Recognition
Uses the Google voice recognition function to operate ROBOTIS-MINI.

Touch the MIC icon on the center of your screen then say (input)  the command. To use this function, you must have internet connection access to your smart device for voice recognition.

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
