---
layout: archive
lang: en
ref: cpp_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/cpp/cpp_packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 2"></div>
<div style="counter-reset: h3 4"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="cpp"><a href="#cpp">CPP</a></h2>
<![end dummy Header 1]-->

### [CPP PacketHandler](#cpp-packethandler)

- Description

Base class for packet construction.

- Members

  None


- Methods

| Methods            | Description                                          |
|:-------------------|:-----------------------------------------------------|
| getPacketHandler   | Gets PacketHandler from either of Protocols          |
| ~PacketHandler     | None                                                 |
| getProtocolVersion | Gets Protocol version                                |
| printTxRxResult    | Shows communication result                           |
| printRxPacketError | Shows hardware error                                 |
| txPacket           | Transmits the packet                                 |
| rxPacket           | Receives the packet                                  |
| txRxPacket         | Transmits and receives the packet                    |
| ping               | Ping a Dynamixel                                     |
| broadcastPing      | Ping all connected Dynamixels                        |
| action             | Commands ‘Run’ the Regwritten                        |
| regWrite           | Writes the packets and wait for the ‘Action’ command |
| reboot             | Reboots Dynamixel                                    |
| factoryReset       | Resets all Dynamixel settings                        |
| readTx             | Transmits N byte read instruction packet             |
| readRx             | Receives N byte read status packet                   |
| readTxRx           | Transmits and receives N byte packet                 |
| read1ByteTx        | Transmits 1 byte read instruction packet             |
| read1ByteRx        | Receives 1 byte read status packet                   |
| read1ByteTxRx      | Transmits and receives 1 byte packet                 |
| read2ByteTx        | Transmits 2 byte read instruction packet             |
| read2ByteRx        | Receives 2 byte read status packet                   |
| read2ByteTxRx      | Transmits and receives 2 byte packet                 |
| read4ByteTx        | Transmits 4 byte read instruction packet             |
| read4ByteRx        | Receives 4 byte read status packet                   |
| read4ByteTxRx      | Transmits and receives 4 byte packet                 |
| writeTxOnly        | Transmits N byte write instruction packet            |
| writeTxRx          | Transmits and receives N byte packet                 |
| write1ByteTxOnly   | Transmits 1 byte write instruction packet            |
| write1ByteTxRx     | Transmits and receives 1 byte packet                 |
| write2ByteTxOnly   | Transmits 2 byte write instruction packet            |
| write2ByteTxRx     | Transmits and receives 2 byte packet                 |
| write4ByteTxOnly   | Transmits 4 byte write instruction packet            |
| write4ByteTxRx     | Transmits and receives 4 byte packet                 |
| regWriteTxOnly     | Transmits register write instruction packet          |
| regWriteTxRx       | Transmits and receives register write packet         |
| syncReadTx         | Transmits N byte sync read Instruction packet        |
| syncWriteTxOnly    | Transmits N byte sync write Instruction packet       |
| bulkReadTx         | Transmits N byte bulk read Instruction packet        |
| bulkWriteTxOnly    | Transmits N byte bulk write Instruction packet       |


- Enumerator

