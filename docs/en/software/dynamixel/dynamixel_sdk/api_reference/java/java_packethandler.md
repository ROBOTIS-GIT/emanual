---
layout: archive
lang: en
ref: java_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/java/java_packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 5"></div>
<div style="counter-reset: h3 1"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="java"><a href="#java">Java</a></h2>
<![end dummy Header 1]-->

### [Java PacketHandler](#java-packethandler)

- Description

Base functions for packet construction.

- Members

  None


- Methods

| Methods                                               | Description                                          |
|:------------------------------------------------------|:-----------------------------------------------------|
| **[packetHandler](#packethandler)**                   | Initializes members of packet data pointer struct    |
| **[printTxRxResult](#printtxrxresult)**               | Shows communication result                           |
| **[printRxPacketError](#printtxrxresult)**            | Shows hardware error                                 |
| **[getLastTxRxResult](#getlasttxrxresult)**           | Gets last communication result                       |
| **[getLastRxPacketError](#getlasttxrxresult)**        | Gets last hardware error                             |
| **[setDataWrite](#setdatawrite)**                     | Gets last communication result                       |
| **[getDataRead](#getdataread)**                       | Gets last hardware error                             |
| **[txPacket](#txpacket)**                             | Transmits the packet                                 |
| **[rxPacket](#rxpacket)**                             | Receives the packet                                  |
| **[txRxPacket](#txrxpacket)**                         | Transmits and receives the packet                    |
| **[ping](#ping)**                                     | ping a Dynamixel                                     |
| **[pingGetModelNum](#pinggetmodelnum)**               | Ping a Dynamixel and get its model number            |
| **[broadcastPing](#broadcastping)**                   | ping all connected Dynamixels                        |
| **[getBroadcastPingResult](#getbroadcastpingresult)** | Get IDs of Dynamixels responded by BroadcastPing2    |
| **[action](#action)**                                 | Commands ‘Run’ the Regwritten                        |
| **[regWrite](#regwrite)**                             | Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**                                 | Reboots Dynamixel                                    |
| **[factoryReset](#factoryreset)**                     | Resets all Dynamixel settings                        |
| **[readTx](#readtx)**                                 | Transmits N byte read instruction packet             |
| **[readRx](#readrx)**                                 | Receives N byte read status packet                   |
| **[readTxRx](#readtxrx)**                             | Transmits and receives N byte packet                 |
| **[read1ByteTx](#read1bytetx)**                       | Transmits 1 byte read instruction packet             |
| **[read1ByteRx](#read1byterx)**                       | Receives 1 byte read status packet                   |
| **[read1ByteTxRx](#read1bytetxrx)**                   | Transmits and receives 1 byte packet                 |
| **[read2ByteTx](#read2bytetx)**                       | Transmits 2 byte read instruction packet             |
| **[read2ByteRx](#read2byterx)**                       | Receives 2 byte read status packet                   |
| **[read2ByteTxRx](#read2bytetxrx)**                   | Transmits and receives 2 byte packet                 |
| **[read4ByteTx](#read4bytetx)**                       | Transmits 4 byte read instruction packet             |
| **[read4ByteRx](#read4byterx)**                       | Receives 4 byte read status packet                   |
| **[read4ByteTxRx](#read4bytetxrx)**                   | Transmits and receives 4 byte packet                 |
| **[writeTxOnly](#writetxonly)**                       | Transmits N byte write instruction packet            |
| **[writeTxRx](#writetxrx)**                           | Transmits and receives N byte packet                 |
| **[write1ByteTxOnly](#write1bytetxonly)**             | Transmits 1 byte write instruction packet            |
| **[write1ByteTxRx](#write1bytetxrx)**                 | Transmits and receives 1 byte packet                 |
| **[write2ByteTxOnly](#write2bytetxonly)**             | Transmits 2 byte write instruction packet            |
| **[write2ByteTxRx](#write2bytetxrx)**                 | Transmits and receives 2 byte packet                 |
| **[write4ByteTxOnly](#write4bytetxonly)**             | Transmits 4 byte write instruction packet            |
| **[write4ByteTxRx](#write4bytetxrx)**                 | Transmits and receives 4 byte packet                 |
| **[regWriteTxOnly](#regwritetxonly)**                 | Transmits register write instruction packet          |
| **[regWriteTxRx](#regwritetxrx)**                     | Transmits and receives register write packet         |
| **[syncReadTx](#syncreadtx)**                         | Transmits N byte sync read Instruction packet        |
| **[syncWriteTxOnly](#syncwritetxonly)**               | Transmits N byte sync write Instruction packet       |
| **[bulkReadTx](#bulkreadtx)**                         | Transmits N byte bulk read Instruction packet        |
| **[bulkWriteTxOnly](#bulkwritetxonly)**               | Transmits N byte bulk write Instruction packet       |


- Enumerator

  None

#### Method References

##### packetHandler
- Syntax
``` java
void packetHandler()
```
- Parameters

   None

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes `packetData` struct and initialzes struct members.  


##### printTxRxResult
- Syntax
``` java
void printTxRxResult(int protocol_version, int result)
```
- Parameters

| Parameters       | Description          |
|:-----------------|:---------------------|
| protocol_version | Protocol version     |
| result           | Communication result |

- Detailed Description

   This function calls either `printTxRxResult1` or `printTxRxResult2` function depending on the `protocol_version`. The function prints out on the console window what communication `result` value means.


##### printRxPacketError
- Syntax
``` java
void printRxPacketError(int protocol_version, byte error)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| protocol_version | Protocol version |
| error            | Hardware error   |

- Detailed Description

   This function calls either `printRxPacketError1` or `printRxPacketError2` function depending on the `protocol_version`. The function prints out on the console window what hardware `error` value means.


##### getLastTxRxResult
- Syntax
``` java
int getLastTxRxResult(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastTxRxResult1` or `getLastTxRxResult2` function depending on the `protocol_version`. The function returns the communication result of #`port_num` port.


##### getLastRxPacketError
- Syntax
``` java
byte getLastRxPacketError(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `getLastRxPacketError1` or `getLastRxPacketError2` function depending on the `protocol_version`. The function returns the hardware error of #`port_num` port.

##### setDataWrite
- Syntax
``` java
void setDataWrite(int port_num, int protocol_version, short data_length, short data_pos, int data)
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

   This function calls either `setDataWrite1` or `setDataWrite2` function depending on the `protocol_version`. The function puts `Data length` bytes of `Data` into `data_pos` element of array for writing data at #`port_num` port tx buffer.


##### getDataRead
- Syntax
``` java
int getDataRead(int port_num, int protocol_version, short data_length, short data_pos)
```
- Parameters

| Parameters       | Description                        |
|:-----------------|:-----------------------------------|
| port_num         | Port number                        |
| protocol_version | Protocol version                   |
| data_length      | Data length                        |
| data_pos         | Targeted position of array element |

- Detailed Description

   This function calls either `getDataRead1` or `getDataRead2` function depending on the `protocol_version`. The function gets `data_length` bytes of the data located in `data_pos` position of read data array that from #`port_num` port rx buffer.


##### txPacket
- Syntax
``` java
 void txPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port_num         |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `txPacket1` or `txPacket2` function depending on the `protocol_version`. The function transmits the packet. The function clears the port by `clearPort` function at first, and stores data in the txpacket storage of #`port_num` port. The communication result and the hardware error are available when the function is terminated.


##### rxPacket
- Syntax
``` java
void rxPacket(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `rxPacket1` or `rxPacket2` function depending on the `protocol_version`. The function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket
- Syntax
``` java
void txRxPacket(int port_num, int protocol_version)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `txRxPacket1` or `txRxPacket2` function depending on the `protocol_version`. The function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket` and `rxPacket` functions. When `txPacket` function succeeds to communicate, it will continue to `rxPacket` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, and BulkWrite, don’t use `rxPacket` so the function finishes its operation immediately after the 'txPacket2'. Before the `rxPacket`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping
- Syntax
``` java
void ping (int port_num, int protocol_version, byte id)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |

- Detailed Description

   This function calls either `ping1` or `ping2` function depending on the `protocol_version`. The function uses `pingGetModelNum` without requesting Dynamixel to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### pingGetModelNum
- Syntax
``` java
short pingGetModelNum (int port_num, int protocol_version, int id)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |

- Detailed Description

   This function calls either `pingGetModelNum1` or `pingGetModelNum2` function depending on the `protocol_version`. The function constructs the transmission packet for ping, and stats `txRxPacket`. Then, the function tries to get the model number of the Dynamixel by `readTxRx` function. When it succeeds to receive the packet, it returns the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing
- Syntax
``` java
void broadcastPing(int port_num, int protocol_version)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `broadcastPing1` or `broadcastPing2` function depending on the `protocol_version`. The function finds all connected dynamixels and store their id in the list. The function is unavailable in protocol 1.0.


##### getBroadcastPingResult
- Syntax
``` java
Boolean getBroadcastPingResult(int port_num, int protocol_version, int id)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |

- Detailed Description

   This function calls either `getBroadcastPingResult1` or `getBroadcastPingResult2` function depending on the `protocol_version`. The function returns whether #`id` Dynamixel responded by `broadcastPing` function. The function is unavailable in protocol 1.0.


##### action
- Syntax
``` java
void action(int port_num, int protocol_version, int id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |

- Detailed Description

   This function calls either `action1` or `action2` function depending on the `protocol_version`. The function pulls the trigger of sending txpacket previously set by `regWriteTxOnly` or `regWriteTxRx` function, using `txRxPacket` function. The communication result and the hardware error are available when the function is terminated.


##### reboot
- Syntax
``` java
void reboot(int port_num, int protocol_version, byte id)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |


- Detailed Description

   This function calls either `reboot1` or `reboot2` function depending on the `protocol_version`. The function constructs the transmission packet with reboot instruction, and starts `txRxPacket`. The function may perform its role when the Dynamixel stops working caused by hardware error. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### factoryReset
- Syntax
``` java
void factoryReset(int port_num, int protocol_version, byte id, byte option)

```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| id               | Dynamixel ID     |
| option           | Reset option     |

- Detailed Description

   This function calls either `factoryReset1` or `factoryReset2` function depending on the `protocol_version`. The function constructs the transmission packet for reset Dynamixel, and starts `txRxPacket`. The resets targeted Dynamixel's settings to the factory default settings. The `option` indicates the range of which items on the control table should be reset: `0xFF` for resetting all values, `0x01` for resetting all values except ID, `0x02` for resetting all values except ID and Baudrate. The communication result and the hardware error are available when the function is terminated. In protocol 1.0, `option` is selectable with only full-reset mode `0x00`.

##### readTx
- Syntax
``` java
void readTx(int port_num, int protocol_version, byte id, short address, short length)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |

- Detailed Description

   This function calls either `readTx1` or `readTx2` function depending on the `protocol_version`. The function constructs the transmission packet with read instruction, and starts `txPacket`. Then the function calls `setPacketTimeout` function when packet transmission succeeds. The function can't control more than one Dynamixel at once. The communication result and the hardware error are available when the function is terminated.


##### readRx
- Syntax
``` java
void readRx(int port_num, int protocol_version, short length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| length           | Packet length    |


- Detailed Description

   This function calls either `readRx1` or `readRx2` function depending on the `protocol_version`. The function calls `rxPacket2` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx
- Syntax
``` java
 void readTxRx(int port_num, int protocol_version, byte id, short address, short length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   This function calls either `readTxRx1` or `readTxRx2` function depending on the `protocol_version`. The function calls `readTx` function and `readRx` function. `readRx` function will be called when `readTx` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx
- Syntax
``` java
void read1ByteTx(int port_num, int protocol_version, byte id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `read1ByteTx1` or `read1ByteTx2` function depending on the `protocol_version`. The function calls `readTx` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx
- Syntax
``` java
byte read1ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `read1ByteRx1` or `read1ByteRx2` function depending on the `protocol_version`. The function calls `readRx` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx
- Syntax
```java
 byte read1ByteTxRx(int port_num, int protocol_version, byte id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |

- Detailed Description

   This function calls either `read1ByteTxRx1` or `read1ByteTxRx2` function depending on the `protocol_version`. The function calls `readTxRx` function to read 1 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx
- Syntax
```java
void read2ByteTx(int port_num, int protocol_version, byte id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `read2ByteTx1` or `read2ByteTx2` function depending on the `protocol_version`. The function calls `readTx` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx
- Syntax
```java
 short read2ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |


- Detailed Description

   This function calls either `read2ByteRx1` or `read2ByteRx2` function depending on the `protocol_version`. The function calls `readRx` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx
- Syntax
```java
 short read2ByteTxRx(int port_num, int protocol_version, byte id,short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `read2ByteTxRx1` or `read2ByteTxRx2` function depending on the `protocol_version`. The function calls `readTxRx` function to read 2 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx
- Syntax
```java
void read4ByteTx(int port_num, int protocol_version, byte id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `read4ByteTx1` or `read4ByteTx2` function depending on the `protocol_version`. The function calls `readTx` function to send 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### read4ByteRx
- Syntax
```java
int read4ByteRx(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |

- Detailed Description

   This function calls either `read4ByteRx1` or `read4ByteRx2` function depending on the `protocol_version`. The function calls `readRx` function to receive response packet of 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### read4ByteTxRx
- Syntax
```java
int read4ByteTxRx(int port_num, int protocol_version, UIN8_T id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `read4ByteTxRx1` or `read4ByteTxRx2` function depending on the `protocol_version`. The function calls `readTxRx` function to read 4 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### writeTxOnly
- Syntax
```java
void writeTxOnly(int port_num, int protocol_version, byte id, short address, short length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   This function calls either `writeTxOnly1` or `writeTxOnly2` function depending on the `protocol_version`. The function constructs the transmission packet with write instruction, and starts `txPacket`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx
- Syntax
```java
void writeTxRx(int port_num, int protocol_version, byte id, short address, short length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   This function calls either `writeTxRx1` or `writeTxRx2` function depending on the `protocol_version`. The function constructs the transmission packet with write instruction, and starts `txRxPacket`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly
- Syntax
```java
void write1ByteTxOnly(int port_num, int protocol_version, byte id, short address, byte data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write1ByteTxOnly1` or `write1ByteTxOnly2` function depending on the `protocol_version`. The function calls `writeTxOnly` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx
- Syntax
```java
void write1ByteTxRx(int port_num, int protocol_version, byte id, short address, byte data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write1ByteTxRx1` or `write1ByteTxRx2` function depending on the `protocol_version`. The function calls `writeTxRx` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly
- Syntax
```java
void write2ByteTxOnly(int port_num, int protocol_version, byte id, short address, short data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write2ByteTxOnly1` or `write2ByteTxOnly2` function depending on the `protocol_version`. The function calls `writeTxOnly` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx
- Syntax
```java
 void write2ByteTxRx(int port_num, int protocol_version, byte id, short address, short data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write2ByteTxRx1` or `write2ByteTxRx2` function depending on the `protocol_version`. The function calls `writeTxRx` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly
- Syntax
```java
void write4ByteTxOnly(int port_num, int protocol_version, byte id, short address, int data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | Data for write                            |


- Detailed Description

   This function calls either `write4ByteTxOnly1` or `write4ByteTxOnly2` function depending on the `protocol_version`. The function calls `writeTxOnly` function to send 4 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### write4ByteTxRx
- Syntax
```java
void write4ByteTxRx(int port_num, int protocol_version, byte id, short address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   This function calls either `write4ByteTxRx1` or `write4ByteTxRx2` function depending on the `protocol_version`. The function calls `writeTxRx` function to send 4 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### regWriteTxOnly
- Syntax
```java
 void regWriteTxOnly(int port_num, int protocol_version, byte id, short address, short length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   This function calls either `RegWriteTxOnly1` or `RegWriteTxOnly2` function depending on the `protocol_version`. The function intends simultaneous control of more than one Dynamixel. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx

- Syntax
```java
 void regWriteTxRx(int port_num, int protocol_version, byte id, short address, short length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| id               | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   This function calls either `regWriteTxRx1` or `regWriteTxRx2` function depending on the `protocol_version`. The function intends simultaneous multiple Dynamixel control. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx
- Syntax
```java
void syndReadTx(int port_num, int protocol_version, short address, short data_length, short param_length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| address          | Address on the control table of Dynamixel |
| data_length      | Data length                               |
| param_length     | Parameter length                          |

- Detailed Description

   This function calls either `syncReadTx1` or `syncReadTx2` function depending on the `protocol_version`. The function intends simultanoues multiple Dynamixel control by reading same length of data from the same address on the Dynamixel control table. The function constructs the transmission packet with sync read instruction, and starts 'txPacket2'. Then the function calls `setPacketTimeout` function when `txPacket` succeeds. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### syncWriteTxOnly
- Syntax
```java
 void syncWriteTxOnly(int port_num, int protocol_version, short start_address, short data_length, short param_length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port_num         | Port number                               |
| protocol_version | Protocol version                          |
| start_address    | Address on the control table of Dynamixel |
| data_length      | Data length                               |
| param_length     | Parameter length                          |


- Detailed Description

   This function calls either `syncWriteTxOnly1` or `syncWriteTxOnly2` function depending on the `protocol_version`. The function intends simultaneous multiple Dynamixel control by writing same length of data to the same address on the Dynamixel control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx
- Syntax
```java
 void bulkReadTx(int port_num, int protocol_version, short param_length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| param_length     | Parameter length |

- Detailed Description

   This function calls either `bulkReadTx1` or `bulkReadTx2` function depending on the `protocol_version`. The function intends simultaneous multiple Dynamixel control by writing different length of data to the different address on the Dynamixel control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket`. Then the function calls `setPacketTimeout` function when `txPacket` succeeds. The communication result and the hardware error are available when the function is terminated.

##### bulkWriteTxOnly
- Syntax
``` java
 void bulkWriteTxOnly(int port_num, int protocol_version, short param_length)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |
| param_length     | Parameter length |

- Detailed Description

   This function calls either `bulkWriteTxOnly1` or `bulkWriteTxOnly2` function depending on the `protocol_version`. The function intends simultaneous multiple Dynamixel control by writing different length of data from the different address on the Dynamixel control table. The function constructs the transmission packet with bulk write instruction, and starts `TxRxPacket`. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.
