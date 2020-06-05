---
  layout: popup
---

# [제어기와 PC 연결하기](#포트-연결하기)

1. CM-550에 전원을 연결합니다.
2. PC의 USB 포트에, BT-410 동글을 연결합니다.
3. CM-550의 `MODE` 버튼 부분을 BT-410 동글에 가까이 가져가면, 페어링이 완료됩니다.
4. 로보플러스 태스크 3.0을 실행시킨 후, 왼쪽 하단의 `연결`버튼을 클릭 해주세요.

    ![](/assets/images/edu/engineer/kit1/remote_pairing_01.png)  

5. BT-410 동글을 사용할 경우 반드시 `Use USB Dongle` 옵션을 선택해주세요.

    ![](/assets/images/edu/engineer/kit1/remote_pairing_02.png)  

6. 사용할 시리얼 포트를 선택해 주세요.

    ![](/assets/images/edu/engineer/kit1/remote_pairing_03.png)  

7. 연결 버튼을 클릭하여, PC와 제어기를 연결시켜 주세요.   

    ![](/assets/images/edu/engineer/kit1/remote_pairing_04.png)  

8. 연결이 성공적으로 완료되면 '삐비빅' 소리가 납니다.  

    ![](/assets/images/edu/engineer/kit1/remote_pairing_05.png)  

  {% capture pairing_01 %}
  **참고** :  
    - 첫 페어링시 제어기의 `MODE` 버튼쪽으로 BT-410 동글을 가까이 가져가면 자동으로 페어링됩니다.  
    - 페어링이 완료된 후에는 블루투스의 통신거리 이내에서 로봇과 PC가 멀어져도 연결이 유지됩니다.  
    - 페어링이 한번 설정되면, 재시작할 때 블루투스의 통신거리 이내에서 자동으로 페어링이 됩니다.  
  {% endcapture %}
  <div class="notice--info">{{ pairing_01 | markdownify}}</div> 
