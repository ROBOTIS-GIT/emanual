---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_porthandlerlinux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlerlinux/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 2"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C PortHandlerLinux](#c-porthandlerlinux)

- Description

   PortHandler dependent functions for serial communication on Linux OS.

- Members

   None


- Methods

| | |
| ------------- | ------------- |
| **[portHandleLinux](#porthandlerlinux)** | Initializes parameters for serial port control |
| **[openPortLinux](#openportlinux)**	| Opens a serial port |
| **[closePortLinux](#closeportlinux)**	| Closes a serial port |
| **[clearPortLinux](#clearportlinux)**	| Refreshes a serial port |
| **[setPortNameLinux](#setportnamelinux)**	| Sets a device name |
| **[getPortNameLinux](#getportnamelinux)**	| Gets a device name |
| **[setBaudrateLinux](#setbaudratelinux)**	| Sets a baudrate |
| **[getBaudrateLinux](#getbaudratelinux)**	| Gets a baudrate |
| **[getBytesAvailableLinux](#getbytesavailablelinux)**	| Checks how many bytes can be read in port buffer |
| **[readPortLinux](#readportlinux)**	| Reads bytes from port buffer |
| **[writePortLinux](#writeportlinux)**	| Writes bytes to port buffer |
| **[setPacketTimeoutLinux](#setpackettimeoutlinux)**	| Sets timeout |
| **[isPacketTimeoutLinux](#ispackettimeoutlinux)**	| Checks whether communication has been succeeded in timeout |


- Enumerator

   None



#### Method References
----------------------------------------------
##### portHandlerLinux
- Syntax
``` cpp
int portHandlerLinux(const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_name | Port name |

- Detailed Description

   The function initializes the parameters for port control. At first, this checks if the port with same device name is set already in the `portDataLinux` pointer struct. If it exists, the function returns the port number as what it has. If not, the function finds any free port, resize `portDataLinux` struct and start to initialize struct members.

##### openPortLinux
- Syntax
``` cpp
uint8_t openPortLinux(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

   This function opens the port by `SetBaudRateLinux` function using `DEFAULT_BAUDRATE`. If the baudrate is needed to be changed to another baudrate value, `SetBaudRateLinux` function should be called again after calling `OpenPortLinux` function. When the port succeeds to be opened, this function will return true, and if not, then false.


##### closePortLinux
- Syntax
``` cpp
void closePortLinux(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function closes the port by closing the file descriptor.


##### clearPortLinux
- Syntax
``` cpp
void clearPortLinux(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function clears the port by flushing the file descriptor.


##### setPortNameLinux
- Syntax
``` cpp
void setPortNameLinux(int port_num, const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| port_name | Port name |

- Detailed Description

  This function sets the device name as port_name.


##### getPortNameLinux
- Syntax
``` cpp
char *getPortNameLinux(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function returns the device name which the port is using.


##### setBaudrateLinux
- Syntax

``` cpp
uint8_t setBaudrateLinux(int port_num, const int baudrate)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| baudrate | Target baudrate |


- Description

  This function converts `baudrate` to baudrate type value at first. Secondly, it closes the port with `ClosePortLinux` function, and opens the port with `SetupPortLinux` function again. If the value of `baudrate` is not in the compatible baudrate list, the `SetCustomBaudrateLinux` function suggests the baudrate value which is closest of available baudrate value. Finally, it returns false.


##### getBaudrateLinux
- Syntax

``` cpp
int getBaudrateLinux(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function returns the baudrate value previously set.  


##### getBytesAvailableLinux
- Syntax

``` cpp
int getBytesAvailableLinux(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function checks how much the data can be read, and returns its length.


##### readPortLinux
- Syntax

``` cpp
int readPortLinux(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes read previously |
| length	| Byte length for read |


- Description

  This function gets length byte data from port buffer and returns a number of read data bytes. On end-of-file, 0 is returned, on error it returns -1.


##### writePortLinux
- Syntax

``` cpp
int writePortLinux(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes to write |
| length	| Byte length for write |



- Description

  This function transmits length byte, and returns how much the data was written. On error, it returns -1.


##### setPacketTimeoutLinux
- Syntax

``` cpp
void setPacketTimeoutLinux (int port_num, uint16_t packet_length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| Packet_length	| Target byte length for write  |


- Description

  This function sets the start time when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.


##### setPacketTimeoutMSecLinux
- Syntax

``` cpp
void setPacketTimeoutMSecLinux (int port_num, double msec)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| msec	| Miliseconds |


- Description

  This function sets the start time with `msec` milisecond value when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.

##### isPacketTimeoutLinux
- Syntax

``` cpp
uint8_t isPacketTimeoutLinux(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function decides the timeover of packet communication. If the time limit is over, it returns false.