| Enumerator          | Description                                   |
|:--------------------|:----------------------------------------------|
| DXL_MAKEWORD(a, b)  | Makes value from a and b to word type         |
| DXL_MAKEDWORD(a, b) | Makes value from a and b to dword type        |
| DXL_LOWORD(l)       | Gets lower word type value from l             |
| DXL_HIWORD(l)       | Gets higher word type value from l            |
| DXL_LOBYTE(w)       | Gets lower byte type value from w             |
| DXL_HIBYTE(w)       | Gets higher byte type value from w            |
| BROADCAST_ID        | := 0xFE	Broadcast ID                           |
| MAX_ID              | := 0xFC	Maximum ID value                       |
| INST_PING           | := 1	Instruction value of Ping                 |
| INST_READ           | := 2	Instruction value of Read                 |
| INST_WRITE          | := 3	Instruction value of Write                |
| INST_REG_WRITE      | := 4	Instruction value of Register Write       |
| INST_ACTION         | := 5	Instruction value of Action               |
| INST_FACTORY_RESET  | := 6	Instruction value of Factory Reset        |
| INST_SYNC_WRITE     | := 131	Instruction value of Sync Write         |
| INST_BULK_READ      | := 146	Instruction value of Bulk Read          |
| INST_REBOOT         | := 8	Instruction value of Reboot               |
| INST_STATUS         | := 85	Instruction value of Status              |
| INST_SYNC_READ      | := 130	Instruction value of Sync Read          |
| INST_BULK_WRITE     | := 147		Instruction value of Bulk Write         |
| COMM_SUCCESS        | := 0	Status of Communication Success           |
| COMM_PORT_BUSY      | := -1000	Status of Port in use                 |
| COMM_TX_FAIL        | := -1001	Status of Transmit packet failed      |
| COMM_RX_FAIL        | := -1002	Status of Receive packet failed       |
| COMM_TX_ERROR       | := -2000	Status of Transmit packet error       |
| COMM_RX_WAITING     | := -3000	Status of Receive packet waiting      |
| COMM_RX_TIMEOUT     | := -3001	Status of Receive packet timeout      |
| COMM_RX_CORRUPT     | := -3002	Status of Receive packet corrupt      |
| COMM_NOT_AVAILABLE  | := -9000	Status of Unavailable in protocol 1.0 |


#### Method References

[Protocol1 Packet Handler](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/cpp/cpp_protocol1packethandler)

[Protocol2 Packet Handler](/docs/en/software/dynamixel/dynamixel_sdk/api_reference/cpp/cpp_protocol2packethandler)

### [CPP Protocol1PacketHandler](#cpp-protocol1packethandler)

- Description

  Child class for packet construction using Protocol 1.0.

- Members

  None


- Methods

