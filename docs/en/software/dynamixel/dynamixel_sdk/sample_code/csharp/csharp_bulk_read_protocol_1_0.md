---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_csharp_bulk_read_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_bulk_read_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 8"></div>
<div style="counter-reset: h3 3"></div>

# [Sample Code](#sample-code)

## [CSharp Protocol 1.0](#csharp-protocol-10)

### [CSharp Bulk Read Protocol 1.0](#csharp-bulk-read-protocol-10)

- Description

  This example writes goal positions to two Dynamixels simultaneously and repeats to read each present positions until Dynamixels stop moving. The funtions that are related with the Syncwrite handle the number of items that are near to each other in the Dynamixel control table on multiple Dynamixels, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

- Code Parts


``` cs
/*
 * BulkRead.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Bulk Read Example      *********
//
//
// Available Dynamixel model on this example : MX or X series set to Protocol 1.0
// This example is designed for using two Dynamixel MX-28, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel MX properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000)
//

using System;
using dynamixel_sdk;

namespace bulk_read
{
  class BulkRead
  {
    // Control table address
    public const int ADDR_MX_TORQUE_ENABLE           = 24;                  // Control table address is different in Dynamixel model
    public const int ADDR_MX_GOAL_POSITION           = 30;
    public const int ADDR_MX_PRESENT_POSITION        = 36;
    public const int ADDR_MX_MOVING                  = 46;

    // Data Byte Length
    public const int LEN_MX_GOAL_POSITION            = 2;
    public const int LEN_MX_PRESENT_POSITION         = 2;
    public const int LEN_MX_MOVING                   = 1;

    // Protocol version
    public const int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    public const int DXL1_ID                         = 1;                   // Dynamixel ID: 1
    public const int DXL2_ID                         = 2;                   // Dynamixel ID: 2
    public const int BAUDRATE                        = 1000000;
    public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                            // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const int TORQUE_ENABLE                   = 1;                   // Value for enabling the torque
    public const int TORQUE_DISABLE                  = 0;                   // Value for disabling the torque
    public const int DXL_MINIMUM_POSITION_VALUE      = 100;                 // Dynamixel will rotate between this value
    public const int DXL_MAXIMUM_POSITION_VALUE      = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
    public const int DXL_MOVING_STATUS_THRESHOLD     = 10;                  // Dynamixel moving status threshold

    public const byte ESC_ASCII_VALUE                = 0x1b;

    public const int COMM_SUCCESS                    = 0;                   // Communication Success result value
    public const int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed

    static void Main(string[] args)
    {
      // Initialize PortHandler Structs
      // Set the port path
      // Get methods and members of PortHandlerLinux or PortHandlerWindows
      int port_num = dynamixel.portHandler(DEVICENAME);

      // Initialize PacketHandler Structs
      dynamixel.packetHandler();

      // Initialize Groupbulkread Structs
      int group_num = dynamixel.groupBulkRead(port_num, PROTOCOL_VERSION);

      int index = 0;
      int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result
      bool dxl_addparam_result = false;                                     // AddParam result
      bool dxl_getdata_result = false;                                      // GetParam result
      UInt16[] dxl_goal_position = new UInt16[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE }; // Goal position

      byte dxl_error = 0;                                                   // Dynamixel error
      UInt16 dxl1_present_position = 0;                                     // Present position
      byte dxl2_moving = 0;                                                 // Dynamixel moving status

      // Open port
      if (dynamixel.openPort(port_num))
      {
        Console.WriteLine("Succeeded to open the port!");
      }
      else
      {
        Console.WriteLine("Failed to open the port!");
        Console.WriteLine("Press any key to terminate...");
        Console.ReadKey();
        return;
      }

      // Set port baudrate
      if (dynamixel.setBaudRate(port_num, BAUDRATE))
      {
        Console.WriteLine("Succeeded to change the baudrate!");
      }
      else
      {
        Console.WriteLine("Failed to change the baudrate!");
        Console.WriteLine("Press any key to terminate...");
        Console.ReadKey();
        return;
      }

      // Enable Dynamixel#1 Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }
      else
      {
        Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
      }

      // Enable Dynamixel#2 Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }
      else
      {
        Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
      }

      // Add parameter storage for Dynamixel#1 present position value
      dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
      if (dxl_addparam_result != true)
      {
        Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL1_ID);
        return;
      }

      // Add parameter storage for Dynamixel#2 present moving value
      dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
      if (dxl_addparam_result != true)
      {
        Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL2_ID);
        return;
      }

      while (true)
      {
        Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
        if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
          break;

        // Write Dynamixel#1 goal position
        dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        // Write Dynamixel#2 goal position
        dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        do
        {
          // Bulkread present position and moving status
          dynamixel.groupBulkReadTxRxPacket(group_num);
          if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

          dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
          if (dxl_getdata_result != true)
          {
            Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL1_ID);
            return;
          }

          dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
          if (dxl_getdata_result != true)
          {
            Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL2_ID);
            return;
          }

          // Get Dynamixel#1 present position value
          dxl1_present_position = (UInt16)dynamixel.groupBulkReadGetData(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);

          // Get Dynamixel#2 moving status value
          dxl2_moving = (byte)dynamixel.groupBulkReadGetData(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);

          Console.WriteLine("[ID: {0}] Present Position : {1} [ID: {2}] Is Moving : {3}", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_moving);

        } while (Math.Abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Disable Dynamixel#2 Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Close port
      dynamixel.closePort(port_num);

      return;
    }
  }
}
```

