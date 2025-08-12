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

<div class="main-header">
  <h1>Basic Read/Write Tutorial <C++></h1>
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
  #include <iostream> // For standard input/output
  #include <unistd.h> // For usleep function
```

### [Initialize Handler Objects](#make-objects)
- Make main function and initialize the `PortHandler` and `PacketHandler`. Set the `port name` and `baud rate` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `57600` as the baud rate.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
    portHandler->openPort();
    portHandler->setBaudRate(57600);
```

### [Write data to turn torque on](#write-data-to-turn-torque-on)
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

### [Get User Input and Write Data](#get-user-input-and-write-data)
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

### [Read data to get current position](#read-data-to-get-current-position)
- Check if the DYNAMIXEL is moving before read the motor position.
```cpp
      usleep(100000);
      while(true){
        uint16_t moving_address = 122;
        uint8_t moving;
        packetHandler->read1ByteTxRx(portHandler, dxl_id, moving_address, &moving);
        if(moving == 0) break;
        usleep(100000);
      }
```

- Read the current position from the DYNAMIXEL and close the port.
```cpp
      uint16_t present_position_address = 132;
      uint32_t present_position;
      packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position);
      std::cout << "Current Position: " << present_position << std::endl;
    }
    portHandler->closePort();
  }
```

## [Compile and Run](#compile-and-run)
- Compile the code using g++.
```bash
$ g++ my_read_write.cpp -o my_read_write -ldxl_x64_cpp
$ ./my_read_write
```

# [Error Logging](#error-logging)

## [Error when opening port or setting baud rate](#error-when-opening-port-or-setting-baud-rate)
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

## [Error when writing data](#error-when-writing-data)
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

