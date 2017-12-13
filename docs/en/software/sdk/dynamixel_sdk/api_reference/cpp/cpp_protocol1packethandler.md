---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_cpp_protocol1packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_protocol1packethandler
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 5"></div>
<div style="counter-reset: h2 2"></div>
<div style="counter-reset: h1 5"></div>

### [CPP Protocol1PacketHandler](#cpp-protocol1packethandler)

- Description

  Child class for packet construction using Protocol 1.0.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
| getInstance	| Gets instance of this class |
| ~Protocol1PacketHandler	| None |
| **[getProtocolVersion](#getprotocolversion)**	| Gets Protocol version |
| **[printTxRxResult](#printtxrxresult)**	| Shows communication result |
| **[printRxPacketError](#printrxpacketerror)**	| Shows hardware error |
| **[txPacket](#txpacket)**	| Transmits the packet |
| **[rxPacket](#rxpacket)**	| Receives the packet |
| **[txRxPacket](#txrxpacket)**	| Transmits and receives the packet |
| **[ping](#ping)**	| Ping a Dynamixel |
| **[broadcastPing](#broadcastping)**	| Not available in Protocol 1.0 |
| **[action](#action)**	| Commands ‘Run’ the Regwritten |
| **[regWrite](#regwrite)**	| Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**	| Not available in Protocol 1.0 |
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
| **[read4ByteTx](#read4bytetx)**	| Not available in Protocol 1.0 |
| **[read4ByteRx](#read4byterx)**	| Not available in Protocol 1.0 |
| **[read4ByteTxRx](#read4bytetxrx)**	| Not available in Protocol 1.0 |
| **[writeTxOnly](#writetxonly)**	| Transmits N byte write instruction packet |
| **[writeTxRx](#writetxrx)**	| Transmits and receives N byte packet |
| **[write1ByteTxOnly](#write1bytetxonly)**	| Transmits 1 byte write instruction packet |
| **[write1ByteTxRx](#write1bytetxrx)**	| Transmits and receives 1 byte packet |
| **[write2ByteTxOnly](#write2bytetxonly)**	| Transmits 2 byte write instruction packet |
| **[write2ByteTxRx](#write2bytetxrx)**	| Transmits and receives 2 byte packet |
| **[write4ByteTxOnly](#write4bytetxonly)**	| Not available in Protocol 1.0 |
| **[write4ByteTxRx](#write4bytetxrx)**	| Not available in Protocol 1.0 |
| **[regWriteTxOnly](#regwritetxonly)**	| Transmits register write instruction packet |
| **[regWriteTxRx](#regwritetxrx)**	| Transmits and receives register write packet |
| **[syncReadTx](#syncreadtx)**	| Not available in Protocol 1.0 |
| **[syncWriteTxOnly](#syncwritetxonly)**	| Transmits N byte sync write Instruction packet |
| **[bulkReadTx](#bulkreadtx)**	| Transmits N byte bulk read Instruction packet |
| **[bulkWriteTxOnly](#bulkwritetxonly)**	| Not available in Protocol 1.0 |


- Enumerator

  None

#### Method References
----------------------------------------------

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

| | |
| ------------- | ------------- |
|result |Communication result |

- Detailed Description

   This function prints out on the console window what communication `result` value means.


##### printRxPacketError
- Syntax
``` cpp
void printRxPacketError(uint8_t error)
```
- Parameters

| | |
| ------------- | ------------- |
|error| Hardware error |

- Detailed Description

   This function prints out on the console window what hardware `error` value means.



##### txPacket
- Syntax
``` cpp
 int txPacket(PortHandler *port, UINT8_T *txpacket)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|txpacket	|packet for transmission|

- Detailed Description

   This function transmits the packet. The function clears the port by `clearPort()` function at first, and passes the txpacket to the `writePort()` function. The function activates while the port is not busy, and when the packet is written on the port buffer.


##### rxPacket
- Syntax
``` cpp
int rxPacket(PortHandler *port, UINT8_T *rxpacket)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|rxpacket	|packet for reception|

- Detailed Description

   This function repeatedly tries to receive packets by `readPort()` function until whole packets that it waits to get have arrived, or the packet wait time limit is over. After, it returns communication status value.


##### txRxPacket
- Syntax
``` cpp
int txRxPacket(PortHandler *port, UINT8_T *txpacket, UINT8_T *rxpacket, UINT8_T *error = 0)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|txpacket	|packet for transmission|
|rxpacket	|packet for reception|
|error	|Dynamixel error|

- Detailed Description

   This function transmits and receives packets by `txPacket()` and `rxPacket()` functions. When `txPacket()` function succeeds to communicate, it will continue to `rxPacket()` and finishes the process if the packet succeeds to be received. In case of using the group handler functions for write, such as SyncWrite, and BulkWrite, they don’t use `rxPacket()`, so the function finishes its operation immediately after the `txPacket()`. Before the `rxPacket()`, it sets packet timeout if the packet instruction is `INST_READ`.


##### ping
- Syntax
``` cpp
int ping (PortHandler *port, UINT8_T id, UINT8_T *error = 0)
int ping (PortHandler *port, UINT8_T id, UINT16_T *model_number, UINT8_T *error = 0)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|error	|Dynamixel error|

- Detailed Description

   This function constructs the transmission packet with `INST_PING` instruction, and `txRxPacket()`. Then, the function tries to get the model number of the Dynamixel by `ReadTxRx()` function. When it succeeds to receive the packet, it makes the model number value by using `DXL_MAKEWORD()` to put two byte-type data together. Finally, it returns communication status value.


##### broadcastPing
- Syntax
``` cpp
int broadcastPing(PortHandler *port, std::vector<UINT8_T> &id_list)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id_list	|Dynamixel ID list|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### action
- Syntax
``` cpp
int action(PortHandler *port, UINT8_T id)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|


- Detailed Description

   This function constructs the transmission packet with `INST_ACTION` instruction, and `txRxPacket()`. Before using this function, the orders for the Dynamixels should be already written in the register in Dynamixel by RegWrite function. Finally, it returns communication status value.


##### reboot
- Syntax
``` cpp
int reboot(PortHandler *port, UINT8_T id, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|error	|Dynamixel error|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### factoryReset
- Syntax
``` cpp
int factoryReset(PortHandler *port, UINT8_T id, UINT8_T option, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|option |Reset option|
|error	|Dynamixel error|

- Detailed Description

   This function constructs the transmission packet with `INST_FACTORY_RESET` instruction, and `txRxPacket()`. This resets all Dynamixel settings to the factory default settings. The option is not available in Dynamixel Protocol 1.0. Finally, it returns communication status.


##### readTx
- Syntax
``` cpp
int readTx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|

- Detailed Description

   This function constructs the transmission packet with `INST_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. This function is not available for controlling more than one Dynamixel. Finally, it returns communication status.


##### readRx
- Syntax
``` cpp
int readRx(PortHandler *port, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|length	|Packet length|
|data	|Packet data|
|error	|Dynamixel error|


- Detailed Description

   This function calls `rxPacket()` function and gets the reception packet if the communication succeeds. Finally, it returns communication status value.


##### readTxRx
- Syntax
``` cpp
 int readTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|
|data	|Packet data|
|error	|Dynamixel error|


- Detailed Description

   This function calls `readTx()` function and `readRx()` function. `readRx()` function will be called when `readTx()` succeeds. Finally, it returns communication status value.


##### read1ByteTx
- Syntax
``` cpp
int read1ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx()` function for 1 Byte packet transmission. Finally, it returns communication status.


##### read1ByteRx
- Syntax
``` cpp
int read1ByteRx(PortHandler *port, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|data	|Packet data|
|error	|Dynamixel error|

- Detailed Description

   This function calls `readRx()` function for 1 Byte packet reception. Finally, it returns communication status.


##### read1ByteTxRx
- Syntax
``` cpp
 int read1ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Packet data|
|error	|Dynamixel error|


- Detailed Description

   This function calls `read1ByteTx()` function and `read1ByteRx()` function for 1 Byte packet transmission and reception. `read1ByteRx()` function will be called when `read1ByteTx()` succeeds. Finally, it returns communication status.


##### read2ByteTx
- Syntax
``` cpp
int read2ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function calls `readTx()` function for 2 Byte packet transmission. Finally, it returns communication status.


##### read2ByteRx
- Syntax
``` cpp
 int read2ByteRx(PortHandler *port, UINT16_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|data	|Packet data|
|error	|Dynamixel error|


- Detailed Description

   This function calls `readRx()` function for 2 Byte packet reception. Finally, it returns communication status.


##### read2ByteTxRx
- Syntax
``` cpp
 int read2ByteTxRx(PortHandler *port, UINT8_T id,UINT16_T address, UIN16_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Packet data|
|error	|Dynamixel error|


- Detailed Description

   This function calls `read2ByteTx()` function and `read2ByteRx()` function for 2 Byte packet transmission and reception. `read2ByteRx()` function will be called when `read2ByteTx()` succeeds. Finally, it returns communication status.


##### read4ByteTx
- Syntax
``` cpp
int read4ByteTx(PortHandler *port, UINT8_T id, UINT16_T address)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### read4ByteRx
- Syntax
``` cpp
int read4ByteRx(PortHandler *port, UINT32_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|data	|Packet data|
|error	|Dynamixel error|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### read4ByteTxRx
- Syntax
``` cpp
int read4ByteTxRx(PortHandler *port, UIN8_T id, UINT16_T address, UINT32_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### writeTxOnly
- Syntax
``` cpp
int writeTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|
|data	|Data for write|


- Detailed Description

   This function constructs the transmission packet with `INST_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### writeTxRx
- Syntax
``` cpp
int writeTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

    This function constructs the transmission packet with `INST_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### write1ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function calls `writeTxOnly()` function for 1 Byte packet. Finally, it returns communication status.


##### write1ByteTxRx
- Syntax
``` cpp
int write1ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT8_T data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

   This function calls `writeTxRx()` function for 1 Byte packet transmission and reception. Finally, it returns communication status.


##### write2ByteTxOnly
- Syntax
``` cpp
int write2ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

    This function calls `writeTxOnly()` function for 2 Byte packet. Finally, it returns communication status.


##### write2ByteTxRx
- Syntax
``` cpp
 int write2ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

    This function calls `writeTxRx()` function for 2Byte packet transmission and reception. Finally, it returns communication status.


##### write4ByteTxOnly
- Syntax
``` cpp
int write1ByteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address|	Address on the control table of Dynamixel|
|data	|Data for write|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### write4ByteTxRx
- Syntax
``` cpp
int write4ByteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT32_T data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### regWriteTxOnly
- Syntax
``` cpp
 int RegWriteTxOnly(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|
|data	|Data for write|


- Detailed Description

   This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txPacket()`. Finally, it returns communication status.


##### regWriteTxRx

- Syntax
``` cpp
 int RegWriteTxRx(PortHandler *port, UINT8_T id, UINT16_T address, UINT16_T length, UINT8_T *data, UINT8_T *error)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|length	|Packet length|
|data	|Data for write|
|error	|Dynamixel error|


- Detailed Description

    This function constructs the transmission packet with `INST_REG_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### syncReadTx
- Syntax
``` cpp
int syndReadTx(PortHandler *port, UINT16_T address, UINT16_T data_length, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|param	|Parameters|
|param_length	|Parameter length|


- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.


##### syncWriteTxOnly
- Syntax
``` cpp
 int syncWriteTxOnly(PortHandler *port, UINT16_T start_address, UINT16_T data_length, UINT8_T *data, UINT16_T param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|id	|Dynamixel ID|
|address	|Address on the control table of Dynamixel|
|data_length	|Data length|
|data	|Data for write|
|param_length	|Parameter length|


- Detailed Description

    This function constructs the transmission packet with `INST_SYNC_WRITE` instruction, and `txRxPacket()`. Finally, it returns communication status.


##### bulkReadTx
- Syntax
``` cpp
 int bulkReadTx(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|param	|Parameters|
|param_length	|Parameter length|

- Detailed Description

   This function constructs the transmission packet with `INST_BULK_READ` instruction, and `txPacket()`. Then the function calls `setPacketTimeout()` function when `txPacket()` succeeds. Finally, it returns communication status.


##### bulkWriteTxOnly
- Syntax
``` cpp
 int bulkWriteTxOnly(PortHandler *port, UINT8_T *param, UINT16_T param_length)
```
- Parameters

| | |
| ------------- | ------------- |
|port	|PortHandler instance|
|param	|Parameters|
|param_length	|Parameter length|

- Detailed Description

   This function is not available with the Dynamixel Protocol 1.0. It returns `COMM_NOT_AVAILABLE` status.
