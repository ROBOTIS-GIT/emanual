---
layout: popup
---

# syncWrite

## Description

This function writes data to a specific memory address of DYNAMIXEL with a specific ID.

## Syntax

- syncWrite(syncWriteParam)

## Parameters

- **syncWriteParam** : Structure that contains Sync Write data in below members. Data type : ParamForSyncWriteInst_t
  - addr : Address of the specific memory of DYNAMIXEL. Data type : unsigned int16
  - length : Length of data to write. Data type : unsigned int16
  - id_count : Number of ID to apply Sync Write instruction.  Data type : unsigned int8
  - XelInfoForSyncWriteParam_t xel[DXL_MAX_NODE] : Structure that contains DYNAMIXEL ID and data to write on each DYNAMIXEL
    - id : ID of a specific DYNAMIXEL. Data type : unsigned int8
    - data[DXL_MAX_NODE_BUFFER_SIZE] : Data to write on each DYNAMIXEL. Data type : unsigned int8

**NOTE**  
`DXL_MAX_NODE` : 16  
`DXL_MAX_NODE_BUFFER_SIZE` : 12
{: .notice}

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
#include <Dynamixel2Arduino.h>

SoftwareSerial soft_serial(7, 8);   //RX,TX
#define DXL_SERIAL   Serial
#define DEBUG_SERIAL soft_serial    //define proper serial debugging port for the board
const uint8_t RS485_DIR_PIN = 2;    //DYNAMIXEL Shield

ParamForSyncWriteInst_t sync_write_param;
const int DXL_DIR_PIN = 2;
int32_t velocity = 0;

Dynamixel2Arduino dxl(DXL_SERIAL, RS485_DIR_PIN);

void setup() {
  dxl.begin(1000000);
  dxl.scan();

  sync_write_param.addr = 104; //Goal Velocity of DYNAMIXEL X series
  sync_write_param.length = 4;
  sync_write_param.xel[0].id = 1;
  sync_write_param.xel[1].id = 3;
  sync_write_param.id_count = 2;

  dxl.torqueOff(1);
  dxl.setOperatingMode(1, OP_VELOCITY);
  dxl.torqueOn(1);
  dxl.torqueOff(3);
  dxl.setOperatingMode(3, OP_VELOCITY);
  dxl.torqueOn(3);

  memcpy(sync_write_param.xel[0].data, 200, sizeof(velocity));
  memcpy(sync_write_param.xel[1].data, -200, sizeof(velocity));

  dxl.syncWrite(sync_write_param);
}

void loop() {

}
```
