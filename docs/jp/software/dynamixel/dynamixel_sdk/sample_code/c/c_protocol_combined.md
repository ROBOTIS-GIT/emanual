---
layout: archive
lang: en
ref: c_protocol_combined
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/c_protocol_combined/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 2"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
<![end dummy Header 1]-->

## [C Protocol Combined](#c-protocol-combined)

- Description

  This example, basically, writes the goal position of Dynamixel and repeats to read its present position, until it stops moving. Read and write function can be used even to handle other multiple items in nearby addresses on the control table lists, such as goal position and velocity.

- Available Dynamixel model

  All models using protocol 1.0 and 2.0


### Sample code


```c
/*
 * protocol_combined.c
 *
 *  Created on: 2016. 5. 16.
 *      Author: Leon Ryu Woon Jung
 */

//
// *********     Protocol Combined Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0 and 2.0
// This example is tested with a Dynamixel MX-28, a Dynamixel PRO 54-200 and an USB2DYNAMIXEL
// Be sure that properties of Dynamixel MX and PRO are already set as %% MX - ID : 1 / Baudnum : 1 (Baudrate : 1000000) , PRO - ID : 1 / Baudnum : 3 (Baudrate : 1000000)
//

// Be aware that:
// This example configures two different control tables (especially, if it uses Dynamixel and Dynamixel PRO). It may modify critical Dynamixel parameter on the control table, if DYNAMIXEL have wrong ID.
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
#include "dynamixel_sdk.h"                                   // Uses DYNAMIXEL SDK library

// Control table address for Dynamixel MX
#define ADDR_MX_TORQUE_ENABLE           24                  // Control table address is different in Dynamixel model
#define ADDR_MX_GOAL_POSITION           30
#define ADDR_MX_PRESENT_POSITION        36

// Control table address for Dynamixel PRO
#define ADDR_PRO_TORQUE_ENABLE          562
#define ADDR_PRO_GOAL_POSITION          596
#define ADDR_PRO_PRESENT_POSITION       611

// Protocol version
#define PROTOCOL_VERSION1               1.0                 // See which protocol version is used in the Dynamixel
#define PROTOCOL_VERSION2               2.0

// Default setting
#define DXL1_ID                         1                   // Dynamixel#1 ID: 1
#define DXL2_ID                         2                   // Dynamixel#2 ID: 2
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define DXL1_MINIMUM_POSITION_VALUE     100                 // Dynamixel will rotate between this value
#define DXL1_MAXIMUM_POSITION_VALUE     4000                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
#define DXL2_MINIMUM_POSITION_VALUE     -150000
#define DXL2_MAXIMUM_POSITION_VALUE     150000
#define DXL1_MOVING_STATUS_THRESHOLD    10                  // Dynamixel MX moving status threshold
#define DXL2_MOVING_STATUS_THRESHOLD    20                  // Dynamixel PRO moving status threshold

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

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result
  int dxl1_goal_position[2] = {DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel MX
  int dxl2_goal_position[2] = {DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel PRO

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint16_t dxl1_present_position = 0;             // Present position of Dynamixel MX
  int32_t dxl2_present_position = 0;              // Present position of Dynamixel PRO

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

  // Enable Dynamixel#1 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL2_ID);
  }

  while(1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Write Dynamixel#1 goal position
    write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION1, dxl_error);
    }

    // Write Dynamixel#2 goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, dxl2_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION2, dxl_error);
    }

    do
    {
      // Read Dynamixel#1 present position
    	dxl1_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }

      // Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION2, dxl_error);
      }

      printf("[ID:%03d] GoalPos:%03d  PresPos:%03d [ID:%03d] GoalPos:%03d  PresPos:%03d\n", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

    }while((abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }

  // Close port
  closePort(port_num);

  return 0;
}
```



### Details

```c
#ifdef __linux__
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif
```

This source includes above to get key input interruption while the example is running. Actual functions for getting the input is described in a little below.

```c
#include <stdlib.h>
```

The function `abs()` is in the example code, and it needs `stdlib.h` to be included.

```c
#include <stdio.h>
```

The example shows Dynamixel status in sequence by the function `printf()`. So here `stdio.h` is needed.

```c
#include "dynamixel_sdk.h"                                   // Uses DYNAMIXEL SDK library
```

All libraries of DYNAMIXEL SDK are linked with the header file `dynamixel_sdk.h`.

```c
// Control table address for Dynamixel MX
#define ADDR_MX_TORQUE_ENABLE           24                  // Control table address is different in Dynamixel model
#define ADDR_MX_GOAL_POSITION           30
#define ADDR_MX_PRESENT_POSITION        36

// Control table address for Dynamixel PRO
#define ADDR_PRO_TORQUE_ENABLE          562
#define ADDR_PRO_GOAL_POSITION          596
#define ADDR_PRO_PRESENT_POSITION       611
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

```c
// Protocol version
#define PROTOCOL_VERSION1               1.0                 // See which protocol version is used in the Dynamixel
#define PROTOCOL_VERSION2               2.0
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

