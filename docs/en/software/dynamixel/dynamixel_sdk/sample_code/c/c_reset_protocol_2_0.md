---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_c_reset_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/c_reset_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 8"></div>

# [Sample Code](#sample-code)

## [C Protocol 2.0](#c-protocol-20)

### [C Reset Protocol 2.0](#c-reset-protocol-20)

- Description

  This example resets settings of Dynamixel to default values. The Factoryreset function has three operation modes:

  * 0xFF : reset all values (ID to 1, baudrate to 57600)

  * 0x01 : reset all values except ID (baudrate to 57600)

  * 0x02 : reset all values except ID and baudrate.

- Available Dynamixel

  All series using protocol 2.0

- Simple code


``` cpp
/*
* factory_reset.c
*
*  Created on: 2016. 5. 16.
*      Author: Leon Ryu Woon Jung
*/

//
// *********     Factory Reset Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below "#define"d variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

// Be aware that:
// This example resets all properties of Dynamixel to default values, such as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
//

#ifdef __linux__
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#elif defined(_WIN32) || defined(_WIN64)
#include <conio.h>
#endif
#include <stdio.h>
#include "dynamixel_sdk.h"                                   // Uses Dynamixel SDK library

// Control table address
#define ADDR_PRO_BAUDRATE               8                   // Control table address is different in Dynamixel model

// Protocol version
#define PROTOCOL_VERSION                2.0                 // See which protocol version is used in the Dynamixel

// Default setting
#define DXL_ID                          1                   // Dynamixel ID: 1
#define BAUDRATE                        1000000
#define DEVICENAME                      "/dev/ttyUSB0"      // Check which port is being used on your controller
                                                            // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

#define FACTORYRST_DEFAULTBAUDRATE      57600               // Dynamixel baudrate set by factoryreset
#define NEW_BAUDNUM                     3                   // New baudnum to recover Dynamixel baudrate as it was
#define OPERATION_MODE                  0x01                // 0xFF : reset all values
                                                            // 0x01 : reset all values except ID
                                                            // 0x02 : reset all values except ID and baudrate

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

void msecSleep(int waitTime)
{
#ifdef __linux__
    usleep(waitTime * 1000);
#elif defined(_WIN32) || defined(_WIN64)
    Sleep(waitTime);
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

  int dxl_comm_result = COMM_TX_FAIL;             // Communication result

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_baudnum_read;                       // Read baudnum

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

  // Read present baudrate of the controller
  printf("Now the controller baudrate is : %d\n", getBaudRate(port_num));

  // Try factoryreset
  printf("[ID:%03d] Try factoryreset : ", DXL_ID);
  factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printf("Aborted\n");
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    return 0;
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Wait for reset
  printf("Wait for reset...\n");
  msecSleep(2000);

  printf("[ID:%03d] factoryReset Success!\n", DXL_ID);

  // Set controller baudrate to Dynamixel default baudrate
  if (setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  {
    printf("Succeed to change the controller baudrate to : %d\n", FACTORYRST_DEFAULTBAUDRATE);
  }
  else
  {
    printf("Failed to change the controller baudrate\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] DXL baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
  }

  // Write new baudnum
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE, NEW_BAUDNUM);
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
    printf("[ID:%03d] Set Dynamixel baudnum to : %d\n", DXL_ID, NEW_BAUDNUM);
  }

  // Set port baudrate to BAUDRATE
  if (setBaudRate(port_num, BAUDRATE))
  {
    printf("Succeed to change the controller baudrate to : %d\n", BAUDRATE);
  }
  else
  {
    printf("Failed to change the controller baudrate\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  msecSleep(200);

  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] Dynamixel Baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
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
#include <stdio.h>
```

The example shows Dynamixel status in sequence by the function `printf()`. So here `stdio.h` is needed.

``` cpp
#include "dynamixel_sdk.h"                                   // Uses Dynamixel SDK library
```

All libraries of Dynamixel SDK are linked with the header file `dynamixel_sdk.h`.

``` cpp
// Control table address
#define ADDR_PRO_BAUDRATE                8                   // Control table address is different in Dynamixel model
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

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

#define FACTORYRST_DEFAULTBAUDRATE      57600               // Dynamixel baudrate set by factoryreset
#define NEW_BAUDNUM                     1                   // New baudnum to recover Dynamixel baudrate as it was
#define OPERATION_MODE                  0x01                // 0xFF : reset all values
                                                            // 0x01 : reset all values except ID
                                                            // 0x02 : reset all values except ID and baudrate
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Since the factory reset recovers the Dynamixel control table items to the original state, the baudrate of controller serial port should be set to its changed baudrate(`FACTORYRST_DEFAULTBAUDRATE` : 57600 bps) as well. After that, controller sets its baudrate to the value (1000000 bps : `NEW_BAUDNUM` = 1) before factory reset.

In Protocol 2.0, factory reset recovers in three types, depending on reset mode (`OPERATION_MODE`):
0xFF : reset all values (Especially resets ID to 1, baudrate to 57600)
0x01 : reset all values except ID (Especially resets baudrate to 57600)
0x02 : reset all values except ID and baudrate

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
void msecSleep(int waitTime)
{
#ifdef __linux__
    usleep(waitTime * 1000);
#elif defined(_WIN32) || defined(_WIN64)
    Sleep(waitTime);
#endif
}
```

