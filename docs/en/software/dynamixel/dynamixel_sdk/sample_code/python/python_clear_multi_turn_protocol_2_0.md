---
layout: archive
lang: en
ref: python_clear_multi_turn_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/python_clear_multi_turn_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 13"></div>
<div style="counter-reset: h3 9"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="python-protocol-20"><a href="#python-protocol-20">Python Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [Python Clear Multi Turn Protocol 2.0](#python-claer-multi-turn-protocol-20)

- Description

  This example is that when Dynamixel operate `Extended Position Control Mode(Multi-turn)`, clear present position from 0 to 4028. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# clear_multi_turn.py
#
#  Created on: 2018. 11. 23.
#      Author: Ki Jong Gil (Gilbert)
#

#
# *********     Clear Multi-Turn Example      *********
#
#
# Available Dynamixel model on this example : MX with Protocol 2.0 (firmware v42 or above), Dynamixel X-series (firmware v42 or above)
# This example is designed for using a Dynamixel XM430-W350-R, and an U2D2.
# To use another Dynamixel model, such as MX series, see their details in E-Manual(emanual.robotis.com) and edit below "#define"d variables yourself.
# Be sure that Dynamixel properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
#

from __future__ import print_function
import os

if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import termios, fcntl, sys, os
    from select import select
    fd = sys.stdin.fileno()
    old_term = termios.tcgetattr(fd)
    new_term = termios.tcgetattr(fd)

    def getch():   
        new_term[3] = (new_term[3] & ~termios.ICANON & ~termios.ECHO)
        termios.tcsetattr(fd, termios.TCSANOW, new_term)
        try:
            ch = sys.stdin.read(1)
        finally:      
            termios.tcsetattr(fd, termios.TCSADRAIN, old_term)
        return ch
        
    def kbhit():
        new_term[3] = (new_term[3] & ~(termios.ICANON | termios.ECHO))
        termios.tcsetattr(fd, termios.TCSANOW, new_term)
        try:
            dr,dw,de = select([sys.stdin], [], [], 0)
            if dr != []:
                return 1
        finally: 
            termios.tcsetattr(fd, termios.TCSADRAIN, old_term)
            sys.stdout.flush()

        return 0

from dynamixel_sdk import *                    # Uses DYNAMIXEL SDK library

# Control table address
ADDR_OPERATING_MODE         = 11               # Control table address is different in Dynamixel model
ADDR_TORQUE_ENABLE          = 64               
ADDR_GOAL_POSITION          = 116
ADDR_PRESENT_POSITION       = 132

# Protocol version
PROTOCOL_VERSION            = 2.0               # See which protocol version is used in the Dynamixel

# Default setting
DXL_ID                      = 1                 # Dynamixel ID : 1
BAUDRATE                    = 57600             # Dynamixel default baudrate : 57600
DEVICENAME                  = '/dev/ttyUSB0'    # Check which port is being used on your controller
                                                # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"

TORQUE_ENABLE               = 1                 # Value for enabling the torque
TORQUE_DISABLE              = 0                 # Value for disabling the torque
MAX_POSITION_VALUE          = 1048575
DXL_MOVING_STATUS_THRESHOLD = 20                # Dynamixel will rotate between this value
EXT_POSITION_CONTROL_MODE   = 4                 # Value for extended position control mode (operating mode)

ESC_ASCII_VALUE             = 0x1b
SPACE_ASCII_VALUE           = 0x20

# Initialize PortHandler instance
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
portHandler = PortHandler(DEVICENAME)

# Initialize PacketHandler instance
# Set the protocol version
# Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
packetHandler = PacketHandler(PROTOCOL_VERSION)

# Open port
if portHandler.openPort():
    print("Succeeded to open the port")
else:
    print("Failed to open the port")
    print("Press any key to terminate...")
    getch()
    quit()


# Set port baudrate
if portHandler.setBaudRate(BAUDRATE):
    print("Succeeded to change the baudrate")
else:
    print("Failed to change the baudrate")
    print("Press any key to terminate...")
    getch()
    quit()

# Set operating mode to extended position control mode
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Operating mode changed to extended position control mode.")

# Enable Dynamixel Torque
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel has been successfully connected")

while 1:
    print("\nPress any key to continue! (or press ESC to quit!)")
    if getch() == chr(ESC_ASCII_VALUE):
        break
    print("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)")

    # Write goal position    
    dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE)
    if dxl_comm_result != COMM_SUCCESS:
        print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
    elif dxl_error != 0:
        print("%s" % packetHandler.getRxPacketError(dxl_error))

    while 1:
        # Read present position
        dxl_present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))

        print("   [ID:%03d] GoalPos:%03d  PresPos:%03d" %(DXL_ID, MAX_POSITION_VALUE, dxl_present_position), end = "\r") 
        if kbhit():
            c = getch()
            if c == chr(SPACE_ASCII_VALUE):
                print("\n  Stop & Clear Multi-Turn Information! ")   
                # Write the present position to the goal position to stop moving
                dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))
                
                time.sleep(0.3)

                # Clear Multi-Turn Information
                dxl_comm_result, dxl_error = packetHandler.clearMultiTurn(portHandler, DXL_ID)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))

                # Read present position
                dxl_present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))

                print("  Present Position has been reset. : %03d" % dxl_present_position)

                break

            elif c == chr(ESC_ASCII_VALUE):
                print("\n  Stopped!!")
                # Write the present position to the goal position to stop moving
                dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))
                break

        if not abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD:
            break

