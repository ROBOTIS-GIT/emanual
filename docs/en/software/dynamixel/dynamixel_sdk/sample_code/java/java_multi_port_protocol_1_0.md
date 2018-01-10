---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_java_multi_port_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/java_multi_port_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 14"></div>
<div style="counter-reset: h3 1"></div>

# [Sample Code](#sample-code)

## [Java Protocol 1.0](#python-protocol-10)

### [Java Multi Port Protocol 1.0](#java-multi-port-protocol-10)

- Description

  This example writes goal position of Dynamixels connected with two ports, and reads their present position until Dynamixels stop moving.

- Available Dynamixel

  All series using protocol 1.0

- Code


``` java
/*
 * MultiPort.java
 *
 *  Created on: 2016. 6. 23.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Multi Port Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0
// This example is designed for using two Dynamixel MX-28, and two USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel MX properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
//

import java.util.Scanner;

public class MultiPort
{
  public static void main(String[] args)
  {
    // Control table address
    short ADDR_MX_TORQUE_ENABLE         = 24;                  // Control table address is different in Dynamixel model
    short ADDR_MX_GOAL_POSITION         = 30;
    short ADDR_MX_PRESENT_POSITION      = 36;

    // Protocol version
    int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    byte DXL1_ID                        = 1;                   // Dynamixel ID: 1
    byte DXL2_ID                        = 2;                   // Dynamixel ID: 2
    int BAUDRATE                        = 1000000;
    String DEVICENAME1                   = "/dev/ttyUSB0";     // Check which port is being used on your controller
    String DEVICENAME2                   = "/dev/ttyUSB1";     // ex) "COM1"   Linux: "/dev/ttyUSB0"

    byte TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
    byte TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
    short DXL_MINIMUM_POSITION_VALUE    = 100;                 // Dynamixel will rotate between this value
    short DXL_MAXIMUM_POSITION_VALUE    = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
    int DXL_MOVING_STATUS_THRESHOLD     = 10;                  // Dynamixel moving status threshold

    String KEY_FOR_ESCAPE               = "e";                 // Key for escape

    int COMM_SUCCESS                    = 0;                   // Communication Success result value
    int COMM_TX_FAIL                    = -1001;               // Communication Tx Failed

    // Instead of getch
    Scanner scanner = new Scanner(System.in);

    // Initialize Dynamixel class for java
    Dynamixel dynamixel = new Dynamixel();

    // Initialize PortHandler Structs
    // Set the port path
    // Get methods and members of PortHandlerLinux or PortHandlerWindows
    int port_num1 = dynamixel.portHandler(DEVICENAME1);
    int port_num2 = dynamixel.portHandler(DEVICENAME2);

    // Initialize PacketHandler Structs
    dynamixel.packetHandler();

    int index = 0;
    int dxl_comm_result = COMM_TX_FAIL;                         // Communication result
    short[] dxl_goal_position = new short[]{DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE};         // Goal position

    byte dxl_error = 0;                                         // Dynamixel error
    short dxl1_present_position = 0, dxl2_present_position = 0; // Present position

    // Open port1
    if (dynamixel.openPort(port_num1))
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

    // Open port2
    if (dynamixel.openPort(port_num2))
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


    // Set port1 baudrate
    if (dynamixel.setBaudRate(port_num1, BAUDRATE))
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

    // Set port2 baudrate
    if (dynamixel.setBaudRate(port_num1, BAUDRATE))
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

    // Enable Dynamixel#1 Torque
    dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }
    else
    {
      System.out.printf("Dynamixel#%d has been successfully connected\n", DXL1_ID);
    }

    // Enable Dynamixel#2 Torque
    dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }
    else
    {
      System.out.printf("Dynamixel#%d has been successfully connected\n", DXL2_ID);
    }

    while (true)
    {
      System.out.println("Press enter to continue! (or press e then enter to quit!)");
      if(scanner.nextLine().equals(KEY_FOR_ESCAPE))
        break;

      // Write Dynamixel#1 goal position
      dynamixel.write2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      // Write Dynamixel#2 goal position
      dynamixel.write2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
      {
        dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
      }

      do
      {
        // Read Dynamixel#1 present position
        dxl1_present_position = dynamixel.read2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        // Read Dynamixel#2 present position
        dxl2_present_position = dynamixel.read2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        System.out.printf("[ID: %d] GoalPos: %d  PresPos: %d [ID: %d] GoalPos: %d  PresPos: %d\n", DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position);

      } while ((Math.abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD) || (Math.abs(dxl_goal_position[index] - dxl2_present_position) > DXL_MOVING_STATUS_THRESHOLD));

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
    dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Disable Dynamixel#2 Torque
    dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Close port1
    dynamixel.closePort(port_num1);

    // Close port2
    dynamixel.closePort(port_num2);

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
short ADDR_MX_TORQUE_ENABLE         = 24;                  // Control table address is different in Dynamixel model
short ADDR_MX_GOAL_POSITION         = 30;
short ADDR_MX_PRESENT_POSITION      = 36;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` java
// Protocol version
int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Default setting
byte DXL1_ID                        = 1;                   // Dynamixel ID: 1
byte DXL2_ID                        = 2;                   // Dynamixel ID: 2
int BAUDRATE                        = 1000000;
String DEVICENAME1                   = "/dev/ttyUSB0";     // Check which port is being used on your controller
String DEVICENAME2                   = "/dev/ttyUSB1";     // ex) "COM1"   Linux: "/dev/ttyUSB0"

