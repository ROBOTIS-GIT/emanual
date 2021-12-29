---
layout: archive
lang: en
ref: c_groupsyncread
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_groupsyncread/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 8"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="c"><a href="#c">C</a></h2>
<![end dummy Header 1]-->

### [C GroupSyncRead](#c-groupsyncread)

- Description

  Base functions for simultaneous dynamixel control on reading to same length data on same control table address.

- Members

  None

| Methods                                                         | Description                                                        |
|:----------------------------------------------------------------|:-------------------------------------------------------------------|
| **[groupSyncRead](#groupsyncread)**                             | Initializes members of packet data pointer struct                  |
| **[groupSyncReadAddParam](#groupsyncreadaddparam)**             | Adds parameter storage for read                                    |
| **[groupSyncReadRemoveParam](#groupsyncreadremoveparam)**       | Removes parameter on the storage                                   |
| **[groupSyncReadClearParam](#groupsyncreadclearparam)**         | Clears parameter storage                                           |
| **[groupSyncReadTxPacket](#groupsyncreadtxpacket)**             | Transmits packet to the number of DYNAMIXEL's                      |
| **[groupSyncReadRxPacket](#groupsyncreadrxpacket)**             | receives packet from the number of DYNAMIXEL's                     |
| **[groupSyncReadTxRxPacket](#groupsyncreadtxrxpacket)**         | Transmits and receives packet on the number of DYNAMIXEL's         |
| **[groupFastSyncReadTxPacket](#groupfastsyncreadtxpacket)**     | Transmits packet to the number of DYNAMIXEL's quickly              |
| **[groupFastSyncReadRxPacket](#groupfastsyncreadrxpacket)**     | Receives packet from the number of DYNAMIXEL's quickly             |
| **[groupFastSyncReadTxRxPacket](#groupfastsyncreadtxrxpacket)** | Transmits and receives packet on the number of DYNAMIXEL's quickly |
| **[groupSyncReadIsAvailable](#groupsyncreadisavailable)**       | Checks whether there is available data in the data storage         |
| **[groupSyncReadGetData](#groupsyncreadgetdata)**               | Gets data from received packet                                     |


- Enumerator

  None

#### Method References

##### groupSyncRead
- Syntax
``` cpp
int groupSyncRead(int port_num, int protocol_version, uint16_t start_address, uint16_t data_length)
```

| Parameters       | Description                                 |
|:-----------------|:--------------------------------------------|
| port_num         | Port number                                 |
| protocol_version | Protocol version                            |
| start_address    | Control table address to start reading data |
| data_length      | Total data length                           |

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### groupSyncReadAddParam
- Syntax
``` cpp
uint8_t groupSyncReadAddParam(int group_num, uint8_t id)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function pushes id to the DYNAMIXEL ID list, and initializes #`group_num` parameter storage It returns false when the class uses Protocol 1.0, or it returns true.


##### groupSyncReadRemoveParam
- Syntax
``` cpp
void groupSyncReadRemoveParam(int group_num, uint8_t id)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function removes id and its data for write in the #`group_num` DYNAMIXEL ID list. It returns false when the class uses Protocol 1.0 or target ID does not exists in the ID list, or returns true.


##### groupSyncReadClearParam
- Syntax
``` cpp
void groupSyncReadClearParam(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |


- Detailed Description

   This function clears #`group_num` DYNAMIXEL ID list. It returns false when the class uses Protocol 1.0, or returns true.


##### groupSyncReadTxPacket
- Syntax
``` cpp
void groupSyncReadTxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits the packet by using `SyncReadTx` function. The communication result and the hardware error are available when the function is terminated.


##### groupSyncReadRxPacket
- Syntax
``` cpp
void groupSyncReadRxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function receives the packet by using `ReadRx` function. The communication result and the hardware error are available when the function is terminated.


##### groupSyncReadTxRxPacket
- Syntax
``` cpp
void groupSyncReadTxRxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits and receives the packet by using `SyncReadTx` function and `ReadRx` function. The communication result and the hardware error are available when the function is terminated.


##### groupFastSyncReadTxPacket
- Syntax
``` cpp
void groupFastSyncReadTxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits and receives the packet by using `fastSyncReadTx` quickly. The communication result and the hardware error are available when the function is terminated.


##### groupFastSyncReadRxPacket
- Syntax
``` cpp
void groupFastSyncReadRxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits and receives the packet by using `fastSyncReadRx` function quickly. The communication result and the hardware error are available when the function is terminated.


##### groupFastSyncReadTxRxPacket
- Syntax
``` cpp
void groupFastSyncReadTxRxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits and receives the packet by using `fastSyncReadTx` function and `fastSyncReadRx` function quickly. The communication result and the hardware error are available when the function is terminated.


##### groupSyncReadIsAvailable
- Syntax
``` cpp
uint8_t groupSyncReadIsAvailable(int group_num, uint8_t id, uint16_t address, uint16_t data_length)
```

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Packet data                               |


- Detailed Description

    This function checks whether there is available data in the data storage. It returns false when used Protocol is 1.0 version or there is no data from target address, or returns true.

##### groupSyncReadGetData
- Syntax
``` cpp
uint32_t groupSyncReadGetData(int group_num, uint8_t id, uint16_t address, uint16_t data_length)
```

| Parameters | Description                               |
|:-----------|:------------------------------------------|
| group_num  | Group number                              |
| id         | DYNAMIXEL ID                              |
| address    | Address on the control table of DYNAMIXEL |
| data       | Packet data                               |


- Detailed Description

   This function gets specific data from received packet. It returns false when the class uses Protocol 1.0 or there is no data from target address, or returns true.
