---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_c_bulk_read_write_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/c_bulk_read_write_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 9"></div>
<div style="counter-reset: h1 3"></div>

## [C Bulk Read Write Protocol 2.0](#c-bulk-read-write-protocol-20)

- Description

  This example writes either of goal position or LED value of two Dynamixels and simulateously reads them until Dynamixel stops moving. The functions that are related with the Bulkwrite and the Bulkread function handle the number of items which are not near each other in the Dynamixel control table on multiple Dynamixels.

- Available Dynamixel

  All series using protocol 2.0

- Code


``` cpp
/*
* bulk_read_write.c
*
*  Created on: 2016. 5. 16.
*      Author: Leon Ryu Woon Jung
*/

//
// *********     Bulk Read and Bulk Write Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using two Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below "#define"d variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 and 2 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

#ifdef __linux__
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif

#include <stdlib.h>
#include <stdio.h>
#include "dynamixel_sdk.h"                                   // Uses Dynamixel SDK library

// Control table address
#define ADDR_PRO_TORQUE_ENABLE          562                 // Control table address is different in Dynamixel model
#define ADDR_PRO_LED_RED                563
#define ADDR_PRO_GOAL_POSITION          596
#define ADDR_PRO_PRESENT_POSITION       611

// Data Byte Length
#define LEN_PRO_LED_RED                 1
#define LEN_PRO_GOAL_POSITION           4
#define LEN_PRO_PRESENT_POSITION        4

// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel

// Default setting
#define DXL1_ID                         1                   // Dynamixel#1 ID: 1
#define DXL2_ID                         2                   // Dynamixel#2 ID: 2
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define DXL_MINIMUM_POSITION_VALUE      -150000             // Dynamixel will rotate between this value
#define DXL_MAXIMUM_POSITION_VALUE      150000              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
#define DXL_MOVING_STATUS_THRESHOLD     20                  // Dynamixel moving status threshold

#define ESC_ASCII_VALUE                 0x1b

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
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);

  // Initialize PacketHandler Structs
  packetHandler();

  // Initialize groupBulkWrite Struct
  int groupwrite_num = groupBulkWrite(port_num, PROTOCOL_VERSION);
  //groupBulkWrite groupBulkWrite(portHandler, packetHandler);

  // Initialize Groupbulkread Struct
  int groupread_num = groupBulkRead(port_num, PROTOCOL_VERSION);

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result
  uint8_t dxl_addparam_result = False;               // AddParam result
  uint8_t dxl_getdata_result = False;                // GetParam result
  int dxl_goal_position[2] = { DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_led_value[2] = { 0x00, 0xFF };      // Dynamixel LED value for write
  int32_t dxl1_present_position = 0;              // Present position
  uint8_t dxl2_led_value_read;                    // Dynamixel LED value for read

  // Open port
  if (openPort(port_num))
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
  if (setBaudRate(port_num, BAUDRATE))
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

  // Enable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL2_ID);
  }

  // Add parameter storage for Dynamixel#1 present position
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL1_ID);
    return 0;
  }

  // Add parameter storage for Dynamixel#2 LED value
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL2_ID);
    return 0;
  }

  while (1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Add parameter storage for Dynamixel#1 goal position
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL1_ID, ADDR_PRO_GOAL_POSITION, LEN_PRO_GOAL_POSITION, dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL1_ID);
      return 0;
    }

    // Add parameter storage for Dynamixel#2 LED value
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED, dxl_led_value[index], LEN_PRO_LED_RED);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL2_ID);
      return 0;
    }

    // Bulkwrite goal position and LED value
    groupBulkWriteTxPacket(groupwrite_num);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    // Clear bulkwrite parameter storage
    groupBulkWriteClearParam(groupwrite_num);

    do
    {
      // Bulkread present position and LED status
      groupBulkReadTxRxPacket(groupread_num);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      // Check if groupbulkread data of Dynamixel#1 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL1_ID);
        return 0;
      }

      // Check if groupbulkread data of Dynamixel#2 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL2_ID);
        return 0;
      }

      // Get present position value
      dxl1_present_position = groupBulkReadGetData(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);

      // Get LED value
      dxl2_led_value_read = groupBulkReadGetData(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);

      printf("[ID:%03d] Present Position : %d \t [ID:%03d] LED Value: %d\n", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_led_value_read);

    } while (abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

    // Change goal position
    if (index == 0)
    {
      index = 1;
    }
    else
    {
      index = 0;
    }
  }

  // Disable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Close port
  closePort(port_num);

  return 0;
}
```

