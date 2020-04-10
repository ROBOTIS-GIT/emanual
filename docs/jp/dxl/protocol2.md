---
layout: archive
lang: en
ref: protocol2
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/protocol2/
sidebar:
  title: Protocol 2.0
  nav: "protocol2"
---

# [Introduction](#introduction)

- Protocol 2.0 supported devices: MX-28, MX-64, MX-106(MX Series with Firmware V39 or above), X Series (2X Series included), PRO Series, P Series. 
- Protocol 2.0 supported controllers: CM-50, CM-150, CM-200, OpenCM7.0, OpenCM9.04, CM-550, OpenCR
- Other: 2.0 protocol from R+ Smart app

**TIP** : See Protocol [Compatibility Table]{: .popup}.
{: .notice--success}

# [Instruction Packet](#instruction-packet)
Instruction Packet is the command data sent to the Device.

| Header1 | Header2 | Header3 | Reserved | Packet ID | Length1 | Length2 | Instruction |  Param  | Param |  Param  | CRC1  | CRC2  |
|:-------:|:-------:|:-------:|:--------:|:---------:|:-------:|:-------:|:-----------:|:-------:|:-----:|:-------:|:-----:|:-----:|
|  0xFF   |  0xFF   |  0xFD   |   0x00   |    ID     |  Len_L  |  Len_H  | Instruction | Param 1 |  ...  | Param N | CRC_L | CRC_H |

## [Header](#header)
The field indicates the start of the Packet

## [Reserved](#reserved)
0x00 (0xFD cannot be used)

## [Packet ID](#packet-id)
The field that indicates the ID of the Device that should receive the Instruction Packet and process it

  1. Range : 0 ~ 252 (0x00 ~ 0xFC), which is a total of 253 numbers that can be used
  2. Broadcast ID : 254 (0xFE), which makes all connected devices execute the Instruction Packet
  3. 253(0xFD), 255(0xFF) : These are not used in order to avoid duplicate use with Header

## [Packet Length](#packet-length)
The length after the Packet Length field (Instruction, Parameter, CRC fields).
Packet Length = number of Parameters + 3

## [Instruction](#instruction)
The field that defines the type of command.

| Value |  Instructions  |                                                        Description                                                         |
|:-----:|:--------------:|:--------------------------------------------------------------------------------------------------------------------------:|
| 0x01  |      Ping      |              Instruction that checks whether the Packet has arrived to a device with the same ID as Packet ID              |
| 0x02  |      Read      |                                          Instruction to read data from the Device                                          |
| 0x03  |     Write      |                                          Instruction to write data on the Device                                           |
| 0x04  |   Reg Write    | Instruction that registers the Instruction Packet to a standby status; Packet is later executed through the Action command |
| 0x05  |     Action     |                    Instruction that executes the Packet that was registered beforehand using Reg Write                     |
| 0x06  | Factory Reset  |                     Instruction that resets the Control Table to its initial factory default settings                      |
| 0x08  |     Reboot     |                                              Instruction to reboot the Device                                              |
| 0x10  |     Clear      |                                          Instruction to reset certain information                                          |
| 0x55  | Status(Return) |                                       Return Instruction for the Instruction Packet                                        |
| 0x82  |   Sync Read    |             For multiple devices, Instruction to read data from the same Address with the same length at once              |
| 0x83  |   Sync Write   |              For multiple devices, Instruction to write data on the same Address with the same length at once              |
| 0x92  |   Bulk Read    |           For multiple devices, Instruction to read data from different Addresses with different lengths at once           |
| 0x93  |   Bulk Write   |           For multiple devices, Instruction to write data on different Addresses with different lengths at once            |

## [Parameters](#parameters)

  1. As the auxiliary data field for Instruction, its purpose is different for each Instruction.
  2. Method of expressing negative number data : This is different for each product, so please refer to the e-manual of the corresponding product.

## [CRC](#crc)
16bit CRC field checks if the Packet has been damaged during communication. Please refer to the [CRC calculation code](/docs/en/dxl/crc/).


# [Status Packet](#status-packet)

