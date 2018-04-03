---
layout: popup
---

# [MPU6050 DMP](#mpu6050-dmp)

The MPU6050 is a sensor consisting of three axes of acceleration / three axes of gyro. If a dedicated processor called DMP is used in the MPU6050, the MPU6050 performs sensor fusion processing for obtaining Roll / Pitch / Yaw.

# Connection

| MPU6050 | OpenCM9.04 | etc  |
|:--------|:-----------|:-----|
| VCC     | 5V         |      |
| GND     | GND        |      |
| SCL     | D24        | I2C2 |
| SDA     | D25        | I2C2 |
| INT     | A2         |      |

# Arduino code
Enable the DMP function of MPU6050 and output Roll / Pitch / Yaw value in serial every 50ms. The full source code is downloaded from the link below.

- Source code download link
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip)

```c++
#include "mpu.h"

MPU6050 mpu;

void setup()
{
  Serial.begin(115200);

  dmpDataReady();
  dmp_setup();
}

void loop()
{
  static uint32_t tTime[4];

  dmp_loop();

  if( (millis() - tTime[2]) >= 50 )
  {
    tTime[2] = millis();
    Serial.print("roll : ");
    Serial.print(String(roll, 2));
    Serial.print("  pitch : ");
    Serial.print(String(pitch, 2));
    Serial.print("  yaw : ");
    Serial.println(String(yaw, 2));
  }  
}

////////////////////////////////////////
//        IMU
/////////////////////////////////////////
/*---------------------------------------------------------------------------
     TITLE   : dmpDataReady
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmpDataReady() {
    mpuInterrupt = true;
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_setup() {
  I2Cdev::begin(400);

  // initialize device
  Serial.println(F("Initializing I2C devices..."));
  mpu.initialize();
  pinMode(INTERRUPT_PIN, INPUT);

  // verify connection
  Serial.println(F("Testing device connections..."));
  Serial.println(mpu.testConnection() ? F("MPU6050 connection successful") : F("MPU6050 connection failed"));

  // wait for ready
  Serial.println(F("\nSend any character to begin DMP programming and demo: "));
//  while (Serial.available() && Serial.read()); // empty buffer
//  while (!Serial.available());                 // wait for data
//  while (Serial.available() && Serial.read()); // empty buffer again

  // load and configure the DMP
  Serial.println(F("Initializing DMP..."));
  devStatus = mpu.dmpInitialize();

  // supply your own gyro offsets here, scaled for min sensitivity
  //mpu.setXGyroOffset(220);
  //mpu.setYGyroOffset(76);
  //mpu.setZGyroOffset(-85);
  //mpu.setZAccelOffset(1788); // 1688 factory default for my test chip

  // make sure it worked (returns 0 if so)
  if (devStatus == 0) {
    // turn on the DMP, now that it's ready
    Serial.println(F("Enabling DMP..."));
    mpu.setDMPEnabled(true);

    // enable Arduino interrupt detection
    Serial.println(F("Enabling interrupt detection (Arduino external interrupt 0)..."));
    attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), dmpDataReady, RISING);
    mpuIntStatus = mpu.getIntStatus();

    // set our DMP Ready flag so the main loop() function knows it's okay to use it
    Serial.println(F("DMP ready! Waiting for first interrupt..."));
    dmpReady = true;

    // get expected DMP packet size for later comparison
    packetSize = mpu.dmpGetFIFOPacketSize();
  } else {
    // ERROR!
    // 1 = initial memory load failed
    // 2 = DMP configuration updates failed
    // (if it's going to break, usually the code will be 1)
    Serial.print(F("DMP Initialization failed (code "));
    Serial.print(devStatus);
    Serial.println(F(")"));
  }
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_loop() {
  // if programming failed, don't try to do anything
  if (!dmpReady) return;

  // wait for MPU interrupt or extra packet(s) available
  if (!mpuInterrupt && fifoCount < packetSize) return;

  // reset interrupt flag and get INT_STATUS byte
  mpuInterrupt = false;
  mpuIntStatus = mpu.getIntStatus();

  // get current FIFO count
  fifoCount = mpu.getFIFOCount();

  // check for overflow (this should never happen unless our code is too inefficient)
  if ((mpuIntStatus & 0x10) || fifoCount == 1024) {
      // reset so we can continue cleanly
      mpu.resetFIFO();
    //  Serial.println(F("FIFO overflow!"));

  // otherwise, check for DMP data ready interrupt (this should happen frequently)
  } else if (mpuIntStatus & 0x02) {
    // wait for correct available data length, should be a VERY short wait
    while (fifoCount < packetSize) fifoCount = mpu.getFIFOCount();

    // read a packet from FIFO
    mpu.getFIFOBytes(fifoBuffer, packetSize);

    // track FIFO count here in case there is > 1 packet available
    // (this lets us immediately read more without waiting for an interrupt)
    fifoCount -= packetSize;

    // display Euler angles in degrees
    mpu.dmpGetQuaternion(&q, fifoBuffer);
    mpu.dmpGetGravity(&gravity, &q);
    mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);

    // store roll, pitch, yaw
    yaw = ypr[0] * 180/M_PI;
    roll = ypr[1] * 180/M_PI;
    pitch = ypr[2] * 180/M_PI;                       
  }
}
```