-------------------------------------------------------------------------------------

- Details

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
#include <stdlib.h>
```

The function `abs()` is in the example code, and it needs `stdlib.h` to be included.

``` cpp
#include <stdio.h>
```

The example shows Dynamixel status in sequence by the function `printf()`. So here `stdio.h` is needed.

``` cpp
#include "dynamixel_sdk.h"                                   // Uses Dynamixel SDK library
```

All libraries of Dynamixel SDK are linked with the header file `dynamixel_sdk.h`.

``` cpp
// Control table address
#define ADDR_PRO_TORQUE_ENABLE           562                  // Control table address is different in Dynamixel model
#define ADDR_PRO_LED_RED                 563
#define ADDR_PRO_GOAL_POSITION           596
#define ADDR_PRO_PRESENT_POSITION        611

// Data Byte Length
#define LEN_PRO_LED_RED                  1
#define LEN_PRO_GOAL_POSITION            2
#define LEN_PRO_PRESENT_POSITION         2
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` cpp
// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cpp
// Default setting
#define DXL1_ID                         1                   // Dynamixel#1 ID: 1
#define DXL2_ID                         2                   // Dynamixel#2 ID: 2
#define BAUDRATE                        1000000
#define DEVICENAME1                     "/dev/ttyUSB0"      // Check which port is being used on your controller

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define DXL_MINIMUM_POSITION_VALUE      -150000             // Dynamixel will rotate between this value
#define DXL_MAXIMUM_POSITION_VALUE      150000              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
#define DXL_MINIMUM_LED_VALUE           0                   // Dynamixel LED will light between this value
#define DXL_MAXIMUM_LED_VALUE           255                 // and this value
#define DXL_MOVING_STATUS_THRESHOLD     20                  // Dynamixel moving status threshold

#define ESC_ASCII_VALUE                 0x1b
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two Dynamixels `DXL1_ID`, `DXL2_ID` connected with the port `DEVICENAME`.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

Dynamixel LED has its own range of value: 1 byte red LED for Dynamixel MX-28 and 1byte each on red, green, blue LED for Dynamixel PRO 54-200.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

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
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);

  // Initialize PacketHandler Structs
  packetHandler();

  // Initialize groupBulkWrite Struct
  int groupwrite_num = groupBulkWrite(port_num, PROTOCOL_VERSION);
  //groupBulkWrite groupBulkWrite(portHandler, packetHandler);

  // Initialize Groupbulkread Struct
  int groupread_num = groupBulkRead(port_num, PROTOCOL_VERSION);

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result
  uint8_t dxl_addparam_result = False;               // AddParam result
  uint8_t dxl_getdata_result = False;                // GetParam result
  int dxl_goal_position[2] = { DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_led_value[2] = { 0x00, 0xFF };      // Dynamixel LED value for write
  int32_t dxl1_present_position = 0;              // Present position
  uint8_t dxl2_led_value_read;                    // Dynamixel LED value for read

  // Open port
  if (openPort(port_num))
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
  if (setBaudRate(port_num, BAUDRATE))
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

  // Enable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL2_ID);
  }

  // Add parameter storage for Dynamixel#1 present position
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL1_ID);
    return 0;
  }

  // Add parameter storage for Dynamixel#2 LED value
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL2_ID);
    return 0;
  }

  while (1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Add parameter storage for Dynamixel#1 goal position
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL1_ID, ADDR_PRO_GOAL_POSITION, LEN_PRO_GOAL_POSITION, dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL1_ID);
      return 0;
    }

    // Add parameter storage for Dynamixel#2 LED value
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED, dxl_led_value[index], LEN_PRO_LED_RED);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL2_ID);
      return 0;
    }

    // Bulkwrite goal position and LED value
    groupBulkWriteTxPacket(groupwrite_num);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    // Clear bulkwrite parameter storage
    groupBulkWriteClearParam(groupwrite_num);

    do
    {
      // Bulkread present position and LED status
      groupBulkReadTxRxPacket(groupread_num);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      // Check if groupbulkread data of Dynamixel#1 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL1_ID);
        return 0;
      }

      // Check if groupbulkread data of Dynamixel#2 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL2_ID);
        return 0;
      }

      // Get present position value
      dxl1_present_position = groupBulkReadGetData(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);

      // Get LED value
      dxl2_led_value_read = groupBulkReadGetData(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);

      printf("[ID:%03d] Present Position : %d \t [ID:%03d] LED Value: %d\n", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_led_value_read);

    } while (abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

    // Change goal position
    if (index == 0)
    {
      index = 1;
    }
    else
    {
      index = 0;
    }
  }

  // Disable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Close port
  closePort(port_num);

  return 0;
}
```

