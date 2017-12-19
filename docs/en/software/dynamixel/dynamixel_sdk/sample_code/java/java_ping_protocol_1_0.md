---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_java_ping_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/java_ping_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 70"></div>
<div style="counter-reset: h1 3"></div>

## [Java Ping Protocol 1.0](#java-ping-protocol-10)

- Description

  This example tries to ping Dynamixel and shows the model number received from Dynamixel. The example is commonly used to check for Dynamixel connection or to get model number to refer its specification.

- Available Dynamixel

  All series using protocol 1.0

- Code Parts


``` java
/*
 * Ping.java
 *
 *  Created on: 2016. 6. 23.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Ping Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0
// This example is designed for using a Dynamixel MX-28, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel MX properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
//

import java.util.Scanner;

public class Ping
{
  public static void main(String[] args)
  {
    // Protocol version
    int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    byte DXL_ID                         = 1;                   // Dynamixel ID: 1
    int BAUDRATE                        = 1000000;
    String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                               // ex) "COM1"   Linux: "/dev/ttyUSB0"

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

    int dxl_comm_result = COMM_TX_FAIL;                       // Communication result

    byte dxl_error = 0;                                       // Dynamixel error
    int dxl_model_number;                                     // Dynamixel model number

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

    // Try to ping the Dynamixel
    // Get Dynamixel model number
    dxl_model_number = dynamixel.pingGetModelNum(port_num, PROTOCOL_VERSION, DXL_ID);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    System.out.printf("[ID: %d] ping Succeeded. Dynamixel model number : %d", DXL_ID, dxl_model_number);

    // Close port
    dynamixel.closePort(port_num);

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
// Protocol version
int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Default setting
byte DXL_ID                         = 1;                   // Dynamixel ID: 1
int BAUDRATE                        = 1000000;
String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/2.-Hardware-Settings), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

``` java
// Instead of getch
Scanner scanner = new Scanner(System.in);
```

This initializes instance for key detection.

``` java
// Initialize Dynamixel class for java
Dynamixel dynamixel = new Dynamixel();
```

This initializes Dynamixel class.  

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
int dxl_comm_result = COMM_TX_FAIL;                       // Communication result

byte dxl_error = 0;                                       // Dynamixel error
int dxl_model_number;                                     // Dynamixel model number
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_model_number` keeps Dynamixel model number.

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
}```

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
// Try to ping the Dynamixel
// Get Dynamixel model number
dxl_model_number = dynamixel.pingGetModelNum(port_num, PROTOCOL_VERSION, DXL_ID);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

`pingGetModelNum()` function orders to the #`DXL_ID` Dynamixel through #`port_num` port. Then, it receives the `dxl_model_number`. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
