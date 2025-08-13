---
layout: archive
lang: en
ref: dynamixel_sdk_basic_read_write_tutorial_cpp
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/basic_read_write_tutorial/basic_read_write_tutorial_cpp/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="basic-read-write-tutorial">Basic Read/Write Tutorial <C++></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides examples of how to write code in C++ to read and write data to DYNAMIXEL motors.

**NOTE**: This tutorial is based on **XL-series** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

# [Read/Write Example](#read-write-example)

## [Make cpp file](#make-cpp-file)
- Create a CPP file and open it in a text editor.
```bash
$ mkdir -p my_dxl_project/src
$ cd my_dxl_project/src
$ code my_read_write.cpp
```

## [Source Code](#source-code)

### [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_sdk.h` to the top of your CPP file. This header file includes all necessary functions and classes from the DYNAMIXEL SDK.
```cpp
  #include "dynamixel_sdk/dynamixel_sdk.h"
  #include <iostream>
```

### [Initialize Handler Objects](#make-objects)
- Make main function and initialize the `PortHandler` and `PacketHandler`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
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

### [Write data to enable torque](#write-data-to-enable-torque)
- Turn on the torque of the DYNAMIXEL.
  ```cpp
    uint8_t dxl_id = 1;
    uint16_t torque_on_address = 64;
    uint8_t data = 1; // 1 to turn on the torque, 0 to turn off
    packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data);
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
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data, &dxl_error);

  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#1 has been successfully connected \n";
  }
```
</details>

### [Get User Input](#get-user-input-and-write-data)
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

### [Write data to set target position](#write-data-to-set-target-position)
- Write the target position to the DYNAMIXEL.
```cpp
      uint16_t goal_position_address = 116;
      packetHandler->write4ByteTxRx(portHandler, dxl_id, goal_position_address, uint32_t(target_position));
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`write4ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_comm_result`, `dxl_error` variable should be declared beforehand.
```cpp
  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;  //COMM_TX_FAIL is a constant defined in the SDK
  ...
```
```cpp
  dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, dxl_id, goal_position_address, uint32_t(target_position), &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  }
```
</details>

### [Read data from DYNAMIXEL](#read-data-from-dynamixel)
- Read the current position from the DYNAMIXEL.
```cpp
      uint16_t present_position_address = 132;
      uint32_t present_position;
      do {
        packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position);
        std::cout << "Current Position: " << present_position << std::endl;
      } while (abs(target_position - present_position) > 10);
    }
```
<details>
<summary>
  ![](/assets/images/icon_unfold.png) **ERROR LOGGING**
</summary>

`read4ByteTxRx()` returns a communication result. If you want to check the communication result and error, you can write the code as shown below.  
The `dxl_comm_result`, `dxl_error` variable should be declared beforehand.
```cpp
  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;  //COMM_TX_FAIL is a constant defined in the SDK
  ...
```
```cpp
  dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  }
```
</details>

- Turn off the torque when while loop is exited. And close the port.
```cpp
    data = 0; // 0 to turn off the torque
    packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data);
    portHandler->closePort();

    return 0;
  }
```

## [Compile and Run](#compile-and-run)
- Compile the code using g++.
```bash
$ g++ my_read_write.cpp -o my_read_write -ldxl_x64_cpp
$ ./my_read_write
```
