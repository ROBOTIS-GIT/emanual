---
layout: archive
lang: en
ref: c_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_packethandler/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 4"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="c"><a href="#c">C</a></h2>
<![end dummy Header 1]-->

### [C PacketHandler](#c-packethandler)

- Description : Base functions for packet construction.

- Members : None

- Methods

| Methods                                               | Description                                                                    |
|:------------------------------------------------------|:-------------------------------------------------------------------------------|
| **[packetHandler](#packethandler)**                   | Initializes members of packet data pointer struct                              |
| **[printTxRxResult](#printtxrxresult)**               | Shows communication result *(Deprecated Methods. Please check *getTxRxResult)* |
| **[printRxPacketError](#printtxrxresult)**            | Shows hardware error *(Deprecated Methods. Please check *getRxPacketError)*    |
| **[getLastTxRxResult](#getlasttxrxresult)**           | Gets last communication result                                                 |
| **[getLastRxPacketError](#getlasttxrxresult)**        | Gets last hardware error                                                       |
| **[setDataWrite](#setdatawrite)**                     | Gets last communication result                                                 |
| **[getDataRead](#getdataread)**                       | Gets last hardware error                                                       |
| **[txPacket](#txpacket)**                             | Transmits the packet                                                           |
| **[rxPacket](#rxpacket)**                             | Receives the packet                                                            |
| **[fastReadRxPacket](#fastreadrxpacket)**             | Fast Receives the packet                                                       |
| **[txRxPacket](#txrxpacket)**                         | Transmits and receives the packet                                              |
| **[ping](#ping)**                                     | ping DYNAMIXEL                                                                 |
| **[pingGetModelNum](#pinggetmodelnum)**               | Ping DYNAMIXEL and get its model number                                        |
| **[broadcastPing](#broadcastping)**                   | ping all connected DYNAMIXEL's                                                 |
| **[getBroadcastPingResult](#getbroadcastpingresult)** | Get IDs of DYNAMIXEL's responded by BroadcastPing2                             |
| **[action](#action)**                                 | Commands ‘Run’ the Regwritten                                                  |
| **[regWrite](#regwrite)**                             | Writes the packets and wait for the ‘Action’ command                           |
| **[reboot](#reboot)**                                 | Reboots DYNAMIXEL                                                              |
| **[clearMultiTurn](#clearmultiturn)**                 | Reset the Present Position                                                     | 
| **[factoryReset](#factoryreset)**                     | Resets all DYNAMIXEL settings                                                  |
| **[readTx](#readtx)**                                 | Transmits N byte read instruction packet                                       |
| **[readRx](#readrx)**                                 | Receives N byte read status packet                                             |
| **[fastSyncReadRx](#fastsyncreadrx)**                 | Fast receives N byte read status packet                                        |
| **[readTxRx](#readtxrx)**                             | Transmits and receives N byte packet                                           |
| **[read1ByteTx](#read1bytetx)**                       | Transmits 1 byte read instruction packet                                       |
| **[read1ByteRx](#read1byterx)**                       | Receives 1 byte read status packet                                             |
| **[read1ByteTxRx](#read1bytetxrx)**                   | Transmits and receives 1 byte packet                                           |
| **[read2ByteTx](#read2bytetx)**                       | Transmits 2 byte read instruction packet                                       |
| **[read2ByteRx](#read2byterx)**                       | Receives 2 byte read status packet                                             |
| **[read2ByteTxRx](#read2bytetxrx)**                   | Transmits and receives 2 byte packet                                           |
| **[read4ByteTx](#read4bytetx)**                       | Transmits 4 byte read instruction packet                                       |
| **[read4ByteRx](#read4byterx)**                       | Receives 4 byte read status packet                                             |
| **[read4ByteTxRx](#read4bytetxrx)**                   | Transmits and receives 4 byte packet                                           |
| **[writeTxOnly](#writetxonly)**                       | Transmits N byte write instruction packet                                      |
| **[writeTxRx](#writetxrx)**                           | Transmits and receives N byte packet                                           |
| **[write1ByteTxOnly](#write1bytetxonly)**             | Transmits 1 byte write instruction packet                                      |
| **[write1ByteTxRx](#write1bytetxrx)**                 | Transmits and receives 1 byte packet                                           |
| **[write2ByteTxOnly](#write2bytetxonly)**             | Transmits 2 byte write instruction packet                                      |
| **[write2ByteTxRx](#write2bytetxrx)**                 | Transmits and receives 2 byte packet                                           |
| **[write4ByteTxOnly](#write4bytetxonly)**             | Transmits 4 byte write instruction packet                                      |
| **[write4ByteTxRx](#write4bytetxrx)**                 | Transmits and receives 4 byte packet                                           |
| **[regWriteTxOnly](#regwritetxonly)**                 | Transmits register write instruction packet                                    |
| **[regWriteTxRx](#regwritetxrx)**                     | Transmits and receives register write packet                                   |
| **[syncReadTx](#syncreadtx)**                         | Transmits N byte sync read Instruction packet                                  |
| **[fastSyncReadTx](#fastsyncreadtx)**                 | Transmits N byte fast sync read Instruction packet                             |
| **[syncWriteTxOnly](#syncwritetxonly)**               | Transmits N byte sync write Instruction packet                                 |
| **[bulkReadTx](#bulkreadtx)**                         | Transmits N byte bulk read Instruction packet                                  |
| **[bulkWriteTxOnly](#bulkwritetxonly)**               | Transmits N byte bulk write Instruction packet                                 |

- Enumerator

| Enumerator          | Description                                    |
|:--------------------|:-----------------------------------------------|
| DXL_MAKEWORD(a, b)  | makes value from a and b to word type          |
| DXL_MAKEDWORD(a, b) | makes value from a and b to dword type         |
| DXL_LOWORD(l)       | gets lower word type value from l              |
| DXL_HIWORD(l)       | gets higher word type value from l             |
| DXL_LOBYTE(w)       | gets lower byte type value from w              |
| DXL_HIBYTE(w)       | gets higher byte type value from w             |
| BROADCAST_ID        | := 0xFE	Broadcast ID                          |
| MAX_ID              | := 0xFC	Maximum ID value                      |
| INST_PING           | := 1	Instruction value of ping                |
| INST_READ           | := 2	Instruction value of Read                |
| INST_WRITE          | := 3	Instruction value of Write               |
| INST_REG_WRITE      | := 4	Instruction value of Register Write      |
| INST_ACTION         | := 5	Instruction value of Action              |
| INST_FACTORY_RESET  | := 6	Instruction value of Factory Reset       |
| INST_SYNC_WRITE     | := 131	Instruction value of Sync Write       |
| INST_BULK_READ      | := 146	Instruction value of Bulk Read        |
| INST_REBOOT         | := 8	Instruction value of Reboot              |
| INST_CLEAR          | := 16 Instruction value of Clear               |
| INST_STATUS         | := 85	Instruction value of Status              |
| INST_SYNC_READ      | := 130	Instruction value of Sync Read        |
| INST_FAST_SYNC_READ | := 138	Instruction value of Fast Sync Read   |
| INST_BULK_WRITE     | := 147	Instruction value of Bulk Write       |
| COMM_SUCCESS        | := 0	Status of Communication Success          |
| COMM_PORT_BUSY      | := -1000	Status of Port in use                 |
| COMM_TX_FAIL        | := -1001	Status of Transmit packet failed      |
| COMM_RX_FAIL        | := -1002	Status of Receive packet failed       |
| COMM_TX_ERROR       | := -2000	Status of Transmit packet error       |
| COMM_RX_WAITING     | := -3000	Status of Receive packet waiting      |
| COMM_RX_TIMEOUT     | := -3001	Status of Receive packet timeout      |
| COMM_RX_CORRUPT     | := -3002	Status of Receive packet corrupt      |
| COMM_NOT_AVAILABLE  | := -9000	Status of Unavailable in protocol 1.0 |

#### Method References

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
const char *getTxRxResult(int protocol_version, int result)
```
- Parameters

| Parameters       | Description          |
|:-----------------|:---------------------|
| protocol_version | Protocol version     |
| result           | Communication result |

- Detailed Description

   printTxRxResult is Deprecated. Please use the getTxRxResult instead of printTxRxResult.

   This function calls either `getTxRxResult1` or `getTxRxResult2` function depending on the `protocol_version`.


##### printRxPacketError
- Syntax
``` cpp
const char *getRxPacketError(int protocol_version, uint8_t error)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| protocol_version | Protocol version |
| error            | Hardware error   |

- Detailed Description

   printRxPacketError is Deprecated. Please use the getRxPacketError instead of printRxPacketError.

   This function calls either `getRxPacketError1` or `getRxPacketError2` function depending on the `protocol_version`.


##### getLastTxRxResult
- Syntax
``` cpp
int getLastTxRxResult(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastTxRxResult1` or `getLastTxRxResult2` function depending on the `protocol_version`.


##### getLastRxPacketError
- Syntax
``` cpp
uint8_t getLastRxPacketError(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastRxPacketError1` or `getLastRxPacketError2` function depending on the `protocol_version`.

##### setDataWrite
- Syntax
``` cpp
void setDataWrite(int port_num, int protocol_version, uint16_t data_length, uint16_t data_pos, uint32_t data)
```
- Parameters

| Parameters       | Description                        |
|:-----------------|:-----------------------------------|
| port_num         | Port number                        |
| protocol_version | Protocol version                   |
| data_length      | Data length                        |
| data_pos         | Targeted position of array element |
| data             | Data                               |

- Detailed Description

   This function calls either `setDataWrite1` or `setDataWrite2` function depending on the `protocol_version`.


##### getDataRead
- Syntax
``` cpp
uint32_t getDataRead(int port_num, int protocol_version, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| Parameters       | Description                        |
|:-----------------|:-----------------------------------|
| port_num         | Port number                        |
| protocol_version | Protocol version                   |
| data_length      | Data length                        |
| data_pos         | Targeted position of array element |

- Detailed Description

   This function calls either `getDataRead1` or `getDataRead2` function depending on the `protocol_version`.


##### txPacket
- Syntax
``` cpp
 void txPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port_num         |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `txPacket1` or `txPacket2` function depending on the `protocol_version`.


##### rxPacket
- Syntax
``` cpp
void rxPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `rxPacket1` or `rxPacket2` function depending on the `protocol_version`.


##### fastReadRxPacket
- Syntax
``` cpp
void fastReadRxPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `rxPacket1` or `fastRxPacket2` function depending on the `protocol_version`.


##### txRxPacket
- Syntax
``` cpp
void txRxPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `txRxPacket1` or `txRxPacket2` function depending on the `protocol_version`.


##### ping
- Syntax
``` cpp
void ping (int port_num, int protocol_version, uint8_t id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |

- Detailed Description

   This function calls either `ping1` or `ping2` function depending on the `protocol_version`.


##### pingGetModelNum
- Syntax
``` cpp
uint16_t pingGetModelNum (int port_num, int protocol_version, int id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |

- Detailed Description

   This function calls either `pingGetModelNum1` or `pingGetModelNum2` function depending on the `protocol_version`.


##### broadcastPing
- Syntax
``` cpp
void broadcastPing(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `broadcastPing1` or `broadcastPing2` function depending on the `protocol_version`.


##### getBroadcastPingResult
- Syntax
``` cpp
uint8_t getBroadcastPingResult(int port_num, int protocol_version, int id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |

- Detailed Description

   This function calls either `getBroadcastPingResult1` or `getBroadcastPingResult2` function depending on the `protocol_version`.


##### action
- Syntax
``` cpp
void action(int port_num, int protocol_version, int id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |

- Detailed Description

   This function calls either `action1` or `action2` function depending on the `protocol_version`.


##### reboot
- Syntax
``` cpp
void reboot(int port_num, int protocol_version, uint8_t id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |


- Detailed Description

   This function calls either `reboot1` or `reboot2` function depending on the `protocol_version`.


##### clearMultiTurn
- Syntax
``` cpp
void clearMultiTurn(int port_num, int protocol_version, uint8_t id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |


- Detailed Description

   This function calls either `clearMultiTurn1` or `clearMultiTurn2` function depending on the `protocol_version`.


##### factoryReset
- Syntax
``` cpp
void factoryReset(int port_num, int protocol_version, uint8_t id, uint8_t option)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | DYNAMIXEL ID     |
| option           | Reset option     |

- Detailed Description

   This function calls either `factoryReset1` or `factoryReset2` function depending on the `protocol_version`.

##### readTx
- Syntax
``` cpp
void readTx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |

- Detailed Description

   This function calls either `readTx1` or `readTx2` function depending on the `protocol_version`.


##### readRx
- Syntax
``` cpp
void readRx(int port_num, int protocol_version, uint16_t length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| length           | Packet length    |


- Detailed Description

   This function calls either `readRx1` or `readRx2` function depending on the `protocol_version`.


##### fastSyncReadRx
- Syntax
``` cpp
 void fastSyncReadRx(int port_num, int protocol_version, uint16_t length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| length           | Packet length    |


- Detailed Description

   This function calls either `fastReadRx2` function depending on the `protocol_version`.


##### readTxRx
- Syntax
``` cpp
 void readTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |


- Detailed Description

   This function calls either `readTxRx1` or `readTxRx2` function depending on the `protocol_version`.


##### read1ByteTx
- Syntax
``` cpp
void read1ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `read1ByteTx1` or `read1ByteTx2` function depending on the `protocol_version`.


##### read1ByteRx
- Syntax
``` cpp
uint8_t read1ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `read1ByteRx1` or `read1ByteRx2` function depending on the `protocol_version`.

##### read1ByteTxRx
- Syntax
``` cpp
 uint8_t read1ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |

- Detailed Description

   This function calls either `read1ByteTxRx1` or `read1ByteTxRx2` function depending on the `protocol_version`.

##### read2ByteTx
- Syntax
``` cpp
void read2ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `read2ByteTx1` or `read2ByteTx2` function depending on the `protocol_version`.


##### read2ByteRx
- Syntax
``` cpp
 uint16_t read2ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |


- Detailed Description

   This function calls either `read2ByteRx1` or `read2ByteRx2` function depending on the `protocol_version`.


##### read2ByteTxRx
- Syntax
``` cpp
 uint16_t read2ByteTxRx(int port_num, int protocol_version, uint8_t id,uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `read2ByteTxRx1` or `read2ByteTxRx2` function depending on the `protocol_version`.


##### read4ByteTx
- Syntax
``` cpp
void read4ByteTx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `read4ByteTx1` or `read4ByteTx2` function depending on the `protocol_version`.


##### read4ByteRx
- Syntax
``` cpp
uint32_t read4ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `read4ByteRx1` or `read4ByteRx2` function depending on the `protocol_version`.


##### read4ByteTxRx
- Syntax
``` cpp
uint32_t read4ByteTxRx(int port_num, int protocol_version, UIN8_T id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `read4ByteTxRx1` or `read4ByteTxRx2` function depending on the `protocol_version`.


##### writeTxOnly
- Syntax
``` cpp
void writeTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |


- Detailed Description

   This function calls either `writeTxOnly1` or `writeTxOnly2` function depending on the `protocol_version`.

##### writeTxRx
- Syntax
``` cpp
void writeTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |


- Detailed Description

   This function calls either `writeTxRx1` or `writeTxRx2` function depending on the `protocol_version`.


##### write1ByteTxOnly
- Syntax
``` cpp
void write1ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write1ByteTxOnly1` or `write1ByteTxOnly2` function depending on the `protocol_version`.

##### write1ByteTxRx
- Syntax
``` cpp
void write1ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write1ByteTxRx1` or `write1ByteTxRx2` function depending on the `protocol_version`.

##### write2ByteTxOnly
- Syntax
``` cpp
void write2ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write2ByteTxOnly1` or `write2ByteTxOnly2` function depending on the `protocol_version`.


##### write2ByteTxRx
- Syntax
``` cpp
 void write2ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write2ByteTxRx1` or `write2ByteTxRx2` function depending on the `protocol_version`.


##### write4ByteTxOnly
- Syntax
``` cpp
void write4ByteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write4ByteTxOnly1` or `write4ByteTxOnly2` function depending on the `protocol_version`.


##### write4ByteTxRx
- Syntax
``` cpp
void write4ByteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls either `write4ByteTxRx1` or `write4ByteTxRx2` function depending on the `protocol_version`.


##### regWriteTxOnly
- Syntax
``` cpp
 void regWriteTxOnly(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |


- Detailed Description

   This function calls either `RegWriteTxOnly1` or `RegWriteTxOnly2` function depending on the `protocol_version`.


##### regWriteTxRx

- Syntax
``` cpp
 void regWriteTxRx(int port_num, int protocol_version, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | DYNAMIXEL ID                              |
| address          | Address on the control table of DYNAMIXEL |
| length           | Packet length                             |


- Detailed Description

   This function calls either `regWriteTxRx1` or `regWriteTxRx2` function depending on the `protocol_version`.


##### syncReadTx
- Syntax
``` cpp
void syndReadTx(int port_num, int protocol_version, uint16_t address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| address          | Address on the control table of DYNAMIXEL |
| data_length      | Data length                               |
| param_length     | Parameter length                          |

- Detailed Description

   This function calls either `syncReadTx1` or `syncReadTx2` function depending on the `protocol_version`.


##### fastSyncReadTx
- Syntax
``` cpp
void fastSyncReadTx(iint port_num, int protocol_version, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                                     |
|:-----------------|:------------------------------------------------|
| port_num         | Port number                                     |
| protocol_version | Protocol version                                |
| start_address    | Start address on the control table of DYNAMIXEL |
| data_length      | Data length                                     |
| param_length     | Parameter length                                |

- Detailed Description

   This function calls either `fastSyncReadTx2` function depending on the `protocol_version`.


##### syncWriteTxOnly
- Syntax
``` cpp
 void syncWriteTxOnly(int port_num, int protocol_version, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                                     |
|:-----------------|:------------------------------------------------|
| port_num         | Port number                                     |
| protocol_version | Protocol version                                |
| start_address    | Start address on the control table of DYNAMIXEL |
| data_length      | Data length                                     |
| param_length     | Parameter length                                |


- Detailed Description

   This function calls either `syncWriteTxOnly1` or `syncWriteTxOnly2` function depending on the `protocol_version`.


##### bulkReadTx
- Syntax
``` cpp
 void bulkReadTx(int port_num, int protocol_version, uint16_t param_length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| param_length     | Parameter length |

- Detailed Description

   This function calls either `bulkReadTx1` or `bulkReadTx2` function depending on the `protocol_version`.

##### bulkWriteTxOnly
- Syntax
``` cpp
 void bulkWriteTxOnly(int port_num, int protocol_version, uint16_t param_length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| param_length     | Parameter length |

- Detailed Description

   This function calls either `bulkWriteTxOnly1` or `bulkWriteTxOnly2` function depending on the `protocol_version`.

### [C Protocol1PacketHandler](#c-protocol1packethandler)

- Description

 PacketHandler dependent functions for packet construction using Protocol 1.0.

- Members

 None


- Methods

| Methods                                                 | Description                                                                     |
|:--------------------------------------------------------|:--------------------------------------------------------------------------------|
| **[printTxRxResult1](#printtxrxresult1)**               | Shows communication result *(Deprecated Methods. Please check *getTxRxResult1)* |
| **[printRxPacketError1](#printtxrxresult1)**            | Shows hardware error *(Deprecated Methods. Please check *getRxPacketError1)*    |
| **[getLastTxRxResult1](#getlasttxrxresult1)**           | Gets last communication result                                                  |
| **[getLastRxPacketError1](#getlasttxrxresult1)**        | Gets last hardware error                                                        |
| **[setDataWrite1](#setdatawrite1)**                     | Gets last communication result                                                  |
| **[getDataRead1](#getdataread1)**                       | Gets last hardware error                                                        |
| **[txPacket1](#txpacket1)**                             | Transmits the packet                                                            |
| **[rxPacket1](#rxpacket1)**                             | Receives the packet                                                             |
| **[txRxPacket1](#txrxpacket1)**                         | Transmits and receives the packet                                               |
| **[ping1](#ping1)**                                     | Ping DYNAMIXEL                                                                  |
| **[pingGetModelNum1](#pinggetmodelnum1)**               | Ping DYNAMIXEL and get its model number                                         |
| **[broadcastPing1](#broadcastping1)**                   | Not available in Protocol 1.0                                                   |
| **[getBroadcastPingResult1](#getbroadcastpingresult1)** | Not available in Protocol 1.0                                                   |
| **[action1](#action1)**                                 | Commands ‘Run’ the Regwritten                                                   |
| **[RegWrite1](#regwrite1)**                             | Writes the packets and wait for the ‘Action’ command                            |
| **[reboot1](#reboot1)**                                 | Not available in Protocol 1.0                                                   |
| **[clearMultiTurn1](#clearmultiturn1)**                 | Reset the Present Position                                                      |
| **[factoryReset1](#factoryreset1)**                     | Resets all DYNAMIXEL settings                                                   |
| **[readTx1](#readtx1)**                                 | Transmits N byte read instruction packet                                        |
| **[readRx1](#readrx1)**                                 | Receives N byte read status packet                                              |
| **[readTxRx1](#readtxrx1)**                             | Transmits and receives N byte packet                                            |
| **[read1ByteTx1](#read1bytetx1)**                       | Transmits 1 byte read instruction packet                                        |
| **[read1ByteRx1](#read1byterx1)**                       | Receives 1 byte read status packet                                              |
| **[read1ByteTxRx1](#read1bytetxrx1)**                   | Transmits and receives 1 byte packet                                            |
| **[read2ByteTx1](#read2bytetx1)**                       | Transmits 2 byte read instruction packet                                        |
| **[read2ByteRx1](#read2byterx1)**                       | Receives 2 byte read status packet                                              |
| **[read2ByteTxRx1](#read2bytetxrx1)**                   | Transmits and receives 2 byte packet                                            |
| **[read4ByteTx1](#read4bytetx1)**                       | Not available in Protocol 1.0                                                   |
| **[read4ByteRx1](#read4byterx1)**                       | Not available in Protocol 1.0                                                   |
| **[read4ByteTxRx1](#read4bytetxrx1)**                   | Not available in Protocol 1.0                                                   |
| **[writeTxOnly1](#writetxonly1)**                       | Transmits N byte write instruction packet                                       |
| **[writeTxRx1](#writetxrx1)**                           | Transmits and receives N byte packet                                            |
| **[write1ByteTxOnly1](#write1bytetxonly1)**             | Transmits 1 byte write instruction packet                                       |
| **[write1ByteTxRx1](#write1bytetxrx1)**                 | Transmits and receives 1 byte packet                                            |
| **[write2ByteTxOnly1](#write2bytetxonly1)**             | Transmits 2 byte write instruction packet                                       |
| **[write2ByteTxRx1](#write2bytetxrx1)**                 | Transmits and receives 2 byte packet                                            |
| **[write4ByteTxOnly1](#write4bytetxonly1)**             | Not available in Protocol 1.0                                                   |
| **[write4ByteTxRx1](#write4bytetxrx1)**                 | Not available in Protocol 1.0                                                   |
| **[regWriteTxOnly1](#regwritetxonly1)**                 | Transmits register write instruction packet                                     |
| **[regWriteTxRx1](#regwritetxrx1)**                     | Transmits and receives register write packet                                    |
| **[syncReadTx1](#syncreadtx1)**                         | Not available in Protocol 1.0                                                   |
| **[syncWriteTxOnly1](#syncwritetxonly1)**               | Transmits N byte sync write Instruction packet                                  |
| **[bulkReadTx1](#bulkreadtx1)**                         | Transmits N byte bulk read Instruction packet                                   |
| **[bulkWriteTxOnly1](#bulkwritetxonly1)**               | Not available in Protocol 1.0                                                   |


- Enumerator

 None

#### Method References

##### printTxRxResult1
- Syntax
``` cpp
const char *getTxRxResult1(int result)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| result     | Communication result |

- Detailed Description

  printTxRxResult1 is Deprecated. Please use the getTxRxResult1 instead of printTxRxResult1.

  This function prints out on the console window what communication `result` value means.


##### printRxPacketError1
- Syntax
``` cpp
const char *getRxPacketError1(uint8_t error)
```
- Parameters

| Parameters | Description    |
|:-----------|:---------------|
| error      | Hardware error |

- Detailed Description

  printRxPacketError1 is Deprecated. Please use the getRxPacketError1 instead of printRxPacketError1.

  This function prints out on the console window what hardware `error` value means.


##### getLastTxRxResult1
- Syntax
``` cpp
int getLastTxRxResult1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function returns the communication result of #`port_num` port.


##### getLastRxPacketError1
- Syntax
``` cpp
uint8_t getLastRxPacketError1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function returns the hardware error of #`port_num` port.

##### setDataWrite1
- Syntax
``` cpp
void setDataWrite1(int port_num, uint16_t data_length, uint16_t data_pos, uint32_t data)
```
- Parameters

| Parameters  | Description                        |
|:------------|:-----------------------------------|
| port_num    | Port number                        |
| data_length | Data length                        |
| data_pos    | Targeted position of array element |
| data        | Data                               |

- Detailed Description

  This function puts `Data length` bytes of `Data` into `data_pos` element of array for writing data at #`port_num` port tx buffer.


##### getDataRead1
- Syntax
``` cpp
uint32_t getDataRead1(int port_num, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| Parameters  | Description                        |
|:------------|:-----------------------------------|
| port_num    | Port number                        |
| data_length | Data length                        |
| data_pos    | Targeted position of array element |

- Detailed Description

  This function gets `data_length` bytes of the data located in `data_pos` position of read data array that from #`port_num` port rx buffer.


##### txPacket1
- Syntax
``` cpp
void txPacket1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port_num    |

- Detailed Description

  This function transmits the packet. The function clears the port by `ClearPort` function at first, and stores data in the txpacket storage of #`port_num` port. The communication result and the hardware error are available when the function is terminated.


##### rxPacket1
- Syntax
``` cpp
void rxPacket1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket1
- Syntax
``` cpp
void txRxPacket1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket1` and `rxPacket1` functions. When `txPacket1` function succeeds to communicate, it will continue to `RxPacket2` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, don’t use `RxPacket` so the function finishes its operation immediately after the `txPacket1`. Before the `rxPacket1`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping1
- Syntax
``` cpp
void ping1 (int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

  This function uses `pingGetModelNum1` without requesting DYNAMIXEL to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### pingGetModelNum1
- Syntax
``` cpp
uint16_t pingGetModelNum1 (int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

  This function constructs the transmission packet for ping, and stats `txRxPacket1`. Then, the function tries to get the model number of the DYNAMIXEL by `readTxRx1` function. When it succeeds to receive the packet, it returns the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing1
- Syntax
``` cpp
void broadcastPing1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### getBroadcastPingResult1
- Syntax
``` cpp
uint8_t getBroadcastPingResult1(int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0. The function returns false.

##### action1
- Syntax
``` cpp
void action1(int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

  This function pulls the trigger of sending txpacket previously set by `regWriteTxOnly1` or `regWriteTxRx1` function, using `txRxPacket1` function. The communication result and the hardware error are available when the function is terminated.


##### reboot1
- Syntax
``` cpp
void reboot1(int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### clearMultiTurn1
- Syntax
``` cpp
void clearMultiTurn1(int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### factoryReset1
- Syntax
``` cpp
void factoryReset1(int port_num, uint8_t id, uint8_t option)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |
| option     | Reset option |

- Detailed Description

  This function constructs the transmission packet for reset DYNAMIXEL, and starts `txRxPacket1`. This resets targeted DYNAMIXEL's settings to the factory default settings. The `option` is not available in DYNAMIXEL Protocol 1.0. The communication result and the hardware error are available when the function is terminated.


##### readTx1
- Syntax
``` cpp
void readTx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |

- Detailed Description

  This function constructs the transmission packet with read instruction, and starts `txPacket1`. Then the function calls `SetPacketTimeout` function when packet transmission succeeds. This function can't control more than one DYNAMIXEL at once. The communication result and the hardware error are available when the function is terminated.


##### readRx1
- Syntax
``` cpp
void readRx1(int port_num, uint16_t length)
```
- Parameters

| Parameters | Description   |
|:-----------|:--------------|
| port_num   | Port number   |
| length     | Packet length |


- Detailed Description

  This function calls `rxPacket1` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx1
- Syntax
``` cpp
void readTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

  This function calls `readTx1` function and `readRx1` function. `readRx1` function will be called when `readTx1` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx1
- Syntax
``` cpp
void read1ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

  This function calls `readTx1` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx1
- Syntax
``` cpp
uint8_t read1ByteRx1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function calls `readRx1` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx1
- Syntax
``` cpp
uint8_t read1ByteTxRx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |

- Detailed Description

  This function calls `readTxRx1` function to read 1 Byte data from DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx1
- Syntax
``` cpp
void read2ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

  This function calls `readTx1` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx1
- Syntax
``` cpp
uint16_t read2ByteRx1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |


- Detailed Description

  This function calls `readRx1` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx1
- Syntax
``` cpp
uint16_t read2ByteTxRx1(int port_num, uint8_t id,uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

  This function calls `readTxRx1` function to read 2 Byte data from DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx1
- Syntax
``` cpp
void read4ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### read4ByteRx1
- Syntax
``` cpp
uint32_t read4ByteRx1(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### read4ByteTxRx1
- Syntax
``` cpp
uint32_t read4ByteTxRx1(int port_num, UIN8_T id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### writeTxOnly1
- Syntax
``` cpp
void writeTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

  This function constructs the transmission packet with write instruction, and starts `txPacket1`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx1
- Syntax
``` cpp
void writeTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

   This function constructs the transmission packet with write instruction, and starts `txRxPacket1`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly1
- Syntax
``` cpp
void write1ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxOnly1` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx1
- Syntax
``` cpp
void write1ByteTxRx1(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxRx1` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly1
- Syntax
``` cpp
void write2ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxOnly1` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx1
- Syntax
``` cpp
void write2ByteTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxRx1` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly1
- Syntax
``` cpp
void write4ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### write4ByteTxRx1
- Syntax
``` cpp
void write4ByteTxRx1(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### regWriteTxOnly1
- Syntax
``` cpp
void regWriteTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

  This function intends simultaneous control of more than one DYNAMIXEL. The function writes the data without requesting an action of DYNAMIXEL. The DYNAMIXEL works when the trigger `action1` function is executed. The function needs previous setting of the data to write on the DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx1

- Syntax
``` cpp
void regWriteTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

  This function intends simultaneous multiple DYNAMIXEL's control. The function writes the data without requesting an action of DYNAMIXEL. The DYNAMIXEL works when the trigger `action1` function is executed. The function needs previous setting of the data to write on the DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx1
- Syntax
``` cpp
void syncReadTx1(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters    | Description                               |
|:--------------|:------------------------------------------|
| port_num      | Port number                               |
| start_address | Address on the control table of DYNAMIXEL |
| data_length   | Data length                               |
| param_length  | Parameter length                          |

- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.


##### syncWriteTxOnly1
- Syntax
``` cpp
void syncWriteTxOnly1(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters    | Description                               |
|:--------------|:------------------------------------------|
| port_num      | Port number                               |
| start_address | Address on the control table of DYNAMIXEL |
| data_length   | Data length                               |
| param_length  | Parameter length                          |


- Detailed Description

   This function intends simultaneous multiple DYNAMIXEL's control by writing same length of data to the same address on the DYNAMIXEL control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket1`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx1
- Syntax
``` cpp
void bulkReadTx1(int port_num, uint16_t param_length)
```
- Parameters

| Parameters   | Description      |
|:-------------|:-----------------|
| port_num     | Port number      |
| param_length | Parameter length |

- Detailed Description

  This function intends simultaneous multiple DYNAMIXEL's control by reading different length of data to the different address on the DYNAMIXEL control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket1`. Then the function calls `SetPacketTimeout` function when `txPacket1` succeeds. The communication result and the hardware error are available when the function is terminated.


##### bulkWriteTxOnly1
- Syntax
``` cpp
void bulkWriteTxOnly1(int port_num, uint16_t param_length)
```
- Parameters

| Parameters   | Description      |
|:-------------|:-----------------|
| port_num     | Port number      |
| param_length | Parameter length |

- Detailed Description

  This function is not available with the DYNAMIXEL Protocol 1.0.

### [C Protocol2PacketHandler](#c-protocol2packethandler)

- Description

  PacketHandler dependent functions for packet construction using Protocol 2.0.

- Members

  None


- Methods

| Methods                                                 | Description                                                                     |
|:--------------------------------------------------------|:--------------------------------------------------------------------------------|
| **[printTxRxResult2](#printtxrxresult2)**               | Shows communication result *(Deprecated Methods. Please check *getTxRxResult2)* |
| **[printRxPacketError2](#printtxrxresult2)**            | Shows hardware error *(Deprecated Methods. Please check *getRxPacketError2)*    |
| **[getLastTxRxResult2](#getlasttxrxresult2)**           | Gets last communication result                                                  |
| **[getLastRxPacketError2](#getlasttxrxresult2)**        | Gets last hardware error                                                        |
| **[setDataWrite2](#setdatawrite2)**                     | Gets last communication result                                                  |
| **[getDataRead2](#getdataread2)**                       | Gets last hardware error                                                        |
| **[updateCRC](#updatecrc)**                             | Data transfer check method                                                      |
| **[addStuffing](#addstuffing)**                         | Appends the packet value                                                        |
| **[removeStuffing](#removestuffing)**                   | Removes the packet value                                                        |
| **[txPacket2](#txpacket2)**                             | Transmits the packet                                                            |
| **[rxPacket2](#rxpacket2)**                             | Receives the packet                                                             |
| **[fastRxPacket2](#fastRxPacket2)**                     | Fast receives the packet                                                        |
| **[txRxPacket2](#txrxpacket2)**                         | Transmits and receives the packet                                               |
| **[ping2](#ping2)**                                     | Ping DYNAMIXEL                                                                  |
| **[pingGetModelNum2](#pinggetmodelnum2)**               | Ping DYNAMIXEL and get its model number                                         |
| **[broadcastPing2](#broadcastping2)**                   | Ping all connected DYNAMIXEL's                                                  |
| **[getBroadcastPingResult2](#getbroadcastpingresult2)** | Get IDs of DYNAMIXEL's responded by broadcastPing2                              |
| **[action2](#action2)**                                 | Commands ‘Run’ the Regwritten                                                   |
| **[regWrite2](#regwrite2)**                             | Writes the packets and wait for the ‘Action’ command                            |
| **[reboot2](#reboot2)**                                 | Reboots DYNAMIXEL                                                               |
| **[clearMultiTurn2](#clearmultiturn2)**                 | Clear instruction packet                                                        |
| **[factoryReset2](#factoryreset2)**                     | Resets all DYNAMIXEL settings                                                   |
| **[readTx2](#readtx2)**                                 | Transmits N byte read instruction packet                                        |
| **[readRx2](#readrx2)**                                 | Receives N byte read status packet                                              |
| **[fastReadRx2](#fastreadrx2)**                         | Fast receives N byte read status packet                                         |
| **[readTxRx2](#readtxrx2)**                             | Transmits and receives N byte packet                                            |
| **[read1ByteTx2](#read1bytetx2)**                       | Transmits 1 byte read instruction packet                                        |
| **[read1ByteRx2](#read1byterx2)**                       | Receives 1 byte read status packet                                              |
| **[read1ByteTxRx2](#read1bytetxrx2)**                   | Transmits and receives 1 byte packet                                            |
| **[read2ByteTx2](#read2bytetx2)**                       | Transmits 2 byte read instruction packet                                        |
| **[read2ByteRx2](#read2byterx2)**                       | Receives 2 byte read status packet                                              |
| **[read2ByteTxRx2](#read2bytetxrx2)**                   | Transmits and receives 2 byte packet                                            |
| **[read4ByteTx2](#read4bytetx2)**                       | Transmits 4 byte read instruction packet                                        |
| **[read4ByteRx2](#read4byterx2)**                       | Receives 4 byte read status packet                                              |
| **[read4ByteTxRx2](#read4bytetxrx2)**                   | Transmits and receives 4 byte packet                                            |
| **[writeTxOnly2](#writetxonly2)**                       | Transmits N byte write instruction packet                                       |
| **[writeTxRx2](#writetxrx2)**                           | Transmits and receives N byte packet                                            |
| **[write1ByteTxOnly2](#write1bytetxonly2)**             | Transmits 1 byte write instruction packet                                       |
| **[write1ByteTxRx2](#write1bytetxrx2)**                 | Transmits and receives 1 byte packet                                            |
| **[write2ByteTxOnly2](#write2bytetxonly2)**             | Transmits 2 byte write instruction packet                                       |
| **[write2ByteTxRx2](#write2bytetxrx2)**                 | Transmits and receives 2 byte packet                                            |
| **[write4ByteTxOnly2](#write4bytetxonly2)**             | Transmits 4 byte write instruction packet                                       |
| **[write4ByteTxRx2](#write4bytetxrx2)**                 | Transmits and receives 4 byte packet                                            |
| **[regWriteTxOnly2](#regwritetxonly2)**                 | Transmits register write instruction packet                                     |
| **[regWriteTxRx2](#regwritetxrx2)**                     | Transmits and receives register write packet                                    |
| **[syncReadTx2](#syncreadtx2)**                         | Transmits N byte sync read Instruction packet                                   |
| **[fastSyncReadTx2](#fastsyncreadtx2)**                 | Transmits N byte fast sync read Instruction packet                              |
| **[syncWriteTxOnly2](#syncwritetxonly2)**               | Transmits N byte sync write Instruction packet                                  |
| **[bulkReadTx2](#bulkreadtx2)**                         | Transmits N byte bulk read Instruction packet                                   |
| **[bulkWriteTxOnly2](#bulkwritetxonly2)**               | Transmits N byte bulk write Instruction packet                                  |


- Enumerator

  None

#### Method References
----------------------------------------------


##### printTxRxResult2
- Syntax
``` cpp
const char *getTxRxResult2(int result)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| result     | Communication result |

- Detailed Description

   printTxRxResult2 is Deprecated. Please use the getTxRxResult2 instead of printTxRxResult2.

   This function prints out on the console window what communication `result` value means.


##### printRxPacketError2
- Syntax
``` cpp
const char *getRxPacketError2(uint8_t error)
```
- Parameters

| Parameters | Description    |
|:-----------|:---------------|
| error      | Hardware error |

- Detailed Description

   printRxPacketError2 is Deprecated. Please use the getRxPacketError2 instead of printRxPacketError2.

   This function prints out on the console window what hardware `error` value means.


##### getLastTxRxResult2
- Syntax
``` cpp
int getLastTxRxResult2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function returns the communication result of #`port_num` port.


##### getLastRxPacketError2
- Syntax
``` cpp
uint8_t getLastRxPacketError2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function returns the hardware error of #`port_num` port.

##### setDataWrite2
- Syntax
``` cpp
void setDataWrite2(int port_num, uint16_t data_length, uint16_t data_pos, uint32_t data)
```
- Parameters

| Parameters  | Description                        |
|:------------|:-----------------------------------|
| port_num    | Port number                        |
| data_length | Data length                        |
| data_pos    | Targeted position of array element |
| data        | Data                               |

- Detailed Description

   This function puts `Data length` bytes of `Data` into `data_pos` element of array for writing data at #`port_num` port tx buffer.


##### getDataRead2
- Syntax
``` cpp
uint32_t getDataRead2(int port_num, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| Parameters  | Description                        |
|:------------|:-----------------------------------|
| port_num    | Port number                        |
| data_length | Data length                        |
| data_pos    | Targeted position of array element |

- Detailed Description

   This function gets `data_length` bytes of the data located in `data_pos` position of read data array that from #`port_num` port rx buffer.


##### updateCRC
- Syntax
``` cpp
void updateCRC(uint16_t crc_accum, uint8_t *data_blk_ptr, uint16_t data_blk_size)
```
- Parameters

| Parameters    | Description                             |
|:--------------|:----------------------------------------|
| crc_accum     | set to '0'                              |
| data_blk_ptr  | Packet array pointer                    |
| data_blk_size | Number of bytes in packet excluding CRC |


- Detailed Description

   This function is a data transfer check method.


##### addStuffing
- Syntax
``` cpp
void addStuffing(uint8_t *packet)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| packet     | packet               |

- Detailed Description

   This function appends the packet value.


##### removeStuffing
- Syntax
``` cpp
void removeStuffing(uint8_t *packet)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| packet     | packet               |

- Detailed Description

   This function removes the packet value.


##### txPacket2
- Syntax
``` cpp
 void txPacket2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port_num    |

- Detailed Description

   This function transmits the packet. The function clears the port by `ClearPort` function at first, and stores data in the txpacket storage of #`port_num` port. The communication result and the hardware error are available when the function is terminated.


##### rxPacket2
- Syntax
``` cpp
void rxPacket2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.

##### fastRxPacket2
- Syntax
``` cpp
void fastRxPacket2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.

##### txRxPacket2
- Syntax
``` cpp
void txRxPacket2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket2` and `rxPacket2` functions. When `txPacket2` function succeeds to communicate, it will continue to `rxPacket2` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, and BulkWrite, don’t use `rxPacket2` so the function finishes its operation immediately after the 'txPacket2'. Before the `rxPacket2`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping2
- Syntax
``` cpp
void ping2 (int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function uses `pingGetModelNum2` without requesting DYNAMIXEL to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### pingGetModelNum2
- Syntax
``` cpp
uint16_t pingGetModelNum2 (int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function constructs the transmission packet for ping, and stats `txRxPacket2`. Then, the function tries to get the model number of the DYNAMIXEL by `readTxRx2` function. When it succeeds to receive the packet, it returns the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing2
- Syntax
``` cpp
void broadcastPing2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function finds all connected dynamixels and store their id in the list.


##### getBroadcastPingResult2
- Syntax
``` cpp
uint8_t getBroadcastPingResult2(int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function returns whether #`id` DYNAMIXEL responded by `broadcastPing2` function.


##### action2
- Syntax
``` cpp
void action2(int port_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function pulls the trigger of sending txpacket previously set by `regWriteTxOnly2` or `regWriteTxRx2` function, using `txRxPacket2` function. The communication result and the hardware error are available when the function is terminated.


##### reboot2
- Syntax
``` cpp
void reboot2(int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |


- Detailed Description

   This function constructs the transmission packet with reboot instruction, and starts `txRxPacket2`. The function may perform its role when the DYNAMIXEL stops working caused by hardware error. The communication result and the hardware error are available when the function is terminated.


##### clearMultiTurn2
- Syntax
``` cpp
void clearMultiTurn2(int port_num, uint8_t id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |


- Detailed Description

  Reset the Present Position value to an absolute value within one rotation (0-4095).
  The Clear instruction can only be applied when DYNAMIXEL is stopped.
  Note that if DYNAMIXEL is in motion and the Clear Instruction packet is sent, Result Fail (0x01) will be sent via the Error field of the Status Packet.


##### factoryReset2
- Syntax
``` cpp
void factoryReset2(int port_num, uint8_t id, uint8_t option)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| port_num   | Port number  |
| id         | DYNAMIXEL ID |
| option     | Reset option |

- Detailed Description

   This function constructs the transmission packet for reset DYNAMIXEL, and starts `txRxPacket2`. This resets targeted DYNAMIXEL's settings to the factory default settings. The `option` indicates the range of which items on the control table should be reset: `0xFF` for resetting all values, `0x01` for resetting all values except ID, `0x02` for resetting all values except ID and Baudrate. The communication result and the hardware error are available when the function is terminated.

##### readTx2
- Syntax
``` cpp
void readTx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |

- Detailed Description

   This function constructs the transmission packet with read instruction, and starts `txPacket2`. Then the function calls `setPacketTimeout` function when packet transmission succeeds. This function can't control more than one DYNAMIXEL at once. The communication result and the hardware error are available when the function is terminated.


##### readRx2
- Syntax
``` cpp
void readRx2(int port_num, uint16_t length)
```
- Parameters

| Parameters | Description   |
|:-----------|:--------------|
| port_num   | Port number   |
| length     | Packet length |


- Detailed Description

   This function calls `rxPacket2` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### fastReadRx2 
- Syntax
``` cpp
void fastReadRx2 (int port_num, uint16_t length)
```
- Parameters

| Parameters | Description   |
|:-----------|:--------------|
| port_num   | Port number   |
| length     | Packet length |


- Detailed Description

   This function calls `fastReadRx2` function and gets the packet quickly from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx2
- Syntax
``` cpp
 void readTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

   This function calls `readTx2` function and `readRx2` function. `readRx2` function will be called when `readTx2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx2
- Syntax
``` cpp
void read1ByteTx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls `readTx2` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx2
- Syntax
``` cpp
uint8_t read1ByteRx2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function calls `readRx2` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx2
- Syntax
``` cpp
 uint8_t read1ByteTxRx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |

- Detailed Description

   This function calls `readTxRx2` function to read 1 Byte data from DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx2
- Syntax
``` cpp
void read2ByteTx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls `readTx2` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx2
- Syntax
``` cpp
 uint16_t read2ByteRx2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |


- Detailed Description

   This function calls `readRx2` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx2
- Syntax
``` cpp
 uint16_t read2ByteTxRx2(int port_num, uint8_t id,uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls `readTxRx2` function to read 2 Byte data from DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx2
- Syntax
``` cpp
void Read4ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls `readTx2` function to send 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read4ByteRx2
- Syntax
``` cpp
uint32_t read4ByteRx2(int port_num)
```
- Parameters

| Parameters | Description |
|:-----------|:------------|
| port_num   | Port number |

- Detailed Description

   This function calls `readRx2` function to receive response packet of 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTxRx2
- Syntax
``` cpp
uint32_t read4ByteTxRx2(int port_num, UIN8_T id, uint16_t address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |


- Detailed Description

   This function calls `readTxRx2` function to read 4 Byte data from DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### writeTxOnly2
- Syntax
``` cpp
void writeTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

   This function constructs the transmission packet with write instruction, and starts `txPacket2`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx2
- Syntax
``` cpp
void writeTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

    This function constructs the transmission packet with write instruction, and starts `txRxPacket2`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly2
- Syntax
``` cpp
void write1ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxOnly2` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx2
- Syntax
``` cpp
void write1ByteTxRx2(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxRx2` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly2
- Syntax
``` cpp
void write2ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxOnly2` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx2
- Syntax
``` cpp
 void write2ByteTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxRx2` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly2
- Syntax
``` cpp
void write4ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxOnly2` function to send 4 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxRx2
- Syntax
``` cpp
void write4ByteTxRx2(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxRx2` function to send 4 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### regWriteTxOnly2
- Syntax
``` cpp
 void regWriteTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

   This function intends simultaneous control of more than one DYNAMIXEL. The function writes the data without requesting an action of DYNAMIXEL. The DYNAMIXEL works when the trigger `action2` function is executed. The function needs previous setting of the data to write on the DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx2

- Syntax
``` cpp
 void regWriteTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port_num   | Port number                               |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| length     | Packet length                             |


- Detailed Description

   This function intends simultaneous multiple DYNAMIXEL's control. The function writes the data without requesting an action of DYNAMIXEL. The DYNAMIXEL works when the trigger `action2` function is executed. The function needs previous setting of the data to write on the DYNAMIXEL. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx2
- Syntax
``` cpp
void syncReadTx2(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                                     |
|:-----------------|:------------------------------------------------|
| port_num         | Port number                                     |
| start_address    | Start address on the control table of DYNAMIXEL |
| data_length      | Data length                                     |
| param_length     | Parameter length                                |

- Detailed Description

   This function intends simultanoues multiple DYNAMIXEL's control by reading same length of data from the same address on the DYNAMIXEL control table. The function constructs the transmission packet with sync read instruction, and starts 'txPacket2'. Then the function calls `setPacketTimeout` function when `txPacket2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### fastSyncReadTx2
- Syntax
``` cpp
void fastSyncReadTx2(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                                     |
|:-----------------|:------------------------------------------------|
| port_num         | Port number                                     |
| start_address    | Start address on the control table of DYNAMIXEL |
| data_length      | Data length                                     |
| param_length     | Parameter length                                |

- Detailed Description

   This function intends simultanoues multiple DYNAMIXEL's control by reading same length of data from the same address on the DYNAMIXEL control table. The function constructs the transmission packet with sync read instruction, and starts 'txPacket2'. Then the function calls `setPacketTimeout` function when `txPacket2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### syncWriteTxOnly2
- Syntax
``` cpp
 void syncWriteTxOnly2(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| Parameters       | Description                                     |
|:-----------------|:------------------------------------------------|
| port_num         | Port number                                     |
| start_address    | Start address on the control table of DYNAMIXEL |
| data_length      | Data length                                     |
| param_length     | Parameter length                                |


- Detailed Description

    This function intends simultaneous multiple DYNAMIXEL's control by writing same length of data to the same address on the DYNAMIXEL control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket2`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx2
- Syntax
``` cpp
 void bulkReadTx2(int port_num, uint16_t param_length)
```
- Parameters

| Parameters   | Description      |
|:-------------|:-----------------|
| port_num     | Port number      |
| param_length | Parameter length |

- Detailed Description

   This function intends simultaneous multiple DYNAMIXEL's control by writing different length of data to the different address on the DYNAMIXEL control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket2`. Then the function calls `setPacketTimeout` function when `txPacket2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### bulkWriteTxOnly2
- Syntax
``` cpp
 void bulkWriteTxOnly2(int port_num, uint16_t param_length)
```
- Parameters

| Parameters   | Description      |
|:-------------|:-----------------|
| port_num     | Port number      |
| param_length | Parameter length |

- Detailed Description

   This function intends simultaneous multiple DYNAMIXEL's control by writing different length of data from the different address on the DYNAMIXEL control table. The function constructs the transmission packet with bulk write instruction, and starts `TxRxPacket`. The communication result and the hardware error are available when the function is terminated.
