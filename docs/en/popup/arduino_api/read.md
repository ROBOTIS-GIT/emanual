---
layout: popup
---

# read

## Description

This function reads data from specific memory addresses of DYNAMIXEL with a specific ID.

## Syntax

- read(id, addr, addr_length, *p_recv_buf, recv_buf_capacity, timeout_ms)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **addr** : Specific memory address of DYNAMIXEL to read. Data type : unsigned int16
- **addr_length** : Size in byte to read beginning from the `addr`. Data type : unsigned int16
- **\*p_recv_buf** : Address of buffer to save the received data. Data type : unsigned int8 pointer
- **recv_buf_capacity** : Size in byte of the `p_recv_buf` buffer. Data type : unsigned int16
- **timeout_ms** : Set Timeout in milliseconds. Data type : unsigned int32

## Returns

- `Length of received parameters` on success.
- `-1` on failure.

## Example

```c++
#define ID_ADDR                 7
#define ID_ADDR_LEN             1
#define TIMEOUT 10    //default communication timeout 10ms

const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN
const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 2.0;

uint8_t returned_id = 0;

Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

void setup() {
  DEBUG_SERIAL.begin(115200);
  dxl.begin(57600);
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);

  // Read DYNAMIXEL ID
  dxl.read(DXL_ID, ID_ADDR, ID_ADDR_LEN, (uint8_t*)&returned_id, sizeof(returned_id), TIMEOUT);
  DEBUG_SERIAL.print("ID : ");
  DEBUG_SERIAL.println(returned_id);
}

void loop() {
  // put your main code here, to run repeatedly:
}
```
