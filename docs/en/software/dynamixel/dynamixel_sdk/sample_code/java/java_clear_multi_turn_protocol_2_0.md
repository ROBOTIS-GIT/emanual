---
layout: archive
lang: en
ref: java_clear_multi_turn_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/java_clear_multi_turn_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 16"></div>
<div style="counter-reset: h3 9"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="java-protocol-20"><a href="#java-protocol-20">Java Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [Java Clear Multi Turn Protocol 2.0](#java-clear-multi-turn-protocol-20)

- Description

  This example is that when Dynamixel operate `Extended Position Control Mode(Multi-turn)`, clear present position from 0 to 4028. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` java
/*
* ClearMultiTurn.java
*
*  Created on: 2018. 11. 23.
*      Author: Gilbert Ki Jong Gil
*/

//
// *********     Clear Multi-Turn Example      *********
//
//
// Available Dynamixel model on this example : MX with Protocol 2.0 (firmware v42 or above), Dynamixel X-series (firmware v42 or above)
// This example is designed for using a Dynamixel XM430-W350-R, and an U2D2.
// To use another Dynamixel model, such as MX series, see their details in E-Manual emanual.robotis.com) and edit below "#define"d variables yourself.
// Be sure that Dynamixel properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
//

import java.io.IOException;
import java.util.Scanner;

public class ClearMultiTurn
{	
  public static void main(String[] args) throws InterruptedException, IOException
  {  
    // Control table address
    short ADDR_OPERATING_MODE           = 11;				   // Control table address is different in Dynamixel model
    short ADDR_TORQUE_ENABLE            = 64;                
    short ADDR_GOAL_POSITION            = 116;
    short ADDR_PRESENT_POSITION         = 132;

    // Protocol version
    int PROTOCOL_VERSION                = 2;                   // See which protocol version is used in the Dynamixel

    // Default setting
    byte DXL_ID                         = 1;                   // Dynamixel ID: 1
    int BAUDRATE                        = 57600;
    String DEVICENAME                   = "COM1";              // Check which port is being used on your controller
                                                               // ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"

    byte TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
    byte TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
    int MAX_POSITION_VALUE              = 1048575;             
    int DXL_MOVING_STATUS_THRESHOLD     = 20;                  // Dynamixel moving status threshold
    byte EXT_POSITION_CONTROL_MODE      = 4;                   //  Value for extended position control mode (operating mode)
    

    String KEY_FOR_ESCAPE               = "e";                 // Key for escape
    String KEY_FOR_CONTINUE             = " ";				   // key for continue
    
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
    int dxl_present_position = 0;                              // Present position

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
    
    // Set operating mode to extended position control mode
    dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
    }
    else
    {
      System.out.println("Operating mode changed to extended position control mode. \n");
    }   
    
    // Enable Dynamixel Torque
    dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
    }
    else
    {
      System.out.println("Dynamixel has been successfully connected");
    }

    while (true)
    {
      System.out.println("\nPress enter to continue! (or press e then enter to quit!)");
          
      String ch = scanner.nextLine();
      if (ch.equals("e"))
        break;
      
	  System.out.println("\nPress SPACE key to clear multi-turn information! (or press ESC to stop!)\n");

	  // Write goal position
      dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE);
      if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
      {
        System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
      }
      else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
      {
        System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
      }

      do
      {
        // Read present position
        dxl_present_position = dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
        }
        
        System.out.printf("  [ID: %d] GoalPos:%d  PresPos:%d\n", DXL_ID, MAX_POSITION_VALUE, dxl_present_position);

        if (System.in.available() > 0)
        {
    	 
          String c = scanner.nextLine(); 	
          if(c.equals(KEY_FOR_CONTINUE))
          {
            System.out.printf("  Stop & Clear Multi-Turn Information! \n");   
            
            // Write the present position to the goal position to stop moving 
            dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position);
            if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            {
              System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            }
            else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
            {
              System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
            }
            
            Thread.sleep(300);
            
            // Clear Multi-Turn Information
            dynamixel.clearMultiTurn(port_num, PROTOCOL_VERSION, DXL_ID);
            if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            {
              System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            }
            else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
            {
              System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
            }
            
            // Read present position
            dxl_present_position = dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
            if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            {
              System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            }
            else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
            {
              System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
            }
            
            System.out.printf("  Present Position has been reset. : %03d \n", dxl_present_position); 
            
            break;
          }
          
          else if (c.equals(KEY_FOR_ESCAPE))
          {
        	System.out.printf("\n  Stopped!! ");
        	  
        	// Write the present position to the goal position to stop moving
        	dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position);
            if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
            {
              System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            }
            else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
            {
              System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
            }
              
            break;
          }
        }
        
      } while ((Math.abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));
    }

    // Disable Dynamixel Torque
    dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
    }

    // Close port
    dynamixel.closePort(port_num);

    return;
  }
}
```



#### Details

``` java
import java.io.IOException;
import java.util.Scanner;
```

The functions `Scanner.*` for I, are in the example code, and it uses `java.util.Scanner` library.

``` java
// Control table address
short ADDR_OPERATING_MODE           = 11;				           // Control table address is different in Dynamixel model
short ADDR_TORQUE_ENABLE            = 64;                
short ADDR_GOAL_POSITION            = 116;
short ADDR_PRESENT_POSITION         = 132;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` java
// Protocol version
int PROTOCOL_VERSION                = 2;                   // See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` java
// Default setting
byte DXL_ID                         = 1;                   // Dynamixel ID: 1
int BAUDRATE                        = 1000000;
String DEVICENAME                   = "/dev/ttyUSB0";      // Check which port is being used on your controller
                                                           // ex) "COM1"   Linux: "/dev/ttyUSB0"

byte TORQUE_ENABLE                  = 1;                   // Value for enabling the torque
byte TORQUE_DISABLE                 = 0;                   // Value for disabling the torque
int MAX_POSITION_VALUE              = 1048575;             
int DXL_MOVING_STATUS_THRESHOLD     = 20;                  // Dynamixel moving status threshold
byte EXT_POSITION_CONTROL_MODE      = 4;                   // Value for extended position control mode (operating mode)


String KEY_FOR_ESCAPE               = "e";                 // Key for escape
String KEY_FOR_CONTINUE             = " ";				         // key for continue
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.
`EXT_POSITION_CONTROL_MODE` acts as a position control Mode.

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
int dxl_comm_result = COMM_TX_FAIL;                        // Communication result

byte dxl_error = 0;                                        // Dynamixel error
int dxl_present_position = 0;                              // Present position
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_present_position` views where now it points out.

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
// Set operating mode to extended position control mode
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE);
if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
{
  System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
}
else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
{
  System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
}
else
{
  System.out.println("Operating mode changed to extended position control mode. \n");
}   
```

The controller sets the operating mode as Extended Position Control Mode(Multi-turn).


``` java
// Enable Dynamixel Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE);
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
  System.out.println("Dynamixel has been successfully connected");
}
```

As mentioned in the document, above code enables Dynamixel torque to set its status as being ready to move.

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

``` java
while (true)
{
  System.out.println("\nPress enter to continue! (or press e then enter to quit!)");
      
  String ch = scanner.nextLine();
  if (ch.equals("e"))
    break;
  
System.out.println("\nPress SPACE key to clear multi-turn information! (or press ESC to stop!)\n");

// Write goal position
  dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE);
  if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
  {
    System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
  }
  else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
  {
    System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
  }

  do
  {
    // Read present position
    dxl_present_position = dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
    if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
    {
      System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    }
    else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
    {
      System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
    }
    
    System.out.printf("  [ID: %d] GoalPos:%d  PresPos:%d\n", DXL_ID, MAX_POSITION_VALUE, dxl_present_position);

    if (System.in.available() > 0)
    {
    
      String c = scanner.nextLine(); 	
      if(c.equals(KEY_FOR_CONTINUE))
      {
        System.out.printf("  Stop & Clear Multi-Turn Information! \n");   
        
        // Write the present position to the goal position to stop moving 
        dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
        }
        
        Thread.sleep(300);
        
        // Clear Multi-Turn Information
        dynamixel.clearMultiTurn(port_num, PROTOCOL_VERSION, DXL_ID);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
        }
        
        // Read present position
        dxl_present_position = dynamixel.read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
        }
        
        System.out.printf("  Present Position has been reset. : %03d \n", dxl_present_position); 
        
        break;
      }
      
      else if (c.equals(KEY_FOR_ESCAPE))
      {
      System.out.printf("\n  Stopped!! ");
        
      // Write the present position to the goal position to stop moving
      dynamixel.write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, dxl_present_position);
        if ((dxl_comm_result = dynamixel.getLastTxRxResult(port_num, PROTOCOL_VERSION)) != COMM_SUCCESS)
        {
          System.out.println(dynamixel.getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        }
        else if ((dxl_error = dynamixel.getLastRxPacketError(port_num, PROTOCOL_VERSION)) != 0)
        {
          System.out.println(dynamixel.getRxPacketError(PROTOCOL_VERSION, dxl_error));
        }
          
        break;
      }
    }
    
  } while ((Math.abs(MAX_POSITION_VALUE - dxl_present_position) > DXL_MOVING_STATUS_THRESHOLD));
}
```

During `while()` loop, the controller wait to any key input for start `while()` and writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `MAX_POSITION_VALUE` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

`read4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

When the space key input, `write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `dxl_present_position` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either. And then `clearMultiTurn()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port.

Reading its present position will be ended when absolute value of `(MAX_POSITION_VALUE - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.  


``` java
// Disable Dynamixel Torque
dynamixel.write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE);
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

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

``` java
// Close port
dynamixel.closePort(port_num);

return;
```

Finally, port becomes disposed.