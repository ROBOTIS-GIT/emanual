---
layout: archive
lang: en
ref: java_sync_write_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/java_sync_write_protocol_1_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 15"></div>
<div style="counter-reset: h3 2"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="java-protocol-10"><a href="#java-protocol-10">Java Protocol 1.0</a></h2>
<![end dummy Header 1]-->

### [Java Sync Write Protocol 1.0](#java-sync-write-protocol-10)

- Description

  This example writes goal positions to two DYNAMIXEL's simultaneously and repeats to read each present positions until DYNAMIXEL stop moving. The funtions that are related with the Syncwrite handle the number of items that are near to each other in the Dynamixel control table on multiple DYNAMIXEL's, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

#### Sample code Parts


``` java
/*
 * SyncWrite.java
 *
 *  Created on: 2016. 6. 23.
 *      Author: Ryu Woon Jung (Leon)
 */

//
// *********     Sync Write Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0
// This example is designed for using two Dynamixel MX-28, and an USB2DYNAMIXEL.
// To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
// Be sure that Dynamixel MX properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 1000000 [1M])
//

import java.util.Scanner;

public class SyncWrite
{
  public static void main(String[] args)
  {
    // Control table address
    short ADDR_MX_TORQUE_ENABLE         = 24;                  // Control table address is different in Dynamixel model
    short ADDR_MX_GOAL_POSITION         = 30;
    short ADDR_MX_PRESENT_POSITION      = 36;

    // Data Byte Length
    short LEN_MX_GOAL_POSITION          = 2;

    // Protocol version
    int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

    // Default setting
    byte DXL1_ID                        = 1;                   // Dynamixel ID: 1
    byte DXL2_ID                        = 2;                   // Dynamixel ID: 2
    int BAUDRATE                        = 1000000;
    String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                               // ex) "COM1"   Linux: "/dev/ttyUSB0"

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
    int port_num = dynamixel.portHandler(DEVICENAME);

    // Initialize PacketHandler Structs
    dynamixel.packetHandler();

    // Initialize Groupsyncwrite instance
    int group_num = dynamixel.groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_MX_GOAL_POSITION, LEN_MX_GOAL_POSITION);

    int index = 0;
    int dxl_comm_result = COMM_TX_FAIL;                         // Communication result
    Boolean dxl_addparam_result = false;                        // AddParam result
    short[] dxl_goal_position = new short[]{DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE};         // Goal position

    byte dxl_error = 0;                                         // Dynamixel error
    short dxl1_present_position = 0, dxl2_present_position = 0; // Present position

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
      System.out.printf("Dynamixel#%d has been successfully connected\n", DXL1_ID);
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
      System.out.printf("Dynamixel#%d has been successfully connected\n", DXL2_ID);
    }

    while (true)
    {
      System.out.println("Press enter to continue! (or press e then enter to quit!)");
      if(scanner.nextLine().equals(KEY_FOR_ESCAPE))
        break;

      // Add Dynamixel#1 goal position value to the Syncwrite storage
      dxl_addparam_result = dynamixel.groupSyncWriteAddParam(group_num, DXL1_ID, dxl_goal_position[index], LEN_MX_GOAL_POSITION);
      if (dxl_addparam_result != true)
      {
        System.out.printf("[ID: %d] groupSyncWrite addparam failed\n", DXL1_ID);
        return;
      }

      // Add Dynamixel#2 goal position value to the Syncwrite parameter storage
      dxl_addparam_result = dynamixel.groupSyncWriteAddParam(group_num, DXL2_ID, dxl_goal_position[index], LEN_MX_GOAL_POSITION);
      if (dxl_addparam_result != true)
      {
        System.out.printf("[ID: %d] groupSyncWrite addparam failed\n", DXL2_ID);
        return;
      }

      // Syncwrite goal position
      dynamixel.groupSyncWriteTxPacket(group_num);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

      // Clear syncwrite parameter storage
      dynamixel.groupSyncWriteClearParam(group_num);

      do
      {
        // Read Dynamixel#1 present position
        dxl1_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        // Read Dynamixel#2 present position
        dxl2_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
        }

        System.out.printf("[ID: %d] GoalPos:%d  PresPos:%d [ID: %d] GoalPos:%d  PresPos:%d\n", DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position);

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
```



#### Details

``` java
import java.util.Scanner;
```

The functions `Scanner.*` for I, are in the example code, and it uses `java.util.Scanner` library.

``` java
// Control table address
short ADDR_MX_TORQUE_ENABLE         = 24;                  // Control table address is different in Dynamixel model
short ADDR_MX_GOAL_POSITION         = 30;
short ADDR_MX_PRESENT_POSITION      = 36;

// Data Byte Length
short LEN_MX_GOAL_POSITION          = 2;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` java
// Protocol version
public const int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Protocol version
int PROTOCOL_VERSION                = 1;                   // See which protocol version is used in the Dynamixel

