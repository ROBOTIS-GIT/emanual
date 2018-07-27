---
layout: archive
lang: en
ref: java_groupsyncwrite
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/java/java_groupsyncwrite/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 5"></div>
<div style="counter-reset: h3 2"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="java"><a href="#java">Java</a></h2>
<![end dummy Header 1]-->

### [Java GroupSyncWrite](#java-groupsyncwrite)

- Description

  Base functions for simultaneous dynamixel control on writing to same length data on same control table address.

- Members

  None


- Methods

| Methods                                                      | Description                                       |
|:-------------------------------------------------------------|:--------------------------------------------------|
| **[groupSyncWrite](#groupsyncwrite)**                        | Initializes members of packet data pointer struct |
| **[groupSyncWriteAddParam](#groupsyncwrite_addparam)**       | Adds parameter storage for read                   |
| **[groupSyncWriteRemoveParam](#groupsyncwrite_removeparam)** | Removes parameter on the storage                  |
| **[groupSyncWriteChangeParam](#groupsyncwrite_changeparam)** | Changes parameter on the storage                  |
| **[groupSyncWriteClearParam](#groupsyncwrite_clearparam)**   | Clears parameter storage                          |
| **[groupSyncWriteTxPacket](#groupsyncwrite_txpacket)**       | Transmits packet to the number of Dynamixels      |



- Enumerator

  None

#### Method References

##### groupSyncWrite
- Syntax
``` java
int groupSyncWrite(int port_num, int protocol_version, short start_address, short data_length)
```
- Parameters

| Parameters       | Description                                 |
|:-----------------|:--------------------------------------------|
| port_num         | Port number                                 |
| protocol_version | Protocol version                            |
| start_address    | Control table address to start writing data |
| data_length      | Total data length                           |

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### groupSyncWriteAddParam
- Syntax
``` java
Boolean groupSyncWriteAddParam(int group_num, byte id, int data, short input_length)
```
- Parameters

| Parameters   | Description       |
|:-------------|:------------------|
| group_num    | Group number      |
| id           | Dynamixel ID      |
| data         | Data for write    |
| input_length | Input data length |

- Detailed Description

   This function pushes `id` to the Dynamixel ID list, and initializes #`group_num` parameter storage by adding `input_length` bytes `data`. The function deals with 1, 2 or 4 byte data only. The function returns false when the length of input data exceeds parameter or wrong length, or returns true.


##### groupSyncWriteRemoveParam
- Syntax
``` java
void groupSyncWriteRemoveParam(int group_num, byte id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |
| id         | Dynamixel ID |

- Detailed Description

   This function removes `id` and its data for write in the #`group_num` Dynamixel ID list. The function returns false when no data is in the parameter storage, or returns true.


##### groupSyncWriteChangeParam
- Syntax
``` java
Boolean groupSyncWriteChangeParam(int group_num, byte id, int data, short input_length, short data_pos)
```
- Parameters

| Parameters   | Description                |
|:-------------|:---------------------------|
| group_num    | Group number               |
| id           | Dynamixel ID               |
| data         | Data for write             |
| input_length | Input data length          |
| data_pos     | Data position in the array |

- Detailed Description

   This function pushes new `data_length` bytes `data` into #`group_num` parameter storage of same `id`. The function returns false when the target ID doesn’t exists in the ID list, or returns true.


##### groupSyncWriteClearParam
- Syntax
``` java
void groupSyncWriteClearParam(int group_num)
```
- Parameters

   None

- Detailed Description

   This function clears #`group_num` Dynamixel ID list.


##### groupSyncWriteTxPacket
- Syntax
``` java
void groupSyncWriteTxPacket(int group_num)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits the packet by using `syncWriteTxOnly` function. The communication result and the hardware error are available when the function is terminated.
