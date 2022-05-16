---
layout: popup
---

# [USB 드라이버 설치](#usb-드라이버-설치)

**지원하는 제어기**:  

| 모델                   | CM-5 | CM-50 | CM-100 | CM-150 | CM-200 | CM-510 | CM-530 | CM-550 | CM-700 | CM-900 | OpenCM9.04+[485 EXP] | OpenCM7.0 | OpenCR 1.0 |
|:-----------------------|:----:|:-----:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:--------------------:|:---------:|:----------:|
| ROBOTIS Virtual Driver |  X   |   X   |   X    |   O    |   X    |   X    |   O    |   O    |   X    |   X    |          O           |     O     |     X      |

{% capture supported_controller %}
**참고**: 만일, 사용중인 제어기가 제공된 드라이버와 호환되지 않을시, 다음 중 하나를 참조하세요.  
    1. 사용중인 제어기의 e-Manual에서 드라이버 정보를 찾으세요. OpenCR은 ST 드라이버를 지원합니다.   
    2. e-Manual에서 드라이버 정보를 찾을수 없을경우, FTDI 드라이버 설치를 진행 하세요.
{% endcapture %}
<div class="notice">{{ supported_controller | markdownify }}</div>

- `다운로드` [Robotis_CDC_drv.zip](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/opencm/robotis_cdc_drv.zip)  
  Windows XP, Vista, 7, 8, 8.1 (32비트 및 64비트 지원, 단 서버군 제외)

## INF,CAT 파일을 이용한 설치방법

1. RoboPlus의 USB_CDC_Driver 폴더로 접근 합니다.
2. USB_CDC_Driver 폴더에서 "ROBOTIS_CDC_DRV.INF"를  오른쪽 마우스 클릭해서 "설치"를 클릭 합니다.

    ![][img_01]

3. 정상적으로 설치 되었습니다.

    ![][img_02]

**주의** : 윈도우즈 10에서 "타사의 INF 파일에 디지털 서명 정보가 없습니다." 라는 메세지가 발생하면 아래 링크를 따라 `고급 부팅 옵션`으로 진입 후 8번 단계의 시작 설정 창에서 `7` 또는 `F7`을 눌러 **드라이버 서명 적용 사용 안 함** 을 선택하십시오.  
[https://answers.microsoft.com/ko-kr/windows/forum/windows_10-update-winpc/windows-10-%EA%B3%A0%EA%B8%89-%EB%B6%80%ED%8C%85/27f170ed-28db-4840-8533-0e47d2d04288](https://answers.microsoft.com/ko-kr/windows/forum/windows_10-update-winpc/windows-10-%EA%B3%A0%EA%B8%89-%EB%B6%80%ED%8C%85/27f170ed-28db-4840-8533-0e47d2d04288)
{: .notice--warning}

## 수동 설치 방법

Server 군 (Windows 2003, 2008)

1. 제어기를 PC 의 USB 와 연결합니다.
2. 컴퓨터 위에서 오른쪽 클릭하여 뜨는 팝업 메뉴에서 “관리”를 선택합니다.

    ![][img_03]

3. “장치 관리자” 에서 “기타 장치” 에 “ROBOTIS Virtual COM Port” 라는 장치가 나타나면 그 장치 위에서 마우스 우측 클릭 후 “드라이버 소프트웨어 업데이트” 를 선택합니다.

    ![][img_04]

4. “컴퓨터에서 드라이버 소프트웨어 찾아보기” 를 선택합니다.

    ![][img_05]

5. “찾아보기” 버튼을 누르고, RoboPlus 가 설치된 폴더의 하위 폴더인 “USB_CDC_Driver” 디렉토리를 선택하고, “다음” 버튼을 누릅니다.

    ![][img_06]

6. 성공적으로 USB CDC 드라이버를 설치하셨다면 아래와 같이 “드라이버 소프트웨어를 업데이트했습니다” 라는 메시지가 나타납니다.

    ![][img_07]

7. 장치 관리자에서 방금 설치한 “ROBOTIS Virtual COM Port” 가 “포트(COM & LPT)” 에서 COM 포트 몇 번으로 할당되었는지 확인합니다.

    ![][img_08]


[img_01]: /assets/images/faq/usb_150_kr.jpg
[img_02]: /assets/images/faq/clip_image031_kr.jpg
[img_03]: /assets/images/faq/clip_image002_kr.jpg
[img_04]: /assets/images/faq/clip_image004_kr.gif
[img_05]: /assets/images/faq/clip_image006_kr.jpg
[img_06]: /assets/images/faq/clip_image008_kr.jpg
[img_07]: /assets/images/faq/clip_image012_kr.jpg
[img_08]: /assets/images/faq/clip_image014_kr.jpg
