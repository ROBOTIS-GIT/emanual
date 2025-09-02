---
layout: archive
lang: en
ref: dynamixel_sdk_bulk_read_write_tutorial_cpp
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/bulk_read_write_tutorial/bulk_read_write_tutorial_cpp/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="bulk-read-write-tutorial">Bulk Read/Write Tutorial <C++></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

**NOTE**: This tutorial is based on **XL-430-W250** DYNAMIXEL motors and uses **Protocol 2.0**.
{: .notice--warning}

This section provides examples of how to write code in C++ to bulk_read and bulk_write data to DYNAMIXEL motors.  
**Bulk Read/Write** enables simultaneous control of multiple motors.  
Unlike **Sync Read/Write**, which can only access the same address across multiple motors, **Bulk Read/Write** can access different addresses on multiple motors in a single instruction.  
In this example, we need two motors to operate simultaneously.

# [Make cpp file](#make-cpp-file)
- Create a CPP file and open it in a text editor. In this case, we use visual studio code, but you can use any text editor you prefer.
```bash
$ mkdir -p my_dxl_project/src
$ cd my_dxl_project/src
$ code my_bulk_read_write.cpp
```

# [Source Code Description](#source-code-description)

## [Add Header Files](#add-header-files)
- Add `dynamixel_sdk/dynamixel_sdk.h` to the top of your CPP file. This header file includes all necessary functions and classes from the DYNAMIXEL SDK.
```cpp
  #include "dynamixel_sdk/dynamixel_sdk.h"
  #include <iostream>
```

## [Initialize Handler Objects](#make-objects)
- Make main function and initialize the `PortHandler`,`PacketHandler`,`GroupBulkWrite` and `GroupBulkRead`. Set the `port name` and `protocol version` according to your DYNAMIXEL setup. The example below uses `/dev/ttyUSB0` as the port name and `2.0` as the protocol version.
```cpp
  int main(){
    dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0"); // your dxl port name
    dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0); //protocol version
    dynamixel::GroupBulkWrite groupBulkWrite(portHandler, packetHandler);
    dynamixel::GroupBulkRead groupBulkRead(portHandler, packetHandler);
```

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
    uint8_t dxl_id1 = 1;
    uint8_t dxl_id2 = 2;
    uint16_t torque_on_address = 64;
    uint8_t data = 1; // 1 to turn on the torque, 0 to turn off
    packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data);
    packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data);
  ```
  - `id` : Dynamixel ID you set
  - `address` : The address of the data you want to write. Refer to the [**Control Table**](/docs/en/dxl/x/xc430-w240/#control-table) of your DYNAMIXEL model, which can be found in its **specification manual** or **Dynamixel Wizard 2.0**. In this example, we use XL series.
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

## [Add Parameters to GroupBulkRead](#add-parameters-to-groupbulkread)
- Add the DYNAMIXEL IDs and addresses to access to the `GroupBulkRead`.
```cpp
    uint16_t present_position_address = 132;
    uint16_t data_length_4byte = 4;
    groupBulkRead.addParam(dxl_id1, present_position_address, data_length_4byte);

    uint16_t led_address = 65;
    uint16_t data_length_1byte = 1;
    groupBulkRead.addParam(dxl_id2, led_address, data_length_1byte);
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
  dxl_addparam_result = groupBulkRead.addParam(dxl_id1, present_position_address, data_length_4byte);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id1  <<"]groupBulkRead addparam failed" << std::endl;
    return 0;
  }

  dxl_addparam_result = groupBulkRead.addParam(dxl_id2, led_address, data_length_1byte);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id2  <<"]groupBulkRead addparam failed" << std::endl;
    return 0;
  }
```
</details>

## [Get User Input and Set Data](#get-user-input-and-write-data)
- Get user input for the target position.
```cpp
    int target_position = 0;
    uint8_t dxl2_led_value_read = 0;
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
- Since `addParam()` requires a `uint8_t *` as its input, the data must be provided as a byte array. Also set the LED data to toggle the LED on the second DYNAMIXEL.
```cpp
      uint8_t param_goal_position[4];
      param_goal_position[0] = DXL_LOBYTE(DXL_LOWORD(target_position));
      param_goal_position[1] = DXL_HIBYTE(DXL_LOWORD(target_position));
      param_goal_position[2] = DXL_LOBYTE(DXL_HIWORD(target_position));
      param_goal_position[3] = DXL_HIBYTE(DXL_HIWORD(target_position));

      uint8_t led_data = 0;
      if (dxl2_led_value_read == 0){
        led_data = 1;
      } else {
        led_data = 0;
      }
```

## [Add parameter to GroupBulkWrite and Write Data](#add-parameters-to-groupbulkwrite)
- Add parameter to the `GroupBulkWrite` and tranfer the data to the DYNAMIXEL.
```cpp
      uint16_t goal_position_address = 116;
      groupBulkWrite.addParam(dxl_id1, goal_position_address, data_length_4byte, param_goal_position);
      groupBulkWrite.addParam(dxl_id2, led_address, data_length_1byte, &led_data);
      groupBulkWrite.txPacket();
      groupBulkWrite.clearParam();
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
    dxl_addparam_result = groupBulkWrite.addParam(dxl_id1, goal_position_address, data_length_4byte, param_goal_position);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id1  <<"]groupBulkWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_addparam_result = groupBulkWrite.addParam(dxl_id2, led_address, data_length_1byte, &led_data);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id2  <<"]groupBulkWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_comm_result = groupBulkWrite.txPacket();
    if (dxl_comm_result != COMM_SUCCESS) {
      std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
    }
```
</details>