-------------------------------------------------------------------------------------

- Details

``` cs
using System;
```

The functions `Math.Abs()`, `Console.*` for I/O, are in the example code, and it uses `System` namespace.

``` cs
using dynamixel_sdk;
```

All libraries of Dynamixel SDK are wrapped into the `dynamixel_sdk` namespace.

``` cs
// Control table address
public const int ADDR_MX_TORQUE_ENABLE           = 24;                  // Control table address is different in Dynamixel model
public const int ADDR_MX_GOAL_POSITION           = 30;
public const int ADDR_MX_PRESENT_POSITION        = 36;
public const int ADDR_MX_MOVING                  = 46;

// Data Byte Length
public const int LEN_MX_GOAL_POSITION            = 2;
public const int LEN_MX_PRESENT_POSITION         = 2;
public const int LEN_MX_MOVING                   = 1;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` cs
// Protocol version
public const int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int DXL1_ID                         = 1;                   // Dynamixel ID: 1
public const int DXL2_ID                         = 2;                   // Dynamixel ID: 2
public const int BAUDRATE                        = 1000000;
public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                        // ex) "COM1"   Linux: "/dev/ttyUSB0"

public const int TORQUE_ENABLE                   = 1;                   // Value for enabling the torque
public const int TORQUE_DISABLE                  = 0;                   // Value for disabling the torque
public const int DXL_MINIMUM_POSITION_VALUE      = 100;                 // Dynamixel will rotate between this value
public const int DXL_MAXIMUM_POSITION_VALUE      = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
public const int DXL_MOVING_STATUS_THRESHOLD     = 10;                  // Dynamixel moving status threshold

public const byte ESC_ASCII_VALUE                = 0x1b;
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two Dynamixels `DXL1_ID`, `DXL2_ID` connected with the port `DEVICENAME`.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

