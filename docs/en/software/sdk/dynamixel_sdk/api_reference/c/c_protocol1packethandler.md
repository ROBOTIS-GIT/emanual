---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_c_protocol1packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/c/c_protocol1packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 5"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h1 5"></div>

### [C Protocol1PacketHandler](#c-protocol1packethandler)

- Description

  PacketHandler dependent functions for packet construction using Protocol 1.0.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
| **[printTxRxResult1](#printtxrxresult1)**	| Shows communication result |
| **[printRxPacketError1](#printtxrxresult1)**	| Shows hardware error |
| **[getLastTxRxResult1](#getlasttxrxresult1)**	| Gets last communication result |
| **[getLastRxPacketError1](#getlasttxrxresult1)**	| Gets last hardware error |
| **[setDataWrite1](#setdatawrite1)**	| Gets last communication result |
| **[getDataRead1](#getdataread1)**	| Gets last hardware error |
| **[txPacket1](#txpacket1)**	| Transmits the packet |
| **[rxPacket1](#rxpacket1)**	| Receives the packet |
| **[txRxPacket1](#txrxpacket1)**	| Transmits and receives the packet |
| **[ping1](#ping1)**	| Ping a Dynamixel |
| **[pingGetModelNum1](#pinggetmodelnum1)**	| Ping a Dynamixel and get its model number |
| **[broadcastPing1](#broadcastping1)**	| Not available in Protocol 1.0 |
| **[getBroadcastPingResult1](#getbroadcastpingresult1)** | Not available in Protocol 1.0 |
| **[action1](#action1)**	| Commands ‘Run’ the Regwritten |
| **[RegWrite1](#regwrite1)**	| Writes the packets and wait for the ‘Action’ command |
| **[reboot1](#reboot1)**	| Not available in Protocol 1.0 |
| **[factoryReset1](#factoryreset1)**	| Resets all Dynamixel settings |
| **[readTx1](#readtx1)**	| Transmits N byte read instruction packet |
| **[readRx1](#readrx1)**	| Receives N byte read status packet |
| **[readTxRx1](#readtxrx1)**	| Transmits and receives N byte packet |
| **[read1ByteTx1](#read1bytetx1)**	| Transmits 1 byte read instruction packet |
| **[read1ByteRx1](#read1byterx1)**	| Receives 1 byte read status packet |
| **[read1ByteTxRx1](#read1bytetxrx1)**	| Transmits and receives 1 byte packet |
| **[read2ByteTx1](#read2bytetx1)**	| Transmits 2 byte read instruction packet |
| **[read2ByteRx1](#read2byterx1)**	| Receives 2 byte read status packet |
| **[read2ByteTxRx1](#read2bytetxrx1)**	| Transmits and receives 2 byte packet |
| **[read4ByteTx1](#read4bytetx1)**	| Not available in Protocol 1.0 |
| **[read4ByteRx1](#read4byterx1)**	| Not available in Protocol 1.0 |
| **[read4ByteTxRx1](#read4bytetxrx1)**	| Not available in Protocol 1.0 |
| **[writeTxOnly1](#writetxonly1)**	| Transmits N byte write instruction packet |
| **[writeTxRx1](#writetxrx1)**	| Transmits and receives N byte packet |
| **[write1ByteTxOnly1](#write1bytetxonly1)**	| Transmits 1 byte write instruction packet |
| **[write1ByteTxRx1](#write1bytetxrx1)**	| Transmits and receives 1 byte packet |
| **[write2ByteTxOnly1](#write2bytetxonly1)**	| Transmits 2 byte write instruction packet |
| **[write2ByteTxRx1](#write2bytetxrx1)**	| Transmits and receives 2 byte packet |
| **[write4ByteTxOnly1](#write4bytetxonly1)**	| Not available in Protocol 1.0 |
| **[write4ByteTxRx1](#write4bytetxrx1)**	| Not available in Protocol 1.0 |
| **[regWriteTxOnly1](#regwritetxonly1)**	| Transmits register write instruction packet |
| **[regWriteTxRx1](#regwritetxrx1)**	| Transmits and receives register write packet |
| **[syncReadTx1](#syncreadtx1)**	| Not available in Protocol 1.0 |
| **[syncWriteTxOnly1](#syncwritetxonly1)**	| Transmits N byte sync write Instruction packet |
| **[bulkReadTx1](#bulkreadtx1)**	| Transmits N byte bulk read Instruction packet |
| **[bulkWriteTxOnly1](#bulkwritetxonly1)**	| Not available in Protocol 1.0 |


- Enumerator

  None

#### Method References
----------------------------------------------

##### printTxRxResult1
- Syntax
``` cpp
void printTxRxResult1(int result)
```
- Parameters

| | |
| ------------- | ------------- |
|result |Communication result |

- Detailed Description

   This function prints out on the console window what communication `result` value means.


##### printRxPacketError1
- Syntax
``` cpp
void printRxPacketError1(uint8_t error)
```
- Parameters

| | |
| ------------- | ------------- |
|error| Hardware error |

- Detailed Description

   This function prints out on the console window what hardware `error` value means.


##### getLastTxRxResult1
- Syntax
``` cpp
int getLastTxRxResult1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |

- Detailed Description

   This function returns the communication result of #`port_num` port.


##### getLastRxPacketError1
- Syntax
``` cpp
uint8_t getLastRxPacketError1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |

- Detailed Description

   This function returns the hardware error of #`port_num` port.

##### setDataWrite1
- Syntax
``` cpp
void setDataWrite1(int port_num, uint16_t data_length, uint16_t data_pos, uint32_t data)
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


##### getDataRead1
- Syntax
``` cpp
uint32_t getDataRead1(int port_num, uint16_t data_length, uint16_t data_pos)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num| Port number |
|data_length| Data length |
|data_pos| Targeted position of array element |

- Detailed Description

   This function gets `data_length` bytes of the data located in `data_pos` position of read data array that from #`port_num` port rx buffer.


##### txPacket1
- Syntax
``` cpp
 void txPacket1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port_num|

- Detailed Description

   This function transmits the packet. The function clears the port by `ClearPort` function at first, and stores data in the txpacket storage of #`port_num` port. The communication result and the hardware error are available when the function is terminated.


##### rxPacket1
- Syntax
``` cpp
void rxPacket1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function repeatedly tries to receive packets from #`port_num` port rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket1
- Syntax
``` cpp
void txRxPacket1(int port_num)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket1` and `rxPacket1` functions. When `txPacket1` function succeeds to communicate, it will continue to `RxPacket2` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, don’t use `RxPacket` so the function finishes its operation immediately after the `txPacket1`. Before the `rxPacket1`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping1
- Syntax
``` cpp
void ping1 (int port_num, uint8_t id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id | Dynamixel ID|

- Detailed Description

   This function uses `pingGetModelNum1` without requesting Dynamixel to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### pingGetModelNum1
- Syntax
``` cpp
uint16_t pingGetModelNum1 (int port_num, int id)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|

- Detailed Description

   This function constructs the transmission packet for ping, and stats `txRxPacket1`. Then, the function tries to get the model number of the Dynamixel by `readTxRx1` function. When it succeeds to receive the packet, it returns the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing1
- Syntax
``` cpp
void broadcastPing1(int port_num)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### getBroadcastPingResult1
- Syntax
``` cpp
uint8_t getBroadcastPingResult1(int port_num)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. The function returns false.

##### action1
- Syntax
``` cpp
void action1(int port_num, int id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|

- Detailed Description

   This function pulls the trigger of sending txpacket previously set by `regWriteTxOnly1` or `regWriteTxRx1` function, using `txRxPacket1` function. The communication result and the hardware error are available when the function is terminated.


##### reboot1
- Syntax
``` cpp
void reboot1(int port_num, uint8_t id)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### factoryReset1
- Syntax
``` cpp
void factoryReset1(int port_num, uint8_t id, uint8_t option)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|option |Reset option|

- Detailed Description

   This function constructs the transmission packet for reset Dynamixel, and starts `txRxPacket1`. This resets targeted Dynamixel's settings to the factory default settings. The `option` is not available in Dynamixel Protocol 1.0. The communication result and the hardware error are available when the function is terminated.


##### readTx1
- Syntax
``` cpp
void readTx1(int port_num, uint8_t id, uint16_t address, uint16_t length)

```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|

- Detailed Description

   This function constructs the transmission packet with read instruction, and starts `txPacket1`. Then the function calls `SetPacketTimeout` function when packet transmission succeeds. This function can't control more than one Dynamixel at once. The communication result and the hardware error are available when the function is terminated.


##### readRx1
- Syntax
``` cpp
void readRx1(int port_num, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|length	|Packet length|


- Detailed Description

   This function calls `rxPacket1` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx1
- Syntax
``` cpp
 void readTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function calls `readTx1` function and `readRx1` function. `readRx1` function will be called when `readTx1` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx1
- Syntax
``` cpp
void read1ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx1` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx1
- Syntax
``` cpp
uint8_t read1ByteRx1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function calls `readRx1` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx1
- Syntax
``` cpp
 uint8_t read1ByteTxRx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|

- Detailed Description

   This function calls `readTxRx1` function to read 1 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx1
- Syntax
``` cpp
void read2ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx1` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx1
- Syntax
``` cpp
 uint16_t read2ByteRx1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|


- Detailed Description

   This function calls `readRx1` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx1
- Syntax
``` cpp
 uint16_t read2ByteTxRx1(int port_num, uint8_t id,uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTxRx1` function to read 2 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx1
- Syntax
``` cpp
void read4ByteTx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### read4ByteRx1
- Syntax
``` cpp
uint32_t read4ByteRx1(int port_num)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### read4ByteTxRx1
- Syntax
``` cpp
uint32_t read4ByteTxRx1(int port_num, UIN8_T id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### writeTxOnly1
- Syntax
``` cpp
void writeTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function constructs the transmission packet with write instruction, and starts `txPacket1`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx1
- Syntax
``` cpp
void writeTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

    This function constructs the transmission packet with write instruction, and starts `txRxPacket1`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly1
- Syntax
``` cpp
void write1ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly1` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx1
- Syntax
``` cpp
void write1ByteTxRx1(int port_num, uint8_t id, uint16_t address, uint8_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxRx1` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly1
- Syntax
``` cpp
void write2ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly1` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx1
- Syntax
``` cpp
 void write2ByteTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxRx1` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly1
- Syntax
``` cpp
void write4ByteTxOnly1(int port_num, uint8_t id, uint16_t address, uint32_t data)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address|	Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### write4ByteTxRx1
- Syntax
``` cpp
void write4ByteTxRx1(int port_num, uint8_t id, uint16_t address)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### regWriteTxOnly1
- Syntax
``` cpp
 void regWriteTxOnly1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function intends simultaneous control of more than one Dynamixel. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action1` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx1

- Syntax
``` cpp
 void regWriteTxRx1(int port_num, uint8_t id, uint16_t address, uint16_t length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|


- Detailed Description

   This function intends simultaneous multiple Dynamixel control. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action1` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx1
- Syntax
``` cpp
void syncReadTx1(int port_num, uint16_t address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.


##### syncWriteTxOnly1
- Syntax
``` cpp
 void syncWriteTxOnly1(int port_num, uint16_t start_address, uint16_t data_length, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|start_address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param_length	|Parameter length|


- Detailed Description

    This function intends simultaneous multiple Dynamixel control by writing same length of data to the same address on the Dynamixel control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket1`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx1
- Syntax
``` cpp
 void bulkReadTx1(int port_num, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|param_length	|Parameter length|

- Detailed Description

   This function intends simultaneous multiple Dynamixel control by reading different length of data to the different address on the Dynamixel control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket1`. Then the function calls `SetPacketTimeout` function when `txPacket1` succeeds. The communication result and the hardware error are available when the function is terminated.


##### bulkWriteTxOnly1
- Syntax
``` cpp
 void bulkWriteTxOnly1(int port_num, uint16_t param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|param_length	|Parameter length|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0.
