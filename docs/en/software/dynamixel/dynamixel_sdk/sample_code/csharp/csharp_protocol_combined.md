---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_csharp_protocol_combined
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_protocol_combined/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 10"></div>

# [Sample Code](#sample-code)

## [CSharp Protocol Combined](#csharp-protocol-combined)

- Description

  This example, basically, writes the goal position of Dynamixel and repeats to read its present position, until it stops moving. Read and write function can be used even to handle other multiple items in nearby addresses on the control table lists, such as goal position and velocity.

- Available Dynamixel model

  All models using protocol 1.0 and 2.0


#### Sample code


``` cs
/*
 * ProtocolCombined.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
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
// This example configures two different control tables (especially, if it uses Dynamixel and Dynamixel PRO). It may modify critical Dynamixel parameter on the control table, if Dynamixels have wrong ID.
//

using System;
using dynamixel_sdk;

namespace protocol_combined
{
  class ProtocolCombined
  {
    // Control table address for Dynamixel MX
    public const int ADDR_MX_TORQUE_ENABLE          = 24;                  // Control table address is different in Dynamixel model
    public const int ADDR_MX_GOAL_POSITION          = 30;
    public const int ADDR_MX_PRESENT_POSITION       = 36;

    // Control table address for Dynamixel PRO
    public const int ADDR_PRO_TORQUE_ENABLE         = 562;
    public const int ADDR_PRO_GOAL_POSITION         = 596;
    public const int ADDR_PRO_PRESENT_POSITION      = 611;

    // Protocol version
    public const int PROTOCOL_VERSION1              = 1;                   // See which protocol version is used in the Dynamixel
    public const int PROTOCOL_VERSION2              = 2;

    // Default setting
    public const int DXL1_ID                        = 1;                   // Dynamixel ID: 1
    public const int DXL2_ID                        = 2;                   // Dynamixel ID: 2
    public const int BAUDRATE                       = 1000000;
    public const string DEVICENAME                  = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const int TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
    public const int TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
    public const int DXL1_MINIMUM_POSITION_VALUE    = 100;                 // Dynamixel will rotate between this value
    public const int DXL1_MAXIMUM_POSITION_VALUE    = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
    public const int DXL2_MINIMUM_POSITION_VALUE    = -150000;
    public const int DXL2_MAXIMUM_POSITION_VALUE    = 150000;
    public const int DXL1_MOVING_STATUS_THRESHOLD   = 10;                  // Dynamixel MX moving status threshold
    public const int DXL2_MOVING_STATUS_THRESHOLD   = 20;                  // Dynamixel PRO moving status threshold

    public const byte ESC_ASCII_VALUE = 0x1b;

    public const int COMM_SUCCESS = 0;                                     // Communication Success result value
    public const int COMM_TX_FAIL = -1001;                                 // Communication Tx Failed

    static void Main(string[] args)
    {
      // Initialize PortHandler Structs
      // Set the port path
      // Get methods and members of PortHandlerLinux or PortHandlerWindows
      int port_num = dynamixel.portHandler(DEVICENAME);

      // Initialize PacketHandler Structs
      dynamixel.packetHandler();

      int index = 0;
      int dxl_comm_result = COMM_TX_FAIL;                                  // Communication result
      UInt16[] dxl1_goal_position = new UInt16[2]{ DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE };   // Goal position of Dynamixel MX
      int[] dxl2_goal_position = new int[2]{ DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE };         // Goal position of Dynamixel PRO

      byte dxl_error = 0;                                                  // Dynamixel error
      UInt16 dxl1_present_position = 0;                                    // Present position of Dynamixel MX
      Int32 dxl2_present_position = 0;                                     // Present position of Dynamixel PRO


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

      // Enable Dynamixel#1 torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }
      else
      {
        Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL1_ID);
      }

      // Enable Dynamixel#2 torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
      }
      else
      {
        Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL2_ID);
      }

      while (true)
      {
        Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
        if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
          break;

        // Write Dynamixel#1 goal position
        dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
        }

        // Write Dynamixel#2 goal position
        dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, (UInt32)dxl2_goal_position[index]);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
        }

        do
        {
          // Read Dynamixel#1 present position
          dxl1_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
          if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
          {
            dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
          }
          else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
          {
            dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
          }

          // Read Dynamixel#2 present position
          dxl2_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
          if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
          {
            dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
          }
          else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
          {
            dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
          }

          Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2} [ID: {3}] GoalPos: {4}  PresPos: {5}", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

        } while ((Math.Abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (Math.Abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }

      // Disable Dynamixel#2 Torque
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
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

All libraries of Dynamixel SDK are wrapped into the `dynamixel_sdk` namespace.

``` cs
// Control table address for Dynamixel MX
public const int ADDR_MX_TORQUE_ENABLE          = 24;                  // Control table address is different in Dynamixel model
public const int ADDR_MX_GOAL_POSITION          = 30;
public const int ADDR_MX_PRESENT_POSITION       = 36;