| Header1 | Header2 | Header3 | Reserved | Packet ID | Length1 | Length2 | Instruction |  ERR  |  PARAM  | PARAM |  PARAM  | CRC1  | CRC2  |
|:-------:|:-------:|:-------:|:--------:|:---------:|:-------:|:-------:|:-----------:|:-----:|:-------:|:-----:|:-------:|:-----:|:-----:|
|  0xFF   |  0xFF   |  0xFD   |   0x00   |    ID     |  Len_L  |  Len_H  | Instruction | Error | Param 1 |  ...  | Param N | CRC_L | CRC_H |

## Instruction
Instruction of the Status Packet is designated to 0x55 (Status)

## [Error](#error)
The field that indicates the processing result of Instruction Packet

| Bit 7 | Bit 6 ~ Bit 0 |
|:-----:|:-------------:|
| Alert | Error Number  |

  - Alert : When there has been a problem in the Device, this field is set as 1. Checking the Hardware error status value of the Control Table can indicate the cause of the problem.
  - Error Number : When there has been an Error in the processing of the Instruction Packet.

| Value |       Error       |                                                                                                                            Description                                                                                                                             |
|:-----:|:-----------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| 0x01  |    Result Fail    |                                                                                                           Failed to process the sent Instruction Packet                                                                                                            |
| 0x02  | Instruction Error |                                                                                          Undefined Instruction has been used<br />Action has been used without Reg Write                                                                                           |
| 0x03  |     CRC Error     |                                                                                                               CRC of the sent Packet does not match                                                                                                                |
| 0x04  | Data Range Error  |                                                                                 Data to be written in the corresponding Address is outside the range of the minimum/maximum value                                                                                  |
| 0x05  | Data Length Error |                                         Attempt to write Data that is shorter than the data length of the corresponding Address<br />(ex: when you attempt to only use 2 bytes of a item that has been defined as 4 bytes)                                         |
| 0x06  | Data Limit Error  |                                                                                           Data to be written in the corresponding Address is outside of the Limit value                                                                                            |
| 0x07  |   Access Errer    | Attempt to write a value in an Address that is Read Only or has not been defined<br />Attempt to read a value in an Address that is Write Only or has not been defined<br />Attempt to write a value in the ROM domain while in a state of Torque Enable(ROM Lock) |

## Parameter

1. As the auxiliary data field for Instruction, its purpose is different for each Instruction.
2. Method of expressing negative number data : This is different for each product, so please refer to the e-manual of the corresponding product

# [Packet Process](#packet-process)

## Processing Order of Transmission

1. Generate basic form of Packet and afterwards Byte Stuffing(0xFD)
  - Inspection range : Everything within the Instruction field to the Parameter field (not the CRC)
  - Processing method : When the pattern “0xFF 0xFF 0xFD” appears, add Byte Stuffing (0xFD)
    (If “0xFF 0xFF 0xFD” already exists, add a 0xFD to change it to “0xFF 0xFF 0xFD 0xFD”)
2. Packet Length : Modify to Packet Length with Byte Stuffing applied
3. CRC : Calculate CRC with Byte Stuffing applied

## Processing Order of Reception

1. Search for Header(0xFF 0xFF 0xFD) : Ignore the Byte Stuffing(“0xFF 0xFF 0xFD 0xFD”).
2. Packet ID : If Packet ID is valid, receive additional transmission the size of Packet Length
3. CRC : Calculate with the received Packet with Byte Stuffing included, and once CRC is matched then remove Byte Stuffing

# [Instruction Details](#instruction-details)

## [Ping](#ping)
### Description
  - Instruction to check the existence of a Device and basic information
  - Regardless of the Status Return Level of the Device, the Status Packet is always sent to Ping Instruction.
  - When the Packet ID field is 0xFE(Broadcast ID) : All devices send their Status Packet according to their arranged order.

### Packet Parameters

**NOTE** : Status Packet is received from each Device.
{: .notice}

| Status Packet |     Description     |
|:-------------:|:-------------------:|
|  Parameter 1  |  Model Number LSB   |
|  Parameter 2  |  Model Number MSB   |
|  Parameter 3  | Version of Firmware |

### Example 1
#### Conditions
- ID1(XM430-W210) : For Model Number 1030(0x0406), Version of Firmware 38(0x26)
- Instruction Packet ID : 1

