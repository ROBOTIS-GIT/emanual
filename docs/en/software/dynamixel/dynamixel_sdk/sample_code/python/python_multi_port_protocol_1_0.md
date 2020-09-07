---
layout: archive
lang: en
ref: python_multi_port_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/python_multi_port_protocol_1_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 12"></div>
<div style="counter-reset: h3 1"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="python-protocol-10"><a href="#python-protocol-10">Python Protocol 1.0</a></h2>
<![end dummy Header 1]-->

### [Python Multi Port Protocol 1.0](#python-multi-port-protocol-10)

- Description

  This example writes goal position of DYNAMIXEL connected with two ports, and reads their present position until DYNAMIXEL stop moving.

- Available Dynamixel

  All series using protocol 1.0

#### Sample code


```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# multi_port.py
#
#  Created on: 2016. 6. 16.
#      Author: Ryu Woon Jung (Leon)
#

#
# *********     Multi Port Example      *********
#
#
# Available Dynamixel model on this example : All models using Protocol 1.0
# This example is designed for using two Dynamixel MX-28, and two USB2DYNAMIXEL.
# To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
# Be sure that Dynamixel MX properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
#

import os, sys

if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    tty.setraw(sys.stdin.fileno())
    def getch():
        return sys.stdin.read(1)

os.sys.path.append('../dynamixel_functions_py')             # Path setting

import dynamixel_functions as dynamixel                     # Uses DYNAMIXEL SDK library

# Control table address
ADDR_MX_TORQUE_ENABLE       = 24                            # Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION       = 30
ADDR_MX_PRESENT_POSITION    = 36

# Protocol version
PROTOCOL_VERSION            = 1                             # See which protocol version is used in the Dynamixel

# Default setting
DXL1_ID                     = 1                             # Dynamixel ID: 1
DXL2_ID                     = 2                             # Dynamixel ID: 2
BAUDRATE                    = 1000000
DEVICENAME1                 = "/dev/ttyUSB0".encode('utf-8')# Check which port is being used on your controller
DEVICENAME2                 = "/dev/ttyUSB1".encode('utf-8')# ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

TORQUE_ENABLE               = 1                             # Value for enabling the torque
TORQUE_DISABLE              = 0                             # Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = 100                           # Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 4000                          # and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 10                            # Dynamixel moving status threshold

ESC_ASCII_VALUE             = 0x1b

COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed

# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num1 = dynamixel.portHandler(DEVICENAME1)
port_num2 = dynamixel.portHandler(DEVICENAME2)

# Initialize PacketHandler Structs
dynamixel.packetHandler()

index = 0
dxl_comm_result = COMM_TX_FAIL                              # Communication result
dxl_goal_position = [DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE]         # Goal position

dxl_error = 0                                               # Dynamixel error
dxl1_present_position = 0                                   # Present position
dxl2_present_position = 0

# Open port1
if dynamixel.openPort(port_num1):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    getch()
    quit()

# Open port2
if dynamixel.openPort(port_num2):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    getch()
    quit()


# Set port1 baudrate
if dynamixel.setBaudRate(port_num1, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    getch()
    quit()

# Set port2 baudrate
if dynamixel.setBaudRate(port_num2, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    getch()
    quit()


# Enable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE)
if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))
else:
    print("Dynamixel#1 has been successfully connected")

# Enable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE)
if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))
else:
    print("Dynamixel#2 has been successfully connected")


while 1:
    print("Press any key to continue! (or press ESC to quit!)")
    if getch() == chr(ESC_ASCII_VALUE):
        break

    # Write Dynamixel#1 goal position
    dynamixel.write2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index])
    if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
    elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

    # Write Dynamixel#2 goal position
    dynamixel.write2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index])
    if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
    elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))

    while 1:
        # Read present position
        dxl1_present_position = dynamixel.read2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION)
        if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
        elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
            dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

        # Read present position
        dxl2_present_position = dynamixel.read2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION)
        if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
        elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
            dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))

        print("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d" % (DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position))

        if not ((abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD) or (abs(dxl_goal_position[index] - dxl2_present_position) > DXL_MOVING_STATUS_THRESHOLD)):
            break

    # Change goal position
    if index == 0:
        index = 1
    else:
        index = 0


# Disable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE)
if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

# Disable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE)
if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))

# Close port
dynamixel.closePort(port_num1)

dynamixel.closePort(port_num2)
```



#### Details

```python
import os, sys

if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    tty.setraw(sys.stdin.fileno())
    def getch():
        return sys.stdin.read(1)

os.sys.path.append('../dynamixel_functions_py')             # Path setting

import dynamixel_functions as dynamixel                     # Uses DYNAMIXEL SDK library
```

