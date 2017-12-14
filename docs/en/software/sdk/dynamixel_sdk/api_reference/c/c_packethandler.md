---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 4"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C PacketHandler](#c-packethandler)

- Description

Base functions for packet construction.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
| **[packetHandler](#packethandler)**	| Initializes members of packet data pointer struct |
| **[printTxRxResult](#printtxrxresult)**	| Shows communication result |
| **[printRxPacketError](#printtxrxresult)**	| Shows hardware error |
| **[getLastTxRxResult](#getlasttxrxresult)**	| Gets last communication result |
| **[getLastRxPacketError](#getlasttxrxresult)**	| Gets last hardware error |
| **[setDataWrite](#setdatawrite)**	| Gets last communication result |
| **[getDataRead](#getdataread)**	| Gets last hardware error |
| **[txPacket](#txpacket)**	| Transmits the packet |
| **[rxPacket](#rxpacket)**	| Receives the packet |
| **[txRxPacket](#txrxpacket)**	| Transmits and receives the packet |
| **[ping](#ping)**	| ping a Dynamixel |
| **[pingGetModelNum](#pinggetmodelnum)**	| Ping a Dynamixel and get its model number |
| **[broadcastPing](#broadcastping)**	| ping all connected Dynamixels |
| **[getBroadcastPingResult](#getbroadcastpingresult)** | Get IDs of Dynamixels responded by BroadcastPing2 |
| **[action](#action)**	| Commands ‘Run’ the Regwritten |
| **[regWrite](#regwrite)**	| Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**	| Reboots Dynamixel |
| **[factoryReset](#factoryreset)**	| Resets all Dynamixel settings |
| **[readTx](#readtx)**	| Transmits N byte read instruction packet |
| **[readRx](#readrx)**	| Receives N byte read status packet |
| **[readTxRx](#readtxrx)**	| Transmits and receives N byte packet |
| **[read1ByteTx](#read1bytetx)**	| Transmits 1 byte read instruction packet |
| **[read1ByteRx](#read1byterx)**	| Receives 1 byte read status packet |
| **[read1ByteTxRx](#read1bytetxrx)**	| Transmits and receives 1 byte packet |
| **[read2ByteTx](#read2bytetx)**	| Transmits 2 byte read instruction packet |
| **[read2ByteRx](#read2byterx)**	| Receives 2 byte read status packet |
| **[read2ByteTxRx](#read2bytetxrx)**	| Transmits and receives 2 byte packet |
| **[read4ByteTx](#read4bytetx)**	| Transmits 4 byte read instruction packet |
| **[read4ByteRx](#read4byterx)**	| Receives 4 byte read status packet |
| **[read4ByteTxRx](#read4bytetxrx)**	| Transmits and receives 4 byte packet |
| **[writeTxOnly](#writetxonly)**	| Transmits N byte write instruction packet |
| **[writeTxRx](#writetxrx)**	| Transmits and receives N byte packet |
| **[write1ByteTxOnly](#write1bytetxonly)**	| Transmits 1 byte write instruction packet |
| **[write1ByteTxRx](#write1bytetxrx)**	| Transmits and receives 1 byte packet |
| **[write2ByteTxOnly](#write2bytetxonly)**	| Transmits 2 byte write instruction packet |
| **[write2ByteTxRx](#write2bytetxrx)**	| Transmits and receives 2 byte packet |
| **[write4ByteTxOnly](#write4bytetxonly)**	| Transmits 4 byte write instruction packet |
| **[write4ByteTxRx](#write4bytetxrx)**	| Transmits and receives 4 byte packet |
| **[regWriteTxOnly](#regwritetxonly)**	| Transmits register write instruction packet |
| **[regWriteTxRx](#regwritetxrx)**	| Transmits and receives register write packet |
| **[syncReadTx](#syncreadtx)**	| Transmits N byte sync read Instruction packet |
| **[syncWriteTxOnly](#syncwritetxonly)**	| Transmits N byte sync write Instruction packet |
| **[bulkReadTx](#bulkreadtx)**	| Transmits N byte bulk read Instruction packet |
| **[bulkWriteTxOnly](#bulkwritetxonly)**	| Transmits N byte bulk write Instruction packet |


- Enumerator

| | |
| ------------- | ------------- |
| DXL_MAKEWORD(a, b)	| makes value from a and b to word type |
| DXL_MAKEDWORD(a, b)	| makes value from a and b to dword type |
| DXL_LOWORD(l)	| gets lower word type value from l |
| DXL_HIWORD(l)	| gets higher word type value from l |
| DXL_LOBYTE(w)	| gets lower byte type value from w |
| DXL_HIBYTE(w)	| gets higher byte type value from w |
| BROADCAST_ID  | := 0xFE	Broadcast ID |
| MAX_ID  | := 0xFC	Maximum ID value |
| INST_PING  | := 1	Instruction value of ping |
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

##### packetHandler
- Syntax
``` cpp
void packetHandler()
```
- Parameters

   None

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes `packetData` struct and initialzes struct members.  


##### printTxRxResult
- Syntax
``` cpp
void printTxRxResult(int protocol_version, int result)
```
- Parameters

| | |
| ------------- | ------------- |
|protocol_version | Protocol version |
|result |Communication result |

- Detailed Description

   This function calls either `PrintTxRxResult1` or `PrintTxRxResult2` function depending on the `protocol_version`.


##### printRxPacketError
- Syntax
``` cpp
void printRxPacketError(int protocol_version, uint8_t error)
```
- Parameters

| | |
| ------------- | ------------- |
|protocol_version | Protocol version |
|error| Hardware error |

- Detailed Description

   This function calls either `PrintRxPacketError1` or `PrintRxPacketError2` function depending on the `protocol_version`.


##### getLastTxRxResult
- Syntax
``` cpp
int getLastTxRxResult(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastTxRxResult1` or `getLastTxRxResult2` function depending on the `protocol_version`.


##### getLastRxPacketError
- Syntax
``` cpp
uint8_t getLastRxPacketError(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastRxPacketError1` or `getLastRxPacketError2` function depending on the `protocol_version`.

##### setDataWrite
- Syntax
``` cpp
void setDataWrite(int port_num, int protocol_version, uint16_t data_length, uint16_t data_pos, uint32_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|protocol_version | Protocol version |
|data_length| Data length |
|data_pos| Targeted position of array element |
|data| Data |

- Detailed Description

   This function calls either `setDataWrite1` or `setDataWrite2` function depending on the `protocol_version`.


##### getDataRead
- Syntax
``` cpp
uint32_t getDataRead(int port_num, int protocol_version, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|protocol_version | Protocol version |
|data_length| Data length |
|data_pos| Targeted position of array element |

- Detailed Description

   This function calls either `getDataRead1` or `getDataRead2` function depending on the `protocol_version`.


##### txPacket
- Syntax
``` cpp
 void txPacket(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port_num|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `txPacket1` or `txPacket2` function depending on the `protocol_version`.


##### rxPacket
- Syntax
``` cpp
void rxPacket(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `rxPacket1` or `rxPacket2` function depending on the `protocol_version`.


##### txRxPacket
- Syntax
``` cpp
void txRxPacket(int port_num, int protocol_version)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `txRxPacket1` or `txRxPacket2` function depending on the `protocol_version`.


##### ping
- Syntax
``` cpp
void ping (int port_num, int protocol_version, uint8_t id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id | Dynamixel ID|

- Detailed Description

   This function calls either `ping1` or `ping2` function depending on the `protocol_version`.


##### pingGetModelNum
- Syntax
``` cpp
uint16_t pingGetModelNum (int port_num, int protocol_version, int id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|

- Detailed Description

   This function calls either `pingGetModelNum1` or `pingGetModelNum2` function depending on the `protocol_version`.


##### broadcastPing
- Syntax
``` cpp
void broadcastPing(int port_num, int protocol_version)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `broadcastPing1` or `broadcastPing2` function depending on the `protocol_version`.


##### getBroadcastPingResult
- Syntax
``` cpp
uint8_t getBroadcastPingResult(int port_num, int protocol_version, int id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id | Dynamixel ID |

- Detailed Description

   This function calls either `getBroadcastPingResult1` or `getBroadcastPingResult2` function depending on the `protocol_version`.


##### action
- Syntax
``` cpp
void action(int port_num, int protocol_version, int id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|

- Detailed Description

   This function calls either `action1` or `action2` function depending on the `protocol_version`.


##### reboot
- Syntax
``` cpp
void reboot(int port_num, int protocol_version, uint8_t id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|


- Detailed Description

   This function calls either `reboot1` or `reboot2` function depending on the `protocol_version`.


##### factoryReset
- Syntax
``` cpp
void factoryReset(int port_num, int protocol_version, uint8_t id, uint8_t option)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|option |Reset option|

- Detailed Description

   This function calls either `factoryReset1` or `factoryReset2` function depending on the `protocol_version`.

##### readTx
- Syntax
``` cpp
void readTx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|

- Detailed Description

   This function calls either `readTx1` or `readTx2` function depending on the `protocol_version`.


##### readRx
- Syntax
``` cpp
void readRx(int port_num, int protocol_version, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|length	|Packet length|


- Detailed Description

   This function calls either `readRx1` or `readRx2` function depending on the `protocol_version`.


##### readTxRx
- Syntax
``` cpp
 void readTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls either `readTxRx1` or `readTxRx2` function depending on the `protocol_version`.


##### read1ByteTx
- Syntax
``` cpp
void read1ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `read1ByteTx1` or `read1ByteTx2` function depending on the `protocol_version`.


##### read1ByteRx
- Syntax
``` cpp
uint8_t read1ByteRx(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `read1ByteRx1` or `read1ByteRx2` function depending on the `protocol_version`.

##### read1ByteTxRx
- Syntax
``` cpp
 uint8_t read1ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|

- Detailed Description

   This function calls either `read1ByteTxRx1` or `read1ByteTxRx2` function depending on the `protocol_version`.

##### read2ByteTx
- Syntax
``` cpp
void read2ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `read2ByteTx1` or `read2ByteTx2` function depending on the `protocol_version`.


##### read2ByteRx
- Syntax
``` cpp
 uint16_t read2ByteRx(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |


- Detailed Description

   This function calls either `read2ByteRx1` or `read2ByteRx2` function depending on the `protocol_version`.


##### read2ByteTxRx
- Syntax
``` cpp
 uint16_t read2ByteTxRx(int port_num, int protocol_version, uint8_t id,uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `read2ByteTxRx1` or `read2ByteTxRx2` function depending on the `protocol_version`.


##### read4ByteTx
- Syntax
``` cpp
void read4ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `read4ByteTx1` or `read4ByteTx2` function depending on the `protocol_version`.


##### read4ByteRx
- Syntax
``` cpp
uint32_t read4ByteRx(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |

- Detailed Description

   This function calls either `read4ByteRx1` or `read4ByteRx2` function depending on the `protocol_version`.


##### read4ByteTxRx
- Syntax
``` cpp
uint32_t read4ByteTxRx(int port_num, int protocol_version, UIN8_T id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `read4ByteTxRx1` or `read4ByteTxRx2` function depending on the `protocol_version`.


##### writeTxOnly
- Syntax
``` cpp
void writeTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls either `writeTxOnly1` or `writeTxOnly2` function depending on the `protocol_version`.

##### writeTxRx
- Syntax
``` cpp
void writeTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls either `writeTxRx1` or `writeTxRx2` function depending on the `protocol_version`.


##### write1ByteTxOnly
- Syntax
``` cpp
void write1ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls either `write1ByteTxOnly1` or `write1ByteTxOnly2` function depending on the `protocol_version`.

##### write1ByteTxRx
- Syntax
``` cpp
void write1ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls either `write1ByteTxRx1` or `write1ByteTxRx2` function depending on the `protocol_version`.

##### write2ByteTxOnly
- Syntax
``` cpp
void write2ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls either `write2ByteTxOnly1` or `write2ByteTxOnly2` function depending on the `protocol_version`.


##### write2ByteTxRx
- Syntax
``` cpp
 void write2ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls either `write2ByteTxRx1` or `write2ByteTxRx2` function depending on the `protocol_version`.


##### write4ByteTxOnly
- Syntax
``` cpp
void write4ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address|	Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls either `write4ByteTxOnly1` or `write4ByteTxOnly2` function depending on the `protocol_version`.


##### write4ByteTxRx
- Syntax
``` cpp
void write4ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls either `write4ByteTxRx1` or `write4ByteTxRx2` function depending on the `protocol_version`.


##### regWriteTxOnly
- Syntax
``` cpp
 void regWriteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls either `RegWriteTxOnly1` or `RegWriteTxOnly2` function depending on the `protocol_version`.


##### regWriteTxRx

- Syntax
``` cpp
 void regWriteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls either `regWriteTxRx1` or `regWriteTxRx2` function depending on the `protocol_version`.


##### syncReadTx
- Syntax
``` cpp
void syndReadTx(int port_num, int protocol_version, uint16_t address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|

- Detailed Description

   This function calls either `syncReadTx1` or `syncReadTx2` function depending on the `protocol_version`.


##### syncWriteTxOnly
- Syntax
``` cpp
 void syncWriteTxOnly(int port_num, int protocol_version, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|start_address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|


- Detailed Description

   This function calls either `syncWriteTxOnly1` or `syncWriteTxOnly2` function depending on the `protocol_version`.


##### bulkReadTx
- Syntax
``` cpp
 void bulkReadTx(int port_num, int protocol_version, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|param_length	|Parameter length|

- Detailed Description

   This function calls either `bulkReadTx1` or `bulkReadTx2` function depending on the `protocol_version`.

##### bulkWriteTxOnly
- Syntax
``` cpp
 void bulkWriteTxOnly(int port_num, int protocol_version, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version | Protocol version |
|param_length	|Parameter length|

- Detailed Description

   This function calls either `bulkWriteTxOnly1` or `bulkWriteTxOnly2` function depending on the `protocol_version`.
