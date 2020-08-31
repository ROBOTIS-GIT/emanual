---
layout: archive
lang: en
ref: csharp_read_write_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_read_write_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 10"></div>
<div style="counter-reset: h3 0"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="csharp-protocol-20"><a href="#csharp-protocol-20">CSharp Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [CSharp Read Write Protocol 2.0](#csharp-read-write-protocol-10)

- Description

  This example writes goal position to the Dynamixel and repeats to read present position until it stops moving. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` cs
/*
 * ReadWrite.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Read and Write Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

using System;
using dynamixel_sdk;

namespace read_write
{
  class ReadWrite
  {
    // Control table address
    public const int ADDR_PRO_TORQUE_ENABLE          = 562;                 // Control table address is different in Dynamixel model
    public const int ADDR_PRO_GOAL_POSITION          = 596;
    public const int ADDR_PRO_PRESENT_POSITION       = 611;

    // Protocol version
    public const int PROTOCOL_VERSION                = 2;                   // See which protocol version is used in the Dynamixel

    // Default setting
    public const int DXL_ID                          = 1;                   // Dynamixel ID: 1
    public const int BAUDRATE                        = 1000000;
    public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                            // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const int TORQUE_ENABLE                   = 1;                   // Value for enabling the torque
    public const int TORQUE_DISABLE                  = 0;                   // Value for disabling the torque
    public const int DXL_MINIMUM_POSITION_VALUE      = -150000;             // Dynamixel will rotate between this value
    public const int DXL_MAXIMUM_POSITION_VALUE      = 150000;              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
    public const int DXL_MOVING_STATUS_THRESHOLD     = 20;                  // Dynamixel moving status threshold

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

      int index = 0;
      int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result
      int[] dxl_goal_position = new int[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

      byte dxl_error = 0;                                                   // Dynamixel error
      Int32 dxl_present_position = 0;                                       // Present position

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
      else
      {
        Console.WriteLine("Dynamixel has been successfully connected");
      }

      while (true)
      {
        Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
        if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
          break;

        // Write goal position
        dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_GOAL_POSITION, (UInt32)dxl_goal_position[index]);
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
          // Read present position
          dxl_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_PRESENT_POSITION);
          if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
          {
            dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
          }
          else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
          {
            dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
          }

          Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2}", DXL_ID, dxl_goal_position[index], dxl_present_position);

        } while ((Math.Abs(dxl_goal_position[index] - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));

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
// Control table address
public const int ADDR_PRO_TORQUE_ENABLE          = 562;                 // Control table address is different in Dynamixel model
public const int ADDR_PRO_GOAL_POSITION          = 596;
public const int ADDR_PRO_PRESENT_POSITION       = 611;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` cs
// Protocol version
public const int PROTOCOL_VERSION                = 2;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int DXL_ID                          = 1;                   // Dynamixel ID: 1
public const int BAUDRATE                        = 1000000;
public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                        // ex) "COM1"   Linux: "/dev/ttyUSB0"

public const int TORQUE_ENABLE                   = 1;                   // Value for enabling the torque
public const int TORQUE_DISABLE                  = 0;                   // Value for disabling the torque
public const int DXL_MINIMUM_POSITION_VALUE      = -150000;             // Dynamixel will rotate between this value
public const int DXL_MAXIMUM_POSITION_VALUE      = 150000;              // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
public const int DXL_MOVING_STATUS_THRESHOLD     = 20;                  // Dynamixel moving status threshold

public const byte ESC_ASCII_VALUE                = 0x1b;
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

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
  int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result
  int[] dxl_goal_position = new int[2]{ DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE };         // Goal position

  byte dxl_error = 0;                                                   // Dynamixel error
  Int32 dxl_present_position = 0;                                       // Present position

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
  else
  {
    Console.WriteLine("Dynamixel has been successfully connected");
  }

  while (true)
  {
    Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
    if (Console.ReadKey().KeyChar == ESC_ASCII_VALUE)
      break;

    // Write goal position
    dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_GOAL_POSITION, (UInt32)dxl_goal_position[index]);
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
      // Read present position
      dxl_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_PRESENT_POSITION);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      Console.WriteLine("[ID: {0}] GoalPos: {1}  PresPos: {2}", DXL_ID, dxl_goal_position[index], dxl_present_position);

    } while ((Math.Abs(dxl_goal_position[index] - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));

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
int dxl_comm_result = COMM_TX_FAIL;                            // Communication result

byte dxl_error = 0;                                            // Dynamixel error
Int32 dxl_present_position = 0;                                // Present position
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_present_position` views where now it points out.

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
// Set operating mode to extended position control mode
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
}
else
{
  Console.WriteLine("Operating mode changed to extended position control mode.");
}
```

The controller sets the operating mode as Extended Position Control Mode(Multi-turn).

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
else
{
  Console.WriteLine("Dynamixel has been successfully connected");
}
```

As mentioned in the document, above code enables Dynamixel torque to set its status as being ready to move.

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
while (true)
{
  Console.WriteLine("Press any key to continue! (or press ESC to quit!)");
  if (Console.ReadKey(true).KeyChar == ESC_ASCII_VALUE)
      break;

  Console.WriteLine("  Press SPACE key to clear multi-turn information! (or press ESC to stop!)");

  // Write goal position
  dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
      Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
      Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
  }

  do
  {
    // Read present position
    dxl_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
    }

    Console.Write(string.Format("  [ID: {0}] GoalPos: {1}  PresPos: {2}", DXL_ID, MAX_POSITION_VALUE, dxl_present_position, Environment.NewLine));
    Console.Write("\r".PadLeft(Console.WindowWidth - Console.CursorLeft - 1));
    if (Console.KeyAvailable)
    {
      char c = Console.ReadKey().KeyChar;
      if (c == SPACE_ASCII_VALUE)
      {
        Console.WriteLine("\n  Stop & Clear Multi-Turn Information!");

        // Write the present position to the goal position to stop moving
        dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, (UInt32)dxl_present_position);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
        }

        System.Threading.Thread.Sleep(300);

        // Clear Multi-Turn Information
        dynamixel.clearMultiTurn(port_num, PROTOCOL_VERSION, DXL_ID);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
        }

        // Read present position
        dxl_present_position = (Int32)dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
        }

        Console.WriteLine("  Present Position has been reset. : {0} \n", dxl_present_position);

        break;
    }
    else if ( c == ESC_ASCII_VALUE)
    {
      Console.WriteLine("\n  Stopped!! \n");

      // Write the present position to the goal position to stop moving
      dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, (UInt32)dxl_present_position);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result)));
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
          Console.WriteLine(Marshal.PtrToStringAnsi(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error)));
      }

        break;
    }
  }
} while ((Math.Abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));
```


During `while()` loop, the controller writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `dxl_goal_position[index]` value to `ADDR_PRO_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRO_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading its present position will be ended when absolute value of `(dxl_goal_position[index] - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes its direction to the counter-wise and waits for extra key input.

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

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
