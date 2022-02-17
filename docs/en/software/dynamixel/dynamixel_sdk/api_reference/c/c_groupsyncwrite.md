---
layout: archive
lang: en
ref: c_groupsyncwrite
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/c/c_groupsyncwrite/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 7"></div>

<!--[dummy Header 1], Dummy should be set if you are resetting the header otherwise, the raw_index.json would give you some error. Plus, you should manually add <p> tag for search tool to show the contnet in search box. >
<h1 id="dummy">DYNAMIXEL SDK</h1>
<p class=dummy_content>Group Sync Write Language C </p>
<![end dummy Header 1]-->

### [C GroupSyncWrite](#c-groupsyncwrite)

- Description

  Base functions for simultaneous dynamixel control on writing to same length data on same control table address.

- Members

  None

| Methods                                                     | Description                                       |
|:------------------------------------------------------------|:--------------------------------------------------|
| **[groupSyncWrite](#groupsyncwrite)**                       | Initializes members of packet data pointer struct |
| **[groupSyncWriteAddParam](#groupsyncwriteaddparam)**       | Adds parameter storage for write                  |
| **[groupSyncWriteRemoveParam](#groupsyncwriteremoveparam)** | Removes parameter on the storage                  |
| **[groupSyncWriteChangeParam](#groupsyncwritechangeparam)** | Changes parameter on the storage                  |
| **[groupSyncWriteClearParam](#groupsyncwriteclearparam)**   | Clears parameter storage                          |
| **[groupSyncWriteTxPacket](#groupsyncwritetxpacket)**       | Transmits packet to the number of DYNAMIXEL's     |



- Enumerator

  None

#### Method References

##### groupSyncWrite
- Syntax
``` cpp
int groupSyncWrite(int port_num, int protocol_version, uint16_t start_address, uint16_t data_length)
```

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
``` cpp
uint8_t groupSyncWriteAddParam(int group_num, uint8_t id, uint32_t data, uint16_t input_length)
```

| Parameters   | Description       |
|:-------------|:------------------|
| group_num    | Group number      |
| id           | DYNAMIXEL ID      |
| data         | Data for write    |
| input_length | Input data length |

- Detailed Description

   This function pushes `id` to the DYNAMIXEL ID list, and initializes #`group_num` parameter storage by adding `input_length` bytes `data`. The function deals with 1, 2 or 4 byte data only. The function returns false when the length of input data exceeds parameter or wrong length, or returns true.


##### groupSyncWriteRemoveParam
- Syntax
``` cpp
void groupSyncWriteRemoveParam(int group_num, uint8_t id)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |
| id         | DYNAMIXEL ID |

- Detailed Description

   This function removes `id` and its data for write in the #`group_num` DYNAMIXEL ID list. The function returns false when no data is in the parameter storage, or returns true.


##### groupSyncWriteChangeParam
- Syntax
``` cpp
uint8_t groupSyncWriteChangeParam(int group_num, uint8_t id, uint32_t data, uint16_t input_length, uint16_t data_pos)
```

| Parameters   | Description                |
|:-------------|:---------------------------|
| group_num    | Group number               |
| id           | DYNAMIXEL ID               |
| data         | Data for write             |
| input_length | Input data length          |
| data_pos     | Data position in the array |

- Detailed Description

   This function pushes new `data_length` bytes `data` into #`group_num` parameter storage of same `id`. The function returns false when the target ID doesn’t exists in the ID list, or returns true.


##### groupSyncWriteClearParam
- Syntax
``` cpp
void groupSyncWriteClearParam(int group_num)
```
- Parameters

   None

- Detailed Description

   This function clears #`group_num` DYNAMIXEL ID list.


##### groupSyncWriteTxPacket
- Syntax
``` cpp
void groupSyncWriteTxPacket(int group_num)
```

| Parameters | Description  |
|:-----------|:-------------|
| group_num  | Group number |

- Detailed Description

   This function transmits the packet by using `syncWriteTxOnly` function. The communication result and the hardware error are available when the function is terminated.
