---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_porthandlerwindows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlerwindows
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 1"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C PortHandlerWindows](#c-porthandlerwindows)

- Description

   PortHandler dependent functions for serial communication on Windows OS.

- Members

   None


- Methods

| | |
| ------------- | ------------- |
| **[portHandlerWindows](#porthandlerwindows)** | Initializes parameters for serial port control |
| **[openPortWindows](#openportwindows)**	| Opens a serial port |
| **[closePortWindows](#closeportwindows)**	| Closes a serial port |
| **[clearPortWindows](#clearportwindows)**	| Refreshes a serial port |
| **[setPortNameWindows](#setportnamewindows)**	| Sets a device name |
| **[getPortNameWindows](#getportnamewindows)**	| Gets a device name |
| **[setBaudrateWindows](#setbaudratewindows)**	| Sets a baudrate |
| **[getBaudrateWindows](#getbaudratewindows)**	| Gets a baudrate |
| **[readPortWindows](#readportwindows)**	| Reads bytes from port buffer |
| **[writePortWindows](#writeportwindows)**	| Writes bytes to port buffer |
| **[setPacketTimeoutWindows](#setpackettimeoutwindows)**	| Sets timeout |
| **[isPacketTimeoutWindows](#ispackettimeoutwindows)**	| Checks whether communication has been succeeded in timeout |


- Enumerator

   None



#### Method References
----------------------------------------------
##### portHandlerWindows
- Syntax
``` cpp
int portHandlerWindows(const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_name | Port name |

- Detailed Description

   The function initializes the parameters for port control. At first, this checks if the port with same device name is set already in the `portDataWindows` pointer struct. If it exists, the function returns the port number as what it has. If not, the function finds any free port, resize `portDataWindows` struct and start to initialize struct members.


##### openPortWindows
- Syntax
``` cpp
uint8_t openPortWindows(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

   This function opens the port by `SetBaudRateWindows` function using `DEFAULT_BAUDRATE`. If the baudrate is needed to be changed to another baudrate value, `SetBaudRateWindows` function should be called again after calling `openPortWindows` function. When the port succeeds to be opened, this function will return true, and if not, then false.


##### closePortWindows
- Syntax
``` cpp
void closePortWindows(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Detailed Description

  This function sets `serial_handle_` member of `portDataWindows` struct to `INVALID_HANDLE_VALUE` so that the #`port_num` port won't be activated.


##### clearPortWindows
- Syntax
``` cpp
void clearPortWindows(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |


- Detailed Description

  This function clears the port by purging the RX buffer.


##### setPortNameWindows
- Syntax
``` cpp
void setPortNameWindows(int port_num, const char *port_name)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num | Port number |
| port_name | Port name |


- Detailed Description

  This function sets the device name of the #`port_num` port as `port_name`.


##### getPortNameWindows
- Syntax
``` cpp
char *getPortNameWindows(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |


- Detailed Description

  This function returns the device name which the #`port_num` port is using.


##### setBaudrateWindows
- Syntax

``` cpp
uint8_t setBaudrateWindows(int port_num, const int baudrate)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| baudrate | Target baudrate |


- Description

  This function converts baudrate to baudrate type value at first. Secondly, it closes the port with ClosePort function, and opens the port with SetupPort function again. Finally, it returns port setup result.


##### getBaudrateWindows
- Syntax

``` cpp
int getBaudrateWindows(int port_num)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |

- Description

  This function returns the baudrate value previously set.  


##### readPortWindows
- Syntax

``` cpp
int readPortWindows(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes read previously |
| length	| Byte length for read |


- Description

  This function gets length byte data from port buffer and returns a number of read data bytes. On end-of-file, 0 is returned, on error it returns -1.


##### writePortWindows
- Syntax

``` cpp
int writePortWindows(int port_num, uint8_t *packet, int length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet	| The number of data bytes to write |
| length	| Byte length for write |



- Description

  This function transmits length byte, and returns how much the data was written. On error, it returns -1.


##### setPacketTimeoutWindows
- Syntax

``` cpp
void setPacketTimeoutWindows (int port_num, uint16_t packet_length)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| packet_length	| Target byte length for write  |


- Description

  This function sets the start time when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.


##### SetPacketTimeoutMSecWindows
- Syntax

``` cpp
void SetPacketTimeoutMSecWindows (int port_num, double msec)
```

- Parameters

| | |
| ------------- | ------------- |
| port_num| Port number |
| msec	| Miliseconds |


- Description

  This function sets the start time with `msec` milisecond value when it transmits the packet, and set the timeout of packet transmission to be ready for deciding communication result.

##### isPacketTimeoutWindows
- Syntax

``` cpp
uint8_t isPacketTimeoutWindows (int port_num)
```

- Parameters

  None

- Description

  This function decides the timeover of packet communication. If the time limit is over, it returns false.
