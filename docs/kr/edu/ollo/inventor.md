---
layout: archive
lang: kr
ref: ollo_inventor
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/ollo/inventor/
sidebar:
  title: OLLO 3단계
  nav: "ollo_inventor"
---

# [개요](#개요)

올로 교육키트 (로봇 수업용) 3단계는 제어기를 통한 로봇의 제어 원리부터 서보모터의 제어, 접촉센서와 적외선센서, LED 모듈의 제어 원리를 학습할 수 있습니다.  
로봇 프로그램의 순서도 개념을 이해하고, 프로그래밍 기초 지식을 학습함으로써 실질적이고 본격적인 로봇 제작 및 프로그래밍을 이해하는 단계입니다.

제작한 로봇을 센서로 동작시키거나 무선조종기로 조종할 수 있는 프로그램을 직접 제작해 봅니다.

올로 교육키트 (로봇 수업용) 3단계는 2단계 키트와 결합되어 총 12주차의 프로그래밍 학습과 센서들의 활용, 무선 조종 프로그래밍, 원리의 이해, 문제풀이 등의 과정을 제공합니다.  
12회에 걸쳐 로봇을 순서대로 만들면서 로봇 제작의 원리를 학습할 수 있습니다.

`주의` 올로 3단계는 현재 **단종**되어 더 이상 판매되지 않습니다.
{: .notice--warninig}

올로 교육키트 3단계는 2단계 키트의 부품들이 있어야 로봇을 제작할 수 있습니다. 반드시 교육키트 2단계를 먼저 구매하시기 바랍니다.  
{: .notice}

# [부품 리스트](#부품-리스트)

 ![](/assets/images/edu/ollo/edu_3rd_partlist_kr.png)

- [RC-100]
- [LN-101]
- [서보 모터]
- [적외선 센서]
- [LED 모듈]
- [접촉 센서]

# [작동하기](#작동하기)

## [지그비 무선 조종](#지그비-무선-조종)

### 지그비(ZIGBee)

![](/assets/images/edu/ollo/zig_100_110_kr.png)

[ZIG-100/110]은 로봇용 무선 통신 장치로서 ZIGBee 방식을 사용합니다. ZIGBee 는 Bluetooth 와 같이 PAN(Personal Area Network) 통신에 많이 사용되는 통신 기술입니다.  
적외선 방식에 비해서 통신 품질이 매우 좋고, 여러 명이 동시에 조종하여도 각자 자신의 로봇을 조종할 수 있는 장점이 있습니다.


구매한 제품에 지그비 모듈이 포함되지 않을 수 있습니다. 이 경우에는 별도로 구매해야 합니다. BT-210도 사용법은 동일 합니다.
{: .notice}

### 제어기와 지그비

RC-100 을 이용한 올로와 바이올로이드의 조종은 기본적으로 적외선 방식의 무선 통신을 이용하도록 되어 있습니다.  
이것을 ZIGBee 방식의 무선 통신을 이용하도록 하기 위해서는 [ZIG-110 set] 를 별도로 구매하여 [RC-100] 에 ZIG-100 을 장착하고, [제어기]에 ZIG-110 을 장착해야 합니다.  
(자세한 장착 방법은 각 부품의 설명 페이지를 참고하세요.)


지그비 셋트는 제품 출하시 서로 통신이 가능하도록 설정이 맞춰져 있습니다.
만약, 다른 지그비 셋트와 혼용하면 무선 조종이 되지 않으니 섞이지 않도록 주의하시기 바랍니다.   
{: .notice--warning}

|RC-100 에 ZIG-100 모듈을 장착한 모습|CM-100 에 ZIG-110 모듈을 장착한 모습|
|:-----:|:-----:|
|![](/assets/images/edu/ollo/rc-100_zig-100_insert4_kr.jpg)|![](/assets/images/edu/ollo/cm100_zig110_kr.jpg)|

|CM-510 에 ZIG-110 모듈을 장착한 모습|CM-5 에 ZIG-100 모듈을 장착한 모습|
|:-----:|:-----:|
|![](/assets/images/edu/ollo/cm510_zig110_kr.png)|![](/assets/images/edu/ollo/cm5_zig100_kr.png)|


# [다운로드](#다운로드)

## [교안 예제(교육키트 3단계)](#교안-예제(교육키트-3단계)

각 예제의 조립 방법이나 실행 시 동작에 관한 내용은 교육키트 3단계 교안을 참고하세요.   
또한, [예제 태스크 코드의 다운로드 방법은 여기를 참고하세요.]  
{: .notice}