``` cs
public const int COMM_SUCCESS                    = 0;                   // Communication Success result value
public const int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

``` cs
static void Main(string[] args)
{
  // Initialize PortHandler Structs
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  int port_num = dynamixel.portHandler(DEVICENAME);

  // Initialize PacketHandler Structs
  dynamixel.packetHandler();

  // Initialize Groupbulkread Structs
  int group_num = dynamixel.groupBulkRead(port_num, PROTOCOL_VERSION);

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result
  bool dxl_addparam_result = false;                                     // AddParam result
  bool dxl_getdata_result = false;                                      // GetParam result
  UInt16[] dxl_goal_position = new UInt16[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE }; // Goal position

  byte dxl_error = 0;                                                   // Dynamixel error
  UInt16 dxl1_present_position = 0;                                     // Present position
  byte dxl2_moving = 0;                                                 // Dynamixel moving status

  // Open port
  if (dynamixel.openPort(port_num))
  {
    Console.WriteLine("Succeeded to open the port!");
  }
  else
  {
    Console.WriteLine("Failed to open the port!");
    Console.WriteLine("Press any key to terminate...");
    Console.ReadKey();
    return;
  }

  // Set port baudrate
  if (dynamixel.setBaudRate(port_num, BAUDRATE))
  {
    Console.WriteLine("Succeeded to change the baudrate!");
  }
  else
  {
    Console.WriteLine("Failed to change the baudrate!");
    Console.WriteLine("Press any key to terminate...");
    Console.ReadKey();
    return;
  }

  // Enable Dynamixel#1 Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
  }

  // Enable Dynamixel#2 Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }
  else
  {
    Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
  }

  // Add parameter storage for Dynamixel#1 present position value
  dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
  if (dxl_addparam_result != true)
  {
    Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL1_ID);
    return;
  }

  // Add parameter storage for Dynamixel#2 present moving value
  dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
  if (dxl_addparam_result != true)
  {
    Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL2_ID);
    return;
  }

  while (true)
  {
    Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
    if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
      break;

    // Write Dynamixel#1 goal position
    dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Write Dynamixel#2 goal position
    dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    do
    {
      // Bulkread present position and moving status
      dynamixel.groupBulkReadTxRxPacket(group_num);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
      if (dxl_getdata_result != true)
      {
        Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL1_ID);
        return;
      }

      dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
      if (dxl_getdata_result != true)
      {
        Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL2_ID);
        return;
      }

      // Get Dynamixel#1 present position value
      dxl1_present_position = (UInt16)dynamixel.groupBulkReadGetData(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);

      // Get Dynamixel#2 moving status value
      dxl2_moving = (byte)dynamixel.groupBulkReadGetData(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);

      Console.WriteLine("[ID: {0}] Present Position : {1} [ID: {2}] Is Moving : {3}", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_moving);

    } while (Math.Abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Close port
  dynamixel.closePort(port_num);

  return;
}
```

In `Main()` function, the codes call actual functions for Dynamixel control.

--------------------------------------------------------------------------------

``` cs
// Initialize PortHandler Structs
// Set the port path
// Get methods and members of PortHandlerLinux or PortHandlerWindows
int port_num = dynamixel.portHandler(DEVICENAME);
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

``` cs
// Initialize PacketHandler Structs
dynamixel.packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` cs
// Initialize Groupbulkread Structs
int group_num = dynamixel.groupBulkRead(port_num, PROTOCOL_VERSION);
```

`groupBulkRead()` function initializes grouped parameters used for packet construction and packet storing. The utility functions of bulk read deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`.

``` cs
int index = 0;
int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result
bool dxl_addparam_result = false;                                     // AddParam result
bool dxl_getdata_result = false;                                      // GetParam result
UInt16[] dxl_goal_position = new UInt16[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE }; // Goal position

byte dxl_error = 0;                                                   // Dynamixel error
UInt16 dxl1_present_position = 0;                                     // Present position
byte dxl2_moving = 0;                                                 // Dynamixel moving status
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_addparam_result` indicates the result of parameter addition used for sync/bulk related functions  

`dxl_getdata_result` indicates the result of data reception used for sync/bulk related functions  

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` views where now Dynamixel `DXL1_ID` points out.

`dxl2_moving` views whether the Dynamixel is stopped.

``` cs
// Open port
if (dynamixel.openPort(port_num))
{
  Console.WriteLine("Succeeded to open the port!");
}
else
{
  Console.WriteLine("Failed to open the port!");
  Console.WriteLine("Press any key to terminate...");
  Console.ReadKey();
  return;
}
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` cs
// Set port baudrate
if (dynamixel.setBaudRate(port_num, BAUDRATE))
{
  Console.WriteLine("Succeeded to change the baudrate!");
}
else
{
  Console.WriteLine("Failed to change the baudrate!");
  Console.WriteLine("Press any key to terminate...");
  Console.ReadKey();
  return;
}
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.

``` cs
// Enable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
else
{
  Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
}

