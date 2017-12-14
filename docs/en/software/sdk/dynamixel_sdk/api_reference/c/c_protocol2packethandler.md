---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_protocol2packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_protocol2packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 6"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C Protocol2PacketHandler](#c-protocol2packethandler)

- Description

  PacketHandler dependent functions for packet construction using Protocol 2.0.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
| **[printTxRxResult2](#printtxrxresult2)**	| Shows communication result |
| **[printRxPacketError2](#printtxrxresult2)**	| Shows hardware error |
| **[getLastTxRxResult2](#getlasttxrxresult2)**	| Gets last communication result |
| **[getLastRxPacketError2](#getlasttxrxresult2)**	| Gets last hardware error |
| **[setDataWrite2](#setdatawrite2)**	| Gets last communication result |
| **[getDataRead2](#getdataread2)**	| Gets last hardware error |
| **[txPacket2](#txpacket2)**	| Transmits the packet |
| **[rxPacket2](#rxpacket2)**	| Receives the packet |
| **[txRxPacket2](#txrxpacket2)**	| Transmits and receives the packet |
| **[ping2](#ping2)**	| Ping a Dynamixel |
| **[pingGetModelNum2](#pinggetmodelnum2)**	| Ping a Dynamixel and get its model number |
| **[broadcastPing2](#broadcastping2)**	| Ping all connected Dynamixels |
| **[getBroadcastPingResult2](#getbroadcastpingresult2)** | Get IDs of Dynamixels responded by broadcastPing2 |
| **[action2](#action2)**	| Commands ‘Run’ the Regwritten |
| **[regWrite2](#regwrite2)**	| Writes the packets and wait for the ‘Action’ command |
| **[reboot2](#reboot2)**	| Reboots Dynamixel |
| **[factoryReset2](#factoryreset2)**	| Resets all Dynamixel settings |
| **[readTx2](#readtx2)**	| Transmits N byte read instruction packet |
| **[readRx2](#readrx2)**	| Receives N byte read status packet |
| **[readTxRx2](#readtxrx2)**	| Transmits and receives N byte packet |
| **[read1ByteTx2](#read1bytetx2)**	| Transmits 1 byte read instruction packet |
| **[read1ByteRx2](#read1byterx2)**	| Receives 1 byte read status packet |
| **[read1ByteTxRx2](#read1bytetxrx2)**	| Transmits and receives 1 byte packet |
| **[read2ByteTx2](#read2bytetx2)**	| Transmits 2 byte read instruction packet |
| **[read2ByteRx2](#read2byterx2)**	| Receives 2 byte read status packet |
| **[read2ByteTxRx2](#read2bytetxrx2)**	| Transmits and receives 2 byte packet |
| **[read4ByteTx2](#read4bytetx2)**	| Transmits 4 byte read instruction packet |
| **[read4ByteRx2](#read4byterx2)**	| Receives 4 byte read status packet |
| **[read4ByteTxRx2](#read4bytetxrx2)**	| Transmits and receives 4 byte packet |
| **[writeTxOnly2](#writetxonly2)**	| Transmits N byte write instruction packet |
| **[writeTxRx2](#writetxrx2)**	| Transmits and receives N byte packet |
| **[write1ByteTxOnly2](#write1bytetxonly2)**	| Transmits 1 byte write instruction packet |
| **[write1ByteTxRx2](#write1bytetxrx2)**	| Transmits and receives 1 byte packet |
| **[write2ByteTxOnly2](#write2bytetxonly2)**	| Transmits 2 byte write instruction packet |
| **[write2ByteTxRx2](#write2bytetxrx2)**	| Transmits and receives 2 byte packet |
| **[write4ByteTxOnly2](#write4bytetxonly2)**	| Transmits 4 byte write instruction packet |
| **[write4ByteTxRx2](#write4bytetxrx2)**	| Transmits and receives 4 byte packet |
| **[regWriteTxOnly2](#regwritetxonly2)**	| Transmits register write instruction packet |
| **[regWriteTxRx2](#regwritetxrx2)**	| Transmits and receives register write packet |
| **[syncReadTx2](#syncreadtx2)**	| Transmits N byte sync read Instruction packet |
| **[syncWriteTxOnly2](#syncwritetxonly2)**	| Transmits N byte sync write Instruction packet |
| **[bulkReadTx2](#bulkreadtx2)**	| Transmits N byte bulk read Instruction packet |
| **[bulkWriteTxOnly2](#bulkwritetxonly2)**	| Transmits N byte bulk write Instruction packet |


- Enumerator

  None

#### Method References
----------------------------------------------

##### printTxRxResult2
- Syntax
``` cpp
void printTxRxResult2(int result)
```
- Parameters

| | |
| ------------- | ------------- |
|result |Communication result |

- Detailed Description

   This function prints out on the console window what communication `result` value means.


##### printRxPacketError2
- Syntax
``` cpp
void printRxPacketError2(uint8_t error)
```
- Parameters

| | |
| ------------- | ------------- |
|error| Hardware error |

- Detailed Description

   This function prints out on the console window what hardware `error` value means.


##### getLastTxRxResult2
- Syntax
``` cpp
int getLastTxRxResult2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |

- Detailed Description

   This function returns the communication result of #`port_num` port.


##### getLastRxPacketError2
- Syntax
``` cpp
uint8_t getLastRxPacketError2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |

- Detailed Description

   This function returns the hardware error of #`port_num` port.

##### setDataWrite2
- Syntax
``` cpp
void setDataWrite2(int port_num, uint16_t data_length, uint16_t data_pos, uint32_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|data_length| Data length |
|data_pos| Targeted position of array element |
|data| Data |

- Detailed Description

   This function puts `Data length` bytes of `Data` into `data_pos` element of array for writing data at #`port_num` port tx buffer.


##### getDataRead2
- Syntax
``` cpp
uint32_t getDataRead2(int port_num, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|data_length| Data length |
|data_pos| Targeted position of array element |

- Detailed Description

   This function gets `data_length` bytes of the data located in `data_pos` position of read data array that from #`port_num` port rx buffer.


##### txPacket2
- Syntax
``` cpp
 void txPacket2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port_num|

- Detailed Description

   This function transmits the packet. The function clears the port by `ClearPort` function at first, and stores data in the txpacket storage of #`port_num` port. The communication result and the hardware error are available when the function is terminated.


##### rxPacket2
- Syntax
``` cpp
void rxPacket2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket2
- Syntax
``` cpp
void txRxPacket2(int port_num)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket2` and `rxPacket2` functions. When `txPacket2` function succeeds to communicate, it will continue to `rxPacket2` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, and BulkWrite, don’t use `rxPacket2` so the function finishes its operation immediately after the 'txPacket2'. Before the `rxPacket2`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping2
- Syntax
``` cpp
void ping2 (int port_num, uint8_t id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id | Dynamixel ID|

- Detailed Description

   This function uses `pingGetModelNum2` without requesting Dynamixel to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### pingGetModelNum2
- Syntax
``` cpp
uint16_t pingGetModelNum2 (int port_num, int id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|

- Detailed Description

   This function constructs the transmission packet for ping, and stats `txRxPacket2`. Then, the function tries to get the model number of the Dynamixel by `readTxRx2` function. When it succeeds to receive the packet, it returns the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing2
- Syntax
``` cpp
void broadcastPing2(int port_num)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function finds all connected dynamixels and store their id in the list.


##### getBroadcastPingResult2
- Syntax
``` cpp
uint8_t getBroadcastPingResult2(int port_num, int id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id | Dynamixel ID |

- Detailed Description

   This function returns whether #`id` Dynamixel responded by `broadcastPing2` function.


##### action2
- Syntax
``` cpp
void action2(int port_num, int id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|

- Detailed Description

   This function pulls the trigger of sending txpacket previously set by `regWriteTxOnly2` or `regWriteTxRx2` function, using `txRxPacket2` function. The communication result and the hardware error are available when the function is terminated.


##### reboot2
- Syntax
``` cpp
void reboot2(int port_num, uint8_t id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|


- Detailed Description

   This function constructs the transmission packet with reboot instruction, and starts `txRxPacket2`. The function may perform its role when the Dynamixel stops working caused by hardware error. The communication result and the hardware error are available when the function is terminated.


##### factoryReset2
- Syntax
``` cpp
void factoryReset2(int port_num, uint8_t id, uint8_t option)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|option |Reset option|

- Detailed Description

   This function constructs the transmission packet for reset Dynamixel, and starts `txRxPacket2`. This resets targeted Dynamixel's settings to the factory default settings. The `option` indicates the range of which items on the control table should be reset: `0xFF` for resetting all values, `0x01` for resetting all values except ID, `0x02` for resetting all values except ID and Baudrate. The communication result and the hardware error are available when the function is terminated.

##### readTx2
- Syntax
``` cpp
void readTx2(int port_num, uint8_t id, uint16_t address, uint16_t length)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|

- Detailed Description

   This function constructs the transmission packet with read instruction, and starts `txPacket2`. Then the function calls `setPacketTimeout` function when packet transmission succeeds. This function can't control more than one Dynamixel at once. The communication result and the hardware error are available when the function is terminated.


##### readRx2
- Syntax
``` cpp
void readRx2(int port_num, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|length	|Packet length|


- Detailed Description

   This function calls `rxPacket2` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx2
- Syntax
``` cpp
 void readTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls `readTx2` function and `readRx2` function. `readRx2` function will be called when `readTx2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx2
- Syntax
``` cpp
void read1ByteTx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx2` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx2
- Syntax
``` cpp
uint8_t read1ByteRx2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function calls `readRx2` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx2
- Syntax
``` cpp
 uint8_t read1ByteTxRx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|

- Detailed Description

   This function calls `readTxRx2` function to read 1 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx2
- Syntax
``` cpp
void read2ByteTx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx2` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx2
- Syntax
``` cpp
 uint16_t read2ByteRx2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|


- Detailed Description

   This function calls `readRx2` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx2
- Syntax
``` cpp
 uint16_t read2ByteTxRx2(int port_num, uint8_t id,uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTxRx2` function to read 2 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx2
- Syntax
``` cpp
void Read4ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx2` function to send 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read4ByteRx2
- Syntax
``` cpp
uint32_t read4ByteRx2(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function calls `readRx2` function to receive response packet of 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTxRx2
- Syntax
``` cpp
uint32_t read4ByteTxRx2(int port_num, UIN8_T id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTxRx2` function to read 4 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### writeTxOnly2
- Syntax
``` cpp
void writeTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function constructs the transmission packet with write instruction, and starts `txPacket2`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx2
- Syntax
``` cpp
void writeTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

    This function constructs the transmission packet with write instruction, and starts `txRxPacket2`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly2
- Syntax
``` cpp
void write1ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly2` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx2
- Syntax
``` cpp
void write1ByteTxRx2(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxRx2` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly2
- Syntax
``` cpp
void write2ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly2` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx2
- Syntax
``` cpp
 void write2ByteTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxRx2` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly2
- Syntax
``` cpp
void write4ByteTxOnly2(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address|	Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly2` function to send 4 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxRx2
- Syntax
``` cpp
void write4ByteTxRx2(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `writeTxRx2` function to send 4 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### regWriteTxOnly2
- Syntax
``` cpp
 void regWriteTxOnly2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function intends simultaneous control of more than one Dynamixel. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action2` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx2

- Syntax
``` cpp
 void regWriteTxRx2(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function intends simultaneous multiple Dynamixel control. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action2` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx2
- Syntax
``` cpp
void syncReadTx2(int port_num, uint16_t address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|

- Detailed Description

   This function intends simultanoues multiple Dynamixel control by reading same length of data from the same address on the Dynamixel control table. The function constructs the transmission packet with sync read instruction, and starts 'txPacket2'. Then the function calls `setPacketTimeout` function when `txPacket2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### syncWriteTxOnly2
- Syntax
``` cpp
 void syncWriteTxOnly2(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|start_address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|


- Detailed Description

    This function intends simultaneous multiple Dynamixel control by writing same length of data to the same address on the Dynamixel control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket2`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx2
- Syntax
``` cpp
 void bulkReadTx2(int port_num, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|param_length	|Parameter length|

- Detailed Description

   This function intends simultaneous multiple Dynamixel control by writing different length of data to the different address on the Dynamixel control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket2`. Then the function calls `setPacketTimeout` function when `txPacket2` succeeds. The communication result and the hardware error are available when the function is terminated.


##### bulkWriteTxOnly2
- Syntax
``` cpp
 void bulkWriteTxOnly2(int port_num, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|param_length	|Parameter length|

- Detailed Description

   This function intends simultaneous multiple Dynamixel control by writing different length of data from the different address on the Dynamixel control table. The function constructs the transmission packet with bulk write instruction, and starts `TxRxPacket`. The communication result and the hardware error are available when the function is terminated.
