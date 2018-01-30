---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_csharp_reset_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/csharp_reset_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 8"></div>
<div style="counter-reset: h3 5"></div>

# [Sample Code](#sample-code)

## [CSharp Protocol 1.0](#csharp-protocol-10)

### [CSharp Reset Protocol 1.0](#csharp-reset-protocol-10)

- Description

  This example resets all settings of Dynamixel to default values as:

  * ID = 1

  * Baudrate=57600.

- Available Dynamixel

  All series using protocol 1.0

- Simple code


``` cs
/*
 * Reset.cs
 *
 *  Created on: 2016. 6. 20.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Factory Reset Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0
// This example is designed for using a Dynamixel MX-28, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
//

// Be aware that:
// This example resets all properties of Dynamixel to default values, such as %% ID : 1 / Baudnum : 34 (Baudrate : 57600)
//

using System;
using System.Threading;
using dynamixel_sdk;

namespace reset
{
  class Reset
  {
    // Control table address
    public const int ADDR_MX_BAUDRATE                = 4;                   // Control table address is different in Dynamixel model

    // Protocol version
    public const int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    public const int DXL_ID                          = 1;                   // Dynamixel ID: 1
    public const int BAUDRATE                        = 1000000;
    public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                            // ex) "COM1"   Linux: "/dev/ttyUSB0"

    public const int FACTORYRST_DEFAULTBAUDRATE      = 57600;               // Dynamixel baudrate set by factoryreset
    public const int NEW_BAUDNUM                     = 1;                   // New baudnum to recover Dynamixel baudrate as it was
    public const byte OPERATION_MODE                 = 0x00;                // Mode is unavailable in Protocol 1.0 Reset

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

      int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result

      byte dxl_error = 0;                                                   // Dynamixel error
      byte dxl_baudnum_read;                                                // Read baudnum

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

      // Read present baudrate of the controller
      Console.WriteLine("Now the controller baudrate is : {0}", dynamixel.getBaudRate(port_num));

      // Try factoryreset
      Console.WriteLine("[ID: {0}] Try factoryreset : ", DXL_ID);
      dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        Console.WriteLine("Aborted");
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        return;
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Wait for reset
      Console.WriteLine("Wait for reset...");
      Thread.Sleep(2000);

      Console.WriteLine("[ID: {0}] factoryReset Success!", DXL_ID);

      // Set controller baudrate to dxl default baudrate
      if (dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
      {
        Console.WriteLine("Succeed to change the controller baudrate to : {0}", FACTORYRST_DEFAULTBAUDRATE);
      }
      else
      {
        Console.WriteLine("Failed to change the controller baudrate");
        Console.WriteLine("Press any key to terminate...");
        Console.ReadKey();
        return;
      }

      // Read Dynamixel baudnum
      dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
        Console.WriteLine("[ID: {0}] Dynamixel baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
      }

      // Write new baudnum
      dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE, NEW_BAUDNUM);
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
        Console.WriteLine("[ID: {0}] Set Dynamixel baudnum to : {1}", DXL_ID, NEW_BAUDNUM);
      }

      // Set port baudrate to BAUDRATE
      if (dynamixel.setBaudRate(port_num, BAUDRATE))
      {
        Console.WriteLine("Succeed to change the controller baudrate to : {0}", BAUDRATE);
      }
      else
      {
        Console.WriteLine("Failed to change the controller baudrate");
        Console.WriteLine("Press any key to terminate...");
        Console.ReadKey();
        return;
      }

      Thread.Sleep(200);

      // Read Dynamixel baudnum
      dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
        Console.WriteLine("[ID: {0}] Dynamixel Baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
      }

      // Close port
      dynamixel.closePort(port_num);

      return;
    }
  }
}
```




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
// Control table address
public const int ADDR_MX_BAUDRATE                = 4;                   // Control table address is different in Dynamixel model
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` cs
// Protocol version
public const int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` cs
// Default setting
public const int DXL_ID                          = 1;                   // Dynamixel ID: 1
public const int BAUDRATE                        = 1000000;
public const string DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                                        // ex) "COM1"   Linux: "/dev/ttyUSB0"

public const int FACTORYRST_DEFAULTBAUDRATE      = 57600;               // Dynamixel baudrate set by factoryreset
public const int NEW_BAUDNUM                     = 1;                   // New baudnum to recover Dynamixel baudrate as it was
public const byte OPERATION_MODE                 = 0x00;                // Mode is unavailable in Protocol 1.0 Reset
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Since the factory reset recovers the Dynamixel control table items to the original state, the baudrate of controller serial port should be set to its changed baudrate(`FACTORYRST_DEFAULTBAUDRATE` : 57600 bps) as well. After that, controller sets its baudrate to the value (1000000 bps : `NEW_BAUDNUM` = 1) before factory reset.