byte TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
byte TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
short DXL_MINIMUM_POSITION_VALUE    = 100;                 // Dynamixel will rotate between this value
short DXL_MAXIMUM_POSITION_VALUE    = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
int DXL_MOVING_STATUS_THRESHOLD     = 10;                  // Dynamixel moving status threshold

String KEY_FOR_ESCAPE               = "e";                 // Key for escape
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two Dynamixels `DXL1_ID`, `DXL2_ID` connected with each ports `DEVICENAME1`, `DEVICENAME2`

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

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
int port_num1 = dynamixel.portHandler(DEVICENAME1);
int port_num2 = dynamixel.portHandler(DEVICENAME2);
```

`portHandler()` function sets port path as `DEVICENAME1` and `DEVICENAME2` and get `port_num1` and `port_num2` each, and prepares an appropriate functions for port control in controller OS automatically. `port_num1` and `port_num2` would be used in many functions in the body of the code to specify the port for use.

``` java
// Initialize PacketHandler Structs
dynamixel.packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` java
int index = 0;
int dxl_comm_result = COMM_TX_FAIL;                         // Communication result
short[] dxl_goal_position = new short[]{DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE};         // Goal position

byte dxl_error = 0;                                         // Dynamixel error
short dxl1_present_position = 0, dxl2_present_position = 0; // Present position
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` view where now each Dynamixel points out.

``` java
// Open port1
if (dynamixel.openPort(port_num1))
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

// Open port2
if (dynamixel.openPort(port_num2))
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

First, controller opens #`port_num1` and #`port_num2` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` java
// Set port1 baudrate
if (dynamixel.setBaudRate(port_num1, BAUDRATE))
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

// Set port2 baudrate
if (dynamixel.setBaudRate(port_num1, BAUDRATE))
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

Secondly, the controller sets the communication `BAUDRATE` at #`port_num1` and #`port_num2` port opened previously.

``` java
// Enable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
else
{
  System.out.printf("Dynamixel#%d has been successfully connected\n", DXL1_ID);
}

// Enable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
else
{
  System.out.printf("Dynamixel#%d has been successfully connected\n", DXL2_ID);
}
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
while (true)
{
  System.out.println("Press enter to continue! (or press e then enter to quit!)");
  if(scanner.nextLine().equals(KEY_FOR_ESCAPE))
    break;

  // Write Dynamixel#1 goal position
  dynamixel.write2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  // Write Dynamixel#2 goal position
  dynamixel.write2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_GOAL_POSITION, dxl_goal_position[index]);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
  {
    dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
  }

  do
  {
    // Read Dynamixel#1 present position
    dxl1_present_position = dynamixel.read2ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Read Dynamixel#2 present position
    dxl2_present_position = dynamixel.read2ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    System.out.printf("[ID: %d] GoalPos: %d  PresPos: %d [ID: %d] GoalPos: %d  PresPos: %d\n", DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position);

  } while ((Math.abs(dxl_goal_position[index] - dxl1_present_position) > DXL_MOVING_STATUS_THRESHOLD) || (Math.abs(dxl_goal_position[index] - dxl2_present_position) > DXL_MOVING_STATUS_THRESHOLD));

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

`write2ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 2 byte of `dxl_goal_position[index]` value to `ADDR_MX_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.


`read2ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, requesting 2 bytes of value in `ADDR_MX_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading their present position will be ended when absolute value of `(dxl1_goal_position[index] - dxl1_present_position)` or `(dxl2_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` java
// Disable Dynamixel#1 Torque
dynamixel.write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num1, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num1, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}

// Disable Dynamixel#2 Torque
dynamixel.write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num2, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num2, PROTOCOL_VERSION)) != 0)
{
  dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
}
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
// Close port1
dynamixel.closePort(port_num1);

// Close port2
dynamixel.closePort(port_num2);

return;
```

Finally, ports become disposed.
