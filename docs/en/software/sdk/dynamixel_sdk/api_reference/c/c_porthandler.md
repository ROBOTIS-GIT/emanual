---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_porthandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandler
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>

# [API Reference](#api-reference)

## [C](#c)

### [C PortHandler](#c-porthandler)

- Description

Base functions for serial communication.

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

- Enumerator

  None

#### Method References
----------------------------------------------

[Windows](/docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlerwindows)

[Linux](/docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlerlinux)

[Mac](/docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_porthandlermac)