---
layout: archive
lang: en
ref: zigbee_sdk
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/embedded_sdk/zigbee_sdk/
sidebar:
  title: ZIGBEE SDk
  nav: "zigbee_sdk"
---

# [Introduction](#introduction)

Zigbee SDK is a standard programming library to develop S/W communicates with RoboPlus Task with RoboPlus Task code. The characteristics of Zigbee SDK are as below.
- It has outstanding portability in each platform since written in C language.
- It is easy to perform platform porting since it is written in both platform independent and dependent sources.
- The interface is standardized; thus, the developed software can be used again even if the controller is different.

# [API Reference](#api-reference)

## [Device Control Method](#device-control-method)
Functions to control the communication devices

### [zgb_initialize](#zgb-initialize)

It initializes the communication devices and makes ready status.
 
```c
int zgb_initialize( 
  int devIndex , 
);
```

#### Parameters

- devIndex : It is the number of currently connected communication devices. (It may vary depending on each platform.)  
  For example, Windows distinguishes devices by COM port.
 
#### Return Values

- If the value is 1, it means success; if the value is 0, it means failure.
 
#### Example

It shows how to initialize in Windows environment using COM3 port.

```c
#define DEFAULT_PORTNUM 3   // COM3 

int result; 
result =  dxl_initialize( DEFAULT_PORTNUM); 

if( result == 1) 
{ 
  // Succeed to open Zig2Serial
}
else if( result == 0 )
{
  // Failed to open Zig2Serial
}
```

### [zgb_terminate](#zgb-terminate)

It terminates the communication devices.
 
```c
void zgb_terminate();
```

#### Parameters

- None
 
#### Return Values

- None
 
#### Example

```c
zgb_terminate();
```
 
## [Communication Method](#communication-method)
Functions to transmit and receive the packet

### [zgb_tx_data](#zgb-tx-data)

It initializes the communication devices and makes ready status.

```c 
int zgb_tx_data( 
  int data , 
);
```
 
#### Parameters

- data : The data values to be transmitted. If it has the effects of controlling with RC-100, the button value declared in advance can be used.

|Value|Name|Contents|
|:---:|:---:|:---:|
|1|RC100_BTN_U|Pressed value- U Button|
|2|RC100_BTN_D|Pressed value- D Button|
|4|RC100_BTN_L|Pressed value- L Button|
|8|RC100_BTN_R|Pressed value- R Button|
|16|RC100_BTN_1|Pressed value- Button 1|
|32|RC100_BTN_2|Pressed value- Button 2|
|64|RC100_BTN_3|Pressed value- Button 3|
|128|RC100_BTN_4|Pressed value- Button 4|
|256|RC100_BTN_5|Pressed value- Button 5|
|512|RC100_BTN_6|Pressed value- Button 6|
 
#### Return Values

- If the value is 1, it means success; if the value is 0, it means failure.
 
#### Example

```c
int TxData; 
int result 
TxData = 1; 
  
result = zgb_tx_data(TxData); 
  
if( result == 0) 
{ 
   // Failed to transmit 
} 
  
else if( result ==1) 
{ 
   // Succeed to transmit 
}
```

### [zgb_rx_check](#zgb-rx-check)

It checks whether the data is arrived to the communication devices or not.
 
```c
int zgb_rx_check();
```
 
#### Parameters

- None
 
#### Return Values

- If the value is 1, there is a received data; if the value is 0, there is no received data.
 
#### Example

```c
int resut;
result = zgb_rx_check();
if( result == 1 )
{
  // Succeed to data recieved
}
else if( result == 0 )
{
  // Failed to data recieved
}
```

### [zgb_rx_data](#zgb-rx-data)

It receives data from the communication devices.  First of all, the data reception must be chacked using zgb_rx_check in order to receive the latest data.

```c 
int zgb_rxdata( );
```
 
#### Parameters

- None
 
#### Return Values

- The most recently received data value.  
  The button value declared in advance can be used to receive the button values from RC-100.

