---
layout: archive
lang: en
ref: csharp_indirect_address_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_indirect_address_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 10"></div>
<div style="counter-reset: h3 4"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="csharp-protocol-20"><a href="#csharp-protocol-20">CSharp Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [CSharp Indirect Address Protocol 2.0](#csharp-indirect-address-protocol-20)

- Description

  This example writes the goal position and LED value and repeats to read present position and moving status through the indirect data storage, rather than write directly to the their own data storages. The indirect address links between direct and indirect data storages. This makes the Syncread and the Syncwrite function accessible to the items which are far from each other’s address.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` cs
/*
 * IndirectAddress.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Indirect Address Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

using System;
using dynamixel_sdk;

namespace sync_write
{
  class SyncWrite
  {
    // Control table address                                                        // Control table address is different in Dynamixel model
    public const int ADDR_PRO_INDIRECTADDRESS_FOR_WRITE      = 49;                  // EEPROM region
    public const int ADDR_PRO_INDIRECTADDRESS_FOR_READ       = 59;                  // EEPROM region
    public const int ADDR_PRO_TORQUE_ENABLE                  = 562;
    public const int ADDR_PRO_LED_RED                        = 563;
    public const int ADDR_PRO_GOAL_POSITION                  = 596;
    public const int ADDR_PRO_MOVING                         = 610;
    public const int ADDR_PRO_PRESENT_POSITION               = 611;
    public const int ADDR_PRO_INDIRECTDATA_FOR_WRITE         = 634;
    public const int ADDR_PRO_INDIRECTDATA_FOR_READ          = 639;

    // Data Byte Length
    public const int LEN_PRO_LED_RED                         = 1;
    public const int LEN_PRO_GOAL_POSITION                   = 4;
    public const int LEN_PRO_MOVING                          = 1;
    public const int LEN_PRO_PRESENT_POSITION                = 4;
    public const int LEN_PRO_INDIRECTDATA_FOR_WRITE          = 5;
    public const int LEN_PRO_INDIRECTDATA_FOR_READ           = 5;

    // Protocol version
    public const int PROTOCOL_VERSION                        = 2;                   // See which protocol version is used in the Dynamixel

    // Default setting
    public const int DXL_ID                                  = 1;                   // Dynamixel ID: 1
    public const int BAUDRATE                                = 1000000;
    public const string DEVICENAME                           = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                                    // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const int TORQUE_ENABLE                           = 1;                   // Value for enabling the torque
    public const int TORQUE_DISABLE                          = 0;                   // Value for disabling the torque
    public const int DXL_MINIMUM_POSITION_VALUE              = -150000;             // Dynamixel will rotate between this value
    public const int DXL_MAXIMUM_POSITION_VALUE              = 150000;              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
    public const int DXL_MINIMUM_LED_VALUE                   = 0;                   // Dynamixel LED will light between this value
    public const int DXL_MAXIMUM_LED_VALUE                   = 255;                 // and this value
    public const int DXL_MOVING_STATUS_THRESHOLD             = 20;                  // Dynamixel moving status threshold

    public const byte ESC_ASCII_VALUE                        = 0x1b;

    public const int COMM_SUCCESS                            = 0;                   // Communication Success result value
    public const int COMM_TX_FAIL                            = -1001;               // Communication Tx Failed

    static void Main(string[] args)
    {
      // Initialize PortHandler Structs
      // Set the port path
      // Get methods and members of PortHandlerLinux or PortHandlerWindows
      int port_num = dynamixel.portHandler(DEVICENAME);

      // Initialize PacketHandler Structs
      dynamixel.packetHandler();

      // Initialize Groupsyncwrite instance
      int groupwrite_num = dynamixel.groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_WRITE, LEN_PRO_INDIRECTDATA_FOR_WRITE);

      // Initialize Groupsyncread Structs for Present Position
      int groupread_num = dynamixel.groupSyncRead(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_INDIRECTDATA_FOR_READ);

      int index = 0;
      int dxl_comm_result = COMM_TX_FAIL;                     // Communication result
      bool dxl_addparam_result = false;                       // AddParam result
      bool dxl_getdata_result = false;                        // GetParam result
      int[] dxl_goal_position = new int[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

      byte dxl_error = 0;                                     // Dynamixel error
      byte dxl_moving = 0;                                    // Dynamixel moving status
      byte[] dxl_led_value = new byte[2]{ 0x00, 0xFF };       // Dynamixel LED value
      Int32 dxl_present_position = 0;                         // Present position

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

      // Disable Dynamixel Torque :
      // Indirect address would not accessible when the torque is already enabled
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
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
        Console.WriteLine("Dynamixel has been successfully connected");
      }

      // INDIRECTDATA parameter storages replace LED, goal position, present position and moving status storages
      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 0, ADDR_PRO_GOAL_POSITION + 0);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 2, ADDR_PRO_GOAL_POSITION + 1);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 4, ADDR_PRO_GOAL_POSITION + 2);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 6, ADDR_PRO_GOAL_POSITION + 3);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 8, ADDR_PRO_LED_RED);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 0, ADDR_PRO_PRESENT_POSITION + 0);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 2, ADDR_PRO_PRESENT_POSITION + 1);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 4, ADDR_PRO_PRESENT_POSITION + 2);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 6, ADDR_PRO_PRESENT_POSITION + 3);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 8, ADDR_PRO_MOVING);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Enable Dynamixel Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Add parameter storage for Dynamixel present position value
      dxl_addparam_result = dynamixel.groupSyncReadAddParam(groupread_num, DXL_ID);
      if (dxl_addparam_result != true)
      {
        Console.WriteLine("[ID: {0}] groupSyncRead addparam failed", DXL_ID);
        return;
      }

      while (true)
      {
        Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
        if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
          break;

        // Add values to the Syncwrite storage
        dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, (UInt32)dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
        if (dxl_addparam_result != true)
        {
          Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
          return;
        }
        dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, dxl_led_value[index], LEN_PRO_LED_RED);
        if (dxl_addparam_result != true)
        {
          Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
          return;
        }

        // Syncwrite goal position
        dynamixel.groupSyncWriteTxPacket(groupwrite_num);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

        // Clear syncwrite parameter storage
        dynamixel.groupSyncWriteClearParam(groupwrite_num);

        do
        {
          // Syncread present position from indirectdata2
          dynamixel.groupSyncReadTxRxPacket(groupread_num);
          if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

          // Check if groupsyncread data of Dyanamixel is available
          dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);
          if (dxl_getdata_result != true)
          {
            Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
            return;
          }

          // Check if groupsyncread data of Dyanamixel is available
          dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);
          if (dxl_getdata_result != true)
          {
            Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
            return;
          }

          // Get Dynamixel present position value
          dxl_present_position = (Int32)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);

          // Get Dynamixel moving status value
          dxl_moving = (byte)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);

          Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2}  IsMoving: {3}", DXL_ID, dxl_goal_position[index], dxl_present_position, dxl_moving);

        } while (Math.Abs(dxl_goal_position[index] - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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

      // Disable Dynamixel Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
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



#### Details

``` cs
using System;
```

The functions `Math.Abs()`, `Console.*` for I/O, are in the example code, and it uses `System` namespace.

``` cs
using dynamixel_sdk;
```

All libraries of DYNAMIXEL SDK are wrapped into the `dynamixel_sdk` namespace.

``` cs
// Control table address                                                        // Control table address is different in Dynamixel model
public const int ADDR_PRO_INDIRECTADDRESS_FOR_WRITE      = 49;                  // EEPROM region
public const int ADDR_PRO_INDIRECTADDRESS_FOR_READ       = 59;                  // EEPROM region
public const int ADDR_PRO_TORQUE_ENABLE                  = 562;
public const int ADDR_PRO_LED_RED                        = 563;
public const int ADDR_PRO_GOAL_POSITION                  = 596;
public const int ADDR_PRO_MOVING                         = 610;
public const int ADDR_PRO_PRESENT_POSITION               = 611;
public const int ADDR_PRO_INDIRECTDATA_FOR_WRITE         = 634;
public const int ADDR_PRO_INDIRECTDATA_FOR_READ          = 639;

// Data Byte Length
public const int LEN_PRO_LED_RED                         = 1;
public const int LEN_PRO_GOAL_POSITION                   = 4;
public const int LEN_PRO_MOVING                          = 1;
public const int LEN_PRO_PRESENT_POSITION                = 4;
public const int LEN_PRO_INDIRECTDATA_FOR_WRITE          = 5;
public const int LEN_PRO_INDIRECTDATA_FOR_READ           = 5;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` cs
// Protocol version
public const int PROTOCOL_VERSION                        = 2;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int DXL_ID                                  = 1;                   // Dynamixel ID: 1
public const int BAUDRATE                                = 1000000;
public const string DEVICENAME                           = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                                // ex) "COM1"   Linux: "/dev/ttyUSB0"

public const int TORQUE_ENABLE                           = 1;                   // Value for enabling the torque
public const int TORQUE_DISABLE                          = 0;                   // Value for disabling the torque
public const int DXL_MINIMUM_POSITION_VALUE              = -150000;             // Dynamixel will rotate between this value
public const int DXL_MAXIMUM_POSITION_VALUE              = 150000;              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
public const int DXL_MINIMUM_LED_VALUE                   = 0;                   // Dynamixel LED will light between this value
public const int DXL_MAXIMUM_LED_VALUE                   = 255;                 // and this value
public const int DXL_MOVING_STATUS_THRESHOLD             = 20;                  // Dynamixel moving status threshold

public const byte ESC_ASCII_VALUE                        = 0x1b;
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses Dynamixel `DXL_ID` connected with the port `DEVICENAME`.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

Dynamixel LED has its own range of value: 1 byte red LED for Dynamixel MX-28 and 1byte each on red, green, blue LED for Dynamixel PRO 54-200.

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

  // Initialize Groupsyncwrite instance
  int groupwrite_num = dynamixel.groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_WRITE, LEN_PRO_INDIRECTDATA_FOR_WRITE);

  // Initialize Groupsyncread Structs for Present Position
  int groupread_num = dynamixel.groupSyncRead(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_INDIRECTDATA_FOR_READ);

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;                     // Communication result
  bool dxl_addparam_result = false;                       // AddParam result
  bool dxl_getdata_result = false;                        // GetParam result
  int[] dxl_goal_position = new int[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

  byte dxl_error = 0;                                     // Dynamixel error
  byte dxl_moving = 0;                                    // Dynamixel moving status
  byte[] dxl_led_value = new byte[2]{ 0x00, 0xFF };       // Dynamixel LED value
  Int32 dxl_present_position = 0;                         // Present position

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

  // Disable Dynamixel Torque :
  // Indirect address would not accessible when the torque is already enabled
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
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
    Console.WriteLine("Dynamixel has been successfully connected");
  }

  // INDIRECTDATA parameter storages replace LED, goal position, present position and moving status storages
  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 0, ADDR_PRO_GOAL_POSITION + 0);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 2, ADDR_PRO_GOAL_POSITION + 1);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 4, ADDR_PRO_GOAL_POSITION + 2);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 6, ADDR_PRO_GOAL_POSITION + 3);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 8, ADDR_PRO_LED_RED);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 0, ADDR_PRO_PRESENT_POSITION + 0);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 2, ADDR_PRO_PRESENT_POSITION + 1);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 4, ADDR_PRO_PRESENT_POSITION + 2);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 6, ADDR_PRO_PRESENT_POSITION + 3);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 8, ADDR_PRO_MOVING);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Enable Dynamixel Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Add parameter storage for Dynamixel present position value
  dxl_addparam_result = dynamixel.groupSyncReadAddParam(groupread_num, DXL_ID);
  if (dxl_addparam_result != true)
  {
    Console.WriteLine("[ID: {0}] groupSyncRead addparam failed", DXL_ID);
    return;
  }

  while (true)
  {
    Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
    if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
      break;

    // Add values to the Syncwrite storage
    dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, (UInt32)dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
    if (dxl_addparam_result != true)
    {
      Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
      return;
    }
    dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, dxl_led_value[index], LEN_PRO_LED_RED);
    if (dxl_addparam_result != true)
    {
      Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
      return;
    }

    // Syncwrite goal position
    dynamixel.groupSyncWriteTxPacket(groupwrite_num);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    // Clear syncwrite parameter storage
    dynamixel.groupSyncWriteClearParam(groupwrite_num);

    do
    {
      // Syncread present position from indirectdata2
      dynamixel.groupSyncReadTxRxPacket(groupread_num);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      // Check if groupsyncread data of Dyanamixel is available
      dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);
      if (dxl_getdata_result != true)
      {
        Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
        return;
      }

      // Check if groupsyncread data of Dyanamixel is available
      dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);
      if (dxl_getdata_result != true)
      {
        Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
        return;
      }

      // Get Dynamixel present position value
      dxl_present_position = (Int32)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);

      // Get Dynamixel moving status value
      dxl_moving = (byte)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);

      Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2}  IsMoving: {3}", DXL_ID, dxl_goal_position[index], dxl_present_position, dxl_moving);

    } while (Math.Abs(dxl_goal_position[index] - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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

  // Disable Dynamixel Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
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
// Initialize Groupsyncwrite instance
int groupwrite_num = dynamixel.groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_WRITE, LEN_PRO_INDIRECTDATA_FOR_WRITE);
```

`groupSyncWrite()` function initializes grouped parameters used for packet construction and packet storing. The utility functions of sync write deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`, and writing `LEN_PRO_INDIRECTDATA_FOR_WRITE` bytes of the values on the address `ADDR_PRO_INDIRECTDATA_FOR_WRITE`.

``` cs
// Initialize Groupsyncread Structs for Present Position
int groupread_num = dynamixel.groupSyncRead(port_num, PROTOCOL_VERSION, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_INDIRECTDATA_FOR_READ);
```

`groupSyncRead()` function initializes grouped parameters used for packet construction and packet storing. The utility functions of sync read deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`, and requesting `LEN_PRO_INDIRECTDATA_FOR_READ` bytes of the values on the address `ADDR_PRO_INDIRECTDATA_FOR_READ`.

``` cs
int index = 0;
int dxl_comm_result = COMM_TX_FAIL;                     // Communication result
bool dxl_addparam_result = false;                       // AddParam result
bool dxl_getdata_result = false;                        // GetParam result
int[] dxl_goal_position = new int[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

byte dxl_error = 0;                                     // Dynamixel error
byte dxl_moving = 0;                                    // Dynamixel moving status
byte[] dxl_led_value = new byte[2]{ 0x00, 0xFF };       // Dynamixel LED value
Int32 dxl_present_position = 0;                         // Present position
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_addparam_result` indicates the result of parameter addition used for sync/bulk related functions  

`dxl_getdata_result` indicates the result of data reception used for sync/bulk related functions  

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl_moving` views whether the Dynamixel is stopped.

`dxl_led_value` stores LED values of Dynamixel.

`dxl_present_position` view where now each Dynamixel points out.

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
// Disable Dynamixel Torque :
// Indirect address would not accessible when the torque is already enabled
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
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
  Console.WriteLine("Dynamixel has been successfully connected");
}
```

Indirect address and Indirect data are particularly applicable to control several items far from each other in control table address simultaenously. Nth Indirect data shows one of the item on the control table that Nth Indirect Address points out, so if you want to see Dynamixel LED RED value through 1st indirect data, change value of 1st Indirect Address to `ADDR_PRO_LED_RED` value.

However, Dynamixel PRO has Indirect Address items on its EEPROM area. (Please see the E-Manual.) To change them, you must disable the torque at first.

Above `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel through the port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// INDIRECTDATA parameter storages replace LED, goal position, present position and moving status storages
dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 0, ADDR_PRO_GOAL_POSITION + 0);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 2, ADDR_PRO_GOAL_POSITION + 1);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 4, ADDR_PRO_GOAL_POSITION + 2);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 6, ADDR_PRO_GOAL_POSITION + 3);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 8, ADDR_PRO_LED_RED);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

These allocate five target address for writing (ADDR_PRO_GOAL_POSITION + 0, ADDR_PRO_GOAL_POSITION + 1, ADDR_PRO_GOAL_POSITION + 2, ADDR_PRO_GOAL_POSITION + 3 and ADDR_PRO_LED_RED) to the Indirect Addresses(ADDR_PRO_INDIRECTADDRESS_FOR_WRITE + 0 ~ 9) 2 bytes each. Now, you can change goal position value or red LED value by writing 4 byte and 1 byte each on the 1st ~ 4th and 5th Indirect Data item.

``` cs
dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 0, ADDR_PRO_PRESENT_POSITION + 0);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 2, ADDR_PRO_PRESENT_POSITION + 1);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 4, ADDR_PRO_PRESENT_POSITION + 2);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 6, ADDR_PRO_PRESENT_POSITION + 3);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_INDIRECTADDRESS_FOR_READ + 8, ADDR_PRO_MOVING);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

