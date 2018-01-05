---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_python_broadcast_ping_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/python_broadcast_ping_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 62"></div>
<div style="counter-reset: h1 3"></div>

## [Python Broadcast Ping Protocol 2.0](#python-broadcast-ping-protocol-20)

- Description

  This example tries to ping all Dynamixels that are connected to the controller, and shows which Dynamixel is successfully connected. The example is commonly used to check for Dynamixel’s connection at once.

- Available Dynamixel

  All series using protocol 2.0

- Simple code


``` python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# broadcast_ping.py
#
#  Created on: 2016. 6. 16.
#      Author: Ryu Woon Jung (Leon)
#

#
# *********     ping Example      *********
#
#
# Available Dynamixel model on this example : All models using Protocol 2.0
# This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
# To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
# Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
#

import os, sys, ctypes

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

import dynamixel_functions as dynamixel                     # Uses Dynamixel SDK library

# Protocol version
PROTOCOL_VERSION            = 2                             # See which protocol version is used in the Dynamixel

# Default setting
DXL_ID                      = 1                             # Dynamixel ID: 1
BAUDRATE                    = 1000000
DEVICENAME                  = "/dev/ttyUSB0".encode('utf-8')        # Check which port is being used on your controller
                                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

MAX_ID                      = 252                           # Maximum ID value
COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed

# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = dynamixel.portHandler(DEVICENAME)

# Initialize PacketHandler Structs
dynamixel.packetHandler()

dxl_comm_result = COMM_TX_FAIL                              # Communication result

# Open port
if dynamixel.openPort(port_num):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    getch()
    quit()

# Set port baudrate
if dynamixel.setBaudRate(port_num, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    getch()
    quit()

# Try to broadcast ping the Dynamixel
dynamixel.broadcastPing(port_num, PROTOCOL_VERSION)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))

print("Detected Dynamixel : ")
for id in range(0, MAX_ID):
    if ctypes.c_ubyte(dynamixel.getBroadcastPingResult(port_num, PROTOCOL_VERSION, id)).value:
        print("[ID:%03d]" % (id))

# Close port
dynamixel.closePort(port_num)
```

-------------------------------------------------------------------------------------

- Details

``` python
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

import dynamixel_functions as dynamixel                     # Uses Dynamixel SDK library
```

`getch()` gets the input which is for example code control.

`os.sys.path.append()` sets paths of function reference.

This example uses `dynamixel_functions` library as `dynamixel` imported from `dynamixel_functions_py` package.

``` python
# Protocol version
PROTOCOL_VERSION            = 2                             # See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` python
# Default setting
DXL_ID                      = 1                             # Dynamixel ID: 1
BAUDRATE                    = 1000000
DEVICENAME                  = "/dev/ttyUSB0".encode('utf-8')        # Check which port is being used on your controller
                                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as Dynamixel ID, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

``` python
MAX_ID                      = 252                           # Maximum ID value
```

Dynamixel ID can be set with in the range from 1 to 252

``` python
COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

``` python
# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = dynamixel.portHandler(DEVICENAME)
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

``` python
# Initialize PacketHandler Structs
dynamixel.packetHandler()
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` python
dxl_comm_result = COMM_TX_FAIL                              # Communication result
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

``` python
# Open port
if dynamixel.openPort(port_num):
    print("Succeeded to open the port!")
else:
    print("Failed to open the port!")
    print("Press any key to terminate...")
    getch()
    quit()
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` python
# Set port baudrate
if dynamixel.setBaudRate(port_num, BAUDRATE):
    print("Succeeded to change the baudrate!")
else:
    print("Failed to change the baudrate!")
    print("Press any key to terminate...")
    getch()
    quit()
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.


``` python
# Try to broadcast ping the Dynamixel
dynamixel.broadcastPing(port_num, PROTOCOL_VERSION)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
```

`broadcastPing()` function shows the connection between controller and each Dynamixels from ID 1 to ID 253 through #`port_num` port.

``` python
# Close port
dynamixel.closePort(port_num)
```

Finally, port becomes disposed.