// Control table address for Dynamixel PRO
public const int ADDR_PRO_TORQUE_ENABLE         = 562;
public const int ADDR_PRO_GOAL_POSITION         = 596;
public const int ADDR_PRO_PRESENT_POSITION      = 611;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` cs
// Protocol version
public const int PROTOCOL_VERSION1              = 1;                   // See which protocol version is used in the Dynamixel
public const int PROTOCOL_VERSION2              = 2;
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int DXL1_ID                        = 1;                   // Dynamixel ID: 1
public const int DXL2_ID                        = 2;                   // Dynamixel ID: 2
public const int BAUDRATE                       = 1000000;
public const string DEVICENAME                  = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                       // ex) "COM1"   Linux: "/dev/ttyUSB0"

public const int TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
public const int TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
public const int DXL1_MINIMUM_POSITION_VALUE    = 100;                 // Dynamixel will rotate between this value
public const int DXL1_MAXIMUM_POSITION_VALUE    = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
public const int DXL2_MINIMUM_POSITION_VALUE    = -150000;
public const int DXL2_MAXIMUM_POSITION_VALUE    = 150000;
public const int DXL1_MOVING_STATUS_THRESHOLD   = 10;                  // Dynamixel MX moving status threshold
public const int DXL2_MOVING_STATUS_THRESHOLD   = 20;                  // Dynamixel PRO moving status threshold

public const byte ESC_ASCII_VALUE = 0x1b;
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

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

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;                                  // Communication result
  UInt16[] dxl1_goal_position = new UInt16[2]{ DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE };   // Goal position of Dynamixel MX
  int[] dxl2_goal_position = new int[2]{ DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE };         // Goal position of Dynamixel PRO

  byte dxl_error = 0;                                                  // Dynamixel error
  UInt16 dxl1_present_position = 0;                                    // Present position of Dynamixel MX
  Int32 dxl2_present_position = 0;                                     // Present position of Dynamixel PRO


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

  // Enable Dynamixel#1 torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }
  else
  {
    Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL1_ID);
  }

  // Enable Dynamixel#2 torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }
  else
  {
    Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL2_ID);
  }

  while (true)
  {
    Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
    if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
      break;

    // Write Dynamixel#1 goal position
    dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
    }

    // Write Dynamixel#2 goal position
    dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, (UInt32)dxl2_goal_position[index]);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
    }

    do
    {
      // Read Dynamixel#1 present position
      dxl1_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
      }

      // Read Dynamixel#2 present position
      dxl2_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
      }

      Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2} [ID: {3}] GoalPos: {4}  PresPos: {5}", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

    } while ((Math.Abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (Math.Abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }

  // Disable Dynamixel#2 Torque
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
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
int index = 0;
int dxl_comm_result = COMM_TX_FAIL;                                  // Communication result
UInt16[] dxl1_goal_position = new UInt16[2]{ DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE };   // Goal position of Dynamixel MX
int[] dxl2_goal_position = new int[2]{ DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE };         // Goal position of Dynamixel PRO

byte dxl_error = 0;                                                  // Dynamixel error
UInt16 dxl1_present_position = 0;                                    // Present position of Dynamixel MX
Int32 dxl2_present_position = 0;                                     // Present position of Dynamixel PRO
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl1_goal_position` and `dxl2_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` views where now it points out.

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
// Enable Dynamixel#1 torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
}
else
{
  Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL1_ID);
}

// Enable Dynamixel#2 torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
}
else
{
  Console.WriteLine("Dynamixel#{0} has been successfully connected ", DXL2_ID);
}
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.
``` cs
while (true)
{
  Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
  if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
    break;

  // Write Dynamixel#1 goal position
  dynamixel.write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
  }

  // Write Dynamixel#2 goal position
  dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, (UInt32)dxl2_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
  }

  do
  {
    // Read Dynamixel#1 present position
    dxl1_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
    }

    // Read Dynamixel#2 present position
    dxl2_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
    }

    Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2} [ID: {3}] GoalPos: {4}  PresPos: {5}", DXL1_ID, dxl1_goal_position[index], dxl1_present_position, DXL2_ID, dxl2_goal_position[index], dxl2_present_position);

  } while ((Math.Abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (Math.Abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

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

``` cs
// Disable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION1)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION1, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION1)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION1, dxl_error);
}

// Disable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION2)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION2, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION2)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION2, dxl_error);
}
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