| Methods                                       | Description                                          |
|:----------------------------------------------|:-----------------------------------------------------|
| getInstance                                   | Gets instance of this class                          |
| ~Protocol1PacketHandler                       | None                                                 |
| **[getProtocolVersion](#getprotocolversion)** | Gets Protocol version                                |
| **[printTxRxResult](#printtxrxresult)**       | Shows communication result                           |
| **[printRxPacketError](#printrxpacketerror)** | Shows hardware error                                 |
| **[txPacket](#txpacket)**                     | Transmits the packet                                 |
| **[rxPacket](#rxpacket)**                     | Receives the packet                                  |
| **[txRxPacket](#txrxpacket)**                 | Transmits and receives the packet                    |
| **[ping](#ping)**                             | Ping a Dynamixel                                     |
| **[broadcastPing](#broadcastping)**           | Not available in Protocol 1.0                        |
| **[action](#action)**                         | Commands ‘Run’ the Regwritten                        |
| **[regWrite](#regwrite)**                     | Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**                         | Not available in Protocol 1.0                        |
| **[factoryReset](#factoryreset)**             | Resets all Dynamixel settings                        |
| **[readTx](#readtx)**                         | Transmits N byte read instruction packet             |
| **[readRx](#readrx)**                         | Receives N byte read status packet                   |
| **[readTxRx](#readtxrx)**                     | Transmits and receives N byte packet                 |
| **[read1ByteTx](#read1bytetx)**               | Transmits 1 byte read instruction packet             |
| **[read1ByteRx](#read1byterx)**               | Receives 1 byte read status packet                   |
| **[read1ByteTxRx](#read1bytetxrx)**           | Transmits and receives 1 byte packet                 |
| **[read2ByteTx](#read2bytetx)**               | Transmits 2 byte read instruction packet             |
| **[read2ByteRx](#read2byterx)**               | Receives 2 byte read status packet                   |
| **[read2ByteTxRx](#read2bytetxrx)**           | Transmits and receives 2 byte packet                 |
| **[read4ByteTx](#read4bytetx)**               | Not available in Protocol 1.0                        |
| **[read4ByteRx](#read4byterx)**               | Not available in Protocol 1.0                        |
| **[read4ByteTxRx](#read4bytetxrx)**           | Not available in Protocol 1.0                        |
| **[writeTxOnly](#writetxonly)**               | Transmits N byte write instruction packet            |
| **[writeTxRx](#writetxrx)**                   | Transmits and receives N byte packet                 |
| **[write1ByteTxOnly](#write1bytetxonly)**     | Transmits 1 byte write instruction packet            |
| **[write1ByteTxRx](#write1bytetxrx)**         | Transmits and receives 1 byte packet                 |
| **[write2ByteTxOnly](#write2bytetxonly)**     | Transmits 2 byte write instruction packet            |
| **[write2ByteTxRx](#write2bytetxrx)**         | Transmits and receives 2 byte packet                 |
| **[write4ByteTxOnly](#write4bytetxonly)**     | Not available in Protocol 1.0                        |
| **[write4ByteTxRx](#write4bytetxrx)**         | Not available in Protocol 1.0                        |
| **[regWriteTxOnly](#regwritetxonly)**         | Transmits register write instruction packet          |
| **[regWriteTxRx](#regwritetxrx)**             | Transmits and receives register write packet         |
| **[syncReadTx](#syncreadtx)**                 | Not available in Protocol 1.0                        |
| **[syncWriteTxOnly](#syncwritetxonly)**       | Transmits N byte sync write Instruction packet       |
| **[bulkReadTx](#bulkreadtx)**                 | Transmits N byte bulk read Instruction packet        |
| **[bulkWriteTxOnly](#bulkwritetxonly)**       | Not available in Protocol 1.0                        |


- Enumerator

  None

#### Method References

##### getProtocolVersion
- Syntax
``` cpp
float getProtocolVersion()
```
- Parameters

   None

- Detailed Description

   This function returns the protocol version set in the `PacketHandler` as a float value.


##### printTxRxResult
- Syntax
``` cpp
void printTxRxResult(int result)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| result     | Communication result |

- Detailed Description

   This function prints out on the console window what communication `result` value means.


##### printRxPacketError
- Syntax
``` cpp
void printRxPacketError(uint8_t error)
```
- Parameters

| Parameters | Description    |
|:-----------|:---------------|
| error      | Hardware error |

- Detailed Description

   This function prints out on the console window what hardware `error` value means.



##### txPacket
- Syntax
``` cpp
 int txPacket(PortHandler *port, UINT8_T *txpacket)
```
- Parameters

| Parameters | Description             |
|:-----------|:------------------------|
| port       | PortHandler instance    |
| txpacket   | packet for transmission |

- Detailed Description

   This function transmits the packet. The function clears the port by `clearPort()` function at first, and passes the txpacket to the `writePort()` function. The function activates while the port is not busy, and when the packet is written on the port buffer.


##### rxPacket
- Syntax
``` cpp
int rxPacket(PortHandler *port, UINT8_T *rxpacket)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| rxpacket   | packet for reception |

- Detailed Description

   This function repeatedly tries to receive packets by `readPort()` function until whole packets that it waits to get have arrived, or the packet wait time limit is over. After, it returns communication status value.


##### txRxPacket
- Syntax
``` cpp
int txRxPacket(PortHandler *port, UINT8_T *txpacket, UINT8_T *rxpacket, UINT8_T *error = 0)
```
- Parameters

| Parameters | Description             |
|:-----------|:------------------------|
| port       | PortHandler instance    |
| txpacket   | packet for transmission |
| rxpacket   | packet for reception    |
| error      | Dynamixel error         |

- Detailed Description

   This function transmits and receives packets by `txPacket()` and `rxPacket()` functions. When `txPacket()` function succeeds to communicate, it will continue to `rxPacket()` and finishes the process if the packet succeeds to be received. In case of using the group handler functions for write, such as SyncWrite, and BulkWrite, they don’t use `rxPacket()`, so the function finishes its operation immediately after the `txPacket()`. Before the `rxPacket()`, it sets packet timeout if the packet instruction is `INST_READ`.


##### ping
- Syntax
``` cpp
int ping (PortHandler *port, UINT8_T id, UINT8_T *error = 0)
int ping (PortHandler *port, UINT8_T id, UINT16_T *model_number, UINT8_T *error = 0)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| error      | Dynamixel error      |

- Detailed Description

   This function constructs the transmission packet with `INST_PING` instruction, and `txRxPacket()`. Then, the function tries to get the model number of the Dynamixel by `ReadTxRx()` function. When it succeeds to receive the packet, it makes the model number value by using `DXL_MAKEWORD()` to put two byte-type data together. Finally, it returns communication status value.


##### broadcastPing
- Syntax
``` cpp
int broadcastPing(PortHandler *port, std::vector<UINT8_T> &id_list)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id_list    | Dynamixel ID list    |

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### action
- Syntax
``` cpp
int action(PortHandler *port, UINT8_T id)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |


- Detailed Description

   This function constructs the transmission packet with `INST_ACTION` instruction, and `txRxPacket()`. Before using this function, the orders for the Dynamixels should be already written in the register in Dynamixel by RegWrite function. Finally, it returns communication status value.


##### reboot
- Syntax
``` cpp
int reboot(PortHandler *port, UINT8_T id, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| error      | Dynamixel error      |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### factoryReset
- Syntax
``` cpp
int factoryReset(PortHandler *port, UINT8_T id, UINT8_T option, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| option     | Reset option         |
| error      | Dynamixel error      |

- Detailed Description

   This function constructs the transmission packet with `INST_FACTORY_RESET` instruction, and `txRxPacket()`. This resets all Dynamixel settings to the factory default settings. The option is not available in Dynamixel Protocol 1.0. Finally, it returns communication status.


##### readTx
- Syntax
``` cpp
int readTx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |

- Detailed Description

   This function constructs the transmission packet with `INST_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. This function is not available for controlling more than one Dynamixel. Finally, it returns communication status.


##### readRx
- Syntax
``` cpp
int readRx(PortHandler *port, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| length     | Packet length        |
| data       | Packet data          |
| error      | Dynamixel error      |


- Detailed Description

   This function calls `rxPacket()` function and gets the reception packet if the communication succeeds. Finally, it returns communication status value.


##### readTxRx
- Syntax
``` cpp
 int readTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

   This function calls `readTx()` function and `readRx()` function. `readRx()` function will be called when `readTx()` succeeds. Finally, it returns communication status value.


##### read1ByteTx
- Syntax
``` cpp
int read1ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

   This function calls `readTx()` function for 1 Byte packet transmission. Finally, it returns communication status.


##### read1ByteRx
- Syntax
``` cpp
int read1ByteRx(PortHandler *port, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |

- Detailed Description

   This function calls `readRx()` function for 1 Byte packet reception. Finally, it returns communication status.


##### read1ByteTxRx
- Syntax
``` cpp
 int read1ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

   This function calls `read1ByteTx()` function and `read1ByteRx()` function for 1 Byte packet transmission and reception. `read1ByteRx()` function will be called when `read1ByteTx()` succeeds. Finally, it returns communication status.


##### read2ByteTx
- Syntax
``` cpp
int read2ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

   This function calls `readTx()` function for 2 Byte packet transmission. Finally, it returns communication status.


##### read2ByteRx
- Syntax
``` cpp
 int read2ByteRx(PortHandler *port, UINT16_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |


- Detailed Description

   This function calls `readRx()` function for 2 Byte packet reception. Finally, it returns communication status.


##### read2ByteTxRx
- Syntax
``` cpp
 int read2ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UIN16_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

   This function calls `read2ByteTx()` function and `read2ByteRx()` function for 2 Byte packet transmission and reception. `read2ByteRx()` function will be called when `read2ByteTx()` succeeds. Finally, it returns communication status.


##### read4ByteTx
- Syntax
``` cpp
int read4ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### read4ByteRx
- Syntax
``` cpp
int read4ByteRx(PortHandler *port, UINT32_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### read4ByteTxRx
- Syntax
``` cpp
int read4ByteTxRx(PortHandler *port, UIN8_T id, UINT16_T address, UINT32_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### writeTxOnly
- Syntax
``` cpp
int writeTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |


- Detailed Description

   This function constructs the transmission packet with `INST_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### writeTxRx
- Syntax
``` cpp
int writeTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

    This function constructs the transmission packet with `INST_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### write1ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxOnly()` function for 1 Byte packet. Finally, it returns communication status.


##### write1ByteTxRx
- Syntax
``` cpp
int write1ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function calls `writeTxRx()` function for 1 Byte packet transmission and reception. Finally, it returns communication status.


##### write2ByteTxOnly
- Syntax
``` cpp
int write2ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

    This function calls `writeTxOnly()` function for 2 Byte packet. Finally, it returns communication status.


##### write2ByteTxRx
- Syntax
``` cpp
 int write2ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

    This function calls `writeTxRx()` function for 2Byte packet transmission and reception. Finally, it returns communication status.


##### write4ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### write4ByteTxRx
- Syntax
``` cpp
int write4ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### regWriteTxOnly
- Syntax
``` cpp
 int RegWriteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |


- Detailed Description

   This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### regWriteTxRx

- Syntax
``` cpp
 int RegWriteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

    This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### syncReadTx
- Syntax
``` cpp
int syndReadTx(PortHandler *port, UINT16_T address, UINT16_T data_length, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description                               |
|:-------------|:------------------------------------------|
| port         | PortHandler instance                      |
| address      | Address on the control table of Dynamixel |
| data_length  | Data length                               |
| param        | Parameters                                |
| param_length | Parameter length                          |


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### syncWriteTxOnly
- Syntax
``` cpp
 int syncWriteTxOnly(PortHandler *port, UINT16_T start_address, UINT16_T data_length, UINT8_T *data, UINT16_T param_length)
```
- Parameters

| Parameters   | Description                               |
|:-------------|:------------------------------------------|
| port         | PortHandler instance                      |
| id           | Dynamixel ID                              |
| address      | Address on the control table of Dynamixel |
| data_length  | Data length                               |
| data         | Data for write                            |
| param_length | Parameter length                          |


- Detailed Description

    This function constructs the transmission packet with `INST_SYNC_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### bulkReadTx
- Syntax
``` cpp
 int bulkReadTx(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description          |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

   This function constructs the transmission packet with `INST_BULK_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. Finally, it returns communication status.


##### bulkWriteTxOnly
- Syntax
``` cpp
 int bulkWriteTxOnly(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description          |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.
   
### [CPP Protocol2PacketHandler](#cpp-protocol2packethandler)

- Description

 Child class for packet construction using Protocol 2.0.

- Members

 None


- Methods

| Methods                                       | Description                                          |
|:----------------------------------------------|:-----------------------------------------------------|
| getInstance                                   | Gets instance of this class                          |
| ~Protocol2PacketHandler                       | None                                                 |
| **[getProtocolVersion](#getprotocolversion)** | Gets Protocol version                                |
| **[printTxRxResult](#printtxrxresult)**       | Shows communication result                           |
| **[printRxPacketError](#printrxpacketerror)** | Shows hardware error                                 |
| **[txPacket](#txpacket)**                     | Transmits the packet                                 |
| **[rxPacket](#rxpacket)**                     | Receives the packet                                  |
| **[txRxPacket](#txrxpacket)**                 | Transmits and receives the packet                    |
| **[ping](#ping)**                             | Ping a Dynamixel                                     |
| **[broadcastPing](#broadcastping)**           | Ping all connected Dynamixels                        |
| **[action](#action)**                         | Commands ‘Run’ the Regwritten                        |
| **[regWrite](#regwrite)**                     | Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**                         | Reboots Dynamixel                                    |
| **[factoryReset](#factoryreset)**             | Resets all Dynamixel settings                        |
| **[readTx](#readtx)**                         | Transmits N byte read instruction packet             |
| **[readRx](#readrx)**                         | Receives N byte read status packet                   |
| **[readTxRx](#readtxrx)**                     | Transmits and receives N byte packet                 |
| **[read1ByteTx](#read1bytetx)**               | Transmits 1 byte read instruction packet             |
| **[read1ByteRx](#read1byterx)**               | Receives 1 byte read status packet                   |
| **[read1ByteTxRx](#read1bytetxrx)**           | Transmits and receives 1 byte packet                 |
| **[read2ByteTx](#read2bytetx)**               | Transmits 2 byte read instruction packet             |
| **[read2ByteRx](#read2byterx)**               | Receives 2 byte read status packet                   |
| **[read2ByteTxRx](#read2bytetxrx)**           | Transmits and receives 2 byte packet                 |
| **[read4ByteTx](#read4bytetx)**               | Transmits 4 byte read instruction packet             |
| **[read4ByteRx](#read4byterx)**               | Receives 4 byte read status packet                   |
| **[read4ByteTxRx](#read4bytetxrx)**           | Transmits and receives 4 byte packet                 |
| **[writeTxOnly](#writetxonly)**               | Transmits N byte write instruction packet            |
| **[writeTxRx](#writetxrx)**                   | Transmits and receives N byte packet                 |
| **[write1ByteTxOnly](#write1bytetxonly)**     | Transmits 1 byte write instruction packet            |
| **[write1ByteTxRx](#write1bytetxrx)**         | Transmits and receives 1 byte packet                 |
| **[write2ByteTxOnly](#write2bytetxonly)**     | Transmits 2 byte write instruction packet            |
| **[write2ByteTxRx](#write2bytetxrx)**         | Transmits and receives 2 byte packet                 |
| **[write4ByteTxOnly](#write4bytetxonly)**     | Transmits 4 byte write instruction packet            |
| **[write4ByteTxRx](#write4bytetxrx)**         | Transmits and receives 4 byte packet                 |
| **[regWriteTxOnly](#regwritetxonly)**         | Transmits register write instruction packet          |
| **[regWriteTxRx](#regwritetxrx)**             | Transmits and receives register write packet         |
| **[syncReadTx](#syncreadtx)**                 | Transmits N byte sync read Instruction packet        |
| **[syncWriteTxOnly](#syncwritetxonly)**       | Transmits N byte sync write Instruction packet       |
| **[bulkReadTx](#bulkreadtx)**                 | Transmits N byte bulk read Instruction packet        |
| **[bulkWriteTxOnly](#bulkwritetxonly)**       | Transmits N byte bulk write Instruction packet       |


- Enumerator

 None

#### Method References

##### getProtocolVersion
- Syntax
``` cpp
float getProtocolVersion()
```
- Parameters

  None

- Detailed Description

  This function returns the protocol version set in the PacketHandler as a float value.



##### printTxRxResult
- Syntax
``` cpp
void printTxRxResult(int result)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| result     | Communication result |

- Detailed Description

  This function prints out on the console window what communication `result` value means.


##### printRxPacketError
- Syntax
``` cpp
void printRxPacketError(uint8_t error)
```
- Parameters

| Parameters | Description    |
|:-----------|:---------------|
| error      | Hardware error |

- Detailed Description

  This function prints out on the console window what hardware `error` value means.



##### txPacket
- Syntax
``` cpp
int txPacket(PortHandler *port, UINT8_T *txpacket)
```
- Parameters

| Parameters | Description             |
|:-----------|:------------------------|
| port       | PortHandler instance    |
| txpacket   | packet for transmission |

- Detailed Description

  This function transmits the packet. The function clears the port by `clearPort()` function at first, and passes the txpacket to the `writePort()` function. The function activates while the port is not busy, and when the packet is written on the port buffer.


##### rxPacket
- Syntax
``` cpp
int rxPacket(PortHandler *port, UINT8_T *rxpacket)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| rxpacket   | packet for reception |

- Detailed Description

  This function repeatedly tries to receive packets by `readPort()` function until whole packets that it waits to get have arrived, or the packet wait time limit is over. After, it returns communication status value.


##### txRxPacket
- Syntax
``` cpp
int txRxPacket(PortHandler *port, UINT8_T *txpacket, UINT8_T *rxpacket, UINT8_T *error = 0)
```
- Parameters

| Parameters | Description             |
|:-----------|:------------------------|
| port       | PortHandler instance    |
| txpacket   | packet for transmission |
| rxpacket   | packet for reception    |
| error      | Dynamixel error         |

- Detailed Description

  This function transmits and receives packets by `txPacket()` and `rxPacket()` functions. When `txPacket()` function succeeds to communicate, it will continue to `rxPacket()` and finishes the process if the packet succeeds to be received. In case of using the group handler functions for write, such as SyncWrite, and BulkWrite, they don’t use `rxPacket()`, so the function finishes its operation immediately after the `txPacket()`. Before the `rxPacket()`, it sets packet timeout if the packet instruction is `INST_READ`.


##### ping
- Syntax
``` cpp
int ping (PortHandler *port, UINT8_T id, UINT8_T *error = 0)
int ping (PortHandler *port, UINT8_T id, UINT16_T *model_number, UINT8_T *error = 0)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| error      | Dynamixel error      |

- Detailed Description

  This function constructs the transmission packet with `INST_PING` instruction, and `txRxPacket()`. Then, the function tries to get the model number of the Dynamixel by `readTxRx()` function. When it succeeds to receive the packet, it makes the model number value by using `DXL_MAKEWORD()` to put two byte-type data together. Finally, it returns communication status value.


##### broadcastPing
- Syntax
``` cpp
int broadcastPing(PortHandler *port, std::vector<UINT8_T> &id_list)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id_list    | Dynamixel ID list    |

- Detailed Description

  This function finds all connected dynamixels and store the their id lists.


##### action
- Syntax
``` cpp
int action(PortHandler *port, UINT8_T id)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |


- Detailed Description

  This function constructs the transmission packet with `INST_ACTION` instruction, and `txRxPacket()`. Before using this function, the orders for the Dynamixels should be already written in the register in Dynamixel by RegWrite function. Finally, it returns communication status value.


##### reboot
- Syntax
``` cpp
int reboot(PortHandler *port, UINT8_T id, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| error      | Dynamixel error      |


- Detailed Description

  This function constructs the transmission packet with `INST_REBOOT` instruction, and `txRxPacket()`. Finally, it returns commnunication status.


##### factoryReset
- Syntax
``` cpp
int factoryReset(PortHandler *port, UINT8_T id, UINT8_T option, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| id         | Dynamixel ID         |
| option     | Reset option         |
| error      | Dynamixel error      |

- Detailed Description

  This function constructs the transmission packet with `INST_FACTORY_RESET` instruction, and `txRxPacket()`. This resets all Dynamixel settings to the factory default settings. The option is not available in Dynamixel Protocol 1.0. Finally, it returns communication status.


##### readTx
- Syntax
``` cpp
int readTx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |

- Detailed Description

  This function constructs the transmission packet with `INST_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. This function is not available for controlling more than one Dynamixel. Finally, it returns communication status.


##### readRx
- Syntax
``` cpp
int readRx(PortHandler *port, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| length     | Packet length        |
| data       | Packet data          |
| error      | Dynamixel error      |


- Detailed Description

  This function calls `rxPacket()` function and gets the reception packet if the communication succeeds. Finally, it returns communication status value.


##### readTxRx
- Syntax
``` cpp
int readTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `readTx()` function and `readRx()` function. `readRx()` function will be called when `readTx()` succeeds. Finally, it returns communication status value.


##### read1ByteTx
- Syntax
``` cpp
int read1ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

  This function calls `readTx()` function for 1 Byte packet transmission. Finally, it returns communication status.


##### read1ByteRx
- Syntax
``` cpp
int read1ByteRx(PortHandler *port, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |

- Detailed Description

  This function calls `readRx()` function for 1 Byte packet reception. Finally, it returns communication status.


##### read1ByteTxRx
- Syntax
``` cpp
int read1ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `read1ByteTx()` function and `read1ByteRx()` function for 1 Byte packet transmission and reception. `read1ByteRx()` function will be called when `read1ByteTx()` succeeds. Finally, it returns communication status.


##### openPort
- Syntax
``` cpp
int read2ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

  This function calls `readTx()` function for 2 Byte packet transmission. Finally, it returns communication status.


##### read2ByteRx
- Syntax
``` cpp
int read2ByteRx(PortHandler *port, UINT16_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |


- Detailed Description

  This function calls `readRx()` function for 2 Byte packet reception. Finally, it returns communication status.


##### read2ByteTxRx
- Syntax
``` cpp
int read2ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UIN16_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Packet data                               |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `read2ByteTx()` function and `read2ByteRx()` function for 2 Byte packet transmission and reception. `read2ByteRx()` function will be called when `read2ByteTx()` succeeds. Finally, it returns communication status.


##### read4ByteTx
- Syntax
``` cpp
int read4ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |


- Detailed Description

  This function calls `readTx()` function for 4 Byte packet transmission. Finally, it returns communication status.  


##### read4ByteRx
- Syntax
``` cpp
int read4ByteRx(PortHandler *port, UINT32_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| port       | PortHandler instance |
| data       | Packet data          |
| error      | Dynamixel error      |

- Detailed Description

  This function calls `readRx()` function for 4 Byte packet reception. Finally, it returns communication status.  


##### read4ByteTxRx
- Syntax
``` cpp
int read4ByteTxRx(PortHandler *port, UIN8_T id, UINT16_T address, UINT32_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `read4ByteTx()` function and `read4ByteRx()` function for 4 Byte packet transmission and reception. `read4ByteRx()` function will be called when `read4ByteTx()` succeeds. Finally, it returns communication status.


##### writeTxOnly
- Syntax
``` cpp
int writeTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |


- Detailed Description

  This function constructs the transmission packet with `INST_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### writeTxRx
- Syntax
``` cpp
int writeTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function constructs the transmission packet with `INST_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### write1ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxOnly()` function for 1 Byte packet. Finally, it returns communication status.


##### write1ByteTxRx
- Syntax
``` cpp
int write1ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `writeTxRx()` function for 1 Byte packet transmission and reception. Finally, it returns communication status.


##### write2ByteTxOnly
- Syntax
``` cpp
int write2ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

   This function calls `writeTxOnly()` function for 2 Byte packet. Finally, it returns communication status.


##### write2ByteTxRx
- Syntax
``` cpp
int write2ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function calls `writeTxRx()` function for 2 Byte packet transmission and reception. Finally, it returns communication status.


##### write4ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |


- Detailed Description

  This function calls `writeTxOnly()` function for 4 Byte packet. Finally, it returns communication status.


##### write4ByteTxRx
- Syntax
``` cpp
int write4ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

  This function calls `writeTxRx()` function for 4 Byte packet transmission and reception. Finally, it returns communication status.


##### regWriteTxOnly
- Syntax
``` cpp
int regWriteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |


- Detailed Description

  This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### regWriteTxRx

- Syntax
``` cpp
int regWriteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| port       | PortHandler instance                      |
| id         | Dynamixel ID                              |
| address    | Address on the control table of Dynamixel |
| length     | Packet length                             |
| data       | Data for write                            |
| error      | Dynamixel error                           |


- Detailed Description

   This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### syncReadTx
- Syntax
``` cpp
int syndReadTx(PortHandler *port, UINT16_T address, UINT16_T data_length, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description                               |
|:-------------|:------------------------------------------|
| port         | PortHandler instance                      |
| address      | Address on the control table of Dynamixel |
| data_length  | Data length                               |
| param        | Parameters                                |
| param_length | Parameter length                          |


- Detailed Description

  This function constructs the transmission packet with `INST_SYNC_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. Finally, it returns communication status.


##### syncWriteTxOnly
- Syntax
``` cpp
int syncWriteTxOnly(PortHandler *port, UINT16_T start_address, UINT16_T data_length, UINT8_T *data, UINT16_T param_length)
```
- Parameters

| Parameters   | Description                               |
|:-------------|:------------------------------------------|
| port         | PortHandler instance                      |
| id           | Dynamixel ID                              |
| address      | Address on the control table of Dynamixel |
| data_length  | Data length                               |
| data         | Data for write                            |
| param_length | Parameter length                          |


- Detailed Description

   This function constructs the transmission packet with `INST_SYNC_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### bulkReadTx
- Syntax
``` cpp
int bulkReadTx(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description          |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

  This function constructs the transmission packet with `INST_BULK_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. Finally, it returns communication status.


##### bulkWriteTxOnly
- Syntax
``` cpp
int bulkWriteTxOnly(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| Parameters   | Description          |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

  This function constructs the transmission packet with `INST_BULK_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.
