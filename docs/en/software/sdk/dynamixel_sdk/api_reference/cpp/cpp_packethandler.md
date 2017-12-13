---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_cpp_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_packethandler
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 4"></div>
<div style="counter-reset: h2 2"></div>
<div style="counter-reset: h1 5"></div>

### [CPP PacketHandler](#cpp-packethandler)

- Description

Base class for packet construction.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
| getPacketHandler	| Gets PacketHandler from either of Protocols |
| ~PacketHandler	| None |
| getProtocolVersion	| Gets Protocol version |
| printTxRxResult	| Shows communication result |
| printRxPacketError    | Shows hardware error |
| txPacket	| Transmits the packet |
| rxPacket	| Receives the packet |
| txRxPacket	| Transmits and receives the packet |
| ping	| Ping a Dynamixel |
| broadcastPing	| Ping all connected Dynamixels |
| action	| Commands ‘Run’ the Regwritten |
| regWrite	| Writes the packets and wait for the ‘Action’ command |
| reboot	| Reboots Dynamixel |
| factoryReset	| Resets all Dynamixel settings |
| readTx	| Transmits N byte read instruction packet |
| readRx	| Receives N byte read status packet |
| readTxRx	| Transmits and receives N byte packet |
| read1ByteTx	| Transmits 1 byte read instruction packet |
| read1ByteRx	| Receives 1 byte read status packet |
| read1ByteTxRx	| Transmits and receives 1 byte packet |
| read2ByteTx	| Transmits 2 byte read instruction packet |
| read2ByteRx	| Receives 2 byte read status packet |
| read2ByteTxRx	| Transmits and receives 2 byte packet |
| read4ByteTx	| Transmits 4 byte read instruction packet |
| read4ByteRx	| Receives 4 byte read status packet |
| read4ByteTxRx	| Transmits and receives 4 byte packet |
| writeTxOnly	| Transmits N byte write instruction packet |
| writeTxRx	| Transmits and receives N byte packet |
| write1ByteTxOnly	| Transmits 1 byte write instruction packet |
| write1ByteTxRx	| Transmits and receives 1 byte packet |
| write2ByteTxOnly	| Transmits 2 byte write instruction packet |
| write2ByteTxRx	| Transmits and receives 2 byte packet |
| write4ByteTxOnly	| Transmits 4 byte write instruction packet |
| write4ByteTxRx	| Transmits and receives 4 byte packet |
| regWriteTxOnly	| Transmits register write instruction packet |
| regWriteTxRx	| Transmits and receives register write packet |
| syncReadTx	| Transmits N byte sync read Instruction packet |
| syncWriteTxOnly	| Transmits N byte sync write Instruction packet |
| bulkReadTx	| Transmits N byte bulk read Instruction packet |
| bulkWriteTxOnly	| Transmits N byte bulk write Instruction packet |


- Enumerator

| | |
| ------------- | ------------- |
| DXL_MAKEWORD(a, b)	| Makes value from a and b to word type |
| DXL_MAKEDWORD(a, b)	| Makes value from a and b to dword type |
| DXL_LOWORD(l)	| Gets lower word type value from l |
| DXL_HIWORD(l)	| Gets higher word type value from l |
| DXL_LOBYTE(w)	| Gets lower byte type value from w |
| DXL_HIBYTE(w)	| Gets higher byte type value from w |
| BROADCAST_ID  | := 0xFE	Broadcast ID |
| MAX_ID  | := 0xFC	Maximum ID value |
| INST_PING  | := 1	Instruction value of Ping |
| INST_READ  | := 2	Instruction value of Read |
| INST_WRITE  | := 3	Instruction value of Write |
| INST_REG_WRITE  | := 4	Instruction value of Register Write |
| INST_ACTION  | := 5	Instruction value of Action |
| INST_FACTORY_RESET  | := 6	Instruction value of Factory Reset |
| INST_SYNC_WRITE  | := 131	Instruction value of Sync Write |
| INST_BULK_READ  | := 146	Instruction value of Bulk Read |
| INST_REBOOT  | := 8	Instruction value of Reboot |
| INST_STATUS  | := 85	Instruction value of Status |
| INST_SYNC_READ  | := 130	Instruction value of Sync Read |
| INST_BULK_WRITE  | := 147		Instruction value of Bulk Write |
| COMM_SUCCESS  | := 0	Status of Communication Success |
| COMM_PORT_BUSY  | := -1000	Status of Port in use |
| COMM_TX_FAIL  | := -1001	Status of Transmit packet failed |
| COMM_RX_FAIL  | := -1002	Status of Receive packet failed |
| COMM_TX_ERROR  | := -2000	Status of Transmit packet error |
| COMM_RX_WAITING  | := -3000	Status of Receive packet waiting |
| COMM_RX_TIMEOUT  | := -3001	Status of Receive packet timeout |
| COMM_RX_CORRUPT  | := -3002	Status of Receive packet corrupt |
| COMM_NOT_AVAILABLE  | := -9000	Status of Unavailable in protocol 1.0 |


#### Method References
----------------------------------------------

[Protocol1 Packet Handler](/docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_protocol1packethandler)

[Protocol2 Packet Handler](/docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_protocol2packethandler)
