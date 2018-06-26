# Dynamixel SDK for Linux

Linux 용 Dynamixel SDK 를 이하의 링크에서 다운로드 하실 수 있습니다.

- 최신 버전
 <https://github.com/ROBOTIS-GIT/DynamixelSDK>
- 이전 버전
 `다운로드` [DXL_SDK_LINUX_ v1_01.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_linux_v1_01.zip)


- 시스템 요구 사항
  - OS : Linux Kernel 2.6.21 이상 권장
  - [USB2Dynamixel]이 반드시 필요

```
로보티즈의 Dynamixel SDK 는 3-clause BSD license 하에 사용하실 수 있습니다.
BSD License 의 내용은 아래를 참조하세요.

Software License Agreement (BSD License)

Copyright (c) 2014, ROBOTIS Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of ROBOTIS nor the names of its contributors may be
      used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY ROBOTIS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL ROBOTIS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

## 폴더 구성

Dynamixel SDK for Linux의 폴더 구조는 다음과 같습니다.

/include  : Dynamixel SDK를 사용하기 위한 헤더 파일이 있습니다.
/src      : Dynamixel SDK 소스 파일이 있습니다.
/lib      : 컴파일된 라이브러리 파일이 있습니다.
/example  : Zigbee를 제어하는 예제들이 들어있는 곳입니다.


## USB2Dynamixel 드라이버 설치 및 응답 속도 설정

`caption` 최근 몇 년 내에 배포된 대부분의 리눅스 배포판에 포함된 커널에는 USB2Dynamixel 이 사용하는 FTDI 의 FT232RL 에 대한 드라이버를 포함하고 있습니다. 또한 Latency Timer 값도 기본값으로 1ms 를 사용합니다. 따라서 대부분의 경우 FTDI 드라이버 코드 수정 및 설치가 필요 없을 수 있습니다. {:. caption}

### USB2Dynamixel Driver

 USB2Dynamixel은 FTDI의 FT232RL을 사용합니다.

-  Kernel 2.4.x 커널을 사용하는 경우 <http://www.ftdichip.com/Drivers/VCP.htm> 에서 Linux Driver 를 받아 설치하시면 됩니다.
  설치 방법은 ReadMe 파일을 참고하세요. (해당 드라이버는 Kernel 2.4.32 부터 커널에 통합되었습니다.)
-  Kernel 2.6.x 커널을 사용하는 경우 Kernel 2.6.21 이후 커널부터 FT232RL 에 대한 코드가 추가되었습니다. 따라서 Kernel 2.6.21 이상을 사용하실 것을 권장합니다.

### USB2Dynamixel Driver 설치 환경 설정

- USB2Dynamixel Driver 설치를 위한 준비 사항은 다음과 같습니다.
 - 리눅스 소스 디렉토리
   (직접 소스를 받거나 패키지 매니저 등을 통해 자신의 커널 버전과 같은 소스를 복사)
   /usr/src/linux-2.6.28/

 - USB2Dynamixel Driver를 컴파일 할 임의의 디렉토리(빈 상태)
   /usr/src/ftdi_sio

### USB2Dynamixel Driver 설치

USB2Dynamixel Driver 설치 과정은 다음과 같습니다.

1. 아래 파일을 /usr/src/ftdi_sio 디렉토리에 복사합니다.
    ```
    /usr/src/linux-2.6.28/drivers/usb/serial/ftdi_sio.h
    /usr/src/linux-2.6.28/drivers/usb/serial/ftdi_sio.c
    /usr/src/linux-2.6.28/drivers/usb/serial/usb-serial.h
    ```

2. 응답속도를 1msec로 설정하기 위해 복사한 파일의 소스 코드를 수정합니다.
  2-1. USB2Dynamixel Driver 디렉토리에서 ftdi_sio.c 파일을 수정
  - 수정 파일 : /usr/src/ftdi_sio/ftdi_sio.c
  @@ ftdi_sio.c 파일의 처음 부분에 define구문 추가
    ```
    #define FTDI_LATENCY_TIMER_DEFAULT 1
    ```

    2-2. Kernel 의 FTDI Driver 수정
    -  수정 파일 : /usr/src/ftdi_sio/ftdi_sio.c
    ftdi_sio_port_probe() 함수를 찾아서 주석표시된 부분을 추가
    @@ ftdi_sio_port_probe() 함수 처음 부분

        ```
        static int ftdi_sio_port_probe(struct usb_serial_port *port)
        {
        struct ftdi_private *priv;
        struct ftdi_sio_quirk *quirk = usb_get_serial_data(port->serial);

        /* 추가구문
        struct usb_device *udev;  
        int rv;                    
        char buf[1];
        */

        dbg("%s", __func__);
        udev = port->serial->dev; // 추가 구문
        priv = kzalloc(sizeof(struct ftdi_private), GFP_KERNEL);
        if (!priv)
        {
        dev_err(&port->dev, "%s- kmalloc(%Zd) failed.\n", __func__,
        sizeof(struct ftdi_private));
        return -ENOMEM;
        }
        ```

        @@ ftdi_sio_port_probe() 함수 마지막 부분 create_sysfs_attrs(port); 구문 아래에 주석 표시된 부분을 추가

        ```
        usb_set_serial_port_data(port, priv);
        ftdi_determine_type(port);
        create_sysfs_attrs(port);

        /* 추가구문
        rv = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
        FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
        FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
        FTDI_LATENCY_TIMER_DEFAULT, priv->interface, buf, 0, WDR_TIMEOUT);

        if (rv < 0) {
        dbg("Unable to write latency timer: %i", rv);
        return -EIO;
        }
        */

        return 0;
        }
        ```

3. /usr/src/ftdi_sio 디렉토리에 다음과 같이 Makefile을 작성합니다.
다음 내용에서 KDIR의 경로명을 리눅스 소스 디렉토리로 바꾸어 주어야 합니다.
이 예제에서는 /usr/src/linux-2.6.28/ 이므로 아래와 같이 작성하였습니다.
다음과 같이 내용을 작성하고 대소문자를 구별하여 "Makefile" 로 저장을 합니다.
      ```
      obj-m := ftdi_sio.o
      KDIR := /usr/src/linux-2.6.28/
      PWD := $(shell pwd)
      all:
      $(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
      clean:
      rm -rf *.ko
      rm -rf *.mod.*
      rm -rf *.o
      rm -rf Modules.symvers
      rm -rf .tmp_versions
      rm -rf .ftdi_sio*
      ```

4. make 실행 및 컴파일 완료

/usr/src/ftdi_sio 디렉토리에 make 명령을 실행하면 잠시 후 컴파일이 완료됩니다.

5. 모듈 등록

  5-1. USB2Dynamixel 을 PC 에 연결합니다.
  5-2. 수정 전의 Driverf 가 Loading 되어 있는지 확인합니다.
  ```
  # lsmod // 기존 Driver 가 Loading 되어 있으면 ftdi_sio 모듈을 확인할 수 있습니다.
  ```
  5-3. 기존의 Driver 를 제거합니다.
  ```
  # rmmod ftdi_sio
  ```
  5-4. 새로 build 한 Driver 를 설치합니다.
  ```
  # insmod ftdi_sio.ko
  ```
  `notince` 재부팅 후 insmod 명령으로 다시 로드해야 합니다. {:. notice}

## Dynamixel SDK Build

DynamixelSDK/src 폴더에서 make 명령어로 build 하면 library가 빌드되어 DynamixelSDK/lib 폴더로 자동으로 복사됩니다.

## 예제 목록

Example 은 ReadWrite, ScanDynamixel, SyncWrite 의 3 가지를 제공하며, DynamxielSDK/example 폴더의 각 example 폴더로 이동하여 make 명령어를 통해 빌드하면 됩니다.

모든 예제는 /dev/ttyUSB0 를 기본 device 로 사용하도록 되어 있습니다.

예제는 다음 링크를 참조하십시오.

- [Dynamixel SDK linux-gcc Example]

[USB2Dynamixel]: ??
[Dynamixel SDK linux-gcc Example]: ??