# Disable Dynamixel Torque
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))

# Close port
portHandler.closePort()
```



#### Details

```python
if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import termios, fcntl, sys, os
    from select import select
    fd = sys.stdin.fileno()
    old_term = termios.tcgetattr(fd)
    new_term = termios.tcgetattr(fd)

    def getch():   
        new_term[3] = (new_term[3] & ~termios.ICANON & ~termios.ECHO)
        termios.tcsetattr(fd, termios.TCSANOW, new_term)
        try:
            ch = sys.stdin.read(1)
        finally:      
            termios.tcsetattr(fd, termios.TCSADRAIN, old_term)
        return ch
        
    def kbhit():
        new_term[3] = (new_term[3] & ~(termios.ICANON | termios.ECHO))
        termios.tcsetattr(fd, termios.TCSANOW, new_term)
        try:
            dr,dw,de = select([sys.stdin], [], [], 0)
            if dr != []:
                return 1
        finally: 
            termios.tcsetattr(fd, termios.TCSADRAIN, old_term)
            sys.stdout.flush()

        return 0

from dynamixel_sdk import *                    # Uses DYNAMIXEL SDK library
```

`getch()` gets the input which is for example code control.
`kbhit()` gets the return 0 or 1 when key input which is for example code control.
`os.sys.path.append()` sets paths of function reference.


```python
# Control table address
ADDR_OPERATING_MODE         = 11               # Control table address is different in Dynamixel model
ADDR_TORQUE_ENABLE          = 64               
ADDR_GOAL_POSITION          = 116
ADDR_PRESENT_POSITION       = 132

```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

```python
# Protocol version
PROTOCOL_VERSION            = 2                             # See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

```python
# Default setting
DXL_ID                      = 1                 # Dynamixel ID : 1
BAUDRATE                    = 1000000             # Dynamixel default baudrate : 57600
DEVICENAME                  = '/dev/ttyUSB0'    # Check which port is being used on your controller
                                                # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"

TORQUE_ENABLE               = 1                 # Value for enabling the torque
TORQUE_DISABLE              = 0                 # Value for disabling the torque
MAX_POSITION_VALUE          = 1048575
DXL_MOVING_STATUS_THRESHOLD = 20                # Dynamixel will rotate between this value
EXT_POSITION_CONTROL_MODE   = 4                 # Value for extended position control mode (operating mode)

ESC_ASCII_VALUE             = 0x1b
SPACE_ASCII_VALUE           = 0x20
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.
`EXT_POSITION_CONTROL_MODE` acts as a position control Mode.

```python
# Initialize PortHandler instance
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
portHandler = PortHandler(DEVICENAME)
```

`portHandler()` function sets port path as `DEVICENAME` and get `portHandler`, and prepares an appropriate functions for port control in controller OS automatically. `portHandler` would be used in many functions in the body of the code to specify the port for use.

```python
# Initialize PacketHandler instance
# Set the protocol version
# Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
packetHandler = PacketHandler(PROTOCOL_VERSION)
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.


