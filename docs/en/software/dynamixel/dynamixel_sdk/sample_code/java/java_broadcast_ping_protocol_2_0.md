---
layout: archive
lang: en
ref: java_broadcast_ping_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/java_broadcast_ping_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 16"></div>
<div style="counter-reset: h3 6"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="java-protocol-20"><a href="#java-protocol-20">Java Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [Java Broadcast Ping Protocol 2.0](#java-broadcast-ping-protocol-20)

- Description

  This example tries to ping all Dynamixels that are connected to the controller, and shows which Dynamixel is successfully connected. The example is commonly used to check for Dynamixel’s connection at once.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` java
/*
 * BroadcastPing.java
 *
 *  Created on: 2016. 6. 23.
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

import java.util.Scanner;

public class BroadcastPing
{
  public static void main(String[] args)
  {
    // Protocol version
    int PROTOCOL_VERSION                = 2;                   // See which protocol version is used in the Dynamixel

    // Default setting
    int BAUDRATE                        = 1000000;
    String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                               // ex) "COM1"   Linux: "/dev/ttyUSB0"

    int MAX_ID                          = 252;                 // Maximum ID value
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

    int id;
    int dxl_comm_result = COMM_TX_FAIL;                       // Communication result

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

    // Try to broadcast ping the Dynamixel
    dynamixel.broadcastPing(port_num, PROTOCOL_VERSION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

    System.out.println("Detected Dynamixel :");
    for (id = 0; id < MAX_ID; id++)
    {
      if (dynamixel.getBroadcastPingResult(port_num, PROTOCOL_VERSION, id))
        System.out.printf("[ID: %d]\n", id);
    }

    // Close port
    dynamixel.closePort(port_num);

    return;
  }
}
```



#### Details

``` java
import java.util.Scanner;
```

The functions `Scanner.*` for I, are in the example code, and it uses `java.util.Scanner` library.

``` java
// Protocol version
int PROTOCOL_VERSION   = 2;                // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Default setting
int BAUDRATE                        = 1000000;
String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as Dynamixel ID, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

``` java
int MAX_ID                          = 252;                 // Maximum ID value
```

Dynamixel ID can be set with in the range from 1 to 252

``` java
int COMM_SUCCESS                    = 0;                   // Communication Success result value
int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

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
int dxl_comm_result = COMM_TX_FAIL;                   // Communication result
int id;
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`id` keeps Dynamixel id information.

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
// Try to broadcast ping the Dynamixel
dynamixel.broadcastPing(port_num, PROTOCOL_VERSION);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
```

`broadcastPing()` function shows the connection between controller and each Dynamixels from ID 1 to ID 253 through #`port_num` port.

``` java
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
