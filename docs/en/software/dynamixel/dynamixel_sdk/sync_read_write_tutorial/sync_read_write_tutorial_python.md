---
layout: archive
lang: en
ref: dynamixel_sdk_sync_read_write_tutorial_python
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sync_read_write_tutorial/sync_read_write_tutorial_python/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="sync-read-write-tutorial">Sync Read/Write Tutorial <Python></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

**NOTE**: This tutorial is based on **XL-430-W250** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

This section provides examples of how to write code in python to sync_read and sync_write data to DYNAMIXEL motors.  
Sync Read/Write allows simultaneous access to the same address on multiple DYNAMIXEL motors.  
We need two motors to operate simultaneously.  

# [Make python file](#make-python-file)
- Create a python file and open it in a text editor. In this case, we use visual studio code, but you can use any text editor you prefer.
```bash
$ mkdir -p my_dxl_project/python
$ cd my_dxl_project/python
$ code my_sync_read_write.py
```

# [Source Code Description](#source-code-description)

## [Add Header Files](#add-header-files)
- Add   `#!/usr/bin/env python3` and import `dynamixel_sdk` to the top of your py file. This includes all necessary functions and classes from the DYNAMIXEL SDK.
```python
  #!/usr/bin/env python3

  from dynamixel_sdk import *
```

## [Initialize Handler Objects](#make-objects)
- Initialize the `PortHandler`,`PacketHandler`,`GroupSyncWrite` and `GroupSyncRead`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```python
  portHandler = PortHandler('/dev/ttyUSB0')
  packetHandler = PacketHandler(2.0)

  goal_position_address = 116
  present_position_address = 132
  data_length_4byte = 4
  groupSyncWrite = GroupSyncWrite(portHandler, packetHandler, goal_position_address, data_length_4byte)
  groupSyncRead  = GroupSyncRead(portHandler, packetHandler, present_position_address, data_length_4byte)
```


## [Open Port and Set Baud Rate](#open-port-and-set-baud-rate)
- Open the port and set the baud rate. The example below uses `57600` as the baud rate.
```python
  portHandler.openPort()
  portHandler.setBaudRate(57600)
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`openPort()` and `setBaudRate()` functions return a boolean value indicating success or failure. If you want to check for failure, you can write like below to print an error message and exit the program.
```python
if portHandler.openPort():
  print("Succeeded to open the port!")
else:
  print("Failed to open the port!")
  exit()

if portHandler.setBaudRate(57600):
  print("Succeeded to change the baudrate!")
else:
  print("Failed to change the baudrate!")
  exit()
```
</details>

## [Write data to enable torque](#write-data-to-enable-torque)
- Turn on the torque of the DYNAMIXEL.
```python
  dxl_id1 = 1
  dxl_id2 = 2
  torque_on_address = 64
  data = 1
  packetHandler.write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data)
  packetHandler.write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data)
```
  - `id` : Dynamixel ID you set
  - `address` : The address of the data you want to write. Refer to the [**Control Table**](/docs/en/dxl/x/xc430-w240/#control-table) of your DYNAMIXEL model, which can be found in its **specification manual** or **Dynamixel Wizard 2.0**. In this example, we use X series.
  - `data` : The data you want to write to the specified address.
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`write1ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
```python
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel#1 has been successfully connected")

dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel#2 has been successfully connected")
```
</details>

## [Add parameters to GroupSyncRead](#add-parameters-to-groupsyncread)
- Add the DYNAMIXEL IDs to the `GroupSyncRead`.
```python
  groupSyncRead.addParam(dxl_id1)
  groupSyncRead.addParam(dxl_id2)
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`addParam()` returns a communication result as boolean. If you want to check the communication result and error, you can write the code as shown below.  
```python
dxl_addparam_result = groupSyncRead.addParam(dxl_id1)
if dxl_addparam_result != True:
    print("[ID:%03d] groupSyncRead addparam failed" % dxl_id1)
    exit()

dxl_addparam_result = groupSyncRead.addParam(dxl_id2)
if dxl_addparam_result != True:
    print("[ID:%03d] groupSyncRead addparam failed" % dxl_id2)
    exit()
```
</details>


## [Get User Input and Set Data](#get-user-input-and-write-data)
- Get user input for the target position.
```python
  while True:
      try:
          target_position = int(input("Enter target position (0 ~ 4095, -1 to exit): "))
      except ValueError:
          print("Please enter an integer.")
          continue

      if target_position == -1:
          break
      elif target_position < 0 or target_position > 4095:
          print("Position must be between 0 and 4095.")
          continue
```
- Since `addParam()` requires a `uint8_t *` as its input, the data must be provided as a byte array.
```python
      param_goal_position = [
          DXL_LOBYTE(DXL_LOWORD(target_position)),
          DXL_HIBYTE(DXL_LOWORD(target_position)),
          DXL_LOBYTE(DXL_HIWORD(target_position)),
          DXL_HIBYTE(DXL_HIWORD(target_position))
      ]
```

## [Add parameters to GroupSyncWrite](#add-parameters-to-groupsyncwrite)
- Add parameter to the `GroupSyncWrite` and transfer the data to the DYNAMIXEL.
```python
      groupSyncWrite.addParam(dxl_id1, param_goal_position)
      groupSyncWrite.addParam(dxl_id2, param_goal_position)
      groupSyncWrite.txPacket()
      groupSyncWrite.clearParam()
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

 `txPacket()` and `addParam()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
```python
    dxl_addparam_result = groupSyncWrite.addParam(dxl_id1, param_goal_position)
    if not dxl_addparam_result:
        print("[ID:%03d] groupSyncWrite addparam failed" % dxl_id1)
        exit()

    dxl_addparam_result = groupSyncWrite.addParam(dxl_id2, param_goal_position)
    if not dxl_addparam_result:
        print("[ID:%03d] groupSyncWrite addparam failed" % dxl_id2)
        exit()

    dxl_comm_result = groupSyncWrite.txPacket()
    if dxl_comm_result != COMM_SUCCESS:
        print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
