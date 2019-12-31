---
layout: archive
lang: en
ref: cpp_clear_multi_turn_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/cpp_clear_multi_turn_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 6"></div>
<div style="counter-reset: h3 9"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="cpp-protocol-20"><a href="#cpp-protocol-20">CPP Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [CPP Clear Multi Turn Protocol 2.0](#cpp-lear-multi-turn-protocol-20)

- Description

  This example is that when Dynamixel operate `Extended Position Control Mode(Multi-turn)`, clear present position from 0 to 4028. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` cpp
/*
* clear_multi_turn.cpp
*
*  Created on: 2018. 11. 23.
*      Author: Gilbert Ki Jong Gil
*/

//
// *********     Clear Multi-Turn Example      *********
//
//
// Available Dynamixel model on this example : MX with Protocol 2.0 (firmware v42 or above), Dynamixel X-series (firmware v42 or above)
// This example is designed for using a Dynamixel XM430-W350-R, and an U2D2.
// To use another Dynamixel model, such as MX series, see their details in E-Manual(emanual.robotis.com) and edit below "#define"d variables yourself.
// Be sure that Dynamixel properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
//

#if defined(__linux__) || defined(__APPLE__)
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#define STDIN_FILENO 0
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif

#include <stdlib.h>
#include <stdio.h>

#include "dynamixel_sdk.h"                                  // Uses DYNAMIXEL SDK library

// Control table address
#define ADDR_OPERATING_MODE             11                  // Control table address is different in Dynamixel model
#define ADDR_TORQUE_ENABLE              64
#define ADDR_GOAL_POSITION              116
#define ADDR_PRESENT_POSITION           132

// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel

// Default setting
#define DXL_ID                          1                   // Dynamixel ID: 1
#define BAUDRATE                        57600
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define MAX_POSITION_VALUE              1048575
#define DXL_MOVING_STATUS_THRESHOLD     20                  // Dynamixel moving status threshold
#define EXT_POSITION_CONTROL_MODE       4                   // Value for extended position control mode (operating mode)

#define ESC_ASCII_VALUE                 0x1b
#define SPACE_ASCII_VALUE               0x20

int getch()
{
#if defined(__linux__) || defined(__APPLE__)
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
#if defined(__linux__) || defined(__APPLE__)
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

void msecSleep(int waitTime)
{
#if defined(__linux__) || defined(__APPLE__)
  usleep(waitTime * 1000);
#elif defined(_WIN32) || defined(_WIN64)
  _sleep(waitTime);
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

  uint8_t dxl_error = 0;                          // Dynamixel error
  int32_t dxl_present_position = 0;               // Present position

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

  // Set operating mode to extended position control mode
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Operating mode changed to extended position control mode. \n");
  }


  // Enable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Dynamixel has been successfully connected \n");
  }

  while(1)
  {
    printf("\nPress any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    printf("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)\n");

    // Write goal position
    dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE, &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS)
    {
      printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
    }
    else if (dxl_error != 0)
    {
      printf("%s\n", packetHandler->getRxPacketError(dxl_error));
    }

    do
    {
      // Read present position
      dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS)
      {
        printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
      }
      else if (dxl_error != 0)
      {
        printf("%s\n", packetHandler->getRxPacketError(dxl_error));
      }

      printf("  [ID:%03d] GoalPos:%03d  PresPos:%03d\r", DXL_ID, MAX_POSITION_VALUE, dxl_present_position);

      if (kbhit())
      {
        char c = getch();
        if (c == SPACE_ASCII_VALUE)
        {
          printf("\n  Stop & Clear Multi-Turn Information! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          msecSleep(300);

          // Clear Multi-Turn Information
          dxl_comm_result = packetHandler->clearMultiTurn(portHandler, DXL_ID, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          // Read present position
          dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          printf("  Present Position has been reset. : %03d \n", dxl_present_position);

          break;
        }
        else if (c == ESC_ASCII_VALUE)
        {
          printf("\n  Stopped!! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          break;
        }
      }

    }while((abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));

    printf("\n");
  }

  // Disable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }

  // Close port
  portHandler->closePort();

  return 0;
}
```

#### Details

``` cpp
#if defined(__linux__) || defined(__APPLE__)
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#define STDIN_FILENO 0
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif
```

This source includes above to get key input interruption while the example is running. Actual functions for getting the input is described in a little below.

``` cpp
#include <stdio.h>
```

The example shows Dynamixel status in sequence by the function `printf()`. So here `stdio.h` is needed.

``` cpp
#include "dynamixel_sdk.h"                                   // Uses DYNAMIXEL SDK library
```

All libraries of DYNAMIXEL SDK are linked with the header file `dynamixel_sdk.h`.

``` cpp
// Control table address
#define ADDR_OPERATING_MODE             11                  // Control table address is different in Dynamixel model
#define ADDR_TORQUE_ENABLE              64
#define ADDR_GOAL_POSITION              116
#define ADDR_PRESENT_POSITION           132
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` cpp
// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cpp
// Default setting
#define DXL_ID                          1                   // Dynamixel ID: 1
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define MAX_POSITION_VALUE              1048575
#define DXL_MOVING_STATUS_THRESHOLD     20                  // Dynamixel moving status threshold
#define EXT_POSITION_CONTROL_MODE       4                   // Value for extended position control mode (operating mode)

#define ESC_ASCII_VALUE                 0x1b
#define SPACE_ASCII_VALUE               0x20e
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped. `EXT_POSITION_CONTROL_MODE` acts as a position control Mode.

``` cpp
int getch()
{
#if defined(__linux__) || defined(__APPLE__)
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
#if defined(__linux__) || defined(__APPLE__)
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

These functions accept the key inputs in terms of example action and time sleep. The example codes mainly apply the function `getch()` rather than the function `kbhit()` to get information which key has been pressed.


``` cpp
void msecSleep(int waitTime)
{
#if defined(__linux__) || defined(__APPLE__)
    usleep(waitTime * 1000);
#elif defined(_WIN32) || defined(_WIN64)
    _sleep(waitTime);
#endif
}
```

`msecSleep()` function halt the computational process in which this function is used.

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

  uint8_t dxl_error = 0;                          // Dynamixel error
  int32_t dxl_present_position = 0;               // Present position

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

  // Set operating mode to extended position control mode
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Operating mode changed to extended position control mode. \n");
  }


  // Enable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Dynamixel has been successfully connected \n");
  }

  while(1)
  {
    printf("\nPress any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    printf("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)\n");

    // Write goal position
    dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE, &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS)
    {
      printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
    }
    else if (dxl_error != 0)
    {
      printf("%s\n", packetHandler->getRxPacketError(dxl_error));
    }

    do
    {
      // Read present position
      dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS)
      {
        printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
      }
      else if (dxl_error != 0)
      {
        printf("%s\n", packetHandler->getRxPacketError(dxl_error));
      }

      printf("  [ID:%03d] GoalPos:%03d  PresPos:%03d\r", DXL_ID, MAX_POSITION_VALUE, dxl_present_position);

      if (kbhit())
      {
        char c = getch();
        if (c == SPACE_ASCII_VALUE)
        {
          printf("\n  Stop & Clear Multi-Turn Information! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          msecSleep(300);

          // Clear Multi-Turn Information
          dxl_comm_result = packetHandler->clearMultiTurn(portHandler, DXL_ID, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          // Read present position
          dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          printf("  Present Position has been reset. : %03d \n", dxl_present_position);

          break;
        }
        else if (c == ESC_ASCII_VALUE)
        {
          printf("\n  Stopped!! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          break;
        }
      }

    }while((abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));

    printf("\n");
  }

  // Disable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
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

  uint8_t dxl_error = 0;                          // Dynamixel error
  int32_t dxl_present_position = 0;               // Present position
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_present_position` views where now it points out.

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

First, controller opens the port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated

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
  // Set operating mode to extended position control mode
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Operating mode changed to extended position control mode. \n");
  }

