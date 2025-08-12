---
layout: archive
lang: en
ref: dynamixel_sdk_sync_read_write_tutorial_cpp
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sync_read_write_tutorial/sync_read_write_tutorial_cpp/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div class="main-header">
  <h1>Sync Read/Write Tutorial <C++></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides examples of how to write code in C++ to sync_read and sync_write data to DYNAMIXEL motors.

**NOTE**: This tutorial is based on **XL-series** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

# [Sync_Read/Write Example](#sync-read-write-example)
Sync Read/Write allows simultaneous access to the same address on multiple DYNAMIXEL motors.  
We need two motors to operate simultaneously.  

## [Make cpp file](#make-cpp-file)
- Create a CPP file and open it in a text editor.
```bash
$ mkdir -p my_dxl_project/src
$ cd my_dxl_project/src
$ code my_sync_read_write.cpp
```

## [Source Code](#source-code)

### [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_sdk.h` to the top of your CPP file. This header file includes all necessary functions and classes from the DYNAMIXEL SDK.
```cpp
  #include "dynamixel_sdk/dynamixel_sdk.h"
  #include <iostream> // For standard input/output
  #include <unistd.h> // For usleep function
```

### [Initialize Handler Objects](#make-objects)
- Make main function and initialize the `PortHandler`,`PacketHandler`,`GroupSyncWrite` and `GroupSyncRead`. And open the port and set the baud rate.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
    uint16_t goal_position_address = 116;
    uint16_t present_position_address = 132;
    uint16_t data_length = 4;
    dynamixel::GroupSyncWrite groupSyncWrite(portHandler, packetHandler, goal_position_address, data_length);
    dynamixel::GroupSyncRead groupSyncRead(portHandler, packetHandler, present_position_address, data_length);
    portHandler->openPort();
    portHandler->setBaudRate(57600);
```

### [Write data to turn torque on](#write-data-to-turn-torque-on)
- Turn on the torque of the DYNAMIXEL.  
  ```cpp
    uint8_t dxl_id1 = 1;
    uint8_t dxl_id2 = 2;
    uint16_t torque_on_address = 64;
    uint8_t data = 1; // 1 to turn on the torque, 0 to turn off
    packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data);
    packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data);
  ```
  - `id` : Dynamixel ID you set
  - `address` : The address of the data you want to write. Refer to the [**Control Table**](/docs/en/dxl/x/xc430-w240/#control-table) of your DYNAMIXEL model, which can be found in its **specification manual** or **Dynamixel Wizard 2.0**. In this example, we use X series.
  - `data` : The data you want to write to the specified address.

### [Get User Input and Write Data](#get-user-input-and-write-data)
- Get user input for the target position. Also add param to the `GroupSyncRead` before the while loop.
```cpp
    int target_position;
    groupSyncRead.addParam(dxl_id1);
    groupSyncRead.addParam(dxl_id2);
    while(true){
      std::cout << "Enter target position (0 ~ 4095): ";
      std::cin >> target_position;
      if(target_position == -1){
        break; // Exit on -1 input
      } else if(target_position < 0 || target_position > 4095){
        std::cout << "Position must be between 0 and 4095." << std::endl;
        continue;
      }
```

### [Add parameters to GroupSyncWrite](#add-parameters-to-groupsyncwrite)
- Add the DYNAMIXEL IDs and goal_position to the `GroupSyncWrite`. Since `addParam()` requires a `uint8_t *` as its input, the data must be provided as a byte array.
```cpp
      uint8_t param_goal_position[4];
      param_goal_position[0] = DXL_LOBYTE(DXL_LOWORD(target_position));
      param_goal_position[1] = DXL_HIBYTE(DXL_LOWORD(target_position));
      param_goal_position[2] = DXL_LOBYTE(DXL_HIWORD(target_position));
      param_goal_position[3] = DXL_HIBYTE(DXL_HIWORD(target_position));
      groupSyncWrite.addParam(dxl_id1, param_goal_position);
      groupSyncWrite.addParam(dxl_id2, param_goal_position);
```

- Transmit the packet to the Dynamixel and clear the parameters.
```cpp
      groupSyncWrite.txPacket();
      groupSyncWrite.clearParam();
```

### [Read data to get current position](#read-data-to-get-current-position)
- Read the current position from the DYNAMIXEL until it reaches the target position.
```cpp
      int dxl1_present_position;
      int dxl2_present_position;
      do {
        groupSyncRead.txRxPacket();
        dxl1_present_position = groupSyncRead.getData(dxl_id1, present_position_address, data_length);
        dxl2_present_position = groupSyncRead.getData(dxl_id2, present_position_address, data_length);
        printf("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d\n", dxl_id1, target_position, dxl1_present_position, dxl_id2, target_position, dxl2_present_position);
      } while((abs(target_position - dxl1_present_position) > 10) || (abs(target_position - dxl2_present_position) > 10));
    }
    portHandler->closePort();
    return 0;
  }
```
<br>


## [Compile and Run](#compile-and-run)
- Compile the code using g++.
```bash
$ g++ my_sync_read_write.cpp -o my_sync_read_write -ldxl_x64_cpp
$ ./my_sync_read_write
```

# [Error Logging](#error-logging)

- `openPort()` and `setBaudRate()` functions return a boolean value indicating success or failure. If you want to check for failure, you can write like below to print an error message and exit the program.
```cpp
  if (portHandler->openPort())
  {
    printf("Succeeded to open the port!\n");
  }
  else
  {
    printf("Failed to open the port!\n");
    return 0;
  }

  if (portHandler->setBaudRate(57600))
  {
    printf("Succeeded to change the baudrate!\n");
  }
  else
  {
    printf("Failed to change the baudrate!\n");
    return 0;
  }
```
<br>

- `write` functions return an int type result code. If you want to check for failure, you can write like below to print an error message and exit the program. You can use the `getTxRxResult` and `getRxPacketError` functions to get a string representation of the error code. Add the `dxl_comm_result` and `dxl_error` variables when **writing data(ex. write4ByteTxRx)** to the DYNAMIXEL.
```cpp
  int dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, dxl_id, goal_position_address, uint32_t(target_position), &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
  std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
  std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  }
```
  - If `dxl_comm_result` is not `COMM_SUCCESS`, it indicates a communication error.
  - If `dxl_error` is not 0, it indicates an error in the DYNAMIXEL itself.

<br>

- `addParam()` functions return a boolean value indicating success or failure. If you want to check for failure, you can write like below to print an error message and exit the program.
```cpp
  if (!groupSyncWrite.addParam(dxl_id1, param_goal_position))
  {
    printf("Failed to add parameter for ID:%03d\n", dxl_id1);
    return 0;
  }
```
<br>

- You can also check if the data is available in the `GroupSyncRead` by using the `isAvailable()` function. If the data is not available, you can print an error message and exit the program.
```cpp
  bool dxl_getdata_result = groupSyncRead.isAvailable(dxl_id1, present_position_address, data_length);
  if (dxl_getdata_result != true)
  {
    fprintf(stderr, "[ID:%03d] groupSyncRead getdata failed", dxl_id1);
    return 0;
  }
```
