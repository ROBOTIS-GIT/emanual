
## [다양한 X시리즈 사용하기](#다양한-x시리즈-사용하기)

[DYNAMIXEL Channel](#dynamixel-channel-설정하기)을 설정하여, [다이나믹셀-X](/docs/kr/dxl/x/#x-series)를 로보티즈가 제공하는 [소프트웨어](/docs/kr/software/#로보플러스) (R+ Task, R+ Motion 및 R+ Manager)에서 사용하실수 있습니다. 

**참고**: [아두이노 IDE](#아두이노-ide)를 사용시, 채널 설정이 필요하지 않습니다. 
{: .notice}

{% if page.ref=='opencm904' %}
**참고**: [OpenCM485 확장보드](/docs/kr/parts/controller/opencm485exp/)를 사용하면, 24V 다이나믹셀 및 RS485 통신이 사용 가능합니다.  
![](/assets/images/sw/rplus2/manager/rplusmanager2_30_kr.jpg) 
{: .notice}

{% capture 904_convertible %}
**참고**: OpenCM 9.04의 Type-B 및 Type-C는 Molex 타입의 커넥터를 사용합니다. 다이나믹셀-X를 연결하기 위해서 JST-Molex 변환용 케이블을 사용하세요. 
- A-Type-: 커넥터 부착 필요. ([A타입 다이나믹셀 TTL 커넥터 추가하기](#a타입-다이나믹셀-ttl-커넥터-추가하기))
- B-Type-: [로봇케이블-X3P](https://www.robotis.com/shop/item.php?it_id=903-0251-000) 및 [로봇케이블-XL320](https://www.robotis.com/shop/item.php?it_id=903-0291-000)
- C-Type-: [로봇케이블-XL320](https://www.robotis.com/shop/item.php?it_id=903-0291-000)
{% endcapture %}

<div class="notice">{{ 904_convertible | markdownify }}</div>

{% else %}

{% capture dxl_jst_molex %}
**참고**: 다이나믹셀-X 및 P 모델은 JST 커넥터를 사용합니다. OpenCM485 확장보드 사용시, JST-Molex 변환케이블([로봇 케이블-X3P](https://www.robotis.com/shop/item.php?it_id=903-0251-000) 또는 [로봇 케이블-X4P](https://www.robotis.com/shop/item.php?it_id=903-0246-000))을 사용하세요.
{% endcapture %}
<div class="notice">{{ dxl_jst_molex | markdownify }}</div> 

{% endif %}

### [DYNAMIXEL Channel 설정하기](#dynamixel-channel-설정하기)

제어기에서 컨트롤 테이블의 **Dynamixel Channel** 항목을 변경하여, 다양한 X시리즈를 사용해보세요.

{% capture keep_904_uptodate %}
**참고**: 
- OpenCM 9.04의 [펌웨어를 최신으로 유지](/docs/kr/software/rplus2/manager/#펌웨어-업데이트)해주세요.
-  OpenCM 485 확장보드와 OpenCM9.04가 결합되어있는 경우, 펌웨어 복구 및 업데이트를 진행 시 분리해주세요.
{% endcapture %}
<div class="notice">{{ keep_904_uptodate | markdownify }}</div> 

1. R+ Manager를 실행 후, 홈 탭에서 **OpenCM 9.04**를 선택하세요.

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_01_kr.png)

2. **업데이트 & 테스트**를 클릭하세요.  

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_02_kr.png)

3. 컨트롤 테이블이 활성화 되면, 16번 **Dynamixel Channel** 주소에서 원하는 항목으로 변경 후 저장하세요. 예를 들어, 확장 보드에서 다이나믹셀 X시리즈를 사용하기 위해서는 **EXP Board(X-Series)** 을 선택 합니다. 
  
    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_03_kr.png)

  | 항목                    | 설명                                                               |
  |:------------------------|:-------------------------------------------------------------------|
  | **On Board(XL-320)**    | OpenCM 9.04에서 XL-320을 사용 할수 있습니다.                       |
  | **EXP Board(X-Series)** | OpenCM485 확장보드에서 X시리즈를 사용 할수 있습니다 (XL-320 제외). |
  | **EXP Board(XL-320)**   | OpenCM485 확장보드에서 XL320을 사용 할수 있습니다.                 |
  | **On Board(X-Series)**  | OpenCM 9.04에서 X시리즈를 사용 할수 있습니다 (XL-320 제외).        |

**참고**: 설정이 완료 되면, 제어기 연결을 해제하고, OpenCM9.04 또는 485 확장보드의 전원을 끄고 다시 켜주세요. 제어기가 재부팅되고, 변경한 Dynamixel Channel에 맞게 다이나믹셀 Bus가 활성화 됩니다. 이후, 태스크 프로그램에서 모션파일을 사용하거나, 모션 프로그램에서 다이나믹셀을 사용 할 수 있습니다. 
{: .notice}
