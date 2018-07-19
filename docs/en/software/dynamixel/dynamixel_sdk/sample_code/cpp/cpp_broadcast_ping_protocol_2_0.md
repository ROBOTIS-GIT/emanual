---
layout: archive
lang: en
ref: cpp_broadcast_ping_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/cpp_broadcast_ping_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 6"></div>
<div style="counter-reset: h3 6"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="cpp-protocol-20"><a href="#cpp-protocol-20">CPP Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [CPP Broadcast Ping Protocol 2.0](#cpp-broadcast-ping-protocol-20)

- Description

  This example tries to ping all Dynamixels that are connected to the controller, and shows which Dynamixel is successfully connected. The example is commonly used to check for Dynamixel’s connection at once.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code

``` cpp
/*
 * broadcast_ping.cpp
 *
 *  Created on: 2016. 2. 21.
 *      Author: leon
 */

//
// *********     broadcastPing Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below "#define"d variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

#ifdef __linux__
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif

#include <stdio.h>
#include <vector>

#include "dynamixel_sdk.h"                                  // Uses Dynamixel SDK library

// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel

// Default setting
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

int getch()
{
#ifdef __linux__
  struct termios oldt, newt;
  int ch;
  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  ch = getchar();
  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  return ch;
#elif defined(_WIN32) || defined(_WIN64)
  return _getch();
#endif
}

int kbhit(void)
{
#ifdef __linux__
  struct termios oldt, newt;
  int ch;
  int oldf;

  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

  ch = getchar();

  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);

  if (ch != EOF)
  {
    ungetc(ch, stdin);
    return 1;
  }

  return 0;
#elif defined(_WIN32) || defined(_WIN64)
  return _kbhit();
#endif
}

int main()
{
  // Initialize PortHandler instance
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);

  // Initialize PacketHandler instance
  // Set the protocol version
  // Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(PROTOCOL_VERSION);

  int dxl_comm_result = COMM_TX_FAIL;             // Communication result

  std::vector<uint8_t> vec;                       // Dynamixel data storages

  // Open port
  if (portHandler->openPort())
  {
    printf("Succeeded to open the port!\n");
  }
  else
  {
    printf("Failed to open the port!\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Set port baudrate
  if (portHandler->setBaudRate(BAUDRATE))
  {
    printf("Succeeded to change the baudrate!\n");
  }
  else
  {
    printf("Failed to change the baudrate!\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Try to broadcast ping the Dynamixel
  dxl_comm_result = packetHandler->broadcastPing(portHandler, vec);
  if (dxl_comm_result != COMM_SUCCESS) packetHandler->printTxRxResult(dxl_comm_result);

  printf("Detected Dynamixel : \n");
  for (int i = 0; i < (int)vec.size(); i++)
  {
    printf("[ID:%03d]\n", vec.at(i));
  }

  // Close port
  portHandler->closePort();

  return 0;
}
```

#### Details

``` cpp
#ifdef __linux__
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif
```

This source includes above to get key input interruption while the example is running. Actual functions for getting the input is described in a little below.

``` cpp
#include <stdio.h>
```

> The example shows Dynamixel status in sequence by the function `printf()`. So here `stdio.h` is needed.

``` cpp
#include "dynamixel_sdk.h"                                   // Uses Dynamixel SDK library
```

> All libraries of Dynamixel SDK are linked with the header file `dynamixel_sdk.h`.

``` cpp
// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel
```

> Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cpp
// Default setting
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"
```

> Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](https://github.com/ROBOTIS-Leon/test2/wiki/2.-Hardware-Settings), customize Dynamixel control table items, such as Dynamixel ID, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

``` cpp
int getch()
{
#ifdef __linux__
  struct termios oldt, newt;
  int ch;
  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  ch = getchar();
  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  return ch;
#elif defined(_WIN32) || defined(_WIN64)
  return _getch();
#endif
}

int kbhit(void)
{
#ifdef __linux__
  struct termios oldt, newt;
  int ch;
  int oldf;

  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

  ch = getchar();

  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);

  if (ch != EOF)
  {
    ungetc(ch, stdin);
    return 1;
  }

  return 0;
#elif defined(_WIN32) || defined(_WIN64)
  return _kbhit();
#endif
}
```

These functions accept the key inputs in terms of example action. The example codes mainly apply the function `getch()` rather than the function `kbhit()` to get information which key has been pressed.

``` cpp
int main()
{
  // Initialize PortHandler instance
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);

  // Initialize PacketHandler instance
  // Set the protocol version
  // Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
  dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(PROTOCOL_VERSION);

  int dxl_comm_result = COMM_TX_FAIL;             // Communication result

  std::vector<uint8_t> vec;                       // Dynamixel data storages

  // Open port
  if (portHandler->openPort())
  {
    printf("Succeeded to open the port!\n");
  }
  else
  {
    printf("Failed to open the port!\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Set port baudrate
  if (portHandler->setBaudRate(BAUDRATE))
  {
    printf("Succeeded to change the baudrate!\n");
  }
  else
  {
    printf("Failed to change the baudrate!\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Try to broadcast ping the Dynamixel
  dxl_comm_result = packetHandler->broadcastPing(portHandler, vec);
  if (dxl_comm_result != COMM_SUCCESS) packetHandler->printTxRxResult(dxl_comm_result);

  printf("Detected Dynamixel : \n");
  for (int i = 0; i < (int)vec.size(); i++)
  {
    printf("[ID:%03d]\n", vec.at(i));
  }

  // Close port
  portHandler->closePort();

  return 0;
}
```

In `main()` function, the codes call actual functions for Dynamixel control.


``` cpp
// Initialize PortHandler instance
// Set the port path
// Get methods and members of PortHandlerLinux or PortHandlerWindows
dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);
```

`getPortHandler()` function sets port path as `DEVICENAME`, and prepare an appropriate `dynamixel::PortHandler` in controller OS automatically.

``` cpp
// Initialize PacketHandler instance
// Set the protocol version
// Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
dynamixel::PacketHandler *packetHandler = dynamixel::PacketHandler::getPacketHandler(PROTOCOL_VERSION);
```

`getPacketHandler()` function sets the methods for packet construction by choosing the `PROTOCOL_VERSION`.

``` cpp
int dxl_comm_result = COMM_TX_FAIL;             // Communication result

std::vector<uint8_t> vec;                       // Dynamixel data storages
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`vec` keeps Dynamixel information in vector format.

``` cpp
// Open port
if (portHandler->openPort())
{
  printf("Succeeded to open the port!\n");
}
else
{
  printf("Failed to open the port!\n");
  printf("Press any key to terminate...\n");
  getch();
  return 0;
}
```

First, controller opens the port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` cpp
// Set port baudrate
if (portHandler->setBaudRate(BAUDRATE))
{
  printf("Succeeded to change the baudrate!\n");
}
else
{
  printf("Failed to change the baudrate!\n");
  printf("Press any key to terminate...\n");
  getch();
  return 0;
}
```

Secondly, the controller sets the communication `BAUDRATE` at the port opened previously.

``` cpp
// Try to broadcast ping the Dynamixel
dxl_comm_result = packetHandler->broadcastPing(portHandler, vec);
if (dxl_comm_result != COMM_SUCCESS)
  packetHandler->printTxRxResult(dxl_comm_result);
```

`dynamixel::PacketHandler::broadcastPing()` function shows the connection between controller and each Dynamixels from ID 1 to ID 253 through the port which the `portHandler` handles. The function returns 0 if no communication error has been occurred.

``` cpp
// Close port
portHandler->closePort();

return 0;
```

Finally, port becomes disposed.