`getch()` gets the input which is for example code control.

`os.sys.path.append()` sets paths of function reference.

This example uses `dynamixel_functions` library as `dynamixel` imported from `dynamixel_functions_py` package.

```python
# Control table address
ADDR_MX_TORQUE_ENABLE       = 24                            # Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION       = 30
ADDR_MX_PRESENT_POSITION    = 36
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

```python
# Protocol version
PROTOCOL_VERSION            = 1                             # See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

```python
# Default setting
DXL1_ID                     = 1                             # Dynamixel ID: 1
DXL2_ID                     = 2                             # Dynamixel ID: 2
BAUDRATE                    = 1000000
DEVICENAME1                  = "/dev/ttyUSB0".encode('utf-8')       # Check which port is being used on your controller
DEVICENAME2                  = "/dev/ttyUSB1".encode('utf-8')       # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

TORQUE_ENABLE               = 1                             # Value for enabling the torque
TORQUE_DISABLE              = 0                             # Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = 100                           # Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 4000                          # and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 10                            # Dynamixel moving status threshold

ESC_ASCII_VALUE             = 0x1b
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two DYNAMIXEL's `DXL1_ID`, `DXL2_ID` connected with each ports `DEVICENAME1`, `DEVICENAME2`

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

```python
COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

```python
# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num1 = dynamixel.portHandler(DEVICENAME1)
port_num2 = dynamixel.portHandler(DEVICENAME2)
```

`portHandler()` function sets port path as `DEVICENAME1` and `DEVICENAME2` and get `port_num1` and `port_num2` each, and prepares an appropriate functions for port control in controller OS automatically. `port_num1` and `port_num2` would be used in many functions in the body of the code to specify the port for use.

```python
# Initialize PacketHandler Structs
dynamixel.packetHandler()
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

```python
index = 0
dxl_comm_result = COMM_TX_FAIL                              # Communication result
dxl_goal_position = [DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE]         # Goal position

dxl_error = 0                                               # Dynamixel error
dxl1_present_position = 0                                   # Present position
dxl2_present_position = 0
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` view where now each Dynamixel points out.

```python
# Open port1
if dynamixel.openPort(port_num1):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    msvcrt.getch()
    quit()

# Open port2
if dynamixel.openPort(port_num2):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    msvcrt.getch()
    quit()
```

First, controller opens #`port_num1` and #`port_num2` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

```python
# Set port1 baudrate
if dynamixel.setBaudRate(port_num1, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    msvcrt.getch()
    quit()

# Set port2 baudrate
if dynamixel.setBaudRate(port_num2, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    msvcrt.getch()
    quit()
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num1` and #`port_num2` port opened previously.

```python
# Enable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE)
if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))
else:
    print("Dynamixel#1 has been successfully connected")

# Enable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE)
if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))
else:
    print("Dynamixel#2 has been successfully connected")
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

```python
while 1:
    print("Press any key to continue! (or press ESC to quit!)")
    if msvcrt.getch().decode() == chr(ESC_ASCII_VALUE):
        break

    # Write Dynamixel#1 goal position
    dynamixel.write2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index])
    if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
    elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

    # Write Dynamixel#2 goal position
    dynamixel.write2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index])
    if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
    elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))

    while 1:
        # Read present position
        dxl1_present_position = dynamixel.read2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION)
        if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
        elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
            dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

        # Read present position
        dxl2_present_position = dynamixel.read2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION)
        if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
        elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
            dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))

        print("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d" % (DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position))

        if not ((abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD) or (abs(dxl_goal_position[index] - dxl2_present_position) > DXL_MOVING_STATUS_THRESHOLD)):
            break

    # Change goal position
    if index == 0:
        index = 1
    else:
        index = 0
```

During `while` loop, the controller writes and reads each Dynamixel position through packet transmission/reception(Tx/Rx).

To continue their rotation, press any key except ESC.

`write2ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 2 byte of `dxl_goal_position[index]` value to `ADDR_MX_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.


`read2ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, requesting 2 bytes of value in `ADDR_MX_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading their present position will be ended when absolute value of `(dxl1_goal_position[index] - dxl1_present_position)` or `(dxl2_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

```python
# Disable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE)
if dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION))

# Disable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE)
if dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION))
```

The controller frees the DYNAMIXEL to be idle.

`write1ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

```python
# Close port
dynamixel.closePort(port_num1)

dynamixel.closePort(port_num2)
```

Finally, ports become disposed.