// Enable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
else
{
  Console.WriteLine("Dynamixel{0} has been successfully connected ", DXL1_ID);
}
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Add parameter storage for Dynamixel#1 present position value
dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
if (dxl_addparam_result != true)
{
  Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL1_ID);
  return;
}

// Add parameter storage for Dynamixel#2 present moving value
dxl_addparam_result = dynamixel.groupBulkReadAddParam(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
if (dxl_addparam_result != true)
{
  Console.WriteLine("[ID: {0}] groupBulkRead addparam failed", DXL2_ID);
  return;
}
```

`groupBulkReadAddParam()` function stores the Dynamixel ID and address `ADDR_MX_MOVING`, byte length `LEN_MX_MOVING` of required data to the bulkread target Dynamixel list.

``` cs
while (true)
{
  Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
  if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
    break;

  // Write Dynamixel#1 goal position
  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Write Dynamixel#2 goal position
  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  do
  {
    // Bulkread present position and moving status
    dynamixel.groupBulkReadTxRxPacket(group_num);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);
    if (dxl_getdata_result != true)
    {
      Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL1_ID);
      return;
    }

    dxl_getdata_result = dynamixel.groupBulkReadIsAvailable(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);
    if (dxl_getdata_result != true)
    {
      Console.WriteLine("[ID: {0}] groupBulkRead getdata failed", DXL2_ID);
      return;
    }

    // Get Dynamixel#1 present position value
    dxl1_present_position = (UInt16)dynamixel.groupBulkReadGetData(group_num, DXL1_ID, ADDR_MX_PRESENT_POSITION, LEN_MX_PRESENT_POSITION);

    // Get Dynamixel#2 moving status value
    dxl2_moving = (byte)dynamixel.groupBulkReadGetData(group_num, DXL2_ID, ADDR_MX_MOVING, LEN_MX_MOVING);

    Console.WriteLine("[ID: {0}] Present Position : {1} [ID: {2}] Is Moving : {3}", DXL1_ID, dxl1_present_position, DXL2_ID, dxl2_moving);

  } while (Math.Abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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

`write2ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 2 byte of `dxl_goal_position[index]` value to `ADDR_MX_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`groupBulkReadTxRxPacket()` function orders to the Dynamixel #`DXL1_ID` and #`DXL2_ID` at the same time through #`port_num` port, making it possible to require data bytes from different address. (In this example, `LEN_MX_PRESENT_POSITION` bytes of the values to the address `ADDR_MX_PRESENT_POSITION` and `LEN_MX_MOVING` bytes of the values to the address `ADDR_MX_MOVING`, each.) The function checks Tx/Rx result.
`getLastTxRxResult()` function gets it, and then `printTxRxResult()` function shows result on the console window if any communication error has been occurred.

`groupBulkReadIsAvailable()` function checks if available data is in the groupbulkread data storage. The function returns false if no data is available in the storage.

`groupBulkReadGetData()` function pop the data received by `groupBulkReadTxRxPacket()` function out. In the example, it stores `LEN_MX_PRESENT_POSITION` byte data got from `ADDR_MX_PRESENT_POSITION` address of `DXL1_ID` Dynamixel and `LEN_MX_MOVING` byte data got from `ADDR_MX_MOVING` address of `DXL2_ID` Dynamixel, each.

`groupBulkReadClearParam()` function clears the Dynamixel list of groupbulkread.

Reading their present position will be ended when absolute value of `(dxl_goal_position[index] - dxl1_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` cs
// Disable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

// Disable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