In `main()` function, the codes call actual functions for Dynamixel control.

--------------------------------------------------------------------------------

``` cpp
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

``` cpp
  // Initialize PacketHandler Structs
  packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` cpp
  // Initialize groupBulkWrite Struct
  int groupwrite_num = groupBulkWrite(port_num, PROTOCOL_VERSION);
```

`groupBulkWrite()` function  initializes grouped parameters used for packet construction and packet storing. The utility functions of bulk read deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`.

``` cpp
  // Initialize Groupbulkread Structs
  int groupread_num = groupBulkRead(port_num, PROTOCOL_VERSION);
```

`groupBulkRead()` function initializes grouped parameters used for packet construction and packet storing. The utility functions of bulk read deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`.


``` cpp
  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;              // Communication result
  bool dxl_addparam_result = false;                // AddParam result
  bool dxl_getdata_result = false;                 // GetParam result
  int dxl_goal_position[2] = {DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE};         // Goal position

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_led_value[2] = {DXL_MINIMUM_LED_VALUE, DXL_MAXIMUM_LED_VALUE};        // Dynamixel LED value for write             
  uint16_t dxl1_present_position = 0;             // Present position
  uint8_t dxl2_moving = 0;                        // Dynamixel moving status
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_addparam_result` indicates the result of parameter addition used for sync/bulk related functions  