#### Ping Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x03 | 0x00 | 0x01 | 0x19 | 0x4E |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x07 | 0x00 | 0x55 | 0x00 |  0x06  |  0x04  |  0x26  | 0x65 | 0x5D |

### Example 2
#### Conditions
- ID1(XM430-W210) : For Model Number 1030(0x0406), Version of Firmware 38(0x26)
- ID2(XM430-W210) : For Model Number 1030(0x0406), Version of Firmware 38(0x26)
- Instruction Packet ID : 254(Broadcast ID)

#### Ping Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0xFE | 0x03 | 0x00 | 0x01 | 0x31 | 0x42 |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x07 | 0x00 | 0x55 | 0x00 |  0x06  |  0x04  |  0x26  | 0x65 | 0x5D |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x02 | 0x07 | 0x00 | 0x55 | 0x00 |  0x06  |  0x04  |  0x26  | 0x6F | 0x6D |

## [Read](#read)

### Description
  - Instruction to read a value from Control Table
  - Method of expressing negative number data : This is different for each product, so please refer to the e-manual of the corresponding product

### Packet Parameters

| Instruction Packet |                Description                |
|:------------------:|:-----------------------------------------:|
|    Parameter 1     | Low-order byte from the starting address  |
|    Parameter 2     | High-order byte from the starting address |
|    Parameter 3     |  Low-order byte from the data length (X)  |
|    Parameter 4     | High-order byte from the data length (X)  |

| Status Packet | Description |
|:-------------:|:-----------:|
|  Parameter 1  | First Byte  |
|  Parameter 2  | Second Byte |
|      ...      |     ...     |
|  Parameter X  |  X-th Byte  |

### Example

#### Conditions
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte]) = 166(0x000000A6)

#### Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | PARAM1 | PARAM2 | PARAM3 | PARAM4 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x07 | 0x00 | 0x02 |  0x84  |  0x00  |  0x04  |  0x00  | 0x1D | 0x15 |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | PARAM4 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x08 | 0x00 | 0x55 | 0x00 |  0xA6  |  0x00  |  0x00  |  0x00  | 0x8C | 0xC0 |

## [Write](#write)

### Description
  - Instruction to write a value on the Control Table
  - Method of expressing negative number data : This is different for each product, so please refer to the e-manual of the corresponding product

### Packet Parameters

| Instruction Packet |                Description                |
|:------------------:|:-----------------------------------------:|
|    Parameter 1     | Low-order byte from the starting address  |
|    Parameter 2     | High-order byte from the starting address |
|   Parameter 2+1    |                First Byte                 |
|   Parameter 2+2    |                Second Byte                |
|        ...         |                    ...                    |
|   Parameter 2+X    |                 X-th Byte                 |

### Example

#### Conditions
- ID1(XM430-W210) : Write 512(0x00000200) to Goal Position(116, 0x0074, 4[byte])

#### Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x09 | 0x00 | 0x03 | 0x74 | 0x00 | 0x00 | 0x02 | 0x00 | 0x00 | 0xCA | 0x89 |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | CRC1|CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:---------:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1|0x0C |

## [Reg Write](#reg-write)

### Description
  - Instruction that is similar to Write Instruction, but has an improved synchronization characteristic
  - Write Instruction is executed immediately when an Instruction Packet is received.
  - Reg Write Instruction registers the Instruction Packet to a standby status, and sets Control table Registered Instruction to ‘1’.
  - When an Action Instruction is received, the registered Packet is executed, and sets Control Table Registered Instruction to ‘0’.

### Packet Parameters

| Instruction Packet |                Description                |
|:------------------:|:-----------------------------------------:|
|    Parameter 1     | Low-order byte from the starting address  |
|    Parameter 2     | High-order byte from the starting address |
|   Parameter 2+1    |                First Byte                 |
|   Parameter 2+2    |                Second Byte                |
|        ...         |                    ...                    |
|   Parameter 2+X    |                 X-th Byte                 |

### Example

#### Condition
- ID1(XM430-W210) : Write 200(0x000000C8) to Goal Velocity(104, 0x0068, 4[byte])

