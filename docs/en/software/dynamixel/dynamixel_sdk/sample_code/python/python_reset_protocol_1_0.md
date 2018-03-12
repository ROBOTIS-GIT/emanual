---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_python_reset_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/python_reset_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 11"></div>
<div style="counter-reset: h3 5"></div>

# [Sample Code](#sample-code)

## [Python Protocol 1.0](#python-protocol-10)

### [Python Reset Protocol 1.0](#python-reset-protocol-10)

- Description

  This example resets all settings of Dynamixel to default values as:

  * ID = 1

  * Baudrate=57600.

- Available Dynamixel

  All series using protocol 1.0

#### Sample code


```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

#
# factory_reset.py
#
#  Created on: 2016. 6. 16.
#      Author: Ryu Woon Jung (Leon)
#

#
# *********     Factory Reset Example      *********
#
#
# Available Dynamixel model on this example : All models using Protocol 1.0
# This example is designed for using a Dynamixel MX-28, and an USB2DYNAMIXEL.
# To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
# Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
#

# Be aware that:
# This example resets all properties of Dynamixel to default values, such as %% ID : 1 / Baudnum : 34 (Baudrate : 57600)
#

from time import sleep
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

# Control table address
ADDR_MX_BAUDRATE            = 4                             # Control table address is different in Dynamixel model

# Protocol version
PROTOCOL_VERSION            = 1                             # See which protocol version is used in the Dynamixel

# Default setting
DXL_ID                      = 1                             # Dynamixel ID: 1
BAUDRATE                    = 1000000
DEVICENAME                  = "/dev/ttyUSB0".encode("utf-8")# Check which port is being used on your controller
                                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

FACTORYRST_DEFAULTBAUDRATE  = 57600                         # Dynamixel baudrate set by factoryreset
NEW_BAUDNUM                 = 1                             # New baudnum to recover Dynamixel baudrate as it was
OPERATION_MODE              = 0x00                          # Mode is unavailable in Protocol 1.0 Reset

COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed

# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = dynamixel.portHandler(DEVICENAME)

# Initialize PacketHandler Structs
dynamixel.packetHandler()

dxl_comm_result = COMM_TX_FAIL                              # Communication result

dxl_error = 0                                               # Dynamixel error
dxl_baudnum_read = 0                                        # Read baudnum

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


# Read present baudrate of the controller
print("Now the controller baudrate is : %d" % (dynamixel.getBaudRate(port_num)))

# Try factoryreset
print("[ID:%03d] Try factoryreset : " % (DXL_ID))
dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    print("Aborted")
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
    quit()
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))


# Wait for reset
print("Wait for reset...")
sleep(2)

print("[ID:%03d] factoryReset Success!" % (DXL_ID))

# Set controller baudrate to dxl default baudrate
if dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE):
    print("Succeed to change the controller baudrate to : %d" % (FACTORYRST_DEFAULTBAUDRATE))
else:
    print("Failed to change the controller baudrate")
    getch()
    quit()

# Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Dynamixel baudnum is now : %d" % (DXL_ID, dxl_baudnum_read))

# Write new baudnum
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE, NEW_BAUDNUM)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Set Dynamixel baudnum to : %d" % (DXL_ID, NEW_BAUDNUM))

# Set port baudrate to BAUDRATE
if dynamixel.setBaudRate(port_num, BAUDRATE):
    print("Succeed to change the controller baudrate to : %d" % (BAUDRATE))
else:
    print("Failed to change the controller baudrate")
    getch()
    quit()

sleep(0.2)

# Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Dynamixel baudnum is now : %d" % (DXL_ID, dxl_baudnum_read))


# Close port
dynamixel.closePort(port_num)
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

import dynamixel_functions as dynamixel                     # Uses Dynamixel SDK library
```

`getch()` gets the input which is for example code control.

`os.sys.path.append()` sets paths of function reference.

This example uses `dynamixel_functions` library as `dynamixel` imported from `dynamixel_functions_py` package.