// Default setting
byte DXL1_ID                        = 1;                   // Dynamixel ID: 1
byte DXL2_ID                        = 2;                   // Dynamixel ID: 2
int BAUDRATE                        = 1000000;
String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"

byte TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
byte TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
short DXL_MINIMUM_POSITION_VALUE    = 100;                 // Dynamixel will rotate between this value
short DXL_MAXIMUM_POSITION_VALUE    = 4000;                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
int DXL_MOVING_STATUS_THRESHOLD     = 10;                  // Dynamixel moving status threshold

String KEY_FOR_ESCAPE               = "e";                 // Key for escape
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two DYNAMIXEL's `DXL1_ID`, `DXL2_ID` connected with the port `DEVICENAME`.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

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
// Initialize Groupsyncwrite instance
int group_num = dynamixel.groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_MX_GOAL_POSITION, LEN_MX_GOAL_POSITION);
```

`groupSyncWrite()` function initializes grouped parameters used for packet construction and packet storing. The utility functions of sync write deals simultaneously with more than one Dynamixel through #`port_num` port, building packets by the function which uses `PROTOCOL_VERSION`, and writing `LEN_MX_GOAL_POSITION` bytes of the values on the address `ADDR_MX_GOAL_POSITION`.

``` java
int index = 0;
int dxl_comm_result = COMM_TX_FAIL;                         // Communication result
Boolean dxl_addparam_result = false;                        // AddParam result
short[] dxl_goal_position = new short[]{DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE};         // Goal position

byte dxl_error = 0;                                         // Dynamixel error
short dxl1_present_position = 0, dxl2_present_position = 0; // Present position
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_addparam_result` indicates the result of parameter addition used for sync/bulk related functions  

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` view where now each Dynamixel points out.

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
  System.out.printf("Dynamixel#%d has been successfully connected\n", DXL1_ID);
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
  System.out.printf("Dynamixel#%d has been successfully connected\n", DXL2_ID);
}
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
while (true)
{
  System.out.println("Press enter to continue! (or press e then enter to quit!)");
  if(scanner.nextLine().equals(KEY_FOR_ESCAPE))
    break;

  // Add Dynamixel#1 goal position value to the Syncwrite storage
  dxl_addparam_result = dynamixel.groupSyncWriteAddParam(group_num, DXL1_ID, dxl_goal_position[index], LEN_MX_GOAL_POSITION);
  if (dxl_addparam_result != true)
  {
    System.out.printf("[ID: %d] groupSyncWrite addparam failed\n", DXL1_ID);
    return;
  }

  // Add Dynamixel#2 goal position value to the Syncwrite parameter storage
  dxl_addparam_result = dynamixel.groupSyncWriteAddParam(group_num, DXL2_ID, dxl_goal_position[index], LEN_MX_GOAL_POSITION);
  if (dxl_addparam_result != true)
  {
    System.out.printf("[ID: %d] groupSyncWrite addparam failed\n", DXL2_ID);
    return;
  }

  // Syncwrite goal position
  dynamixel.groupSyncWriteTxPacket(group_num);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);

  // Clear syncwrite parameter storage
  dynamixel.groupSyncWriteClearParam(group_num);

  do
  {
    // Read Dynamixel#1 present position
    dxl1_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    // Read Dynamixel#2 present position
    dxl2_present_position = dynamixel.read2ByteTxRx(port_num, PROTOCOL_VERSION, DXL2_ID, ADDR_MX_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      dynamixel.printTxRxResult(PROTOCOL_VERSION, dxl_comm_result);
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      dynamixel.printRxPacketError(PROTOCOL_VERSION, dxl_error);
    }

    System.out.printf("[ID: %d] GoalPos:%d  PresPos:%d [ID: %d] GoalPos:%d  PresPos:%d\n", DXL1_ID, dxl_goal_position[index], dxl1_present_position, DXL2_ID, dxl_goal_position[index], dxl2_present_position);

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

`groupSyncWriteAddParam()` function stores the Dynamixel ID and its `LEN_MX_GOAL_POSITION` bytes goal position `dxl_goal_position` to the syncwrite target Dynamixel list.

`groupSyncWriteTxPacket()` function sends an instruction to the Dynamixel #`DXL1_ID` and #`DXL2_ID` at the same time through #`port_num`, making it possible to write same pre-listed length bytes to same pre-listed address. The function checks Tx/Rx result.
`getLastTxRxResult()` function gets it, and then `printTxRxResult()` function shows result on the console window if any communication error has been occurred.

`groupSyncWriteClearParam()` function clears the Dynamixel list of groupsyncwrite.

`read2ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num` port, requesting 2 bytes of value in `ADDR_MX_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading their present position will be ended when absolute value of `(dxl_goal_position[index] - dxl1_present_position)` or `(dxl_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` java
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

The controller frees the DYNAMIXEL to be idle.

`write1ByteTxRx()` function sends an instruction to the #`DXL1_ID` and #`DXL2_ID` DYNAMIXEL in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` java
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.
