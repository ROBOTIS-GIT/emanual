---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_java_reset_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/sample_code/java_reset_protocol_1_0
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 71"></div>
<div style="counter-reset: h1 3"></div>

## [Java Reset Protocol 1.0](#java-reset-protocol-10)

- Description

  This example resets all settings of Dynamixel to default values as:

  * ID = 1

  * Baudrate=57600.

- Available Dynamixel

  All series using protocol 1.0

- Simple code


``` java
/*
 * Reset.java
 *
 *  Created on: 2016. 6. 23.
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

import java.util.Scanner;

public class Reset
{
  public static void main(String[] args)
  {
    // Control table address
    short ADDR_MX_BAUDRATE              = 4;                   // Control table address is different in Dynamixel model

    // Protocol version
    int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    byte DXL_ID                         = 1;                   // Dynamixel ID: 1-
    int BAUDRATE                        = 1000000;
    String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                               // ex) "COM1"   Linux: "/dev/ttyUSB0"

    int FACTORYRST_DEFAULTBAUDRATE      = 57600;               // Dynamixel baudrate set by factoryreset
    byte NEW_BAUDNUM                    = 1;                   // New baudnum to recover Dynamixel baudrate as it was
    byte OPERATION_MODE                 = 0x00;                // Mode is unavailable in Protocol 1.0 Reset

    int COMM_SUCCESS                    = 0;                   // Communication Success result value
    int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed

    // Instead of getch
    Scanner scanner = new Scanner(System.in);

    // Initialize Dynamixel class for java
    Dynamixel dynamixel = new Dynamixel();

    // Initialize PortHandler Structs
    // Set the port path
    // Get methods and members of PortHandlerLinux or PortHandlerWindows
    int port_num = dynamixel.portHandler(DEVICENAME);

    // Initialize PacketHandler Structs
    dynamixel.packetHandler();

    int dxl_comm_result = COMM_TX_FAIL;                        // Communication result

    byte dxl_error = 0;                                        // Dynamixel error
    byte dxl_baudnum_read;                                     // Read baudnum

    // Open port
    if (dynamixel.openPort(port_num))
    {
      System.out.println("Succeeded to open the port!");
    }
    else
    {
      System.out.println("Failed to open the port!");
      System.out.println("Press any key to terminate...");
      scanner.nextLine();
      return;
    }

    // Set port baudrate
    if (dynamixel.setBaudRate(port_num, BAUDRATE))
    {
      System.out.println("Succeeded to change the baudrate!");
    }
    else
    {
      System.out.println("Failed to change the baudrate!");
      System.out.println("Press any key to terminate...");
      scanner.nextLine();
      return;
    }

    // Read present baudrate of the controller
    System.out.printf("Now the controller baudrate is : %d\n", dynamixel.getBaudRate(port_num));

    // Try factoryreset
    System.out.printf("[ID: %d] Try factoryreset : \n", DXL_ID);
    dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      System.out.println("Aborted");
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      return;
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Wait for reset
    System.out.printf("Wait for reset...\n");
    try
    {
      Thread.sleep(2000);
    }
    catch (InterruptedException e)
    {
      System.out.println(e.getMessage());
    }

    System.out.printf("[ID: %d] factoryReset Success!\n", DXL_ID);

    // Set controller baudrate to dxl default baudrate
    if (dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
    {
      System.out.printf("Succeed to change the controller baudrate to : %d\n", FACTORYRST_DEFAULTBAUDRATE);
    }
    else
    {
      System.out.println("Failed to change the controller baudrate");
      System.out.println("Press any key to terminate...");
      scanner.nextLine();
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
      System.out.printf("[ID: %d] Dynamixel baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
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
      System.out.printf("[ID: %d] Set Dynamixel baudnum to : %d\n", DXL_ID, NEW_BAUDNUM);
    }

    // Set port baudrate to BAUDRATE
    if (dynamixel.setBaudRate(port_num, BAUDRATE))
    {
      System.out.printf("Succeed to change the controller baudrate to : %d\n", BAUDRATE);
    }
    else
    {
      System.out.println("Failed to change the controller baudrate");
      System.out.println("Press any key to terminate...");
      scanner.nextLine();
      return;
    }

    try {
      Thread.sleep(200);
    } catch (InterruptedException e) {
      System.out.println(e.getMessage());
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
      System.out.printf("[ID: %d] Dynamixel Baudnum is now : %d", DXL_ID, dxl_baudnum_read);
    }

    return;
  }
}
```


-------------------------------------------------------------------------------------

- Details

``` java
import java.util.Scanner;
```