`dxl_getdata_result` indicates the result of data reception used for sync/bulk related functions  

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl_led_value` stores LED values of Dynamixel.

`dxl1_present_position` views where now Dynamixel `DXL1_ID` points out.

`dxl2_moving` views whether the Dynamixel is stopped.


``` cpp
  // Open port
  if (openPort(port_num))
  {
      printf("Succeeded to open the port!\n");
  }
  else
  {
      printf("Failed to open the port!\n");
      printf("Press any key to terminate...\n");
      _getch();
      return 0;
  }
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` cpp
  // Set port baudrate
  if (setBaudRate(port_num, BAUDRATE))
  {
      printf("Succeeded to change the baudrate!\n");
  }
  else
  {
      printf("Failed to change the baudrate!\n");
      printf("Press any key to terminate...\n");
      _getch();
      return 0;
  }
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.

``` cpp
  // Enable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    printf("DXL#%d has been successfully connected \n", DXL2_ID);
  }
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cpp
  // Add parameter storage for Dynamixel#1 present position
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL1_ID);
    return 0;
  }

  // Add parameter storage for Dynamixel#2 LED value
  dxl_addparam_result = groupBulkReadAddParam(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
  if (dxl_addparam_result != True)
  {
    fprintf(stderr, "[ID:%03d] groupBulkRead addparam failed", DXL2_ID);
    return 0;
  }
```

`groupBulkReadAddParam()` function stores the Dynamixel ID and address `ADDR_PRO_PRESENT_POSITION` or `ADDR_PRO_LED_RED`, byte length `LEN_PRO_PRESENT_POSITION` or `LEN_PRO_LED_RED` of required data to the bulkread target Dynamixel list.

``` cpp
  while (1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Add parameter storage for Dynamixel#1 goal position
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL1_ID, ADDR_PRO_GOAL_POSITION, LEN_PRO_GOAL_POSITION, dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL1_ID);
      return 0;
    }

    // Add parameter storage for Dynamixel#2 LED value
    dxl_addparam_result = groupBulkWriteAddParam(groupwrite_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED, dxl_led_value[index], LEN_PRO_LED_RED);
    if (dxl_addparam_result != True)
    {
      fprintf(stderr, "[ID:%03d] groupBulkWrite addparam failed", DXL2_ID);
      return 0;
    }

    // Bulkwrite goal position and LED value
    groupBulkWriteTxPacket(groupwrite_num);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    // Clear bulkwrite parameter storage
    groupBulkWriteClearParam(groupwrite_num);

    do
    {
      // Bulkread present position and LED status
      groupBulkReadTxRxPacket(groupread_num);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      // Check if groupbulkread data of Dynamixel#1 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL1_ID);
        return 0;
      }

      // Check if groupbulkread data of Dynamixel#2 is available
      dxl_getdata_result = groupBulkReadIsAvailable(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);
      if (dxl_getdata_result != True)
      {
        fprintf(stderr, "[ID:%03d] groupBulkRead getdata failed", DXL2_ID);
        return 0;
      }

      // Get present position value
      dxl1_present_position = groupBulkReadGetData(groupread_num, DXL1_ID, ADDR_PRO_PRESENT_POSITION, LEN_PRO_PRESENT_POSITION);

      // Get LED value
      dxl2_led_value_read = groupBulkReadGetData(groupread_num, DXL2_ID, ADDR_PRO_LED_RED, LEN_PRO_LED_RED);

      printf("[ID:%03d] Present Position : %d \t [ID:%03d] LED Value: %d\n", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_led_value_read);

    } while (abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

    // Change goal position
    if (index == 0)
    {
      index = 1;
    }
    else
    {
      index = 0;
    }
  }
```

During `while()` loop, the controller writes and reads each Dynamixel position or moving status through packet transmission/reception(Tx/Rx).

To continue their rotation, press any key except ESC.

`groupBulkWriteAddParam()` function stores the Dynamixel ID and its goal position `dxl_goal_position` or red LED value `dxl_led_value` to the bulkwrite target Dynamixel list.

`groupBulkWriteTxPacket()` function orders to the Dynamixel #`DXL1_ID` and #`DXL2_ID` at the same time through the port, making it possible to write data bytes to different address. (In this example, `LEN_PRO_GOAL_POSITION` bytes of the values to the address `ADDR_PRO_GOAL_POSITION` and `LEN_PRO_LED_RED` bytes of the values to the address `ADDR_PRO_LED_RED`, each.) The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`groupBulkWriteClearParam()` function clears the Dynamixel list of groupbulkwrite.

`groupBulkReadTxRxPacket()` function orders to the Dynamixel #`DXL1_ID` and #`DXL2_ID` at the same time through the port, making it possible to require data bytes from different address. (In this example, `LEN_PRO_PRESENT_POSITION` bytes of the values to the address `ADDR_PRO_PRESENT_POSITION` and `LEN_PRO_LED_RED` bytes of the values to the address `ADDR_PRO_LED_RED`, each.) The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`groupBulkReadIsAvailable()` function checks if available data is in the groupbulkread data storage. The function returns false if no data is available in the storage.

`groupBulkReadGetData()` function pop the data received by `groupBulkReadTxRxPacket()` function out. In the example, it stores `LEN_PRO_PRESENT_POSITION` byte data got from `ADDR_PRO_PRESENT_POSITION` address of `DXL1_ID` Dynamixel and `LEN_PRO_LED_RED` byte data got from `ADDR_PRO_LED_RED` address of `DXL2_ID` Dynamixel, each.

`groupBulkReadClearParam()` function clears the Dynamixel list of groupbulkread.

Reading their present position will be ended when absolute value of `(dxl_goal_position[index] - dxl1_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` cpp
  // Disable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cpp
  // Close port
  closePort(port_num);

  return 0;
```

Finally, port becomes disposed.