## [Read data from DYNAMIXEL](#read-data-from-dynamixel)
- Read the current position and LED data from the DYNAMIXEL until it reaches the target position.
```cpp
      int dxl1_present_position;
      do{
        groupBulkRead.txRxPacket();
        dxl1_present_position = groupBulkRead.getData(dxl_id1, present_position_address, data_length_4byte);
        dxl2_led_value_read = groupBulkRead.getData(dxl_id2, led_address, data_length_1byte);
        printf("[ID:%03d] Present Position : %d \t [ID:%03d] LED Value: %d\n", dxl_id1, dxl1_present_position, dxl_id2, dxl2_led_value_read);
      } while (abs(target_position - dxl1_present_position) > 10);
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
      dxl_comm_result = groupBulkRead.txRxPacket();
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      }
```
You can also check if the data is available in the `GroupBulkRead` by using the `isAvailable()` function. If the data is not available, you can print an error message and exit the program.
```cpp
      dxl_getdata_result = groupBulkRead.isAvailable(dxl_id1, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id1 << "] groupBulkRead getdata failed" << std::endl;
        return 0;
      }

      dxl_getdata_result = groupBulkRead.isAvailable(dxl_id2, led_address, data_length_1byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id2 << "] groupBulkRead getdata failed" << std::endl;
        return 0;
      }
```
</details>

- Turn off the torque when while loop is exited. And close the port.
```cpp
    data = 0; // 0 to turn off the torque
    packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data);
    packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data);
    portHandler->closePort();

    return 0;
  }
```


# [Compile and Run](#compile-and-run)
- Compile the code using g++.
```bash
$ g++ my_bulk_read_write.cpp -o my_bulk_read_write -ldxl_x64_cpp
$ ./my_bulk_read_write
```

# [Full Source Code](#full-source-code)
```cpp
#include "dynamixel_sdk/dynamixel_sdk.h"
#include <iostream>

int main(){
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler("/dev/ttyUSB0");
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(2.0);
  dynamixel::GroupBulkWrite groupBulkWrite(portHandler, packetHandler);
  dynamixel::GroupBulkRead groupBulkRead(portHandler, packetHandler);

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

  uint16_t present_position_address = 132;
  uint16_t data_length_4byte = 4;
  dxl_addparam_result = groupBulkRead.addParam(dxl_id1, present_position_address, data_length_4byte);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id1  <<"]groupBulkRead addparam failed" << std::endl;
    return 0;
  }

  uint16_t led_address = 65;
  uint16_t data_length_1byte = 1;
  dxl_addparam_result = groupBulkRead.addParam(dxl_id2, led_address, data_length_1byte);
  if (!dxl_addparam_result) {
    std::cout <<"[ID:" << (int)dxl_id2  <<"]groupBulkRead addparam failed" << std::endl;
    return 0;
  }

  int target_position = 0;
  uint8_t dxl2_led_value_read = 0;
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

    uint8_t led_data = 0;
    if (dxl2_led_value_read == 0){
      led_data = 1;
    } else {
      led_data = 0;
    }

    uint16_t goal_position_address = 116;
    dxl_addparam_result = groupBulkWrite.addParam(dxl_id1, goal_position_address, data_length_4byte, param_goal_position);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id1  <<"]groupBulkWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_addparam_result = groupBulkWrite.addParam(dxl_id2, led_address, data_length_1byte, &led_data);
    if (!dxl_addparam_result) {
      std::cout <<"[ID:" << (int)dxl_id2  <<"]groupBulkWrite addparam failed" << std::endl;
      return 0;
    }

    dxl_comm_result = groupBulkWrite.txPacket();
    if (dxl_comm_result != COMM_SUCCESS) {
      std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
    }
    groupBulkWrite.clearParam();

    int dxl1_present_position;
    do{
      dxl_comm_result = groupBulkRead.txRxPacket();
      if (dxl_comm_result != COMM_SUCCESS) {
        std::cout << packetHandler->getTxRxResult(dxl_comm_result) << std::endl;
      }
      dxl_getdata_result = groupBulkRead.isAvailable(dxl_id1, present_position_address, data_length_4byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id1 << "] groupBulkRead getdata failed" << std::endl;
        return 0;
      }

      dxl_getdata_result = groupBulkRead.isAvailable(dxl_id2, led_address, data_length_1byte);
      if (dxl_getdata_result != true) {
        std::cout << "[ID:" << (int)dxl_id2 << "] groupBulkRead getdata failed" << std::endl;
        return 0;
      }
      dxl1_present_position = groupBulkRead.getData(dxl_id1, present_position_address, data_length_4byte);
      dxl2_led_value_read = groupBulkRead.getData(dxl_id2, led_address, data_length_1byte);
      printf("[ID:%03d] Present Position : %d \t [ID:%03d] LED Value: %d\n", dxl_id1, dxl1_present_position, dxl_id2, dxl2_led_value_read);
    } while (abs(target_position - dxl1_present_position) > 10);
  }
  data = 0;
  packetHandler->write1ByteTxRx(portHandler, dxl_id1, torque_on_address, data);
  packetHandler->write1ByteTxRx(portHandler, dxl_id2, torque_on_address, data);
  portHandler->closePort();

  return 0;
}
```