The functions `Scanner.*` for I, are in the example code, and it uses `java.util.Scanner` library.

``` java
// Control table address
short ADDR_MX_BAUDRATE              = 4;                   // Control table address is different in Dynamixel model
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` java
// Protocol version
int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Default setting
byte DXL_ID                         = 1;                   // Dynamixel ID: 1-
int BAUDRATE                        = 1000000;
String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"

int FACTORYRST_DEFAULTBAUDRATE      = 57600;               // Dynamixel baudrate set by factoryreset
byte NEW_BAUDNUM                    = 1;                   // New baudnum to recover Dynamixel baudrate as it was
byte OPERATION_MODE                 = 0x00;                // Mode is unavailable in Protocol 1.0 Reset
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/2.-Hardware-Settings), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Since the factory reset recovers the Dynamixel control table items to the original state, the baudrate of controller serial port should be set to its changed baudrate(`FACTORYRST_DEFAULTBAUDRATE` : 57600 bps) as well. After that, controller sets its baudrate to the value (1000000 bps : `NEW_BAUDNUM` = 1) before factory reset.

In Protocol 1.0, only one mode that resets whole items is avaiable.

``` java
int COMM_SUCCESS                    = 0;                   // Communication Success result value
int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

``` java
// Initialize PortHandler Structs
// Set the port path
// Get methods and members of PortHandlerLinux or PortHandlerWindows
int port_num = dynamixel.portHandler(DEVICENAME);
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

``` java
// Initialize PacketHandler Structs
dynamixel.packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` java
int dxl_comm_result = COMM_TX_FAIL;                        // Communication result

byte dxl_error = 0;                                        // Dynamixel error
byte dxl_baudnum_read;                                     // Read baudnum
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_baudnum_read` keeps Dynamixel baudrate.

``` java
// Open port
if (dynamixel.openPort(port_num))
{
  System.out.println("Succeeded to open the port!");
}
else
{
  System.out.println("Failed to open the port!");
  System.out.println("Press any key to terminate...");
  scanner.nextLine();
  return;
}
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` java
// Set port baudrate
if (dynamixel.setBaudRate(port_num, BAUDRATE))
{
  System.out.println("Succeeded to change the baudrate!");
}
else
{
  System.out.println("Failed to change the baudrate!");
  System.out.println("Press any key to terminate...");
  scanner.nextLine();
  return;
}
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.

``` java
// Read present baudrate of the controller
System.out.printf("Now the controller baudrate is : %d\n", dynamixel.getBaudRate(port_num));
```

`getBaudRate()` function shows which baudrate is used in #`port_num` port of the controller.

``` java
// Try factoryreset
System.out.printf("[ID: %d] Try factoryreset : \n", DXL_ID);
dynamixel.factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  System.out.println("Aborted");
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


``` java
// Wait for reset
System.out.printf("Wait for reset...\n");
try
{
  Thread.sleep(2000);
}
catch (InterruptedException e)
{
  System.out.println(e.getMessage());
}
```

Factory reset takes few seconds.

``` java
// Set controller baudrate to dxl default baudrate
if (dynamixel.setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
{
  System.out.printf("Succeed to change the controller baudrate to : %d\n", FACTORYRST_DEFAULTBAUDRATE);
}
else
{
  System.out.println("Failed to change the controller baudrate");
  System.out.println("Press any key to terminate...");
  scanner.nextLine();
  return;
}
```

Controller should change its baudrate itself to do the communication with initialized Dynamixel.

``` java
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
  System.out.printf("[ID: %d] Dynamixel baudnum is now : %d\n", DXL_ID, dxl_baudnum_read);
}
```

This shows that reconnection between controller and Dynamixel is happened by adjusting the baudrate.


``` java
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
  System.out.printf("[ID: %d] Set Dynamixel baudnum to : %d\n", DXL_ID, NEW_BAUDNUM);
}
```

To make the Dynamixel into previous condition, `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
// Set port baudrate to BAUDRATE
if (dynamixel.setBaudRate(port_num, BAUDRATE))
{
  System.out.printf("Succeed to change the controller baudrate to : %d\n", BAUDRATE);
}
else
{
  System.out.println("Failed to change the controller baudrate");
  System.out.println("Press any key to terminate...");
  scanner.nextLine();
  return;
}

try
{
  Thread.sleep(200);
}
catch (InterruptedException e)
{
  System.out.println(e.getMessage());
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
  System.out.printf("[ID: %d] Dynamixel Baudnum is now : %d", DXL_ID, dxl_baudnum_read);
}
```

These changes controller baudrate and verify that the Dynamixel has been successfully set into previous state.

``` java
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
