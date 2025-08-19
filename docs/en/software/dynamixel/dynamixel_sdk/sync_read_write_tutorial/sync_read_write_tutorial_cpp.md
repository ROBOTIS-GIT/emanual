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

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="sync-read-write-tutorial">Sync Read/Write Tutorial <C++></h1>
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
  #include <iostream>
```

### [Initialize Handler Objects](#make-objects)
- Make main function and initialize the `PortHandler`,`PacketHandler`,`GroupSyncWrite` and `GroupSyncRead`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version

    uint16_t goal_position_address = 116;
    uint16_t present_position_address = 132;
    uint16_t data_length_4byte = 4;
    dynamixel::GroupSyncWrite groupSyncWrite(portHandler, packetHandler, goal_position_address, data_length_4byte);
    dynamixel::GroupSyncRead groupSyncRead(portHandler, packetHandler, present_position_address, data_length_4byte);
```

### [Open Port and Set Baud Rate](#open-port-and-set-baud-rate)
- Open the port and set the baud rate. The example below uses `57600` as the baud rate.
```cpp
    portHandler->openPort();
    portHandler->setBaudRate(57600);
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`openPort()` and `setBaudRate()` functions return a boolean value indicating success or failure. If you want to check for failure, you can write like below to print an error message and exit the program.
```cpp
  if (portHandler->openPort()) {
    std::cout << "Succeeded to open the port!\n";
  } else {
    std::cout << "Failed to open the port!\n";
    return 0;
  }

  if (portHandler->setBaudRate(57600)) {
    std::cout << "Succeeded to change the baudrate!\n";
  } else {
    std::cout << "Failed to change the baudrate!\n";
    return 0;
  }
```
</details>

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
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`write1ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_comm_result`, `dxl_error` variable should be declared beforehand.
```cpp
  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;  //COMM_TX_FAIL is a constant defined in the SDK
  ...
```
```cpp
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#1 has been successfully connected \n";
  }

  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#2 has been successfully connected \n";
  }
```
</details>

### [Add parameters to GroupSyncRead](#add-parameters-to-groupsyncread)
- Add the DYNAMIXEL IDs to the `GroupSyncRead`.
```cpp
    groupSyncRead.addParam(dxl_id1);
    groupSyncRead.addParam(dxl_id2);
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`addParam()` returns a communication result as boolean. If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_addparam_result` variable should be declared beforehand.
```cpp
  bool dxl_addparam_result = false;
```
```cpp
    dxl_addparam_result = groupSyncRead.addParam(dxl_id1);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id1  <<"]groupSyncRead addparam failed" << std::endl;
      return 0;
    }

    dxl_addparam_result = groupSyncRead.addParam(dxl_id2);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id2  <<"]groupSyncRead addparam failed" << std::endl;
      return 0;
    }
```
</details>


### [Get User Input and Set Data](#get-user-input-and-write-data)
- Get user input for the target position.
```cpp
    int target_position;
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
- Since `addParam()` requires a `uint8_t *` as its input, the data must be provided as a byte array.
```cpp
      uint8_t param_goal_position[4];
      param_goal_position[0] = DXL_LOBYTE(DXL_LOWORD(target_position));
      param_goal_position[1] = DXL_HIBYTE(DXL_LOWORD(target_position));
      param_goal_position[2] = DXL_LOBYTE(DXL_HIWORD(target_position));
      param_goal_position[3] = DXL_HIBYTE(DXL_HIWORD(target_position));
```

### [Add parameters to GroupSyncWrite](#add-parameters-to-groupsyncwrite)
- Add parameter to the `GroupSyncWrite` and tranfer the data to the DYNAMIXEL.
```cpp
      groupSyncWrite.addParam(dxl_id1, param_goal_position);
      groupSyncWrite.addParam(dxl_id2, param_goal_position);
      groupSyncWrite.txPacket();
      groupSyncWrite.clearParam();
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

 `txPacket()` and `addParam()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_addparam_result`, `dxl_comm_result` variables should be declared beforehand.
```cpp
  bool dxl_addparam_result = false;
  int dxl_comm_result = COMM_TX_FAIL;  //COMM_TX_FAIL is a constant defined in the SDK
```
```cpp
  dxl_addparam_result = groupSyncWrite.addParam(dxl_id1, param_goal_position);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id1  <<"]groupSyncWrite addparam failed" << std::endl;
    return 0;
  }
  dxl_addparam_result = groupSyncWrite.addParam(dxl_id2, param_goal_position);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id2  <<"]groupSyncWrite addparam failed" << std::endl;
    return 0;
  }

  dxl_comm_result = groupSyncWrite.txPacket();
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  }
```
</details>

### [Read data to get current position](#read-data-to-get-current-position)
- Read the current position from the DYNAMIXEL until it reaches the target position.
```cpp
      int dxl1_present_position;
      int dxl2_present_position;
      do {
        groupSyncRead.txRxPacket();
        dxl1_present_position = groupSyncRead.getData(dxl_id1, present_position_address, data_length_4byte);
        dxl2_present_position = groupSyncRead.getData(dxl_id2, present_position_address, data_length_4byte);
        printf("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d\n", dxl_id1, target_position, dxl1_present_position, dxl_id2, target_position, dxl2_present_position);
      } while((abs(target_position - dxl1_present_position) > 10) || (abs(target_position - dxl2_present_position) > 10));
    }
    portHandler->closePort();
    return 0;
  }
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`txRxPacket()` and `isAvailable()` returns a communication result . If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_getdata_result`, `dxl_comm_result` variables should be declared beforehand.
```cpp
  bool dxl_getdata_result = false;
  int dxl_comm_result = COMM_TX_FAIL;  //COMM_TX_FAIL is a constant defined in the SDK
