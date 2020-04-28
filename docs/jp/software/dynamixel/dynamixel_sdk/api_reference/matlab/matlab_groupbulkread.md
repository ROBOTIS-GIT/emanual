---
layout: archive
lang: en
ref: matlab_groupbulkread
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/matlab/matlab_groupbulkread/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 6"></div>
<div style="counter-reset: h3 5"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="matlab"><a href="#matlab">Matlab</a></h2>
<![end dummy Header 1]-->

### [Matlab GroupBulkRead](#matlab-groupbulkread)

- Description

  Base functions for simultaneous dynamixel control on reading to different length data on different control table address.

- Members

  None

- Methods

| Methods                                                   | Description                                                |
|:----------------------------------------------------------|:-----------------------------------------------------------|
| **[groupBulkRead](#groupbulkread)**                       | Initializes members of packet data pointer struct          |
| **[groupBulkReadAddParam](#groupbulkreadaddparam)**       | Adds parameter storage for read                            |
| **[groupBulkReadRemoveParam](#groupbulkreadremoveparam)** | Removes parameter on the storage                           |
| **[groupBulkReadClearParam](#groupbulkreadclearparam)**   | Clears parameter storage                                   |
| **[groupBulkReadTxPacket](#groupbulkreadtxpacket)**       | Transmits packet to the number of DYNAMIXEL's               |
| **[groupBulkReadRxPacket](#groupbulkreadrxpacket)**       | receives packet from the number of DYNAMIXEL's              |
| **[groupBulkReadTxRxPacket](#groupbulkreadtxrxpacket)**   | Transmits and receives packet on the number of DYNAMIXEL's  |
| **[groupBulkReadIsAvailable](#groupbulkreadisavailable)** | Checks whether there is available data in the data storage |
| **[groupBulkReadGetData](#groupbulkreadgetdata)**         | Gets data from received packet                             |


- Enumerator

  None

#### Method References

##### groupBulkRead
- Syntax
```c
int groupBulkRead(int port_num, int protocol_version)
```
- Parameters

| Parameters       | Description      |
|:-----------------|:-----------------|
| port_num         | Port number      |
| protocol_version | Protocol version |


- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### groupBulkReadAddParam
- Syntax
```c
bool groupBulkReadAddParam(int group_num, int id, int start_address, int data_length)
```
- Parameters

| Parameters    | Description   |
|:--------------|:--------------|
| group_num     | Group number  |
| id            | DYNAMIXEL ID  |
| start_address | Start address |
| data_length   | Data length   |


- Detailed Description

   This function pushes `id` to the DYNAMIXEL ID list, and initializes the parameter storage by `setting start_address` and `data_length`.


##### groupBulkReadRemoveParam
- Syntax
```c
void groupBulkReadRemoveParam(int group_num, int id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function removes target `id` in the #`group_num` DYNAMIXEL ID list. It returns false when the class uses Protocol 1.0 .


##### groupBulkReadClearParam
- Syntax
```c
void groupBulkReadClearParam(int group_num)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function clears the #`group_num` DYNAMIXEL ID list. It returns false when the class uses Protocol 1.0, or returns true.


##### groupBulkReadTxPacket
- Syntax
```c
void groupBulkReadTxPacket(int group_num)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits the packet by using `BulkReadTx` The communication result and the hardware error are available when the function is terminated.


##### groupBulkReadRxPacket
- Syntax
```c
void groupBulkReadRxPacket(int group_num)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function receives the packet by using `ReadRx` function. The communication result and the hardware error are available when the function is terminated.


##### groupBulkReadTxRxPacket
- Syntax
```c
void groupBulkReadTxRxPacket(int group_num)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits and receives the packet by using `groupBulkReadTxPacket` function and `groupBulkReadRxPacket` function. The communication result and the hardware error are available when the function is terminated.

##### groupBulkReadIsAvailable
- Syntax
```c
bool groupBulkReadIsAvailable(int group_num, int id, int address, int data_length)
```
- Parameters

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Packet data                               |


- Detailed Description

   This function checks whether there is available data in the data storage. It returns false when there is no data from target address, or returns true.

##### groupBulkReadGetData
- Syntax
```c
int groupBulkReadGetData(int group_num, int id, int address, int data_length)
```
- Parameters

| Parameters  | Description                               |
|:------------|:------------------------------------------|
| group_num   | Group number                              |
| id          | DYNAMIXEL ID                              |
| address     | Address on the control table of DYNAMIXEL |
| data_length | Data length                               |


- Detailed Description

   This function gets specific data from received packet. It returns false when there is no data from target address, or returns true.