#### Reg Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x09 | 0x00 | 0x04 | 0x68 | 0x00 | 0xC8 | 0x00 | 0x00 | 0x00 | 0xAE | 0x8E |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1 | 0x0C |

## [Action](#action)

### Description
  - Instruction that executes the Packet that has been registered using Reg Write Instruction
  - When controlling multiple devices using Write Instruction, there will be a difference in the time of execution between the first device that receives the Packet and the last device that receives the Packet.
  - By using Reg Write and Action Instruction, one can operate multiple devices simultaneously.

### Example

#### Condition
- ID1(XM430-W210) : Instruction has been already registered by the Reg Write Instruction.

#### Action Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x03 | 0x00 | 0x05 | 0x02 | 0xCE |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1 | 0x0C |

## [Factory Reset](#factory-reset)

### Description
  - Instruction that resets the Control Table to its initial factory default settings.
  - In case of when **Packet ID** is a Broadcast ID `0xFE` and **Option** is Reset All `0xFF`, Factory Reset Instruction(0x06) will **NOT** be activated.
    - This feature is applied from MX(2.0) FW42, X-series FW42 or above.

### Parameters

| Instruction Packet | Description                                                                                   |
|:------------------:|:----------------------------------------------------------------------------------------------|
|    Parameter 1     | 0xFF : Reset all<br />0x01 : Reset all except ID<br />0x02 : Reset all except ID and Baudrate |

### Example

#### Conditions
- ID1(XM430-W210) : Apply reset with option 0x01(Reset all except ID)

#### Factory Reset Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x06 | 0x01 | 0xA1 | 0xE6 |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1 | 0x0C |

## [Reboot](#reboot)

### Description
- Instruction to reboot the device

### Example

#### Conditions
- ID1(XM430-W210)

#### Reboot Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x03 | 0x00 | 0x08 | 0x2F | 0x4E |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1 | 0x0C |

## [Clear](#clear)

### Description
- This instruction resets certain information of DYNAMIXEL
- Applied Products : MX with Protocol 2.0 (Firmware v42 or above), DYNAMIXEL-X series (Firmware v42 or above)

### Parameters

|  P1  | P2 ~ P5                                 | Description                                                                                                                                                                                                  |
|:----:|:----------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x01 | Fixed Values<br />(0x44 0x58 0x4C 0x22) | Resets multi turn information to 1st rotation.<br />This can be only applied when DYNAMIXEL is not operating<br />During an operation, Result Fail(0x01) will be set in the Error field of the Status Packet |
| 0x02 | -                                       | Reserved                                                                                                                                                                                                     |
| ...  | -                                       | Reserved                                                                                                                                                                                                     |
| 0xFF | -                                       | Reserved                                                                                                                                                                                                     |

### Example

#### Conditions
- ID1(XM430-W210) : Resets multi turn revolution information

#### Clear Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 |   INST   |    P1    |  P2  |  P3  |  P4  |  P5  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:--------:|:--------:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x08 | 0x00 | **0x10** | **0x01** | 0x44 | 0x58 | 0x4C | 0x22 | 0xB1 | 0xDC |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x04 | 0x00 | 0x55 | 0x00 | 0xA1 | 0x0C |

## [Sync Read](#sync-read)

### Description
- Instruction to read data from multiple devices simultaneously using one Instruction Packet
- The Address and Data Length of the data must all be the same.
- If the Address of the data is not continual, an Indirect Address can be used.
- Packet ID field : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet |                Description                |
|:------------------:|:-----------------------------------------:|
|    Parameter 1     | Low-order byte from the starting address  |
|    Parameter 2     | High-order byte from the starting address |
|    Parameter 3     |  Low-order byte from the data length(X)   |
|    Parameter 4     |  High-order byte from the data length(X)  |
|   Parameter 4+1    |           ID of the 1st Device            |
|   Parameter 4+2    |           ID of the 2nd Device            |
|        ...         |                    ...                    |
|   Parameter 4+X    |           ID of the X-th Device           |

**NOTE** : Status Packet is received from each Device.
{: .notice}

| Status Packet | Description |
|:-------------:|:-----------:|
|  Parameter 1  | Frist Byte  |
|  Parameter 2  | Second Byte |
|      ...      |     ...     |
|  Parameter X  |  X-th Byte  |