In Protocol 1.0, only one mode that resets whole items is avaiable.

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

  int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result

  byte dxl_error = 0;                                                   // Dynamixel error
  byte dxl_baudnum_read;                                                // Read baudnum

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

  // Read present baudrate of the controller
  Console.WriteLine("Now the controller baudrate is : {0}", dynamixel.getBaudRate(port_num));

  // Try factoryreset
  Console.WriteLine("[ID: {0}] Try factoryreset : ", DXL_ID);
  dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    Console.WriteLine("Aborted");
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    return;
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Wait for reset
  Console.WriteLine("Wait for reset...");
  Thread.Sleep(2000);

  Console.WriteLine("[ID: {0}] factoryReset Success!", DXL_ID);

  // Set controller baudrate to dxl default baudrate
  if (dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  {
    Console.WriteLine("Succeed to change the controller baudrate to : {0}", FACTORYRST_DEFAULTBAUDRATE);
  }
  else
  {
    Console.WriteLine("Failed to change the controller baudrate");
    Console.WriteLine("Press any key to terminate...");
    Console.ReadKey();
    return;
  }

  // Read Dynamixel baudnum
  dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
    Console.WriteLine("[ID: {0}] Dynamixel baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
  }

  // Write new baudnum
  dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE, NEW_BAUDNUM);
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
    Console.WriteLine("[ID: {0}] Set Dynamixel baudnum to : {1}", DXL_ID, NEW_BAUDNUM);
  }

  // Set port baudrate to BAUDRATE
  if (dynamixel.setBaudRate(port_num, BAUDRATE))
  {
    Console.WriteLine("Succeed to change the controller baudrate to : {0}", BAUDRATE);
  }
  else
  {
    Console.WriteLine("Failed to change the controller baudrate");
    Console.WriteLine("Press any key to terminate...");
    Console.ReadKey();
    return;
  }

  Thread.Sleep(200);

  // Read Dynamixel baudnum
  dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
    Console.WriteLine("[ID: {0}] Dynamixel Baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
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
int dxl_comm_result = COMM_TX_FAIL;                                   // Communication result

byte dxl_error = 0;                                                   // Dynamixel error
byte dxl_baudnum_read;                                                // Read baudnum
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_baudnum_read` keeps Dynamixel baudrate.

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

```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.


``` cs
// Read present baudrate of the controller
Console.WriteLine("Now the controller baudrate is : {0}", dynamixel.getBaudRate(port_num));
```

`getBaudRate()` function shows which baudrate is used in #`port_num` port of the controller.

``` cs
dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  Console.WriteLine("Aborted");
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  return;
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

`factoryReset()` function orders to the #`DXL_ID` Dynamixel through `#port_num` port, executing it to be reset as `OPERATION_MODE` format. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.


``` cs
// Wait for reset
Console.WriteLine("Wait for reset...");
Thread.Sleep(2000);
```

Factory reset takes few seconds.

``` cs
// Set controller baudrate to dxl default baudrate
if (dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
{
  Console.WriteLine("Succeed to change the controller baudrate to : {0}", FACTORYRST_DEFAULTBAUDRATE);
}
else
{
  Console.WriteLine("Failed to change the controller baudrate");
  Console.WriteLine("Press any key to terminate...");
  Console.ReadKey();
  return;
}
```

Controller should change its baudrate itself to do the communication with initialized Dynamixel.

``` cs
// Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
  Console.WriteLine("[ID: {0}] Dynamixel baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
}
```

This shows that reconnection between controller and Dynamixel is happened by adjusting the baudrate.


``` cs
// Write new baudnum
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE, NEW_BAUDNUM);
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
  Console.WriteLine("[ID: {0}] Set Dynamixel baudnum to : {1}", DXL_ID, NEW_BAUDNUM);
}
```

To make the Dynamixel into previous condition, `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` cs
// Set port baudrate to BAUDRATE
if (dynamixel.setBaudRate(port_num, BAUDRATE))
{
  Console.WriteLine("Succeed to change the controller baudrate to : {0}", BAUDRATE);
}
else
{
  Console.WriteLine("Failed to change the controller baudrate");
  Console.WriteLine("Press any key to terminate...");
  Console.ReadKey();
  return;
}

Thread.Sleep(200);

// Read Dynamixel baudnum
dxl_baudnum_read = dynamixel.read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_MX_BAUDRATE);
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
  Console.WriteLine("[ID: {0}] Dynamixel Baudnum is now : {1}", DXL_ID, dxl_baudnum_read);
}
```

These changes controller baudrate and verify that the Dynamixel has been successfully set into previous state.

``` cs
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
