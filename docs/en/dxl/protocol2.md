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

- Protocol 2.0 supported devices: MX-28, MX-64, MX-106(MX Series with Firmware V39 or above), X Series, DYNAMIXEL Pro
- Protocol 2.0 supported controllers: CM-150 , CM-200
- Other: 2.0 protocol from R+ Smart app

# [Instruction Packet](#instruction-packet)
Instruction Packet is the command data sent to the Device.

|Header1|Header2|Header3|Reserved|Packet ID|Length1|Length2|Instruction|Param|Param|Param|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|ID|Len_L|Len_H|Instruction|Param 1|...|Param N|CRC_L|CRC_H|

`Header` The field indicates the start of the Packet

`Reserved` 0x00 (0xFD cannot be used)

`Packet ID` The field that indicates the ID of the Device that should receive the Instruction Packet and process it

  1. Range : 0 ~ 252 (0x00 ~ 0xFC), which is a total of 253 numbers that can be used
  2. Broadcast ID : 254 (0xFE), which makes all connected devices execute the Instruction Packet
  3. 253(0xFD), 255(0xFF) : These are not used in order to avoid duplicate use with Header

`Packet Length` The length after the Packet Length field (Instruction, Parameter, CRC fields), hence number of Parameters + 3

`Instruction` The field that defines the type of command.

|Value|Instruction|Description|
|:---:|:---:|:---:|
|0x01|Ping|Instruction that checks whether the Packet has arrived to a device with the same ID as Packet ID|
|0x02|Read|Instruction to read data from the Device|
|0x03|Write|Instruction to write data on the Device|
|0x04|Reg Write|Instruction that registers the Instruction Packet to a standby status; Packet is later executed through the Action command|
|0x05|Action|Instruction that executes the Packet that was registered beforehand using Reg Write|
|0x06|Factory Reset|Instruction that resets the Control Table to its initial factory default settings|
|0x08|Reboot|Instruction to reboot the Device|
|0x55|Status(Return)|Return Instruction for the Instruction Packet|
|0x82|Sync Read|For multiple devices, Instruction to read data from the same Address with the same length at once|
|0x83|Sync Write|For multiple devices, Instruction to write data on the same Address with the same length at once|
|0x92|Bulk Read|For multiple devices, Instruction to read data from different Addresses with different lengths at once|
|0x93|Bulk Write|For multiple devices, Instruction to write data on different Addresses with different lengths at once|

`Parameter`

  1. As the auxiliary data field for Instruction, its purpose is different for each Instruction.
  2. Method of expressing negative number data : This is different for each product, so please refer to the e-manual of the corresponding product.

`16bit CRC` This is the field that checks if the Packet has been damaged during communication. Please refer to the [CRC calculation code](/docs/en/dxl/crc/).


# [Status Packet](#status-packet)

|Header1|Header2|Header3|Reserved|Packet ID|Length1|Length2|Instruction|Error|Param|Param|Param|CRC1|CRC2|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|0xFD|0x00|ID|Len_L|Len_H|Instruction|Error|Param 1|...|Param N|CRC_L|CRC_H|