```
</details>

## [Read data to get current position](#read-data-to-get-current-position)
- Read the current position from the DYNAMIXEL until it reaches the target position.
```python
      while True:
          groupSyncRead.txRxPacket()
          dxl1_present_position = groupSyncRead.getData(dxl_id1, present_position_address, data_length_4byte)
          dxl2_present_position = groupSyncRead.getData(dxl_id2, present_position_address, data_length_4byte)
          print("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d" % (dxl_id1, target_position, dxl1_present_position, dxl_id2, target_position, dxl2_present_position))
          if abs(target_position - dxl1_present_position) <= 10 and abs(target_position - dxl2_present_position) <= 10:
              break
  portHandler.closePort()
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`txRxPacket()` and `isAvailable()` returns a communication result . If you want to check the communication result and error, you can write the code as shown below.  
```python
        dxl_comm_result = groupSyncRead.txRxPacket()
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
```
You can also check if the data is available in the `GroupSyncRead` by using the `isAvailable()` function. If the data is not available, you can print an error message and exit the program.
```python
        dxl_getdata_result = groupSyncRead.isAvailable(dxl_id1, present_position_address, data_length_4byte)
        if dxl_getdata_result != True:
            print("[ID:%03d] groupSyncRead getdata failed" % dxl_id1)
            quit()

        dxl_getdata_result = groupSyncRead.isAvailable(dxl_id2, present_position_address, data_length_4byte)
        if dxl_getdata_result != True:
            print("[ID:%03d] groupSyncRead getdata failed" % dxl_id2)
            quit()
```
</details>

# [Run the Code](#run-the-code)
- Run the code using python3.
```bash
$ python3 my_sync_read_write.py
```

# [Full Source Code](#full-source-code)
```python
#!/usr/bin/env python3

from dynamixel_sdk import *


portHandler = PortHandler('/dev/ttyUSB0')
packetHandler = PacketHandler(2.0)

goal_position_address = 116
present_position_address = 132
data_length_4byte = 4
groupSyncWrite = GroupSyncWrite(portHandler, packetHandler, goal_position_address, data_length_4byte)
groupSyncRead  = GroupSyncRead(portHandler, packetHandler, present_position_address, data_length_4byte)

if portHandler.openPort():
  print("Succeeded to open the port!")
else:
  print("Failed to open the port!")
  exit()

if portHandler.setBaudRate(57600):
  print("Succeeded to change the baudrate!")
else:
  print("Failed to change the baudrate!")
  exit()

dxl_id1 = 1
dxl_id2 = 2
torque_on_address = 64
data = 1
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel#1 has been successfully connected")

dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel#2 has been successfully connected")

dxl_addparam_result = groupSyncRead.addParam(dxl_id1)
if dxl_addparam_result != True:
    print("[ID:%03d] groupSyncRead addparam failed" % dxl_id1)
    exit()

dxl_addparam_result = groupSyncRead.addParam(dxl_id2)
if dxl_addparam_result != True:
    print("[ID:%03d] groupSyncRead addparam failed" % dxl_id2)
    exit()

while True:
    try:
        target_position = int(input("Enter target position (0 ~ 4095, -1 to exit): "))
    except ValueError:
        print("Please enter an integer.")
        continue

    if target_position == -1:
        break
    elif target_position < 0 or target_position > 4095:
        print("Position must be between 0 and 4095.")
        continue

    param_goal_position = [
        DXL_LOBYTE(DXL_LOWORD(target_position)),
        DXL_HIBYTE(DXL_LOWORD(target_position)),
        DXL_LOBYTE(DXL_HIWORD(target_position)),
        DXL_HIBYTE(DXL_HIWORD(target_position))
    ]

    dxl_addparam_result = groupSyncWrite.addParam(dxl_id1, param_goal_position)
    if not dxl_addparam_result:
        print("[ID:%03d] groupSyncWrite addparam failed" % dxl_id1)
        exit()

    dxl_addparam_result = groupSyncWrite.addParam(dxl_id2, param_goal_position)
    if not dxl_addparam_result:
        print("[ID:%03d] groupSyncWrite addparam failed" % dxl_id2)
        exit()

    dxl_comm_result = groupSyncWrite.txPacket()
    if dxl_comm_result != COMM_SUCCESS:
        print("%s" % packetHandler.getTxRxResult(dxl_comm_result))

    groupSyncWrite.clearParam()
    while True:
        dxl_comm_result = groupSyncRead.txRxPacket()
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        dxl_getdata_result = groupSyncRead.isAvailable(dxl_id1, present_position_address, data_length_4byte)
        if dxl_getdata_result != True:
            print("[ID:%03d] groupSyncRead getdata failed" % dxl_id1)
            quit()

        dxl_getdata_result = groupSyncRead.isAvailable(dxl_id2, present_position_address, data_length_4byte)
        if dxl_getdata_result != True:
            print("[ID:%03d] groupSyncRead getdata failed" % dxl_id2)
            quit()
        dxl1_present_position = groupSyncRead.getData(dxl_id1, present_position_address, data_length_4byte)
        dxl2_present_position = groupSyncRead.getData(dxl_id2, present_position_address, data_length_4byte)
        print("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d" % (dxl_id1, target_position, dxl1_present_position, dxl_id2, target_position, dxl2_present_position))
        if abs(target_position - dxl1_present_position) <= 10 and abs(target_position - dxl2_present_position) <= 10:
            break
portHandler.closePort()
```
