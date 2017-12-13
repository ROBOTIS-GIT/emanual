---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_cpp_porthandlermac
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_porthandlermac
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 3"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [CPP PortHandlerMac](#cpp-porthandlermac)

##### openPort
- Syntax
```cpp
bool openPort()
```
- Parameters

   None

- Detailed Description

   This function opens the port by `setBaudRate()` function using `DEFAULT_BAUDRATE_`. If the baudrate is needed to be changed to another baudrate value, `setBaudRate()` function should be called after calling `openPort()` function. When the port succeeds to be opened, this function will return true, and if not, then false.


##### closePort
- Syntax
```cpp
void closePort()
```
- Parameters

  None

- Detailed Description

  This function closes the port by closing the file descriptor.


##### clearPort
- Syntax
```cpp
void clearPort()
```
- Parameters

  None

- Detailed Description

  This function clears the port by flushing the file descriptor.


##### setPortName
- Syntax
```cpp
void setPortName(const char* port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_name | Port name |


- Detailed Description

  This function sets the device name as port_name.


##### getPortName
- Syntax
```cpp
char* getPortName()
```
- Parameters

  None


- Detailed Description

  This function returns the device name which the port is using.


##### setBaudrate
- Syntax

```cpp
bool setBaudRate(const int baudrate)
```

- Parameters

| | |
| ------------- | ------------- |
| baudrate | Target baudrate |


- Description

  This function converts baudrate to baudrate type value at first. Secondly, it closes the port with `closePort()` function, and opens the port with `setupPort()` function again. If the value of baudrate is not in the baudrate list shown in the `getCFlagBaud()` function, the `setCustomBaudrate()` function suggests the baudrate value which is closest of available baudrate value. Finally, it returns false.


##### getBaudrate
- Syntax

```cpp
int getBaudRate()
```

- Parameters

  None


- Description

  This function returns the baudrate value previously set.  


##### getBytesAvailable
- Syntax

```cpp
int getBytesAvailable()
```

- Parameters

  None


- Description

  This function checks how much the data can be read, and returns its length.


##### readPort
- Syntax

```cpp
int readPort(UINT8_T* packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| packet	| The number of data bytes read previously |
| length	| Byte length for read |


- Description

  This function gets length byte data from port buffer and returns a number of read data bytes. On end-of-file, 0 is returned, on error it returns -1.


##### writePort
- Syntax

```cpp
int writePort(UINT8_T* packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| packet	| The number of data bytes to write |
| length	| Byte length for write |



- Description

  This function transmits length byte, and returns how much the data was written. On error, it returns -1.


##### setPacketTimeout
- Syntax

```cpp
void setPacketTimeout (UINT16_T packet_length)
void setPacketTimeout (double msec)
```

- Parameters

| | |
| ------------- | ------------- |
| Packet_length	| Target byte length for write  |
| msec	| Miliseconds |


- Description

  This function sets the start time when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.


##### isPacketTimeout
- Syntax

```cpp
bool isPacketTimeout ()
```

- Parameters

  None

- Description

  This function decides the timeover of packet communication. If the time limit is over, it returns false.
