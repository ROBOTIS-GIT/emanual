---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_porthandlermac
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlermac/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 3"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C PortHandlerMac](#c-porthandlermac)

- Description

   PortHandler dependent functions for serial communication on Mac OS.

- Members

   None


- Methods

| | |
| ------------- | ------------- |
| **[portHandleMac](#porthandlermac)** | Initializes parameters for serial port control |
| **[openPortMac](#openportmac)**	| Opens a serial port |
| **[closePortMac](#closeportmac)**	| Closes a serial port |
| **[clearPortMac](#clearportmac)**	| Refreshes a serial port |
| **[setPortNameMac](#setportnamemac)**	| Sets a device name |
| **[getPortNameMac](#getportnamemac)**	| Gets a device name |
| **[setBaudrateMac](#setbaudratemac)**	| Sets a baudrate |
| **[getBaudrateMac](#getbaudratemac)**	| Gets a baudrate |
| **[getBytesAvailableMac](#getbytesavailablemac)**	| Checks how many bytes can be read in port buffer |
| **[readPortMac](#readportmac)**	| Reads bytes from port buffer |
| **[writePortMac](#writeportmac)**	| Writes bytes to port buffer |
| **[setPacketTimeoutMac](#setpackettimeoutmac)**	| Sets timeout |
| **[isPacketTimeoutMac](#ispackettimeoutmac)**	| Checks whether communication has been succeeded in timeout |


- Enumerator

   None



#### Method References
----------------------------------------------
##### portHandlerMac
- Syntax
``` cpp
int portHandlerMac(const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_name | Port name |

- Detailed Description

   The function initializes the parameters for port control. At first, this checks if the port with same device name is set already in the `portDataMac` pointer struct. If it exists, the function returns the port number as what it has. If not, the function finds any free port, resize `portDataMac` struct and start to initialize struct members.

##### openPortMac
- Syntax
``` cpp
uint8_t openPortMac(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

   This function opens the port by `SetBaudRateMac` function using `DEFAULT_BAUDRATE`. If the baudrate is needed to be changed to another baudrate value, `SetBaudRateMac` function should be called again after calling `OpenPortMac` function. When the port succeeds to be opened, this function will return true, and if not, then false.


##### closePortMac
- Syntax
``` cpp
void closePortMac(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function closes the port by closing the file descriptor.


##### clearPortMac
- Syntax
``` cpp
void clearPortMac(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function clears the port by flushing the file descriptor.


##### setPortNameMac
- Syntax
``` cpp
void setPortNameMac(int port_num, const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| port_name | Port name |

- Detailed Description

  This function sets the device name as port_name.


##### getPortNameMac
- Syntax
``` cpp
char *getPortNameMac(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function returns the device name which the port is using.


##### setBaudrateMac
- Syntax

``` cpp
uint8_t setBaudrateMac(int port_num, const int baudrate)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| baudrate | Target baudrate |


- Description

  This function converts `baudrate` to baudrate type value at first. Secondly, it closes the port with `ClosePortMac` function, and opens the port with `SetupPortMac` function again. If the value of `baudrate` is not in the compatible baudrate list, the `SetCustomBaudrateMac` function suggests the baudrate value which is closest of available baudrate value. Finally, it returns false.


##### getBaudrateMac
- Syntax

``` cpp
int getBaudrateMac(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function returns the baudrate value previously set.  


##### getBytesAvailableMac
- Syntax

``` cpp
int getBytesAvailableMac(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function checks how much the data can be read, and returns its length.


##### readPortMac
- Syntax

``` cpp
int readPortMac(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes read previously |
| length	| Byte length for read |


- Description

  This function gets length byte data from port buffer and returns a number of read data bytes. On end-of-file, 0 is returned, on error it returns -1.


##### writePortMac
- Syntax

``` cpp
int writePortMac(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes to write |
| length	| Byte length for write |



- Description

  This function transmits length byte, and returns how much the data was written. On error, it returns -1.


##### setPacketTimeoutMac
- Syntax

``` cpp
void setPacketTimeoutMac (int port_num, uint16_t packet_length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| Packet_length	| Target byte length for write  |


- Description

  This function sets the start time when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.


##### setPacketTimeoutMSecMac
- Syntax

``` cpp
void setPacketTimeoutMSecMac (int port_num, double msec)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| msec	| Miliseconds |


- Description

  This function sets the start time with `msec` milisecond value when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.

##### isPacketTimeoutMac
- Syntax

``` cpp
uint8_t isPacketTimeoutMac(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function decides the timeover of packet communication. If the time limit is over, it returns false.
