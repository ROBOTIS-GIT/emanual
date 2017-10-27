Dynamixels used as robot actuators possess many functions. This section explains how to change the dynamixel's settings.

### Changing the ID

1. Select the port the controller is connected to.
2. Click “Connect”.

    ![DXL_Management_01](/assets/images/sw/rplus1/manager/dxl_management_01.png)

3. A list of connected dynamixels is shown on the left. Click on the dynamixel you wish to change the ID of.
4. Click on the ID row in the Control Table.
5. Click on the ID List combo box to see a list of possible ID's. Select the ID, then click Apply.

    ![DXL_Management_02](/assets/images/sw/rplus1/manager/dxl_management_02.png)

- To use in RoboPlus Motion and RoboPlus Task, the ID must be within the following ranges.
  - The Dynamixel’s ID must be between 0 and 25.
  - The ID for AX-S1 should be set between 100 and 109.

### Changing the Movement Mode

The dynamixel can operate in 2 different modes.
- Wheel Mode : Rotates 360 degrees like a regular motor.
- Joint Mode : Moves at a set angle with normal servo motors.

The mode can be changed using RoboPlus Manager. Once the mode is set, it will be maintained, even when turned off.

1. Select the port the controller is connected to.
2. Click “Connect”.

    ![DXL_Management_03](/assets/images/sw/rplus1/manager/dxl_management_03.png)

3. A list of connected Dynamixels is shown on the left.  Click on the Dynamixel you wish to change the mode of. Then, click on the CW/CCW Angle Limit line in the Control Table.
4. To set to Wheel Mode, change the CW/CCW Angle Limit value to “0.”  Or, simply click on the "Wheel Mode" button.

    ![DXL_Management_04](/assets/images/sw/rplus1/manager/dxl_management_04.png)

5. To set to Joint Mode again, set the CW/CCW Angle Limit value to any number other than "0". The initial values for Joint Mode are "0" for CW Angle Limit, and "1023" for CCW Angle Limit.

### Troubleshooting

If you cannot find the dynamixel you are looking for using RoboPlus Manager, try the following :
1. Connect just 1 Dynamixel and check if there are any duplicate IDs. If you see a Dynamixel on the left even though only 1 Dynamixel is connected, there is a high probability of a duplicate ID. Change the ID immediately.
2. If you are unable to find any Dynamixels as in the image below, click on "Dynamixel Search". If the communication speed is not set to 1Mbps, the "Dynamixel Search" function automatically resets the controller’s communication speed to 1Mbps to enable it to be recognized.

  ![DXL_Management_05](/assets/images/sw/rplus1/manager/dxl_management_05.png)

If the problem persists, your dynamixel may need repair. Please contact the service department of the company you purchased from.