```python
# Open port
if portHandler.openPort():
    print("Succeeded to open the port")
else:
    print("Failed to open the port")
    print("Press any key to terminate...")
    getch()
    quit()
```

First, controller opens #`portHandler` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

```python
if portHandler.setBaudRate(BAUDRATE):
    print("Succeeded to change the baudrate")
else:
    print("Failed to change the baudrate")
    print("Press any key to terminate...")
    getch()
    quit()
```

Secondly, the controller sets the communication `BAUDRATE` at #`portHandler` port opened previously.

```python
# Set operating mode to extended position control mode
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Operating mode changed to extended position control mode.")
```

The controller sets the operating mode as Extended Position Control Mode(Multi-turn).

```python
# Enable Dynamixel Torque
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel has been successfully connected")
```

As mentioned in the document, above code enables Dynamixel torque to set its status as being ready to move.

`packetHandler.write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`packetHandler.getLastTxRxResult()` function and `packetHandler.getLastRxPacketError()` function get either.

```python
while 1:
    print("\nPress any key to continue! (or press ESC to quit!)")
    if getch() == chr(ESC_ASCII_VALUE):
        break
    print("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)")

    # Write goal position    
    dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE)
    if dxl_comm_result != COMM_SUCCESS:
        print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
    elif dxl_error != 0:
        print("%s" % packetHandler.getRxPacketError(dxl_error))

    while 1:
        # Read present position
        dxl_present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))

        print("   [ID:%03d] GoalPos:%03d  PresPos:%03d" %(DXL_ID, MAX_POSITION_VALUE, dxl_present_position), end = "\r") 
        if kbhit():
            c = getch()
            if c == chr(SPACE_ASCII_VALUE):
                print("\n  Stop & Clear Multi-Turn Information! ")   
                # Write the present position to the goal position to stop moving
                dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))
                
                time.sleep(0.3)

                # Clear Multi-Turn Information
                dxl_comm_result, dxl_error = packetHandler.clearMultiTurn(portHandler, DXL_ID)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))

                # Read present position
                dxl_present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))

                print("  Present Position has been reset. : %03d" % dxl_present_position)

                break

            elif c == chr(ESC_ASCII_VALUE):
                print("\n  Stopped!!")
                # Write the present position to the goal position to stop moving
                dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position)
                if dxl_comm_result != COMM_SUCCESS:
                    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
                elif dxl_error != 0:
                    print("%s" % packetHandler.getRxPacketError(dxl_error))
                break

        if not abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD:
            break
```

During `while()` loop, the controller wait to any key input for start `while()` and writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`packetHandler.write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `MAX_POSITION_VALUE` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`packetHandler.getLastTxRxResult()` function and `packetHandler.getLastRxPacketError()` function get either.

`packetHandler.read4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`packetHandler.getLastTxRxResult()` function and `packetHandler.getLastRxPacketError()` function get either.

When the space key input, `packetHandler.write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `dxl_present_position` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`packetHandler.getLastTxRxResult()` function and `packetHandler.getLastRxPacketError()` function get either. And then `packetHandler.clearMultiTurn()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port.

Reading its present position will be ended when absolute value of `(MAX_POSITION_VALUE - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`. 

```python
# Disable Dynamixel Torque
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
```

The controller frees the Dynamixel to be idle.

`packetHandler.write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`packetHandler.getLastTxRxResult()` function and `packetHandler.getLastRxPacketError()` function get either.

```python
# Close port
dynamixel.closePort(port_num)
```

Finally, port becomes disposed.
