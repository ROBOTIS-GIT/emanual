
## [다양한 X시리즈 사용하기](#다양한-x시리즈-사용하기)

[DYNAMIXEL Channel](#dynamixel-channel-설정하기)을 설정하여, [다이나믹셀-X](/docs/kr/dxl/x/#x-series)를 로보티즈가 제공하는 [소프트웨어](/docs/kr/software/#로보플러스)에서 사용하실수 있습니다. 

**참고**: [아두이노 IDE](#아두이노-ide)를 사용시, 채널 설정이 필요하지 않습니다. 
{: .notice}

{% if page.ref=='opencm904'}

**참고**: OpenCM485 확장보드를 사용하면, 24V 다이나믹셀 및 RS485 통신이 사용가능합니다.  
![](/assets/images/sw/rplus2/manager/rplusmanager2_30_kr.jpg) 
{: .notice}

{% else %}
{% endif %}

### [DYNAMIXEL Channel 설정하기](#dynamixel-channel-설정하기)

제어기에서 컨트롤 테이블의 **Dynamixel Channel** 항목을 변경하여, 다양한 X시리즈를 사용해보세요.

1. R+ Manager를 실행 후, 홈 탭에서 **OpenCM 9.04**를 선택하세요.

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_01_kr.png)

2. **업데이트 & 테스트**를 클릭하세요.  

    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_02_kr.png)

3. 컨트롤 테이블이 활성화 되면, 컨트롤 테이블 16번 **Dynamixel Channel** 의 항목을 사용하는 다이나믹셀에 맞게 변경하고 저장하세요. 예를 들어, 확장 보드에서 다이나믹셀 X시리즈를 사용하기 위해서는 **EXP Board(X-Series)** 을 선택 합니다.
  
    ![](/assets/images/sw/rplus2/manager/rplus_manager2_dxl_channel_setting_03_kr.png)
              
| 항목                    | 설명                                                                                               |
|:------------------------|:---------------------------------------------------------------------------------------------------|
| **On Board(XL-320)**    | 로보티즈에서 제공하는 프로그램을 통해, OpenCM 9.04에서 XL-320을 사용 할수 있습니다.                |
| **EXP Board(X-Series)** | 로보티즈에서 제공하는 프로그램을 통해, 확장보드에서 X시리즈를 사용 할수 있습니다 (XL-320 제외).    |
| **EXP Board(XL-320)**   | 로보티즈에서 제공하는 프로그램을 통해, 확장보드에서 XL320을 사용 할수 있습니다.                    |
| **On Board(X-Series)**  | 로보티즈에서 제공하는 프로그램을 통해, OpenCM 9.04에서 X시리즈를 사용 할수 있습니다 (XL-320 제외). |

> OpenCM9.04의 컨트롤테이블 Dynamixel Channel 항목

**참고**: 설정이 완료 되면, 제어기 연결을 해제하고, OpenCM9.04 또는 485 확장보드의 전원을 끄고 다시 켜주세요. 제어기가 재부팅되고, 변경한 Dynamixel Channel에 맞게 다이나믹셀 Bus가 활성화 됩니다. 이후, 태스크 프로그램에서 모션파일을 사용하거나, 모션 프로그램에서 다이나믹셀을 사용 할 수 있습니다. 
{: .notice}
