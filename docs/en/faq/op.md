# DARWIN-OP won't turn on.

Ensure that the battery pack or DC power is connected.
Ensure that the battery pack is fully charged.
Ensure that the power rocker switch is on.

If DARWIN-OP turns on under DC power but not under batteries despite being fully charged then you may need to replace the fuse.

# I ended the demonstration program but I cannot restart it again.

refer to How to re-run the demo program

# On Ubuntu's desktop I cannot use the camera.

You must free up camera resources used by running programs (i.e. the demonstration program).
You may free up the resources by running the killall command (i.e. killall demo)
refer to How to kill the demo program

# One or more Dynamixel actuators LED constantly blinks.

You can perform any of the following to reset the actuators in question:
Press "RESET" button, initiate any necessary killall processes, and run program again.
Run Dymanixel Monitor (located at /darwin/Linux/project/dxl_monitor) and perform the reset procedure.
The can be an instance that torque on the MX-28 is unexpectedly released. This is a Dynamixel safety mechanism for overloading error. In such case power DARWIN-OP off for a few minutes then turn back on.

# DARWIN-OP gets up too slowly.

1. If running under battery pack only then replace battery pack or power source.
2. DARwIn-OP begins to beep when battery power is low. However, on noisy environments you may not be able to listen to the beeps. In that case monitor robot performance and make any necessary power supply changes.

# DARWIN-OP's movements are choppy.

Perform the following:
1. press the "RESET" button and initiate killall demo process
2. reset the actuators with dxl_monitor
3. There may be a case that you've interfaced in DARWIN-OP via remote desktop for a while. End the connection via remote desktop and connect again via SSH client.
4. If you are running several CPU-demanding programs from DARWIN-OP's PC then close those programs.

# Dynamixel MX-28 is not supported by RoboPlus.

Please make sure that you are running RoboPlus v1.0.21.0 or higher. You may download RoboPlus software here.

# During Color calibration for the ball I sometimes get green patches in addition to the orange/reddish.

The orange patch mean that the color calibration has been adjusted to the color of the ball desired. The larger the patch of reddish orange the better the adjustment.
However, when you adjust the color setting you may also see a patch of green. That's OK green just means that the hue tolerance range, or part of, the ball and any of the set color overlap.
For further information please refer to "How do you know if color calibration for the ball has been properly adjusted for the desired color?"

# I can connect to DARWIN-OP wirelessly but I get disconnected.

Please check the following:
1. wireless signal
2. wireless connection settings
3. status of your access point or wireless router
4. an operating microwave oven in the vicinity

Please note that due to the nature of wireless radio signals operating on the 2.4GHz band (ISM band) you may loose signal frequently.

# I cannot get visuals from DARWIN-OP when connected to an analog display (via D-Sub)

Reason is that Intel has not provided Ubuntu driver updates for the GMA500 display controller when connecting to an analog display. Instead use a HDMI-capable display of DVI-capable display (through HDMI-DVI adapter).

# I replaced a MX-28 Dynamixel but DXL Monitor cannot detect the new actuator

Information on replacing a new Dynamixel can be found here.
