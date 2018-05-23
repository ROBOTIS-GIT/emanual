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

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 12"></div>
<div style="counter-reset: h3 6"></div>

# [Sample Code](#sample-code)

## [Python Protocol 2.0](#python-protocol-20)

### [Python Broadcast Ping Protocol 2.0](#python-broadcast-ping-protocol-20)

- Description

  This example tries to ping all Dynamixels that are connected to the controller, and shows which Dynamixel is successfully connected. The example is commonly used to check for Dynamixel’s connection at once.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` python
import os

if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import sys, tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    def getch():
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

from dynamixel_sdk import *                 # Uses Dynamixel SDK library

# Protocol version
PROTOCOL_VERSION        = 2.0               # See which protocol version is used in the Dynamixel

# Default setting
BAUDRATE                = 57600             # Dynamixel default baudrate : 57600
DEVICENAME              = '/dev/ttyUSB0'    # Check which port is being used on your controller
                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"

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

# Try to broadcast ping the Dynamixel
dxl_data_list, dxl_comm_result = packetHandler.broadcastPing(portHandler)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))

print("Detected Dynamixel :")
for dxl_id in dxl_data_list:
    print("[ID:%03d] model version : %d | firmware version : %d" % (dxl_id, dxl_data_list.get(dxl_id)[0], dxl_data_list.get(dxl_id)[1]))

# Close port
portHandler.closePort()
```



#### Details

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

from dynamixel_sdk import *                 # Uses Dynamixel SDK library
```

`getch()` gets the input which is for example code control.

`os.sys.path.append()` sets paths of function reference.


``` python
# Protocol version
PROTOCOL_VERSION        = 2.0               # See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` python
# Default setting
BAUDRATE                = 57600             # Dynamixel default baudrate : 57600
DEVICENAME              = '/dev/ttyUSB0'    # Check which port is being used on your controller
                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as Dynamixel ID, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.


``` python
# Initialize PortHandler instance
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
portHandler = PortHandler(DEVICENAME)
```

`portHandler()` function sets port path as `DEVICENAME` and get `PortHandler` instance, and prepares an appropriate functions for port control in controller OS automatically. `portHandler` would be used in many functions in the body of the code to specify the port for use.

``` python
# Initialize PacketHandler instance
# Set the protocol version
# Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
packetHandler = PacketHandler(PROTOCOL_VERSION)
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

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

First, controller opens port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

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

Secondly, the controller sets the communication `BAUDRATE` at port opened previously.


``` python
# Try to broadcast ping the Dynamixel
dxl_data_list, dxl_comm_result = packetHandler.broadcastPing(portHandler)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
```

`broadcastPing()` function shows the connection between controller and each Dynamixels from ID 1 to ID 253 through port.

``` python
# Close port
portHandler.closePort()
```

Finally, port becomes disposed.
