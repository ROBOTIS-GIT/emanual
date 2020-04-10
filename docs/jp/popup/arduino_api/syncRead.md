---
layout: popup
---

# syncRead

## Description

This function writes data to a specific memory address of DYNAMIXEL with a specific ID.

## Syntax

- syncRead(syncReadParam, received_data)

## Parameters

- **syncReadParam** : Structure that contains Sync Read information in below members. Data type : ParamForSyncReadInst_t
  - addr : Address of the specific memory of DYNAMIXEL. Data type : unsigned int16
  - length : Length of data to read. Data type : unsigned int16
  - id_count : Number of ID to apply Sync Read instruction.  Data type : unsigned int8
  - InfoForSyncReadParam_t xel[DXL_MAX_NODE] : Structure that contains DYNAMIXEL ID to read from
    - id : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **received_data** : Structure that contains data read from each DYNAMIXEL. Data type : RecvInfoFromStatusInst_t
  - id_count : Number of ID to apply Sync Read instruction.  Data type : unsigned int8
  - XelInfoForStatusInst_t xel[DXL_MAX_NODE] : Structure that contains DYNAMIXEL ID, data, data length, and error status
    - id : ID of a specific DYNAMIXEL. Data type : unsigned int8
    - length : Length of read data. Data type : unsigned int16
    - error : Error status. Data type : unsigned int8
    - data[DXL_MAX_NODE_BUFFER_SIZE] : Read data from each DYNAMIXEL. Data type : unsigned int8

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

ParamForSyncReadInst_t sync_read_param;
RecvInfoFromStatusInst_t read_result;
const int DXL_DIR_PIN = 2;
int32_t recv_velocity[2];

Dynamixel2Arduino dxl(DXL_SERIAL, RS485_DIR_PIN);

void setup() {
  DEBUG_SERIAL.begin(115200);
  dxl.begin(1000000);
  dxl.scan();

  sync_read_param.addr = 128; //Present Velocity of DYNAMIXEL-X series
  sync_read_param.length = 4;
  sync_read_param.xel[0].id = 1;
  sync_read_param.xel[1].id = 3;
  sync_read_param.id_count = 2;
}

void loop() {
  dxl.syncRead(sync_read_param, read_result);
  DEBUG_SERIAL.println("======= Sync Read =======");
  memcpy(&recv_velocity[0], read_result.xel[0].data, read_result.xel[0].length);
  memcpy(&recv_velocity[1], read_result.xel[1].data, read_result.xel[1].length);
  DEBUG_SERIAL.print("ID: ");DEBUG_SERIAL.print(read_result.xel[0].id);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Present Velocity: ");DEBUG_SERIAL.print(recv_velocity[0]);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Packet Error: ");DEBUG_SERIAL.print(read_result.xel[0].error);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Param Length: ");DEBUG_SERIAL.print(read_result.xel[0].length);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.println();
  DEBUG_SERIAL.print("ID: ");DEBUG_SERIAL.print(read_result.xel[1].id);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Present Velocity: ");DEBUG_SERIAL.print(recv_velocity[1]);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Packet Error: ");DEBUG_SERIAL.print(read_result.xel[1].error);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Param Length: ");DEBUG_SERIAL.print(read_result.xel[1].length);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.println();
  delay(100);
}
```
