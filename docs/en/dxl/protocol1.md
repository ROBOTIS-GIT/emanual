---
layout: archive
lang: en
ref: protocol1
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/protocol1/
sidebar:
  title: Protocol 1.0
  nav: "protocol1"
---

# [Instruction Packet](#instruction-packet)
Instruction Packet is the command data sent to the Device.

|Header1|Header2|ID|Length|Instruction|Param 1|...|Param N|Checksum|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|ID|Length|Instruction|Param 1|...|Param N|CHKSUM|

## Header
The field indicates the start of the Packet.

## Packet ID
The field that indicates the ID of the Device that should receive the Instruction Packet and process it

  1. Range : 0 ~ 253 (0x00 ~ 0xFD), which is a total of 254 numbers that can be used.
  2. Broadcast ID : 254 (0xFE), which makes all connected devices execute the Instruction Packet.

## Length
The length of the Packet(Instruction, Parameter, Checksum fields).
Length = number of Parameters + 2

## Instruction
The field that defines the type of command.

|Value|Instructions|Description|
|:---:|:---:|:---:|
|0x01|Ping|Instruction that checks whether the Packet has arrived to a device with the same ID as Packet ID|
|0x02|Read|Instruction to read data from the Device|
|0x03|Write|Instruction to write data on the Device|
|0x04|Reg Write|Instruction that registers the Instruction Packet to a standby status; Packet is later executed through the Action command|
|0x05|Action|Instruction that executes the Packet that was registered beforehand using Reg Write|
|0x06|Factory Reset|Instruction that resets the Control Table to its initial factory default settings|
|0x83|Sync Write|For multiple devices, Instruction to write data on the same Address with the same length at once|

## Parameters
Parameters are used when additional data is required for an instruction.

## Checksum
It is used to check if packet is damaged during communication.
Instruction Checksum is calculated according to the following formula.

**Instruction Checksum = ~( ID + Length + Instruction + Parameter1 + … Parameter N )**

Where “~” is the Binary Ones Complement operator.
When the calculation result of the parenthesis in the above formula is larger than 255 (0xFF), use only lower bytes.

For example, when you want to use below Instruction Packet,

ID=1(0x01), Length=5(0x05), Instruction=3(0x03),
Parameter1=12(0x0C), Parameter2=100(0x64), Parameter3=170(0xAA)

Checksum = ~ ( ID + Length + Instruction + Parameter1 + … Parameter 3 )
= ~ [ 0x01 + 0x05 + 0x03 + 0x0C + 0x64 + 0xAA ]
= ~ [ 0x123 ] // Only the lower byte 0x23 executes the Not operation.
= 0xDC

Thus, Instruction Packet should be 0xFF, 0xFF, 0x01, 0x05, 0x03, 0x0C, 0x64, 0xAA, 0xDC.


# [Status Packet](#status-packet)

|Header1|Header2|ID|Length|Error|Param 1|...|Param N|Checksum|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|0xFF|0xFF|ID|Length|Error|Param 1|...|Param N|CHKSUM|

## Error
This field displays the error status occurred during the operation of Dynamixel.

|Bit|Error|Description|
|:---:|:---:|:---:|
|Bit 7|0|-|
|Bit 6|Instruction Error|In case of sending an undefined instruction or delivering the action command without the reg_write command, it is set as 1|
|Bit 5|Overload Error|When the current load cannot be controlled by the set Torque, it is set as 1|
|Bit 4|Checksum Error|When the Checksum of the transmitted Instruction Packet is incorrect, it is set as 1|
|Bit 3|Range Error|When a command is out of the range for use, it is set as 1|
|Bit 2|Overheating Error|When internal temperature of Dynamixel is out of the range of operating temperature set in the Control table, it is set as 1|
|Bit 1|Angle Limit Error|When Goal Position is written out of the range from CW Angle Limit to CCW Angle Limit , it is set as 1|
|Bit 0|Input Voltage Error|When the applied voltage is out of the range of operating voltage set in the Control table, it is as 1|

For example, when Status Packet is returned as below

0xFF 0xFF 0x01 0x02 0x24 0xD8
It means that the error of 0x24 occurs from Dynamixel whose ID is 01. Since 0x24 is 00100100 as binary, Bit5 and Bit2 become 1. In order words, Overload and Overheating Errors have occurred.

`Note` The error types on the table above are related to actuators, and the contents may vary depending on the type of Dynamixel.
{: .notice}

## Checksum
It is used to check if packet is damaged during communication.
Status Checksum is calculated according to the following formula.

**Status Checksum = ~( ID + Length + Error + Parameter1 + … Parameter N )**


# [Instruction Details](#instruction-details)

## [Ping](#ping)
This command requests the Status Packet from a specific ID. Even if Status Return Level(16) is 0, Dynamixel returns Status Packet all the time for Ping Instruction.

|Instruction|Length|Parameters|
|:---:|:---:|:---:|
|0x01|0x02|-|

## [Read](#read)

## [Write](#write)

## [Reg Write](#reg-write)

## [Action](#action)

## [Factory Reset](#factory-reset)

## [Sync Write](#sync-write)

## [Bulk Read](#bulk-read)


# [More Packet Examples](#more-packet-examples)