```
```cpp
      dxl_comm_result = groupSyncRead.txRxPacket();
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      }
```
You can also check if the data is available in the `GroupSyncRead` by using the `isAvailable()` function. If the data is not available, you can print an error message and exit the program.
```cpp
      dxl_getdata_result = groupSyncRead.isAvailable(dxl_id1, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id1 << "] groupSyncRead getdata failed" << std::endl;
        return 0;
      }

      dxl_getdata_result = groupSyncRead.isAvailable(dxl_id2, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id2 << "] groupSyncRead getdata failed" << std::endl;
        return 0;
      }
```
</details>

## [Compile and Run](#compile-and-run)
- Compile the code using g++.
```bash
$ g++ my_sync_read_write.cpp -o my_sync_read_write -ldxl_x64_cpp
$ ./my_sync_read_write
```

# [Full Source Code](#full-source-code)
```cpp
#include "dynamixel_sdk/dynamixel_sdk.h"
#include <iostream>

int main(){
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version

  uint16_t goal_position_address = 116;
  uint16_t present_position_address = 132;
  uint16_t data_length_4byte = 4;
  dynamixel::GroupSyncWrite groupSyncWrite(portHandler, packetHandler, goal_position_address, data_length_4byte);
  dynamixel::GroupSyncRead groupSyncRead(portHandler, packetHandler, present_position_address, data_length_4byte);

  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;
  bool dxl_addparam_result = false;
  bool dxl_getdata_result = false;

  if (portHandler->openPort()) {
    std::cout << "Succeeded to open the port!\n";
  } else {
    std::cout << "Failed to open the port!\n";
    return 0;
  }

  if (portHandler->setBaudRate(57600)) {
    std::cout << "Succeeded to change the baudrate!\n";
  } else {
    std::cout << "Failed to change the baudrate!\n";
    return 0;
  }

  uint8_t dxl_id1 = 1;
  uint8_t dxl_id2 = 2;
  uint16_t torque_on_address = 64;
  uint8_t data = 1;
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#1 has been successfully connected \n";
  }

  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#2 has been successfully connected \n";
  }

  dxl_addparam_result = groupSyncRead.addParam(dxl_id1);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id1  <<"]groupSyncRead addparam failed" << std::endl;
    return 0;
  }
  dxl_addparam_result = groupSyncRead.addParam(dxl_id2);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id2  <<"]groupSyncRead addparam failed" << std::endl;
    return 0;
  }

  int target_position;
  while(true){
    std::cout << "Enter target position (0 ~ 4095): ";
    std::cin >> target_position;
    if(target_position == -1){
      break;
    } else if(target_position < 0 || target_position > 4095){
      std::cout << "Position must be between 0 and 4095." << std::endl;
      continue;
    }

    uint8_t param_goal_position[4];
    param_goal_position[0] = DXL_LOBYTE(DXL_LOWORD(target_position));
    param_goal_position[1] = DXL_HIBYTE(DXL_LOWORD(target_position));
    param_goal_position[2] = DXL_LOBYTE(DXL_HIWORD(target_position));
    param_goal_position[3] = DXL_HIBYTE(DXL_HIWORD(target_position));

    groupSyncWrite.addParam(dxl_id1, param_goal_position);
    groupSyncWrite.addParam(dxl_id2, param_goal_position);
    groupSyncWrite.txPacket();
    groupSyncWrite.clearParam();

    dxl_addparam_result = groupSyncWrite.addParam(dxl_id1, param_goal_position);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id1  <<"]groupSyncWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_addparam_result = groupSyncWrite.addParam(dxl_id2, param_goal_position);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id2  <<"]groupSyncWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_comm_result = groupSyncWrite.txPacket();
    if (dxl_comm_result != COMM_SUCCESS) {
      std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
    }

    int dxl1_present_position;
    int dxl2_present_position;
    do {
      dxl_comm_result = groupSyncRead.txRxPacket();
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      }
      dxl_getdata_result = groupSyncRead.isAvailable(dxl_id1, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id1 << "] groupSyncRead getdata failed" << std::endl;
        return 0;
      }

      dxl_getdata_result = groupSyncRead.isAvailable(dxl_id2, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id2 << "] groupSyncRead getdata failed" << std::endl;
        return 0;
      }

      dxl1_present_position = groupSyncRead.getData(dxl_id1, present_position_address, data_length_4byte);
      dxl2_present_position = groupSyncRead.getData(dxl_id2, present_position_address, data_length_4byte);
      printf("[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d\n", dxl_id1, target_position, dxl1_present_position, dxl_id2, target_position, dxl2_present_position);
    } while((abs(target_position - dxl1_present_position) > 10) || (abs(target_position - dxl2_present_position) > 10));
  }
  portHandler->closePort();

  return 0;
}
