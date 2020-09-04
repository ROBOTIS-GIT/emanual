---
layout: popup
---

# write

## Description

This function writes data to specific memory addresses of DYNAMIXEL with a specific ID.

## Syntax

- write(id, addr, *p_data, data_length, timeout_ms)

## Parameters

- **id** : ID of a specific DYNAMIXEL. Data type : unsigned int8
- **addr** : Specific memory address of DYNAMIXEL to write. Data type : unsigned int16
- **\*p_data** : Address of buffer that contains the data to send. Data type : unsigned int8 pointer
- **data_length** : Size of the data in byte. Data type : unsigned int16
- **timeout_ms** : Set Timeout in milliseconds. Data type : unsigned int32

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
#define LED_ADDR                65
#define LED_ADDR_LEN            1
#define TIMEOUT 10    //default communication timeout 10ms

const uint8_t DXL_DIR_PIN = 2; // DYNAMIXEL Shield DIR PIN
const uint8_t DXL_ID = 1;
const float DXL_PROTOCOL_VERSION = 2.0;
const uint8_t turn_on = 1;
const uint8_t turn_off = 0;

Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

void setup() {
  DEBUG_SERIAL.begin(115200);
  dxl.begin(57600);
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  // LED On
  if(!dxl.write(DXL_ID, LED_ADDR, (uint8_t*)&turn_on, LED_ADDR_LEN, TIMEOUT)) {
    DEBUG_SERIAL.println("Failed to turn on the LED.");
  }
  delay(500);

  // LED Off
  if(!dxl.write(DXL_ID, LED_ADDR, (uint8_t*)&turn_off, LED_ADDR_LEN, TIMEOUT)) {
    DEBUG_SERIAL.println("Failed to turn off the LED.");
  }
  delay(500);
}
```
