---
layout: popup
---

# [MS5540S](#ms5540s)

The MS5540S is a sensor that can measure water pressure and can calculate the depth in water by measuring the water pressure. SPI communication is used.

# Connection

| MS5540S | OpenCM9.04 | etc       |
|:--------|:-----------|:----------|
| VCC     | 3.3V       |           |
| GND     | GND        |           |
| MCLK    | D13        | 32.768Khz |
| DIN     | A7         | MOSI      |
| DOUT    | A6         | MISO      |
| SCLK    | A1         | SCK       |

# Arduino code
Use SPI1 of OpenCM9.04 and input the clock of 32.768Khz to MCLK of MS5540S sensor. The analogWriteFreq function, which can adjust the frequency of the PWM pin of OpenCM 9.04, generates a clock of 32.768 KHz.

```c++
#include <SPI.h>

float water_depth;
float water_temp;

void ms5540s_reset();
void ms5540s_setup();
void ms5540s_loop();

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  ms5540s_setup();
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t pre_time[2];

  if( (millis() - pre_time[0]) >= 10 )
  {
    pre_time[0] = millis();
    ms5540s_loop();
  }

  if( (millis() - pre_time[1]) >= 100 )
  {
    pre_time[1] = millis();
    Serial.print(water_depth);
    Serial.print(" m\t");
    Serial.print(water_temp);
    Serial.println(" 'C");       
  }  
}

////////////////////////////////////////////
// MS5540S
////////////////////////////////////////////

#define FRESH_WATER  1000.0 // [kg/m^3]
#define SEA_WATER    1030.0 // [kg/m^3]


const int clock = 13;

const float water_type = SEA_WATER;
const int get_interval = 35;
static int ms5540s_state = 0;

float g;
float latitude = 37.0;
float lat_rad = ((37.0/57.29578) * PI / 180);
float x = sin(lat_rad)*sin(lat_rad);

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_reset
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_reset() //this function keeps the sketch a little shorter
{
 SPI.setDataMode(SPI_MODE0);
 SPI.transfer(0x15);
 SPI.transfer(0x55);
 SPI.transfer(0x40);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_setup() {
 SPI.begin(); //see SPI library details on arduino.cc for details
 SPI.setBitOrder(MSBFIRST);
 SPI.setClockDivider(SPI_CLOCK_DIV32); //divide 16 MHz to communicate on 500 kHz
 pinMode(clock, OUTPUT);
 analogWriteFreq(clock, 32768);
 delay(100);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_loop()
{
  static uint32_t tTime;

  unsigned int word1 = 0;
  unsigned int word11 = 0;
  unsigned int word2 = 0;
  unsigned int word3 = 0;
  byte word22 = 0;
  byte word33 = 0;
  unsigned int word4 = 0;
  byte word44 = 0;
  static long c1;
  static long c2;
  static long c3;
  static long c4;
  static long c5;
  static long c6;
  unsigned int presMSB = 0; //first byte of value
  unsigned int presLSB =0; //last byte of value
  static unsigned int D1 = 0;
  unsigned int tempMSB = 0; //first byte of value
  unsigned int tempLSB = 0; //last byte of value
  static unsigned int D2 = 0;
  long UT1 = 0;
  long dT = 0;
  long TEMP = 0;
  long OFF = 0;
  long SENS = 0;

  float p;
  static long PCOMP = 0;
  static long PCOMP2 = 0;
  static long PH2 = 0;
  static float TEMPREAL = 0;
  static float DEPTH = 0;

  long dT2 = 0;
  static float TEMPCOMP = 0;

  bool ret = false;

//////////////////////////////////////////
  switch( ms5540s_state )
  {
    case 0:      
      analogWrite (clock, 128) ;
      ms5540s_reset();//resets the sensor - caution: afterwards mode = SPI_MODE0!
      //Calibration word 1
      word1 = 0;
      word11 = 0;
      SPI.transfer(0x1D); //send first byte of command to get calibration word 1
      SPI.transfer(0x50); //send second byte of command to get calibration word 1
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      word1 = SPI.transfer(0x00); //send dummy byte to read first byte of word
      word1 = word1 << 8; //shift returned byte
      word11 = SPI.transfer(0x00); //send dummy byte to read second byte of word
      word1 = word1 | word11; //combine first and second byte of word
      ms5540s_reset();//resets the sensor
      //Calibration word 2; see comments on calibration word 1
      word2 = 0;
      word22 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x60);
      SPI.setDataMode(SPI_MODE1);
      word2 = SPI.transfer(0x00);
      word2 = word2 <<8;
      word22 = SPI.transfer(0x00);
      word2 = word2 | word22;
      ms5540s_reset();//resets the sensor
      //Calibration word 3; see comments on calibration word 1
      word3 = 0;
      word33 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x90);
      SPI.setDataMode(SPI_MODE1);
      word3 = SPI.transfer(0x00);
      word3 = word3 <<8;
      word33 = SPI.transfer(0x00);
      word3 = word3 | word33;
      ms5540s_reset();//resets the sensor
      //Calibration word 4; see comments on calibration word 1
      word4 = 0;
      word44 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0xA0);
      SPI.setDataMode(SPI_MODE1);
      word4 = SPI.transfer(0x00);
      word4 = word4 <<8;
      word44 = SPI.transfer(0x00);
      word4 = word4 | word44;
////////////////////////////////////////////////////////////////////

      c1 = (word1 >> 1);
      c2 = ((word3 & 0x3F) << 6) | ((word4 & 0x3F));
      c3 = (word4 >> 6);
      c4 = (word3 >> 6);
      c5 = (word2 >> 6) | ((word1 & 0x1) << 10);
      c6 = (word2 & 0x3F);
      ms5540s_reset();//resets the sensor

      //Temperature:
      SPI.transfer(0x0F); //send first byte of command to get temperature value
      SPI.transfer(0x20); //send second byte of command to get temperature value

      tTime = millis();
      ms5540s_state = 1;
      break;

    case 1:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 2;
      }
      break;

    case 2:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      tempMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      tempMSB = tempMSB << 8; //shift first byte
      tempLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D2 = tempMSB | tempLSB; //combine first and second byte of value
      ms5540s_reset();//resets the sensor

     //Pressure:
      SPI.transfer(0x0F); //send first byte of command to get pressure value
      SPI.transfer(0x40); //send second byte of command to get pressure value

      tTime = millis();
      ms5540s_state = 3;
      break;

    case 3:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 4;
      }
      break;

    case 4:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      presMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      presMSB = presMSB << 8; //shift first byte
      presLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D1 = presMSB | presLSB;   

      UT1 = (c5 * 8) + 20224;   //calculate calibration temperature
      //calculate actual temperature
      dT =(D2 - UT1);
      TEMP = 200 + ((dT * (c6 + 50))/1024);
      //TEMP = 20 + (dT * c6);
      //calculate temperature compensated pressure
      OFF = (c2*4) + (((c4 - 512) * dT)/4096);
      SENS = c1 + ((c3 * dT)/1024) + 24576;

      //0.1 mbar resolution
      PCOMP = ((((((SENS * (D1 - 7168))/16384)- OFF) * 10) / 32) + (250 * 10))/10;

      if(PCOMP > 1000)
      {
       PH2 = (-5 * ((PCOMP-1000) * (PCOMP-1000)))/(1<<19);
      }
      else
      {
        PH2 = 0;
      }
      PCOMP2 = PCOMP - PH2;

       // smaller than 1atm (1,013.25 hPa)
      //if(PCOMP2 < 1013.25) PCOMP2 = 0;

      TEMPREAL = TEMP/10;

      dT2 = dT - ((dT >> 7 * dT >> 7) >> 3);
      TEMPCOMP = (200 + (dT2*(c6+100) >>11))/10;

      if(water_type == FRESH_WATER)
      {
        DEPTH = PCOMP2 * 1.019716 / 1000;   // 1000mb = bar
      }
      else
      {
        g = 9.780318*(1.0 + ((5.2788*1/1000) + 2.36*1/100000 * x) * x) + (1.092*1/1000000*PCOMP2);
        DEPTH = (((((-1.82*1/1000000000000000) * PCOMP2 + (2.279*1/10000000000)) * PCOMP2 - (2.2512*1/100000)) * PCOMP2 + 9.72659) * PCOMP2)/g;
      }  

      water_depth = DEPTH;
      water_temp  = TEMPCOMP;
/*
      Serial.print("Pressure : ");      
      Serial.print(PCOMP);
      Serial.println(" mb(millibar)");   
      Serial.print("Temperature : ");      
      Serial.print(TEMPCOMP);
      Serial.println(" 'C");   
      Serial.print("WaterDepth : ");      
      Serial.print(DEPTH);
      Serial.println(" m");   
      Serial.println();
*/
      ret = true;
      ms5540s_state = 0;
      break;

    default:
      ms5540s_state = 0;
      break;
  }
}
```
