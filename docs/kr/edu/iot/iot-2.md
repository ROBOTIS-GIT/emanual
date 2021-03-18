---
layout: archive
lang: kr
ref: iot-2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/iot/iot-2/
sidebar:
  title: IoT 2단계
  nav: "iot-2"
---

# [개요](#개요)

**로보티즈 IoT 2단계** 는 일반적인 로봇의 형태를 벗어나 실생활에서 사용될 수 있는 사물인터넷(internet of things) 역할을 할 수 있는 장치를 구현한 교육용 프로그래밍 솔루션입니다.  
- 스마트기기로 코딩이 가능한 [R+m.Task 2.0]과 각종 센서를 활용하는 하드웨어를 통한 예제별 프로그램밍 실전학습이 가능한 DIY 교육용 키트입니다.
- [R+m.Task 2.0]으로 순서도 작성 방법, 코딩을 통한 프로그램학습, 응용하기 등의 과정을 제공합니다.
- 교재를 통해 12가지의 사물인터넷 예제를 구현하여 생활 속 장치의 필요성, DIY의 제작 등의 수업을 할 수 있습니다.   
- 무선 통신이 가능한 블루투스 모듈 및 조도센서, 동작감지센서, 온습도센서, 접촉센서, 자석센서, 감속모터 등이 포함되어 다양한 입출력 기능을 할 수 있습니다.
- 스마트 기기에서 프로그램 학습 및 예제를 이용하기 위해서 [R+ IoT (R+ IoT)](/docs/kr/software/mobile_app/rplusiot/)앱과 [로보플러스 R+m.Task 2.0(R+ m.task2.0)](/docs/kr/software/rplus_mobile/mtask20/) 를 설치해야 합니다.  

 [R+ IoT 설치 및 예제실행]  
  
 [로보티즈 IoT 2단계 엔트리 교재 다운로드]  
 
 [R+IoT 앱 파라미터 사용법]

# [부품 목록](부품-목록)

![](/assets/images/edu/iot/robotis_iot_l2_partlist_kr.png)

- [OpenCM7.0]
- [서보모터]
- [적외선 센서]
- [LED 모듈]

# [작동하기](#작동하기)

- 사용할 스마트 기기에 (R+IoT)를 설치해야 합니다.  

- 설치가 완료되면 로보티즈IOT 1단계 키트에 포함된 제어기([OpenCM7.0])에 블루투스를 연결하고 R+IoT에서 [R+m.Task 2.0]을 이용하여 프로그램을 코딩한 후 다운로드 받습니다.  
 
[R+IoT 설치 및 실행 방법 바로가기]  
  
[R+m.Task 2.0 설치 및 실행 방법 바로가기]  

{% capture warning_1 %}
**주의**  
- 제어기에 프로그램을 다운로드 받으면, 그전에 다운받은 프로그램은 지워집니다. 
- 예제 동작시 음원이나 음성이 재생되는 것을 함께 확인하기 위해서는 스마트 기기의 미디어 볼륨을 반드시 키우고 실행하길 권장합니다.
{% endcapture %}
<div class ="notice--warning">{{ warning_1 | markdownify}}</div>

