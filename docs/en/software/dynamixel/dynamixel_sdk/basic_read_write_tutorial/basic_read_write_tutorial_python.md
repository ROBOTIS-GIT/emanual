---
layout: archive
lang: en
ref: dynamixel_sdk_basic_read_write_tutorial_python
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/basic_read_write_tutorial/basic_read_write_tutorial_python/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="basic-read-write-tutorial">Basic Read/Write Tutorial <Python></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides examples of how to write code in Python to read and write data to DYNAMIXEL motors.

**NOTE**: This tutorial is based on **XL-series** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

# [Read/Write Example](#read-write-example)

## [Make python file](#make-cpp-file)
- Create a python file and open it in a text editor.
```bash
$ mkdir -p my_dxl_project/python
$ cd my_dxl_project/python
$ code my_read_write.py
```

## [Source Code](#source-code)

### [Add Header Files](#add-header-files)
- Add   `#!/usr/bin/env python3` and import `dynamixel_sdk` to the top of your py file. This includes all necessary functions and classes from the DYNAMIXEL SDK.
```python
  #!/usr/bin/env python3

  from dynamixel_sdk import *
```

### [Initialize Handler Objects](#make-objects)
- Initialize the `PortHandler` and `PacketHandler`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```python
  portHandler = PortHandler("/dev/ttyUSB0")  # your dxl port name
  packetHandler = PacketHandler(2.0)  # protocol version
```

### [Open Port and Set Baud Rate](#open-port-and-set-baud-rate)
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

### [Write data to enable torque](#write-data-to-enable-torque)
- Turn on the torque of the DYNAMIXEL.
```python
  dxl_id = 1
  torque_on_address = 64
  data = 1
  packetHandler.write1ByteTxRx(portHandler, dxl_id, torque_on_address, data)
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
dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, dxl_id, torque_on_address, data)
if dxl_comm_result != COMM_SUCCESS:
    print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
elif dxl_error != 0:
    print("%s" % packetHandler.getRxPacketError(dxl_error))
else:
    print("Dynamixel has been successfully connected")
```
</details>

### [Get User Input](#get-user-input-and-write-data)
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

### [Write data to set target position](#write-data-to-set-target-position)
- Write the target position to the DYNAMIXEL.
```python
      goal_position_address = 116
      packetHandler.write4ByteTxRx(portHandler, dxl_id, goal_position_address, target_position)
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`write4ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
```python
    dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, dxl_id, goal_position_address, target_position)
    if dxl_comm_result != COMM_SUCCESS:
        print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
    elif dxl_error != 0:
        print("%s" % packetHandler.getRxPacketError(dxl_error))
```
</details>

### [Read data from DYNAMIXEL](#read-data-from-dynamixel)
- Read the current position from the DYNAMIXEL.
```python
      while True:
          present_position_address = 132
          present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, dxl_id, present_position_address)
          print(f"Current Position: {present_position}")

          if abs(target_position - present_position) <= 10:
              break
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`read4ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
```python
        present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, dxl_id, present_position_address)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
```
</details>

- Turn off the torque when while loop is exited. And close the port.
```python
  data = 0
  packetHandler.write1ByteTxRx(portHandler, dxl_id, torque_on_address, data)
  portHandler.closePort()
```

## [Run the Code](#run-the-code)
- Run the code using python3.
```bash
$ python3 my_read_write.py
```