These allocate five target address for writing (ADDR_PRO_PRESENT_POSITION + 0, ADDR_PRO_PRESENT_POSITION + 1, ADDR_PRO_PRESENT_POSITION + 2, ADDR_PRO_PRESENT_POSITION + 3 and ADDR_PRO_MOVING) to the Indirect Addresses(ADDR_PRO_INDIRECTADDRESS_FOR_READ + 0 ~ 9) 2 bytes each. Now, you can get present position value or moving status value by reading 4 byte and 1 byte each on the 6st ~ 9th and 10th Indirect Data item.

``` cs
// Enable Dynamixel Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Add parameter storage for Dynamixel present position value
dxl_addparam_result = dynamixel.groupSyncReadAddParam(groupread_num, DXL_ID);
if (dxl_addparam_result != true)
{
  Console.WriteLine("[ID: {0}] groupSyncRead addparam failed", DXL_ID);
  return;
}
```

`groupSyncReadAddParam()` function stores the Dynamixel ID of required data to the syncread target Dynamixel list.

``` cs
while (true)
{
  Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
  if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
    break;

  // Add values to the Syncwrite storage
  dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, (UInt32)dxl_goal_position[index], LEN_PRO_GOAL_POSITION);
  if (dxl_addparam_result != true)
  {
    Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
    return;
  }
  dxl_addparam_result = dynamixel.groupSyncWriteAddParam(groupwrite_num, DXL_ID, dxl_led_value[index], LEN_PRO_LED_RED);
  if (dxl_addparam_result != true)
  {
    Console.WriteLine("[ID: {0}] groupSyncWrite addparam failed", DXL_ID);
    return;
  }

  // Syncwrite goal position
  dynamixel.groupSyncWriteTxPacket(groupwrite_num);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

  // Clear syncwrite parameter storage
  dynamixel.groupSyncWriteClearParam(groupwrite_num);

  do
  {
    // Syncread present position from indirectdata2
    dynamixel.groupSyncReadTxRxPacket(groupread_num);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    // Check if groupsyncread data of Dyanamixel is available
    dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);
    if (dxl_getdata_result != true)
    {
      Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
      return;
    }

    // Check if groupsyncread data of Dyanamixel is available
    dxl_getdata_result = dynamixel.groupSyncReadIsAvailable(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);
    if (dxl_getdata_result != true)
    {
      Console.WriteLine("[ID: {0}] groupSyncRead getdata failed", DXL_ID);
      return;
    }

    // Get Dynamixel present position value
    dxl_present_position = (Int32)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ, LEN_PRO_PRESENT_POSITION);

    // Get Dynamixel moving status value
    dxl_moving = (byte)dynamixel.groupSyncReadGetData(groupread_num, DXL_ID, ADDR_PRO_INDIRECTDATA_FOR_READ + LEN_PRO_PRESENT_POSITION, LEN_PRO_MOVING);

    Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2}  IsMoving: {3}", DXL_ID, dxl_goal_position[index], dxl_present_position, dxl_moving);

  } while (Math.Abs(dxl_goal_position[index] - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD);

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

During `while()` loop, the controller writes and reads each Dynamixel position through packet transmission/reception(Tx/Rx).

To continue their rotation, press any key except ESC.

`groupSyncWriteAddParam()` function stores the Dynamixel ID and its goal position `dxl_goal_position` and LED value `dxl_led_value` to the syncwrite target Dynamixel list.

`groupSyncWriteTxPacket()` function orders to the Dynamixel #`DXL_ID` through the port, making it possible to write same pre-listed length bytes to same pre-listed address. The function checks Tx/Rx result.
`getLastTxRxResult()` function get it, and then `printTxRxResult()` function shows result on the console window if any communication error has been occurred.

`groupSyncWriteClearParam()` function clears the Dynamixel list of groupsyncwrite.

`groupSyncReadTxRxPacket()` function orders to the Dynamixel #`DXL_ID` through #`port_num` port,  making it possible to read same pre-listed length(LEN_PRO_INDIRECTDATA_FOR_READ) of bytes to same pre-listed address(ADDR_PRO_INDIRECTDATA_FOR_READ). The function checks Tx/Rx result.
`getLastTxRxResult()` function gets it, and then `printTxRxResult()` function shows result on the console window if any communication error has been occurred.

`groupSyncReadIsAvailable()` function checks if available data is in the groupsyncread data storage. The function returns false if no data is available in the storage.

`groupSyncReadGetData()` function pop the data received by `groupSyncReadTxRxPacket()` function out. In the example, it stores `LEN_PRO_PRESENT_POSITION` byte data and `LEN_PRO_MOVING` byte data got from `ADDR_PRO_INDIRECTDATA_FOR_READ` address of Dynamixel.

`groupSyncReadClearParam()` function clears the Dynamixel list of groupsyncread.

Reading their present position will be ended when absolute value of `(dxl_goal_position[index] - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` cs
// Disable Dynamixel Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

The controller frees the Dynamixel to be idle.

`write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