{% capture warning_2 %}
**주의**
- 구글의 변경된 정책으로 SMS 기능은 더이상 지원되지 않습니다.  
SMS 기능이 필요한 경우 이전 버전의 앱 설치파일(APK)을 다운로드 받아 수동으로 설치하시기 바랍니다.  
이전 버전 사용시 최신 업데이트가 반영되지 않는 점 유의하시기 바랍니다.  
[R+ IoT (v0.9.3.6) 다운로드](http://www.robotis.com/service/download.php?no=1669)  
**참고** : [인터넷에서 받은 앱 설치하기](/docs/kr/popup/apk_install){: .popup}  
{% endcapture %}
<div class ="notice--warning">{{ warning_2 | markdownify}}</div>

## [작동방법](#작동방법)

- R+IoT를 실행하고 제어기의 버튼을 눌러 전원을 켜서 대기합니다. R+ 스크래치에서 해당 예제를 클릭하고 연결이 완료되면 프로그램이 실행됩니다.

**참고**: 예제 파일은 [교안예제] 에서 얻을 수 있습니다.  
{: .notice}  

# [교안예제](#교안예제)

각 예제의 실행 시 동작에 관한 내용은 교육키트 2단계 교안을 참고하세요.  
또한, [예제의 실행 방법]을 참고하세요.  
다운로드시 필요한 USB 케이블은 1단계 구성품에 포함되어 있습니다.
{: .notice}

|       이름        |                             그림                              | TASK Code                                                                                                           |
|:-----------------:|:-------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------|
| 1. Hello! ROBOTIS |       ![](/assets/images/edu/iot/iot_l2_1_hello_KR.png)       | - 실습 파일 [Download][IoT_L2_1_Hello(p)_KR] <br />- 완성 파일 [Download][IoT_L2_1_Hello_KR]                        |
|  2. 문자 알리미   |   ![](/assets/images/edu/iot/iot_l2_2_messagesignal_KR.png)   | - 실습 파일 [Download][IoT_L2_2_MessageSignal(p)_KR]<br />- 완성 파일 [Download][IoT_L2_2_MessageSignal_KR]         |
| 3. 스마트 선풍기  |        ![](/assets/images/edu/iot/iot_l2_3_fan_KR.png)        | - 실습 파일 [Download][IoT_L2_3_Fan(p)_KR]<br />- 완성 파일 [Download][IoT_L2_3_Fan_KR]                             |
|      4. 조명      |       ![](/assets/images/edu/iot/iot_l2_4_lamp_KR.png)        | - 실습 파일 [Download][IoT_L2_4_Lamp(p)_KR]<br />- 완성 파일 [Download][IoT_L2_4_Lamp_KR]                           |
|     5. 도어락     |     ![](/assets/images/edu/iot/iot_l2_5_doorlock_KR.png)      | - 실습 파일 [Download][IoT_L2_5_DoorLock(p)_KR]<br />- 완성 파일 [Download][IoT_L2_5_DoorLock_KR]                   |
| 6. 스마트 휴지통  |    ![](/assets/images/edu/iot/iot_l2_6_wastebasket_KR.png)    | - 실습 파일 [Download][IoT_L2_6_WasteBasket(p)_KR]<br />- 완성 파일 [Download][IoT_L2_6_WasteBasket_KR]             |
|    7. 쥬크박스    |      ![](/assets/images/edu/iot/iot_l2_7_jukebox_KR.png)      | - 실습 파일 [Download][IoT_L2_7_JukeBox(p)_KR]<br />- 완성 파일 [Download][IoT_L2_7_JukeBox_KR]                     |
|  8. 화분 물주기   | ![](/assets/images/edu/iot/iot_l2_8_flowermanagement_KR.png)  | - 실습 파일 [Download][IoT_L2_8_FlowerManagement(p)_KR]<br />- 완성 파일 [Download][IoT_L2_8_FlowerManagement_KR]   |
|  9. 침입 감지기   | ![](/assets/images/edu/iot/iot_l2_9_intrusiondetector_KR.png) | - 실습 파일 [Download][IoT_L2_9_IntrusionDetector(p)_KR]<br />- 완성 파일 [Download][IoT_L2_9_IntrusionDetector_KR] |
| 10. 카메라 리모컨 |   ![](/assets/images/edu/iot/iot_l2_10_cameraremote_KR.png)   | - 실습 파일 [Download][IoT_L2_10_CameraRemote(p)_KR]<br />- 완성 파일 [Download][IoT_L2_10_CameraRemote_KR]         |
|   11. 블라인드    |      ![](/assets/images/edu/iot/iot_l2_11_blind_KR.png)       | - 실습 파일 [Download][IoT_L2_11_Blind(p)_KR]<br />- 완성 파일 [Download][IoT_L2_11_Blind_KR]                       |
|   12. 약통 알람   |  ![](/assets/images/edu/iot/iot_l2_12_medicinealarm_KR.png)   | - 실습 파일 [Download][IoT_L2_12_MedicineAlarm(p)_KR]<br />- 완성 파일 [Download][IoT_L2_12_MedicineAlarm_KR]       |



[R+ IoT 설치 및 예제실행]: /docs/kr/software/mobile_app/rplusiot/#r-iot-다운로드설치
[R+IoT 앱 파라미터 사용법]: /docs/kr/software/rplus1/task/task_misc/#스마트앱-파라미터
[로보티즈 IoT 2단계 엔트리 교재 다운로드]: http://www.robotis.com/service/download.php?no=745
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[서보모터]: /docs/kr/parts/motor/servo_motor/
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[LED 모듈]: /docs/kr/parts/display/lm-10/
[스크래치2 오프라인 에디터, R+ 스크래치 설치 및 예제 실행 방법 바로가기]: /docs/kr/software/mobile_app/rplusiot/#r-iot-다운로드설치
[교안예제]: #교안예제
[R+m.Task 2.0]: /docs/kr/software/rplus_mobile/mtask20/
[예제의 실행 방법]: /docs/kr/edu/ollo/bugkit/#태스크-코드-다운로드
[R+IoT 설치 및 실행 방법 바로가기]: /docs/kr/software/mobile_app/rplusiot/#r-iot-다운로드설치
[R+m.Task 2.0 설치 및 실행 방법 바로가기]: /docs/kr/software/rplus_mobile/mtask20/  
[IoT_L2_1_Hello(p)_KR]: http://www.robotis.com/service/download.php?no=1162
[IoT_L2_1_Hello_KR]: http://www.robotis.com/service/download.php?no=1163
[IoT_L2_2_MessageSignal(p)_KR]: http://www.robotis.com/service/download.php?no=1164
[IoT_L2_2_MessageSignal_KR]: http://www.robotis.com/service/download.php?no=1165
[IoT_L2_3_Fan(p)_KR]: http://www.robotis.com/service/download.php?no=1166
[IoT_L2_3_Fan_KR]: http://www.robotis.com/service/download.php?no=1167
[IoT_L2_4_Lamp(p)_KR]: http://www.robotis.com/service/download.php?no=1168
[IoT_L2_4_Lamp_KR]: http://www.robotis.com/service/download.php?no=1169
[IoT_L2_5_DoorLock(p)_KR]: http://www.robotis.com/service/download.php?no=1170
[IoT_L2_5_DoorLock_KR]: http://www.robotis.com/service/download.php?no=1171
[IoT_L2_6_WasteBasket(p)_KR]: http://www.robotis.com/service/download.php?no=1172
[IoT_L2_6_WasteBasket_KR]: http://www.robotis.com/service/download.php?no=1173
[IoT_L2_7_JukeBox(p)_KR]: http://www.robotis.com/service/download.php?no=1174
[IoT_L2_7_JukeBox_KR]: http://www.robotis.com/service/download.php?no=1175
[IoT_L2_8_FlowerManagement(p)_KR]: http://www.robotis.com/service/download.php?no=1176
[IoT_L2_8_FlowerManagement_KR]: http://www.robotis.com/service/download.php?no=1177
[IoT_L2_9_IntrusionDetector(p)_KR]: http://www.robotis.com/service/download.php?no=1178
[IoT_L2_9_IntrusionDetector_KR]: http://www.robotis.com/service/download.php?no=1179
[IoT_L2_10_CameraRemote(p)_KR]: http://www.robotis.com/service/download.php?no=1156
[IoT_L2_10_CameraRemote_KR]: http://www.robotis.com/service/download.php?no=1157
[IoT_L2_11_Blind(p)_KR]: http://www.robotis.com/service/download.php?no=1158
[IoT_L2_11_Blind_KR]: http://www.robotis.com/service/download.php?no=1159
[IoT_L2_12_MedicineAlarm(p)_KR]: http://www.robotis.com/service/download.php?no=1160
[IoT_L2_12_MedicineAlarm_KR]: http://www.robotis.com/service/download.php?no=1161