|Value|Name|Contents|
|:---:|:---:|:---:
|1|RC100_BTN_U|Pressed value- U Button|
|2|RC100_BTN_D|Pressed value- D Button|
|4|RC100_BTN_L|Pressed value- L Button|
|8|RC100_BTN_R|Pressed value- R Button|
|16|RC100_BTN_1|Pressed value- Button 1|
|32|RC100_BTN_2|Pressed value- Button 2|
|64|RC100_BTN_3|Pressed value- Button 3|
|128|RC100_BTN_4|Pressed value- Button 4|
|256|RC100_BTN_5|Pressed value- Button 5|
|512|RC100_BTN_6|Pressed value- Button 6|
 
#### Example

```c
int RxData;
 
if(zgb_rx_check() == 1)
{
  // Get data verified
  RxData = zgb_rx_data();
}
```

# [Platform Porting](#platform-porting)

Zigbee SDK provides sources so that the users can perform porting to various platforms.

- [Download ZIGBEE Porting SDK](http://support.robotis.com/en/baggage_files/zigbee_sdk/zigbee_sdk_porting_v1_00.zip)

## The Structure of Source

- Platform-independent Source  
  Platform-independent source is written in standard C language so as to be compiled in all C language compilers without H/W-dependent routine.   In this source, only the protocol-related contents are actualized to make instruction packet and analyze status packet.  The users, if there is no specific case, do not have to modify the contents of source.
  - Related Source File: zigbee.h, zigbee.c
  - Necessary File for Build: zgb_hal.h, zgb_hal.c

- Platform-dependent Source  
  Platform-dependent Source must include H/W-dependent routine in order to be actually operated in the controller.  If the users want to use Zigbee SDK in other unsupported platforms, the source must be modified.
  - Related Source File: zgb_hal.h, zgb_hal.c
 
If you want to do Porting, you must actualize the following functions depending on each platform.
- zgb_hal_open
- zgb_hal_close
- zgb_hal_tx
- zgb_hal_rx

## [zgb_hal_open](#zgb-hal-open)

It actualizes the available routine by initializing the communication devices.  
zgb_initialize activates the communication devices through  zgb_hal_open.
 
```c
int zgb_hal_open( 
  int devIndex, float baudrate 
)
```
 
#### Parameters

- devIndex : It is the number of currently connected communication devices. (It may vary pursuant to each platform.) For example, Windows distinguishes devices by COM Port.
- baudrate : It is the actual baudrate value.

#### Return Values

- The function returnes 1, if it is successful; otherwise , it returns 0.

## [zgb_hal_close](#zgb-hal-close)

It actualizes the routine that let other application programs use by terminating the communication devices.  
zgb_terminate terminates the communication devices through this function.

```c
void zgb_hal_close();
```
 
#### Parameters

- None

#### Return Values

- None

## [zgb_hal_tx](#zgb-hal-tx)

It actualizes the routine that transmits packet through the communication devices.
 
```c
int zgb_hal_tx( 
  unsigned char *pPacket, int numPacket 
);
```

#### Parameters

- pPacket : The pointer of the line includes the data to be trasmitted
- numPacket : The number of data to be transmitted

#### Return Values

- It returns the number of data actually transmitted.

## [zgb_hal_rx](#zgb-hal-rx)

It actualizes the routine that takes out packet from the received buffers of the communication devices.
 
```c
int zgb_hal_rx( 
  unsigned char *pPacket, int numPacket 
);
```
 
#### Parameters

- pPacket : The pointer of the line to save taken-out data
- numPacket : The number of data to be taken out

#### Return Values

- It returns the number of data actually taken out.

# [ZIG2Serial](#zig2serial)

## For Windows

- [Download ZIG2Serial SDK for 32bit Windows](http://support.robotis.com/en/baggage_files/zigbee_sdk/zigbee_sdk_win32_v1_02.zip)
- [Download ZIG2Serial SDK for 64bit Windows](http://support.robotis.com/en/baggage_files/zigbee_sdk/zigbee_sdk_win64_v1_02.zip)
 
### System Requirements
- OS : Windows XP/Vista/7 (32/64bit)
- Zig2Serial is required
- In case DLL loading is not available :  Needs to install Microsoft Visual C++ 2005 re-distribution package

### Composing Folder

- /bin : DLL files for Windows are included.
- /import : Necessary files for programming are included.
- /src : DLL sources are included.
- /example : Examples to control Zigbee for users' programming environment are included.
 
### Setting Environment Variables

If you want to execute a program developed by Zigbee SDK, zigbee.dll is required.  
zigbee.dll is included in bin folder of Zigbee SDK.  
If you register the location of zigbee.dll as an environment variable for Windows, dll is not necessary when the program is executed.  
If you do not want to register the location of dll as environment variables, the program and dll must be distributed together.
 
1. If you go into Control Panel - System -  Advanced, you can find Environment Variables button as below.

    ![](/assets/images/sw/sdk/zig2serial_sdk_014.png)
 
2. Find Path category in System Variables, and then click Edit button.

    ![](/assets/images/sw/sdk/zig2serial_sdk_015.png)
 
3. As the example below, add bin folder with semicolon to the end of existing variable values. **Please be careful not to change or delete the existing variable values.** The example shows the things are added, assuming the location of DLL file is C:\Project\bin.

    ![](/assets/images/sw/sdk/zig2serial_sdk_016.png)

## For Linux

- [Download ZIG2Serial SDK for Linux](http://support.robotis.com/en/baggage_files/zigbee_sdk/zigbee_sdk_linux_v1_00.zip)
 
### System Requirements
- OS : Over Linux Kernel 2.6.21 is recommended
- USB2Dynamixel and  Zig2Serial are required
 
### Composing Folder

- /include :  Header file for Zigbee SDK is included.
- /src : Zigbee SDK source file is included.
- /lib : Compiled library file is included.
- /example : Examples to control Zigbee are included.
 
### Zigbee SDK Build

If library is built by "make" command in ZigbeeSDK/src folder, it is automatically copied to ZigbeeSDK/lib.

## [Visual C++](#visual-c)

This is an example for Visual C++. This example has been tested in Visual Studio 2005.

### Setting Environment

The environment must be set in C++ to execute the examples.

#### Registering the Path

The location of Zigbee SDK must be registered in Visual Studio.
 
1. Select Tools -> Options in the menu.

    ![](/assets/images/sw/sdk/zig2serial_sdk_001.png)
 
2. Click Project & Solution -> VC++ Directory.

    ![](/assets/images/sw/sdk/zig2serial_sdk_002.png)
 
3. Change the "Directory mark of the next file" part as "Include File," and then add the ZigbeeSDK-installed folder by clicking the icon where "2" is marked. (For example, C:\ZigbeeSDK\import)

    ![](/assets/images/sw/sdk/zig2serial_sdk_003.png)
 
4. Change the "Directory mark of the next file" part as "Library File," and then add the ZigbeeSDK-installed folder by clicking the icon where "2" is marked. (For Example, C:\ZigbeeSDK\import)

    ![](/assets/images/sw/sdk/zig2serial_sdk_004.png)
 
#### Using Zigbee SDK

1. Include Header file. Add #include "zigbee.h" on source file.
2. Include Library file. Add #pragma comment(lib, "zigbee.lib") on source file, or add zigbee.lib on the module of Link tap's input in project characteristics.
3. Use functions.

Call the necessary functions from the source.  Please refer to API Reference on the usage of each function.

![](/assets/images/sw/sdk/zig2serial_sdk_005.png)

### Send/Receive Example

#### Preparation

Used Zigbee modules are set to 1:1 communication for each other.  
Download tsk file appropriate to the controller type so that the controller can respond.

- [Download CM100_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm510_echo.tsk)
- [Download CM700_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm700_echo.tsk)
 
#### Source

##### Initialization

```c
// Open device
if( zgb_initialize(DEFAULT_PORTNUM) == 0 )
{
  printf( "Failed to open Zig2Serial!\n" );
}
else
{
  printf( "Succeed to open Zig2Serial!\n" );
}
```

The source above checks whether the initialization is done properly or not.  
Since the initialization is succeeded, 1 is returned and if it is failed, 0 is returned, the failed source is included in "If" sentence, and the succeeded source goes to "Else" sentence.
zgb_initialize is called from Zigbee API.  
DEFAULT_PORTNUM means the number of a connected device.  
DEFAULT_PORTNUM must be set depending on the user's system status, and it is originally set to COM3.
 
##### Termination

```c
// Close device
zgb_terminate();
```

The source above terminates communication with the controller's communication device. zgb_terminate is called from Zigbee API.
 
##### Tramsmitting Pakcet

```c
if (zgb_tx_data(TxData) == 0)
{
  printf( "Failed to transmit\n" );
}
```

The source above makes Zigbee module to transmit the packet to the controller.  
Using zgb_tx_data function among Zigbee API, the users transmit packets and the results are returned.  
If the returned value is 1, the transmission is successful, and if it is 0, it means transmission failure.  
TxData means the value users transmit to the controller.
 
##### Receiving Packet

```c
for( i=0; i < TIMEOUT_TIME; i++)
{
  // Verify data recieved
  if(zgb_rx_check() == 1)
  {
    // Get data verified
    RxData = zgb_rx_data();
    printf( "Recieved: %d\n", RxData );
    break;
  }
  Sleep(1);
}
```

The source above makes Zigbee module to receive the packet from the controller.  
Using zgb_rx_check function, the users check whether the packet is received or not.  
If the returned value is 1, the reception is successful, and if it is 0, it means the reception failure.  
If the packet is received (if the returned value is 1), using zgb_rx_data function, the received data is saved in RxData variable.  
If the packet is not received, it spins the loop as much as the TIMEOUT_TIME using Sleep() function after providing the delay time of 1ms.  
TIMEOUT_TIME is initially set to 1000, and the packet is waited for 1 second in this example source.

## [Visual Basic](#visual-basic)

This is an example for Visual Basic.
This example has been tested in Visual Studio 2005.

### Setting Environment

The environment must be set in Visual Basic to execute the examples.

#### Using Zigbee SDK

1. In the Solution Browser, selcect Add -> Existing Category by clicking the right button of the mouse on the Projct File name.
 
    ![](/assets/images/sw/sdk/zig2serial_sdk_006.png)
 
2. Add zigbee.vb file.  zigbee.vb is in the import folder where ZigbeeSDK is saved. (For example, C:\ZigbeeSDK\import\zigbee.vb)

    ![](/assets/images/sw/sdk/zig2serial_sdk_007.png)
 
3. Check whether the zigbee.vb is added or not.

    ![](/assets/images/sw/sdk/zig2serial_sdk_008.png)
 
4. Use ZigbeeAPI functions. Please refer to API Reference on the usage of each function.

    ![](/assets/images/sw/sdk/zig2serial_sdk_009.png)

### Send/Receive Example

#### Preparation

Used Zigbee modules are set to 1:1 communication for each other. Download tsk file appropriate to the controller type so that the controller can respond.
- [Download CM100_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm510_echo.tsk)
- [Download CM700_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm700_echo.tsk)
 
#### Source

##### Initialization

```
'Open device
If (zgb_initialize(DEFAULT_PORTNUM) = 0) Then
  Console.WriteLine("Failed to open Zig2Serial!")
  Exit Sub
Else
  Console.WriteLine("Succeed to open Zig2Serial!")
End If
```

The source above checks whether the initialization is done properly or not.  
Since the initialization is succeeded, 1 is returned and if it is failed, 0 is returned, the failed source is included in "If" sentence, and the succeeded source goes to "Else" sentence.  
zgb_initialize is called from Zigbee API.  
DEFAULT_PORTNUM means the number of a connected device.  
DEFAULT_PORTNUM must be set depending on the user's system status, and it is originally set to COM3.
 
##### Termination

```
'Close device
zgb_terminate()
```

The source above terminates communication with the controller's communication device. zgb_terminate is called from Zigbee API.
 
##### Transmitting Packet

```
If (zgb_tx_data(TxData) = 0) Then
  Console.WriteLine("Failed to transmit")
End If
```

The source above makes Zigbee module to transmit the packet to the controller.  
Using zgb_tx_data function among Zigbee API, the users transmit packets and the results are returned.  
If the returned value is 1, the transmission is successful, and if it is 0, it means transmission failure.  
TxData means the value users transmit to the controller.
 
##### Receiving Packet

```
For i = 1 To TIMEOUT_TIME
  'Verify data recieved
  If (zgb_rx_check() = 1) Then
    'Get data verified
    RxData = zgb_rx_data()
    Console.WriteLine("Recieved: " & RxData & "")
    Exit For
  End If
  Sleep(1)
Next i
```
           
The source above makes Zigbee module to receive the packet from the controller.  
Using zgb_rx_check function, the users can check whether the packet is received or not.  
If the returned value is 1, the reception is successful, and if it is 0, it means reception failure.  
If the packet is received (if the returned value is 1), using zgb_rx_data function, the received data is saved in RxData variable.  
If the packet is not received, it spins the loop as long as the Timeout_Time using Sleep() function after providing the delay time of 1ms.  
TIMEOUT_TIME is initially set to 1000, and the packet is waited for 1 second in this example source.

## [Visual C Sharp(#)](#visual-c-sharp)

This is an example for Visual C#. This example has been tested in Visual Studio 2005.

### Setting Environment

The environment must be set in Visual C# to execute the examples.

#### Using Zigbee SDK

1. In the Solution Browser, select Add -> Existing Category by clicking the right button of the mouse on the Project File name.

    ![](/assets/images/sw/sdk/zig2serial_sdk_010.png)

2. Add Zigbee.cs file.  Zigbee.cs is in the import folder where ZigbeeSDK is saved. (For example, C:\ZigbeeSDK\import\Zigbee.cs)

    ![](/assets/images/sw/sdk/zig2serial_sdk_011.png)
 
3. Check whether the Zigbee.cs is added or not.

    ![](/assets/images/sw/sdk/zig2serial_sdk_012.png)
 
4. Add using ROBOTIS, and then use ZigbeeAPI funcitons. Please refer to API Reference on the usage of each function.
 
    ![](/assets/images/sw/sdk/zig2serial_sdk_013.png)
 
### Send_Receive

#### Preparation

Used Zigbee modules are set to 1:1 communication for each other. Download tsk file appropriate to the controller type so that it can respond.
- [Download CM100_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm100_echo.tsk)
- [Download CM5_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm5_echo.tsk)
- [Download CM510_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm510_echo.tsk)
- [Download CM700_Echo.tsk](http://support.robotis.com/en/baggage_files/zigbee_sdk/cm700_echo.tsk)
 
#### Source

##### Initialization

```c
// Open device
if (zigbee.zgb_initialize(DEFAULT_PORTNUM) == 0)
{
  printf( "Failed to open Zig2Serial!\n" );
}
else
{
  printf( "Succeed to open Zig2Serial!\n" );
}
```

The source above checks whether the initialization is done properly or not.  
Since the initialization is succeeded, 1 is returned and if it is failed, 0 is returned, the failed source is included in "If" sentence, and the succeeded source goes to "Else" sentence.  
zgb_initialize is called from Zigbee API.  
DEFAULT_PORTNUM means the number of a connected device.  
DEFAULT_PORTNUM must be set depending on the user's system status, and it is originally set to COM3.
 
##### Termination

```c
// Close device
zigbee.zgb_terminate();
```

The source above terminates communication with the controller's communication device. zgb_terminate is called from Zigbee API.
 
##### Transmitting Packet

```c
if (zigbee.zgb_tx_data(TxData) == 0)
{
  Console.WriteLine("Failed to transmit");
}
```

The source above makes Zigbee module to transmit the packet to the controller.  
Using zgb_tx_data function among Zigbee API Functions, the users transmit packets and the results are returned.  
If the returned value is 1, the transmission is successful, and if it is 0, it means transmission failure.  
TxData means the value users transmit to the controller.
 
##### Receiving Packet

```c
for( i=0; i < TIMEOUT_TIME; i++)
{
  // Verify data recieved
  if(zigbee.zgb_rx_check() == 1)
  {
    // Get data verified
    RxData = zigbee.zgb_rx_data();
    Console.WriteLine("Recieved: {0:d}", RxData);
    break;
  }
  Thread.Sleep(1);
}
```

The source above makes Zigbee module to receive the packet from the controller.  
Using zgb_rx_check function, the users check whether the packet is received or not.  
If the returned value is 1, the reception is successful, and if it is 0, it means reception failure.  
If the packet is received (if the returned value is 1), using zgb_rx_data function, the received data is saved in RxData variable.  
If the packet is not received, it spins the loop as much as the Timeout_Time using Sleep() function after providing the delay time of 1ms.  
TIMEOUT_TIME is initially set to 1000, and the packet is waited for 1 second in this example source.

## [gcc](#gcc)

Linux gcc used for this example.
 
### Setting Environment

#### Using Zigbee API

1. Designate header file. Add #include \<zigbee.h> to source file.
2. Call functions. Call necessary functions for the source.  Please refer to API Reference on the usage of each function.
 
### Send/Receive Example

#### Preparation

Zig2Serial and ZIG-100 must be connected to USB2Dynamixel.  
Also, there must be the controller or other communication device which can communicatte with ZIG-100 communication module connected to Zig2Serial.

#### Source

##### Initialization

```c
if( zgb_initialize(DEFAULT_DEVICEINDEX) == 0 )
{
  printf( "Failed to open Zig2Serial!\n" );
  printf( "Press any key to terminate...\n" );
  getchar();
  return 0;
}
else
  printf( "Succeed to open Zig2Serial!\n" );
```

The source above checks whether the initialization is done properly or not.  
Since the initialization is succeeded, 1 is returned and if it is failed, 0 is returned, the failed source is included in "If" sentence, and the succeeded source goes to "Else" sentence.  
zgb_initialize is called from zigbee API.  
DEFAULT_DEVICEINDEX is the device index of Linux communication devices; the basic value is 1.  
DEFAULT_DEVICEINDEX must be set appropriately to the users' status.  
Baud Rate is fixed to 57600.
 
##### Termination

```c
// Close device
zgb_terminate();
```

The source is for termination. The connection is terminated by calling zgb_teminate function from zigbee API.
 
##### Transmitting Data

```c
// Wait user's input
printf( "Input number to transmit: " );
if(scanf("%d", &TxData));
  // Transmit data
if(zgb_tx_data(TxData) == 0)
  printf( "Failed to transmit\n" );
```

The source above is to transmit the inputted values by users through zigbee. zgb_tx_data function is called form zigbee API.
 
##### Receiving Data

```c
for( i=0; i < TIMEOUT_TIME; i++)
{
  // Verify data recieved
  if(zgb_rx_check() == 1)
  {
    // Get data verified
    RxData = zgb_rx_data();
    printf( "Recieved: %d\n", RxData );
    break;
  }
  sleep(1);
}
```

The source above is to receive data before the set TIMEOUT. zgb_rx_check and  zgb_rx_data functions are called from zigbee API.

# [CM-510/700](#cm-510700)

Zigbee SDK for CM-510/700 is included in Embedded C.  
Please refer to [RC100/ZigBee]

[RC100/ZigBee]: /docs/kr/software/embedded_sdk/embedded_c_cm510/#rc-100zigbee