|I-1|태스크 코드|설명|
| :---: | :-----: | :--- |
|1. 건널목 차단기<br />![](/assets/images/edu/ollo/l3_crossing-gate_kr.jpg)|[Download][I-1-1_1]<br />[Download][I-1-1_2]<br />[Download][I-1-1_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|2. 범퍼카<br /> ![](/assets/images/edu/ollo/l3_bump-car_kr.jpg)|[Download][I-1-2_1]<br />[Download][I-1-2_2]<br />[Download][I-1-2_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|3. 집게 탐사차<br />![](/assets/images/edu/ollo/l3_probing_car_kr.jpg)|[Download][I-1-3_1]<br />[Download][I-1-3_2]<br />[Download][I-1-3_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|4. 전기 기타<br />![](/assets/images/edu/ollo/l3_guitar_kr.jpg)|[Download][I-1-4_1]<br />[Download][I-1-4_2]<br />[Download][I-1-4_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|

|I-2|태스크 코드|설명|
| :---: | :-----: | :--- |
|5. 노래하는 새<br />![](/assets/images/edu/ollo/l3_bird_kr.jpg)|[Download][I-2-1_1]<br />[Download][I-2-1_2]<br />[Download][I-2-1_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|6. 타워 크레인<br />![](/assets/images/edu/ollo/l3_crane_kr.jpg)|[Download][I-2-2_1]<br />[Download][I-2-2_2]<br />[Download][I-2-2_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|7. 장갑차<br />![](/assets/images/edu/ollo/l3_combatcar_kr.jpg)|[Download][I-2-3_1]<br />[Download][I-2-3_3]|-조립 확인용 예제 프로그램<br />- 로봇 예제 프로그램|
|8. 탱크<br />![](/assets/images/edu/ollo/l3_tank_kr.jpg)|[Download][I-2-4_1]<br />[Download][I-2-4_2]<br />[Download][I-2-4_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|

|I-3|태스크 코드|설명|
| :---: | :-----: | :--- |
|9. 청기백기<br />![](/assets/images/edu/ollo/l3_flag-guy_kr.jpg)|[Download][I-3-1_1]<br />[Download][I-3-1_2]<br />[Download][I-3-1_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|10. 배틀 버그<br />![](/assets/images/edu/ollo/l3_battlebug_kr.jpg)|[Download][I-3-2_1]<br />[Download][I-3-2_2]<br />[Download][I-3-2_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|11. 로봇 기사<br />![](/assets/images/edu/ollo/l3_retoma_kr.jpg)|[Download][I-3-3_1]<br />[Download][I-3-3_2]<br />[Download][I-3-3_3]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-로봇 예제 프로그램|
|12. 레이싱카<br />![](/assets/images/edu/ollo/l3_racing_car_kr.jpg)|[Download][I-3-4_1]<br />[Download][I-3-4_2]<br />[Download][I-3-4_3]<br />[Download][I-3-4_4]|-조립 확인용 예제 프로그램<br />-프로그래밍 예제 프로그램<br />-프로그래밍 예제 프로그램2<br />-로봇 예제 프로그램|



[RC-100]: /docs/kr/parts/communication/rc-100/
[LN-101]: /docs/kr/parts/interface/ln-101/
[서보 모터]: /docs/kr/parts/motor/servo_motor/
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[LED 모듈]: /docs/kr/parts/display/lm-10/
[접촉 센서]: /docs/kr/parts/sensor/ts-10/
[ZIG-100/110]: /docs/kr/parts/communication/zig-110/
[ZIG-110 set]: /docs/kr/parts/communication/zig-110/
[제어기]: /docs/kr/parts/controller/controller_compatibility/
[예제 태스크 코드의 다운로드 방법은 여기를 참고하세요.]: /docs/kr/faq/download_task_code/
[I-1-1_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_crossinggateasm_kr.tsk
[I-1-1_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_crossinggateexam_kr.tsk
[I-1-1_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_crossinggate_kr.tsk
[I-1-2_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_bumpcarasm_kr.tsk
[I-1-2_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_bumpcarexam_kr.tsk
[I-1-2_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_bumpcar_kr.tsk
[I-1-3_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_probingcarasm_kr.tsk
[I-1-3_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_probingcarexam_kr.tsk
[I-1-3_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_probingcar_kr.tsk
[I-1-4_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_guitarasm_kr.tsk
[I-1-4_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_guitarexam_kr.tsk
[I-1-4_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_guitar_kr.tsk
[I-2-1_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_birdasm_kr.tsk
[I-2-1_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_birdexam_kr.tsk
[I-2-1_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_bird_kr.tsk
[I-2-2_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_craneasm_kr.tsk
[I-2-2_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_craneexam_kr.tsk
[I-2-2_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_crane_kr.tsk
[I-2-3_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_combatcarasm_kr.tsk
[I-2-3_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_combatcar_kr.tsk
[I-2-4_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_tankasm_kr.tsk
[I-2-4_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_tankexam_kr.tsk
[I-2-4_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_tank_kr.tsk
[I-3-1_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_flaggameasm_kr.tsk
[I-3-1_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_flaggameexam_kr.tsk
[I-3-1_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_flaggame_kr.tsk
[I-3-2_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_battlebugasm_kr.tsk
[I-3-2_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_battlebugexam_kr.tsk
[I-3-2_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_battlebug_kr.tsk
[I-3-3_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_knightasm_kr.tsk
[I-3-3_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_knightexam_kr.tsk
[I-3-3_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_knight_kr.tsk
[I-3-4_1]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_racingcarasm_kr.tsk
[I-3-4_2]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_racingcarexam1_kr.tsk
[I-3-4_3]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_racingcarexam2_kr.tsk
[I-3-4_4]: http://support.robotis.com/ko/baggage_files/ollo/edu_3rd/ollo_l3_racingcar_kr.tsk
