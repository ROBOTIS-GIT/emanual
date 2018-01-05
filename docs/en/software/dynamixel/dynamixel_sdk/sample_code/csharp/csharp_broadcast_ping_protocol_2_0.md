---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_csharp_broadcast_ping_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_broadcast_ping_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 46"></div>
<div style="counter-reset: h1 3"></div>

## [CSharp Broadcast Ping Protocol 2.0](#csharp-broadcast-ping-protocol-20)

- Description

  This example tries to ping all Dynamixels that are connected to the controller, and shows which Dynamixel is successfully connected. The example is commonly used to check for Dynamixel’s connection at once.

- Available Dynamixel

  All series using protocol 2.0

- Simple code


``` cs
/*
 * BroadcastPing.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     BroadcastPing Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 2.0
// This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
//

using System;
using dynamixel_sdk;

namespace broadcast_ping
{
  class BroadcastPing
  {
    // Protocol version
    public const int PROTOCOL_VERSION   = 2;                // See which protocol version is used in the Dynamixel

    // Default setting
    public const int BAUDRATE           = 1000000;
    public const string DEVICENAME      = "/dev/ttyUSB0";   // Check which port is being used on your controller
                                                            // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const byte ESC_ASCII_VALUE   = 0x1b;

    public const int MAX_ID             = 252;              // Maximum ID value
    public const int COMM_SUCCESS       = 0;                // Communication Success result value
    public const int COMM_TX_FAIL       = -1001;            // Communication Tx Failed

    static void Main(string[] args)
    {
      // Initialize PortHandler Structs
      // Set the port path
      // Get methods and members of PortHandlerLinux or PortHandlerWindows
      int port_num = dynamixel.portHandler(DEVICENAME);
      int id;
      // Initialize PacketHandler Structs
      dynamixel.packetHandler();

      int dxl_comm_result = COMM_TX_FAIL;                   // Communication result

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

      // Try to broadcast ping the Dynamixel
      dynamixel.broadcastPing(port_num, PROTOCOL_VERSION);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      Console.WriteLine("Detected Dynamixel :");
      for (id = 0; id < MAX_ID; id++)
      {
        if (dynamixel.getBroadcastPingResult(port_num, PROTOCOL_VERSION, id))
          Console.WriteLine("[ID: {0}]", id);
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

The functions `Console.*` for I/O, are in the example code, and it uses `System` namespace.

``` cs
using dynamixel_sdk;
```

All libraries of Dynamixel SDK are wrapped into the `dynamixel_sdk` namespace.

``` cs
// Protocol version
public const int PROTOCOL_VERSION   = 2;                // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int BAUDRATE           = 1000000;
public const string DEVICENAME      = "/dev/ttyUSB0";   // Check which port is being used on your controller
                                                        // ex) "COM1"   Linux: "/dev/ttyUSB0"
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as Dynamixel ID, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

``` cs
public const int MAX_ID             = 252;              // Maximum ID value
```

Dynamixel ID can be set with in the range from 1 to 252

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
  int id;
  // Initialize PacketHandler Structs
  dynamixel.packetHandler();

  int dxl_comm_result = COMM_TX_FAIL;                   // Communication result

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

  // Try to broadcast ping the Dynamixel
  dynamixel.broadcastPing(port_num, PROTOCOL_VERSION);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

  Console.WriteLine("Detected Dynamixel :");
  for (id = 0; id < MAX_ID; id++)
  {
    if (dynamixel.getBroadcastPingResult(port_num, PROTOCOL_VERSION, id))
      Console.WriteLine("[ID: {0}]", id);
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
int dxl_comm_result = COMM_TX_FAIL;                   // Communication result
int id;
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`id` keeps Dynamixel id information.

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
// Try to broadcast ping the Dynamixel
dynamixel.broadcastPing(port_num, PROTOCOL_VERSION);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
```

`broadcastPing()` function shows the connection between controller and each Dynamixels from ID 1 to ID 253 through #`port_num` port.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
