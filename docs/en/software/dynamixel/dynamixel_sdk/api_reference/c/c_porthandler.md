---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_porthandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_porthandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>

# [API Reference](#api-reference)

## [C](#c)

### [C PortHandler](#c-porthandler)

- Description : Base functions for serial communication.

- Members

| | |
| ------------- | ------------- |
| DEFAULT_BAUDRATE | :=1000000	Default Baudrate |
| g_used_port_num | Shows how much ports are in-use |
| g_is_using | Shows whether the port is in-use |


- Methods

| | |
| ------------- | ------------- |
| portHandler | Initializes members of port data pointer struct |
| openPort	| Opens a serial port |
| closePort	| Closes a serial port |
| clearPort	| Refreshes a serial port |
| setPortName	| Sets a device name |
| getPortName	| Gets a device name |
| setBaudrate	| Sets a baudrate |
| getBaudrate	| Gets a baudrate |
| getBytesAvailable	| Checks how many bytes can be read in port buffer (Linux only)|
| readPort	| Reads bytes from port buffer |
| writePort	| Writes bytes to port buffer |
| setPacketTimeout	| Sets timeout|
| setPacketTimeoutMSec	| Sets timeout using micro second value|
| isPacketTimeout	| Checks whether communication has been succeeded in timeout |

- Enumerator : None

#### Method References

- [PortHandler for Windows](#c-porthandlerwindows)
- [PortHandler for Linux](#c-porthandlerlinux)
- [PortHandler for Mac](#c-porthandlermac)

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
