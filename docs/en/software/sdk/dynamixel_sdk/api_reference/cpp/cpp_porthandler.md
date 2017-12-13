---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_cpp_porthandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_porthandler
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

## [CPP](#cpp)

### [CPP PortHandler](#cpp-porthandler)

- Description

Base class for serial communication.

- Members

| | |
| ------------- | ------------- |
| DEFAULT\_BAUDRATE\_ | :=1000000	Default Baudrate |
| is\_using\_ | Shows whether the port is in-use |


- Methods

| | |
| ------------- | ------------- |
| getPortHandler | Gets a child class (PortHandlerLinux or PortHandlerWindows) instance |
| ~PortHandler	| None |
| openPort	| Opens a serial port |
| closePort	| Closes a serial port |
| clearPort	| Refreshes a serial port |
| setPortName	| Sets a device name |
| getPortName	| Gets a device name |
| setBaudrate	| Sets a baudrate |
| getBaudrate	| Gets a baudrate |
| getBytesAvailable	| Checks how many bytes can be read in port buffer |
| readPort	| Reads bytes from port buffer |
| writePort	| Writes bytes to port buffer |
| setPacketTimeout	| Sets timeout|
| isPacketTimeout	| Checks whether communication has been succeeded in timeout |

- Enumerator

  None


#### Method References
----------------------------------------------
[Windows](/docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_porthandlerwindows)

[Linux](/docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_porthandlerlinux)

[Mac](/docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_porthandlermac)