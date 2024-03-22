목표 전류 Value의 Notch Filter의 설정 Value입니다. Notch Filter를 사용하면 특정 주파수의 신호를 제거할 수 있습니다. 시스템 공진 주파수 등 시스템의 제어 성능 하락을 유발하는 주파수를 제거함으로써 제어 성능을 향상시킬 수 있습니다. 

| 컨트롤 테이블 item            | Unit  | Range              |
|:----------------------------|:------|:------------------|
| Notch Filter Frequency(126) | [Hz]  | 0 ~ 2,147,483,647 |
| Notch Filter Bandwidth(128) | [Hz]  | 0 ~ 2,147,483,647 |
| Notch Filter Depth(130)     | -     | 0 ~ 2,147,483,647 |

![](/assets/images/dxl/y/notch_filter_frequency.PNG)

**Note** : Notch Filter Depth(130) Value이 커질수록 Phase가 급격하게 변하게 되어 시스템의 발산을 유발할 수 있습니다. Notch Filter Depth(130) Value을 조금씩 키우면서 설정하시기 바랍니다.