```c
// Default setting
#define DXL1_ID                         1                   // Dynamixel#1 ID: 1
#define DXL2_ID                         2                   // Dynamixel#2 ID: 2
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define DXL1_MINIMUM_POSITION_VALUE     100                 // Dynamixel will rotate between this value
#define DXL1_MAXIMUM_POSITION_VALUE     4000                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
#define DXL2_MINIMUM_POSITION_VALUE     -150000
#define DXL2_MAXIMUM_POSITION_VALUE     150000
#define DXL1_MOVING_STATUS_THRESHOLD    10                  // Dynamixel MX moving status threshold
#define DXL2_MOVING_STATUS_THRESHOLD    20                  // Dynamixel PRO moving status threshold

#define ESC_ASCII_VALUE                 0x1b
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

```c
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

```c
int main()
{
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);

  // Initialize PacketHandler Structs
  packetHandler();

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result
  int dxl1_goal_position[2] = {DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel MX
  int dxl2_goal_position[2] = {DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel PRO

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint16_t dxl1_present_position = 0;             // Present position of Dynamixel MX
  int32_t dxl2_present_position = 0;              // Present position of Dynamixel PRO

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

  // Enable Dynamixel#1 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL2_ID);
  }

  while(1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Write Dynamixel#1 goal position
    write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION1, dxl_error);
    }

    // Write Dynamixel#2 goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, dxl2_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION2, dxl_error);
    }

    do
    {
      // Read Dynamixel#1 present position
    	dxl1_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }

      // Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION2, dxl_error);
      }

      printf("[ID:%03d] GoalPos:%03d  PresPos:%03d [ID:%03d] GoalPos:%03d  PresPos:%03d\n", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

    }while((abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }

  // Close port
  closePort(port_num);

  return 0;
}
```

In `main()` function, the codes call actual functions for Dynamixel control.



```c
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

```c
  // Initialize PacketHandler Structs
  packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

```c
  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result
  int dxl1_goal_position[2] = {DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel MX
  int dxl2_goal_position[2] = {DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE};         // Goal position of Dynamixel PRO

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint16_t dxl1_present_position = 0;             // Present position of Dynamixel MX
  int32_t dxl2_present_position = 0;              // Present position of Dynamixel PRO
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl1_goal_position` and `dxl2_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` views where now it points out.

```c
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
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

```c
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
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.


```c
  // Enable Dynamixel#1 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL1_ID);
  }

  // Enable Dynamixel#2 torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }
  else
  {
    printf("Dynamixel#%d has been successfully connected \n", DXL2_ID);
  }
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.
```c
  while(1)
  {
    printf("Press any key to continue! (or press ESC to quit!)\n");
    if (getch() == ESC_ASCII_VALUE)
      break;

    // Write Dynamixel#1 goal position
    write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION1, dxl_error);
    }

    // Write Dynamixel#2 goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, dxl2_goal_position[index]);
    if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
    {
      printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
    }
    else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
    {
      printRxPacketError(PROTOCOL_VERSION2, dxl_error);
    }

    do
    {
      // Read Dynamixel#1 present position
    	dxl1_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }

      // Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        printRxPacketError(PROTOCOL_VERSION2, dxl_error);
      }

      printf("[ID:%03d] GoalPos:%03d  PresPos:%03d [ID:%03d] GoalPos:%03d  PresPos:%03d\n", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

    }while((abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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

During `while()` loop, the controller writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`write2ByteTxRx()` function orders to the #`DXL1_ID` Dynamixel in `PROTOCOL_VERSION1` communication protocol through #`port_num` port, writing 2 byte of `dxl1_goal_position[index]` value to `ADDR_MX_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`write4ByteTxRx()` function orders to the #`DXL2_ID` Dynamixel in `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 4 byte of `dxl2_goal_position[index]` value to `ADDR_PRO_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read2ByteTxRx()` function orders to the #`DXL1_ID` Dynamixel in `PROTOCOL_VERSION1` communication protocol through #`port_num` port, requesting 2 bytes of value in `ADDR_MX_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read4ByteTxRx()` function orders to the #`DXL2_ID` Dynamixel in `PROTOCOL_VERSION2` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRO_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading its present position will be ended when absolute value of `(dxl1_goal_position[index] - dxl1_present_position)` or `(dxl2_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes its direction to the counter-wise and waits for extra key input.

```c
  // Disable Dynamixel#1 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }
```

The controller frees the DYNAMIXEL to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

```c
  // Close port
  closePort(port_num);

  return 0;
```

Finally, port becomes disposed.
