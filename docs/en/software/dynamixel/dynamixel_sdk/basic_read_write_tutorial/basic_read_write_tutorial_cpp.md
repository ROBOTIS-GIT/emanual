---
layout: archive
lang: en
ref: dynamixel_sdk_basic_read_write_tutorial_cpp
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/basic_read_write_tutorial/basic_read_write_tutorial_cpp/
tabs: "OS"
tab_title1: Linux
tab_title2: Windows
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

**NOTE**: This tutorial is based on **XL-430-W250** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

# [Make cpp file](#make-cpp-file)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Create a CPP file and open it in a text editor. In this case, we use visual studio code, but you can use any text editor you prefer.
```bash
$ mkdir -p my_dxl_project/src
$ cd my_dxl_project/src
$ code my_read_write.cpp
```
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

- Open Visual Studio and create a new project as a Console Application.
  ![](/assets/images/sw/sdk/dynamixel_sdk/basic_read_write_tutorial/makeproject.png)

</section>

# [Source Code Description](#source-code-description)

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_sdk.h` to the top of your CPP file. This header file includes all necessary functions and classes from the DYNAMIXEL SDK.
```cpp
  #include "dynamixel_sdk/dynamixel_sdk.h"
  #include <iostream>
```

## [Initialize Handler Objects](#make-objects)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Make main function and initialize the `PortHandler` and `PacketHandler`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
```
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

- Make main function and initialize the `PortHandler` and `PacketHandler`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `COM3` as the port name and `2.0` as the protocol version.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("COM3"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
```
</section>

## [Open Port and Set Baud Rate](#open-port-and-set-baud-rate)
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

## [Write data to enable torque](#write-data-to-enable-torque)
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

## [Get User Input](#get-user-input-and-write-data)
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

## [Write data to set target position](#write-data-to-set-target-position)
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

## [Read data from DYNAMIXEL](#read-data-from-dynamixel)
- Read the current position from the DYNAMIXEL.
```cpp
      uint16_t present_position_address = 132;
      uint32_t present_position;
      do {
        packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position);
        std::cout << "Current Position: " << present_position << std::endl;
      } while (abs(static_cast<int>(target_position - present_position)) > 10);
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

# [Compile and Run](#compile-and-run)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Compile the code using g++.
```bash
$ g++ my_read_write.cpp -o my_read_write -ldxl_x64_cpp
$ ./my_read_write
```
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

- Set build properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/basic_read_write_tutorial/buildproperties.png)
  - `C/C++ → Additional Include Directories` : `{$Dynamixel_SDK_PATH\c++\include}`
  - `Debugging → Environment` : `PATH=%PATH%;{$Dynamixel_SDK_PATH\c++\build\win64\output}` (if you use 32bit architecture, use `{$Dynamixel_SDK_PATH\c++\build\win32\output}`)

  ![](/assets/images/sw/sdk/dynamixel_sdk/basic_read_write_tutorial/buildproperties2.png)
  - `Linker` → `Additional Library Directories` : `{$Dynamixel_SDK_PATH\c++\build\win64\output}` (if you use 32bit architecture, use `{$Dynamixel_SDK_PATH\c++\build\win32\output}`)
  - `Linker` → `Input` → `Additional Dependencies` : `dxl_x64_cpp.lib`

<br>

- **Build properties setup is complete. You can now build and run the project.**

  ![](/assets/images/sw/sdk/dynamixel_sdk/basic_read_write_tutorial/buildandrun.png)
- **After building, you can find the executable file( .exe ) in the output directory :** `{$YOUR_SLN_DIR\x64\}`


**WARNING**: If you execute the .exe file directly(not through the IDE), you might encounter a `missing DLL` error. To fix this, ensure that `dxl_x64_cpp.dll` is either in your system PATH or in the same directory as the application.
{: .notice--warning}
</section>

# [Full Source Code](#full-source-code)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

```cpp
#include "dynamixel_sdk/dynamixel_sdk.h"
#include <iostream>

int main(){
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0");
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0);
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

  uint8_t dxl_id = 1;
  uint16_t torque_on_address = 64;
  uint8_t data = 1;
  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;

  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#1 has been successfully connected \n";
  }

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

    uint16_t goal_position_address = 116;
    dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, dxl_id, goal_position_address, uint32_t(target_position), &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS) {
      std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
    } else if (dxl_error != 0) {
      std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
    }

    uint16_t present_position_address = 132;
    uint32_t present_position;
    do {
      dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      } else if (dxl_error != 0) {
        std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
      }
      std::cout << "Current Position: " << present_position << std::endl;
    } while (abs(static_cast<int>(target_position - present_position)) > 10);
  }

  data = 0;
  packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data);
  portHandler->closePort();

  return 0;
}
```
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

```cpp
#include "dynamixel_sdk/dynamixel_sdk.h"
#include <iostream>

int main(){
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("COM3");
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0);
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

  uint8_t dxl_id = 1;
  uint16_t torque_on_address = 64;
  uint8_t data = 1;
  uint8_t dxl_error = 0;
  int dxl_comm_result = COMM_TX_FAIL;

  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS) {
    std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
  } else if (dxl_error != 0) {
    std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
  } else {
    std::cout << "Dynamixel#1 has been successfully connected \n";
  }

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

    uint16_t goal_position_address = 116;
    dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, dxl_id, goal_position_address, uint32_t(target_position), &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS) {
      std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
    } else if (dxl_error != 0) {
      std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
    }

    uint16_t present_position_address = 132;
    uint32_t present_position;
    do {
      dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, dxl_id, present_position_address, &present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      } else if (dxl_error != 0) {
        std::cout << packetHandler->getRxPacketError(dxl_error) << std::endl;
      }
      std::cout << "Current Position: " << present_position << std::endl;
    } while (abs(static_cast<int>(target_position - present_position)) > 10);
  }

  data = 0;
  packetHandler->write1ByteTxRx(portHandler, dxl_id, torque_on_address, data);
  portHandler->closePort();

  return 0;
}
```
</section>
