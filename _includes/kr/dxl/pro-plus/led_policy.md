{% capture dxl_led_policy %}  
**참고**  
(장치의 상태(조건)에 따른 LED의 동작입니다.)

| 상태     | LED 동작      |
|:--------:|:-------------:|
| 부팅     | 1회 녹색 점멸 |
| 초기화   | 4회 녹색 점멸 |
| 알람     | 적색 점멸     |
| 부트모드 | 보라색 점등   |

{% endcapture %}
<div class="notice--danger">{{ dxl_led_policy | markdownify }}</div>