### Example

#### Conditions
- ID1(XM430-W210) : Present Position(132, 0x0084, 4[byte]) = 166(0x000000A6)
- ID2(XM430-W210) : Present Position(132, 0x0084, 4[byte]) = 2,079(0x0000081F)

#### Sync Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0xFE | 0x09 | 0x00 | 0x82 | 0x84 | 0x00 | 0x04 | 0x00 | 0x01 | 0x02 | 0xCE | 0xFA |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | PARAM4 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x08 | 0x00 | 0x55 | 0x00 |  0xA6  |  0x00  |  0x00  |  0x00  | 0x8C | 0xC0 |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | PARAM3 | PARAM4 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x02 | 0x08 | 0x00 | 0x55 | 0x00 |  0x1F  |  0x08  |  0x00  |  0x00  | 0xBA | 0xBE |

## [Sync Write](#sync-write)

### Description
- Instruction to control multiple devices simultaneously using one Instruction Packet
- The Address and Data Length of the data must all be the same.
- If the Address of the data is not continual, an Indirect Address can be used.
- Packet ID field : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | Description                               |
|:------------------:|:------------------------------------------|
|    Parameter 1     | Low-order byte from the starting address  |
|    Parameter 2     | High-order byte from the starting address |
|    Parameter 3     | Low-order byte from the data length(X)    |
|    Parameter 4     | High-order byte from the data length(X)   |
|    Parameter 5     | [1st Device] ID                           |
|   Parameter 5+1    | [1st Device] 1st Byte                     |
|   Parameter 5+2    | [1st Device] 2nd Byte                     |
|        ...         | [1st Device]...                           |
|   Parameter 6+X    | [2nd Device] X-th Byte                    |
|    Parameter 6     | [2nd Device] ID                           |
|   Parameter 6+1    | [2nd Device] 1st Byte                     |
|   Parameter 6+2    | [2nd Device] 2nd Byte                     |
|        ...         | [2nd Device]...                           |
|   Parameter 6+X    | [2nd Device] X-th Byte                    |
|        ...         | ...                                       |

### Example

#### Conditions
- ID1(XM430-W210) : Write 150(0x00000096) to Goal Position(116, 0x0074, 4[byte])
- ID2(XM430-W210) : Write 170(0x000000AA) to Goal Position(116, 0x0074, 4[byte])

#### Sync Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0xFE | 0x11 | 0x00 | 0x83 | 0x74 | 0x00 | 0x04 | 0x00 |

|  P5  |  P6  |  P7  |  P8  |  P9  | P10  | P11  | P12  | P13  | P14  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0x01 | 0x96 | 0x00 | 0x00 | 0x00 | 0x02 | 0xAA | 0x00 | 0x00 | 0x00 | 0x82 | 0x87 |

## [Bulk Read](#bulk-read)

### Description
- Similar to Sync Read, this is an Instruction to read data from multiple devices simultaneously using one Instruction Packet
- This Instruction can be used even if the Address and Data Length of the data for each device are not all the same.
- The same ID cannot be used multiple times in the Parameter. In other words, it can only read once from each individual device.
- If the Address of the data is not continual, an Indirect Address can be used.
- Packet ID field : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | Description                                            |
|:------------------:|:-------------------------------------------------------|
|    Parameter 1     | [1st Device] ID                                        |
|    Parameter 2     | [1st Device] Low-order byte from the starting address  |
|    Parameter 3     | [1st Device] High-order byte from the starting address |
|    Parameter 4     | [1st Device] Low-order byte from the data              |
|    Parameter 5     | [1st Device] High-order byte from the data             |
|    Parameter 6     | [2nd Device] ID                                        |
|    Parameter 7     | [2nd Device] Low-order byte from the starting address  |
|    Parameter 8     | [2nd Device] High-order byte from the starting address |
|    Parameter 9     | [2nd Device] Low-order byte from the data              |
|    Parameter 10    | [2nd Device] High-order byte from the data             |
|        ...         | ...                                                    |

**NOTE** : Status Packet is received from each Device.
{: .notice}