```python
# Control table address
ADDR_MX_BAUDRATE            = 4                             # Control table address is different in Dynamixel model
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

```python
# Protocol version
PROTOCOL_VERSION            = 1                             # See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

```python
# Default setting
DXL_ID                      = 1                             # Dynamixel ID: 1
BAUDRATE                    = 1000000
DEVICENAME                  = "/dev/ttyUSB0".encode("utf-8")        # Check which port is being used on your controller
                                                            # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

FACTORYRST_DEFAULTBAUDRATE  = 57600                         # Dynamixel baudrate set by factoryreset
NEW_BAUDNUM                 = 1                             # New baudnum to recover Dynamixel baudrate as it was
OPERATION_MODE              = 0x00                          # Mode is unavailable in Protocol 1.0 Reset
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Since the factory reset recovers the Dynamixel control table items to the original state, the baudrate of controller serial port should be set to its changed baudrate(`FACTORYRST_DEFAULTBAUDRATE` : 57600 bps) as well. After that, controller sets its baudrate to the value (1000000 bps : `NEW_BAUDNUM` = 1) before factory reset.

In Protocol 1.0, only one mode that resets whole items is avaiable.

```python
COMM_SUCCESS                = 0                             # Communication Success result value
COMM_TX_FAIL                = -1001                         # Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

```python
# Initialize PortHandler Structs
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = dynamixel.portHandler(DEVICENAME)
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

```python
# Initialize PacketHandler Structs
dynamixel.packetHandler()
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

```python
dxl_comm_result = COMM_TX_FAIL                              # Communication result

dxl_error = 0                                               # Dynamixel error
dxl_baudnum_read = 0                                        # Read baudnum
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_baudnum_read` keeps Dynamixel baudrate.

```python
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

```python
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


```python
# Read present baudrate of the controller
print("Now the controller baudrate is : %d" % (dynamixel.getBaudRate(port_num)))
```

`getBaudRate()` function shows which baudrate is used in #`port_num` port of the controller.

```python
# Try factoryreset
print("[ID:%03d] Try factoryreset : " % (DXL_ID))
dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    print("Aborted")
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
    quit()
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
```

`factoryReset()` function orders to the #`DXL_ID` Dynamixel through `#port_num` port, executing it to be reset as `OPERATION_MODE` format. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.


```python
# Wait for reset
print("Wait for reset...")
sleep(2)
```

Factory reset takes few seconds.

```python
# Set controller baudrate to dxl default baudrate
if dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE):
    print("Succeed to change the controller baudrate to : %d" % (FACTORYRST_DEFAULTBAUDRATE))
else:
    print("Failed to change the controller baudrate")
    getch()
    quit()
```

Controller should change its baudrate itself to do the communication with initialized Dynamixel.

```python
# Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Dynamixel baudnum is now : %d" % (DXL_ID, dxl_baudnum_read))
```

This shows that reconnection between controller and Dynamixel is happened by adjusting the baudrate.


```python
# Write new baudnum
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE, NEW_BAUDNUM)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Set Dynamixel baudnum to : %d" % (DXL_ID, NEW_BAUDNUM))
```

To make the Dynamixel into previous condition, `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

```python
# Set port baudrate to BAUDRATE
if dynamixel.setBaudRate(port_num, BAUDRATE):
    print("Succeed to change the controller baudrate to : %d" % (BAUDRATE))
else:
    print("Failed to change the controller baudrate")
    getch()
    quit()

sleep(0.2)

# Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE)
if dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION) != COMM_SUCCESS:
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION))
elif dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION) != 0:
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION))
else:
  print("[ID:%03d] Dynamixel baudnum is now : %d" % (DXL_ID, dxl_baudnum_read))
```

These changes controller baudrate and verify that the Dynamixel has been successfully set into previous state.

```python
# Close port
dynamixel.closePort(port_num)
```

Finally, port becomes disposed.