`msecSleep()` function halt the computational process in which this function is used.

``` cpp
int main()
{
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = portHandler(DEVICENAME);

  // Initialize PacketHandler Structs
  packetHandler();

  int dxl_comm_result = COMM_TX_FAIL;             // Communication result

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_baudnum_read;                       // Read baudnum

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

  // Read present baudrate of the controller
  printf("Now the controller baudrate is : %d\n", getBaudRate(port_num));

  // Try factoryreset
  printf("[ID:%03d] Try factoryreset : ", DXL_ID);
  factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printf("Aborted\n");
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    return 0;
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Wait for reset
  printf("Wait for reset...\n");
  msecSleep(2000);

  printf("[ID:%03d] factoryReset Success!\n", DXL_ID);

  // Set controller baudrate to Dynamixel default baudrate
  if (setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  {
    printf("Succeed to change the controller baudrate to : %d\n", FACTORYRST_DEFAULTBAUDRATE);
  }
  else
  {
    printf("Failed to change the controller baudrate\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] DXL baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
  }

  // Write new baudnum
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE, NEW_BAUDNUM);
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
    printf("[ID:%03d] Set Dynamixel baudnum to : %d\n", DXL_ID, NEW_BAUDNUM);
  }

  // Set port baudrate to BAUDRATE
  if (setBaudRate(port_num, BAUDRATE))
  {
    printf("Succeed to change the controller baudrate to : %d\n", BAUDRATE);
  }
  else
  {
    printf("Failed to change the controller baudrate\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  msecSleep(200);

  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] Dynamixel Baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
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
  int dxl_comm_result = COMM_TX_FAIL;             // Communication result

  uint8_t dxl_error = 0;                          // Dynamixel error
  uint8_t dxl_baudnum_read;                       // Read baudnum
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_baudnum_read` keeps Dynamixel baudrate.

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
  // Read present baudrate of the controller
  printf("Now the controller baudrate is : %d\n", getBaudRate(port_num));
```

`getBaudRate()` function shows which baudrate is used in #`port_num` port of the controller.

``` cpp
  factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
  if ((dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    printf("Aborted\n");
    printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    return 0;
  }
  else if ((dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
```

`factoryReset()` function orders to the #`DXL_ID` Dynamixel through `#port_num` port, executing it to be reset as `OPERATION_MODE` format. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cpp
  // Wait for reset
  printf("Wait for reset...\n");
  msecSleep(2000);
```

Factory reset takes few seconds.

``` cpp
  // Set controller baudrate to dxl default baudrate
  if (setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  {
      printf("Succeed to change the controller baudrate to : %d\n", FACTORYRST_DEFAULTBAUDRATE);
  }
  else
  {
      printf("Failed to change the controller baudrate\n");
      printf("Press any key to terminate...\n");
      _getch();
      return 0;
  }
```

Controller should change its baudrate itself to do the communication with initialized Dynamixel.

``` cpp
  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] DXL baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
  }
```

This shows that reconnection between controller and Dynamixel is happened by adjusting the baudrate.

``` cpp
  // Write new baudnum
  write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE, NEW_BAUDNUM);
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
    printf("[ID:%03d] Set Dynamixel baudnum to : %d\n", DXL_ID, NEW_BAUDNUM);
  }```

To make the Dynamixel into previous condition, `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cpp
  // Set port baudrate to BAUDRATE
  if (setBaudRate(port_num, BAUDRATE))
  {
    printf("Succeed to change the controller baudrate to : %d\n", BAUDRATE);
  }
  else
  {
    printf("Failed to change the controller baudrate\n");
    printf("Press any key to terminate...\n");
    getch();
    return 0;
  }

  msecSleep(200);

  // Read Dynamixel baudnum
  dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
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
    printf("[ID:%03d] Dynamixel Baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
  }
```

These changes controller baudrate and verify that the Dynamixel has been successfully set into previous state.

``` cpp
  // Close port
  closePort(port_num);

  return 0;
```

Finally, port becomes disposed.