| Status Packet | Description |
|:-------------:|:-----------:|
|  Parameter 1  |  1st Byte   |
|  Parameter 2  |  2nd Byte   |
|      ...      |     ...     |
|  Parameter X  |  X-th Byte  |

### Example

#### Condition
- ID1(XM430-W210) : Present Voltage(144, 0x0090, 2[byte]) = 119(0x0077)
- ID2(XM430-W210) : Present Temperature(146, 0x0092, 1[byte]) = 36(0x24)

#### Bulk Read Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0xFE | 0x0D | 0x00 | 0x92 | 0x01 | 0x90 | 0x00 | 0x02 | 0x00 |

|  P6  |  P7  |  P8  |  P9  | P10  | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0x02 | 0x92 | 0x00 | 0x01 | 0x00 | 0x1A | 0x05 |

#### ID 1 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | PARAM2 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x01 | 0x06 | 0x00 | 0x55 | 0x00 |  0x77  |  0x00  | 0xC3 | 0x69 |

#### ID 2 Status Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST | ERR  | PARAM1 | CRC1 | CRC2 |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:------:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0x02 | 0x05 | 0x00 | 0x55 | 0x00 |  0x24  | 0x8B | 0xA9 |

## [Bulk Write](#bulk-write)

### Description
- Similar to Sync Write, this is an Instruction to control multiple devices simultaneously using one Instruction Packet
- This Instruction can be used even if the Address and Data Length of the data for each device are not all the same.
- The same ID cannot be used multiple times in the Parameter. In other words, it can only write once for each individual device.
- If the Address of the data is not continual, an Indirect Address can be used.
- Packet ID field : 0xFE (Broadcast ID)

### Parameters

| Instruction Packet | Description                                            |
|:------------------:|:-------------------------------------------------------|
|    Parameter 1     | [1st Device] ID                                        |
|    Parameter 2     | [1st Device] Low-order byte from the starting address  |
|    Parameter 3     | [1st Device] High-order byte from the starting address |
|    Parameter 4     | [1st Device] Low-order byte from the data length(X)    |
|    Parameter 5     | [1st Device] High-order byte from the data length(X)   |
|   Parameter 5+1    | [1st Device] 1st Byte                                  |
|   Parameter 5+2    | [1st Device] 2nd Byte                                  |
|        ...         | ...                                                    |
|   Parameter 5+X    | [1st Device] X-th Byte                                 |
|   Parameter 6+X    | [2nd Device] ID                                        |
|   Parameter 7+X    | [2nd Device] Low-order byte from the starting address  |
|   Parameter 8+X    | [2nd Device] High-order byte from the starting address |
|   Parameter 9+X    | [2nd Device] Low-order byte from the data length(X)    |
|   Parameter 10+X   | [2nd Device] High-order byte from the data length(X)   |
|  Parameter 10+X+1  | [2nd Device] 1st Byte                                  |
|  Parameter 10+X+2  | [2nd Device] 2nd Byte                                  |
|        ...         | ...                                                    |
|  Parameter 10+X+Y  | [2nd Device] Y-th Byte                                 |
|        ...         | ...                                                    |

### Example

#### Condition
- ID1(XM430-W210) : Set Max Voltage Limit(32, 0x0020, 2[byte]) to 160(0x00A0)
- ID2(XM430-W210) : Set Temperature Limit(31, 0x001F, 1[byte]) to 80(0x50)

#### Bulk Write Instruction Packet

|  H1  |  H2  |  H3  | RSRV |  ID  | LEN1 | LEN2 | INST |  P1  |  P2  |  P3  |  P4  |  P5  |  P6  |  P7  |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0xFF | 0xFF | 0xFD | 0x00 | 0xFE | 0x10 | 0x00 | 0x93 | 0x01 | 0x20 | 0x00 | 0x02 | 0x00 | 0xA0 | 0x00 |

|  P8  |  P9  | P10  | P11  | P12  | P13  | CRC1 | CRC2 |  |
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|::|
| 0x02 | 0x1F | 0x00 | 0x01 | 0x00 | 0x50 | 0xB7 | 0x68 |  |





[Compatibility Table]: /docs/en/popup/faq_protocol_compatibility_table/