```

The controller sets the operating mode as Extended Position Control Mode(Multi-turn).

``` cpp
  // Enable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    printf("%s\n", packetHandler->getRxPacketError(dxl_error));
  }
  else
  {
    printf("Dynamixel has been successfully connected \n");
  }
```

As mentioned in the document, above code enables Dynamixel torque to set its status as being ready to move.

`dynamixel::PacketHandler::write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel through the port which the `portHandler` handles, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_TORQUE_ENABLE` address. Then, it receives the `dxl_error`. The function returns 0 if no communication error has been occurred.

``` cpp
while(1)
  {
    printf("\nPress any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    printf("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)\n");

    // Write goal position
    dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE, &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS)
    {
      printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
    }
    else if (dxl_error != 0)
    {
      printf("%s\n", packetHandler->getRxPacketError(dxl_error));
    }

    do
    {
      // Read present position
      dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS)
      {
        printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
      }
      else if (dxl_error != 0)
      {
        printf("%s\n", packetHandler->getRxPacketError(dxl_error));
      }

      printf("  [ID:%03d] GoalPos:%03d  PresPos:%03d\r", DXL_ID, MAX_POSITION_VALUE, dxl_present_position);

      if (kbhit())
      {
        char c = getch();
        if (c == SPACE_ASCII_VALUE)
        {
          printf("\n  Stop & Clear Multi-Turn Information! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          msecSleep(300);

          // Clear Multi-Turn Information
          dxl_comm_result = packetHandler->clearMultiTurn(portHandler, DXL_ID, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          // Read present position
          dxl_comm_result = packetHandler->read4ByteTxRx(portHandler, DXL_ID, ADDR_PRESENT_POSITION, (uint32_t*)&dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          printf("  Present Position has been reset. : %03d \n", dxl_present_position);

          break;
        }
        else if (c == ESC_ASCII_VALUE)
        {
          printf("\n  Stopped!! \n");

          // Write the present position to the goal position to stop moving
          dxl_comm_result = packetHandler->write4ByteTxRx(portHandler, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position, &dxl_error);
          if (dxl_comm_result != COMM_SUCCESS)
          {
            printf("%s\n", packetHandler->getTxRxResult(dxl_comm_result));
          }
          else if (dxl_error != 0)
          {
            printf("%s\n", packetHandler->getRxPacketError(dxl_error));
          }

          break;
        }
      }

    }while((abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));

    printf("\n");
  }
```

During `while()` loop, the controller wait to any key input for start `while()` and writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`dynamixel::PacketHandler::write4ByteTxRx()` function orders to the #`DXL_ID` Dynamixel through the port which the `portHandler` handles, writing 4 bytes of `MAX_POSITION_VALUE` value to `ADDR_GOAL_POSITION` address. Then, it receives the `dxl_error`. The function returns 0 if no communication error has been occurred.

`dynamixel::PacketHandler::read4ByteTxRx()` functions orders to the #`DXL_ID` Dynamixel through the port which the `portHandler` handles, requesting 4 bytes of value of `ADDR_PRESENT_POSITION` address. Then, it receives `dxl_present_position` and `dxl_error`. The function returns 0 if no communication error has been occurred.

When the space key input, `dynamixel::PacketHandler::write4ByteTxRx()` function orders to the #`DXL_ID` Dynamixel through the port which the `portHandler` handles. writing 4 bytes of `dxl_present_position` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error. And then `dynamixel::PacketHandler::clearMultiTurn()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port.

Reading its present position will be ended when absolute value of `(MAX_POSITION_VALUE - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.  

``` cpp
  // Disable Dynamixel Torque
  dxl_comm_result = packetHandler->write1ByteTxRx(portHandler, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    packetHandler->printTxRxResult(dxl_comm_result);
  }
  else if (dxl_error != 0)
  {
    packetHandler->printRxPacketError(dxl_error);
  }
```

The controller frees the Dynamixel to be idle.

`dynamixel::PacketHandler::write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel through the port which the `portHandler` handles, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. Then, it receives the `dxl_error`. The function returns 0 if no communication error has been occurred.

``` cpp
  // Close port
  portHandler->closePort();

  return 0;
```

Finally, port becomes disposed.