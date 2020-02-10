---
layout: archive
lang: kr
ref: kit2_quickstart
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/engineer/kit2_quickstart/
sidebar:
  title: 엔지니어 키트 2
  nav: "kit2"
product_group: kit2
page_number: 2  
---

<div style="counter-reset: h1 1"></div>

# [작동하기](#작동하기)

## [로보플러스 태스크 3.0 다운로드](#소프트웨어-다운로드)

{% capture software_install %}  
![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**로보플러스 태스크 3.0** : 
- [윈도우용 설치파일 다운로드](http://www.robotis.com/service/download.php?no=1774) 
- [구글 플레이에서 다운로드](https://play.google.com/store/apps/details?id=com.robotis.task3)
- [앱스토어에서 다운로드](https://www.robotis.com/service/download.php?no=1899)
{% endcapture %}
<div class="notice--success">{{ software_install | markdownify }}</div>

- 로보티즈 엔지니어는 [로보플러스 태스크 3.0]을 지원합니다.
- [로보플러스 태스크 3.0]은 기존의 [로보플러스 태스크 2.0]과 [로보플러스 모션 2.0]이 통합된 프로그램입니다.
- 태스크 코드를 작성하여, 로봇을 원하는대로 명령으로 구동할 수 있습니다.
- 모션파일로 로봇의 행동을 직접 만들어 줄 수 있습니다.

## [로보플러스 엔지니어 설치하기](#앱-설치하기)

{% capture app_install %} 
![](/assets/images/edu/engineer/kit1/icon_engineer_48.png)  
**로보플러스 엔지니어** : 
- [구글 플레이에서 다운로드](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)
- [앱 스토어에서 다운로드](https://apps.apple.com/kr/app/r-engineer/id1475713920)
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div>
<!-- 
1. 스마트폰 또는 태블릿에서 `플레이 스토어` 또는 `앱 스토어`를 실행합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_01_kr.png)

2. `플레이 스토어` 또는 `앱 스토어` 검색창에 **로보티즈** 또는 **R+ ENGINEER** 를 입력합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_02_kr.png)

3. 검색된 목록에서 `R+ ENGINEER`를 찾아 `설치`를 선택합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_03_kr.png)

4. 아래와 같은 화면이 나타나면 `동의`를 눌러 설치를 진행합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_04_kr.png) -->

## [예제 다운로드](#예제-다운로드)
- CM-550 제어기에는 최초 출하시 KIT 1 타입에 맞는 프로그램이 기본적으로 다운로드되어 있습니다.  
- 종합예제는 `Dr.R`, `MAX-E1`, `SPI` 세가지 로봇이 모두 포함된 예제입니다.

| 예제명    |                                 태스크 파일                                  |                                 모션 파일                                 |
|:----------|:----------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|
| 종합 예제 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1779 ) | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1787) |
| Dr.R      | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1780)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1788) |
| MAX-E1    | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1781)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1789) |
| SPI       | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1782)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1790) |

**참고**: 다운로드받은 예제파일을 CM-550에 다운로드 해주세요. 

### [PC에서 예제 다운로드 받기](#pc에서-예제-다운로드-받기)

- CM-550의 Micro USB 포트를 이용하면 PC와 직접 연결하여 태스크(.tsk3) 및 모션(.mtn3) 파일을 업로드 할 수 있습니다.
- CM-550에 내장된 BLE 슬레이브 모듈과 BT-410 동글을 페어링하면 PC에서 원격으로 예제를 업로드 할 수 있습니다.

1. [제어기와 PC 연결하기]{: .popup}
2. [PC에서 태스크 예제 다운로드 하기]{: .popup}
3. [PC에서 모션 예제 다운로드 하기]{: .popup}

### [모바일 앱에서 예제 다운로드 받기](#모바일-앱에서-예제-다운로드-받기)

로보플러스 태스크 3.0 앱을 이용하여 제어기에 파일을 업로드 하려면 스마트 기기와 CM-550이 블루투스로 연결되어야 합니다.

1. [모바일 앱과 제어기 연결하기]{: .popup}
2. [모바일 앱에서 태스크 예제 다운로드 하기]{: .popup}
3. [모바일 앱에서 모션 예제 다운로드 하기]{: .popup}

## [예제 실행하기](#예제-실행하기)

`ROBOTIS ENGINEER` 앱을 실행하고 조립된 로봇 예제를 선택하면 해당 예제에 맞는 다양한 기능들을 사용할 수 있습니다.    

![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

**주의** : 조립된 로봇과 다른 예제를 선택할 경우 로봇이 정상적으로 작동하지 않습니다.
{: .notice--warning}

앱 화면 우측 상단의 메뉴버튼을 눌러 환경 설정을 할 수 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_configuration_kr.png)

`연결할 장치 선택` : 연결할 블루투스 장치를 선택합니다.  
`예제 초기화` : 선택한 예제를 초기화 하는 기능입니다.  
`제스처 오차 범위 설정` : 제스처의 허용 오차 범위를 설정합니다.  
`갤러리에 예제 이미지 표시` : 스마트기기의 갤러리에 예제 이미지를 표시합니다.  
`미디어 스캔` : 파일이 PC에서 보이지 않을 때 사용하는 기능입니다.  
`버전 정보` : 현재 앱의 버전을 확인하는 기능입니다.  

### [블루투스 연결하기](#블루투스-연결하기)
- 엔지니어 키트를 조종하기위해서, CM-550과 엔지니어 키트앱의 무선연결이 필요합니다. 엔지니어 키트1의 [블루투스 연결하기](/docs/kr/edu/engineer/kit1/#블루투스-연결하기)를 따라하세요.

### [Dr.R](#drr)

#### 감정 표현  
Dr.R 예제를 선택하면 스마트 기기 화면에 아래와 같은 표정이 나타납니다. 로봇을 터치하거나 이벤트가 발생하면 표정 변화, 움직이기, 말하기 등의 다양한 감정 표현을 합니다.  

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_1.png)

#### 모드 선택하기

오른쪽 아래 `Mode` 버튼을 터치하면 아래와 같이 모드 변경 메뉴가 나타납니다. 5개의 모드와 2개의 옵션 메뉴가 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_3_kr.png)

##### 모드 메뉴

|                        아이콘                         | 모드 설명                                                                                                                                                       |
|:-----------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit1/icon_demo.png)  | **DEMO : 감성인식 모드**<br>기본 데모 모드로 스마트 기기 화면을 통해 감정상태를 표현합니다.<br>로봇이나 스마트 기기를 터치하면 다양한 반응을 합니다.            |
|  ![](/assets/images/edu/engineer/kit1/icon_face.png)  | **FACE : 얼굴인식 모드**<br>스마트 기기의 카메라로 얼굴을 인식하고 추적하는 모드입니다.<br>AR 기술을 적용해 추적하는 얼굴 위에 스티커를 입힙니다.               |
| ![](/assets/images/edu/engineer/kit1/icon_object.png) | **OBJECT : 객체인식 모드**<br>사전에 등록된 물건을 카메라로 인식하고 말하는 모드입니다.<br>바나나, 볼펜, 차 열쇠, 지갑, 지폐 등 12종의 물건을 말할 수 있습니다. |
| ![](/assets/images/edu/engineer/kit1/icon_voice.png)  | **VOICE : 음성인식 모드**<br>등록된 음성 명령을 인식하고 실행하는 모드입니다.<br>모드 변경 및 옵션 메뉴 실행, 종료 등의 명령을 인식합니다.                      |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP : 박수감지 모드**<br>제어기의 마이크 센서를 통해 박수소리를 인식하는 모드입니다.<br>인식한 박수소리의 숫자만큼 Dr.R이 따라서 박수를 칩니다.              |

##### 옵션메뉴

|                        아이콘                         | 옵션 설명                                                                                    |
|:-----------------------------------------------------:|:---------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR : 다이나믹셀 점검**<br>로봇의 다이나믹셀 상태를 각각 테스트해 볼 수 있는 메뉴입니다. |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET : 모션오프셋**<br>모션 동작시 각 관절의 기본 위치를 설정하는 기능입니다.            |

**참고** : 옵션 메뉴는 모든 예제에 포함되어 있으며 세부 설정 방법은 [로봇 설정하기](#로봇-설정하기)를 참고하세요.
{: .notice--info}

### [MAX-E1](#max-e1)

#### 리모컨 화면

![](/assets/images/edu/engineer/kit1/max_controller_kr.png)

`조종 모드` : MAX-E1의 조종 모드를 일반/전투/축구모드로 변경할 수 있습니다.  
`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
`모션 버튼` : 각 조종 모드에 따라 각각 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : 로봇의 다이나믹셀 토크를 켜거나 끌 수 있는 버튼입니다.  
`메뉴 버튼` : MAX-E1 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                         아이콘                         | 메뉴 설명                                                                    |
|:------------------------------------------------------:|:-----------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.                      |
| ![](/assets/images/edu/engineer/kit1/icon_gesture.png) | **GESTURE** : 등록된 스마트 기기의 동작 제스처로 로봇을 조종하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)   | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 MAX-E1이 박수를 칩니다.       |

### [SPI](#spi)

#### 리모컨 화면  

![](/assets/images/edu/engineer/kit1/spi_controller_kr.png)

`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다.  
`모션 버튼` : SPI 로봇에 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : SPI 로봇의 다이나믹셀 토크를 켜거나 풀 수 있는 버튼입니다.  
`메뉴 버튼` : SPI 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                        아이콘                         | 메뉴 설명                                                          |
|:-----------------------------------------------------:|:-------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png) | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.            |
| ![](/assets/images/edu/engineer/kit1/icon_music.png)  | **MUSIC** : 스마트 기기를 통해 로봇과 함께 연주를 하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 SPI가 움직입니다.   |

# [튜토리얼](#튜토리얼)

## [머신러닝 기반의 사물인식](#머신러닝-기반의-사물인식)
로보티즈 엔지니어는 머신러닝(Tensor Flow)기반의 사물학습 및 객체인식 기능을 사용할 수 있습니다.  
아래의 과정을 따라하며 머신러닝을 쉽게 시작해보세요.

{% capture info_01 %}
- 사물학습 및 객체인식을 사용하기 위해서는, 카메라가 장착된 스마트 기기가 있어야 합니다.
- 스마트 기기에 **[로보플러스 엔지니어 앱](#소프트웨어-다운로드)** 을 설치해야 합니다.
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify}}</div>

### [윈도우즈](#윈도우즈)

{% capture info_02 %}
**아나콘다** : 기계 학습, 대규모 데이터 처리를 위한 모듈과 파이썬이 포함된 프로그램입니다.  
텐서플로우를 이용한 머신러닝 이미지 학습을 하기 위해서는 PC에 `아나콘다3 4.2.0`가 설치되어 있어야 합니다.  
- [윈도우 64비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe)  
- [윈도우 32비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86.exe)  
{% endcapture %}
<div class="notice">{{ info_02 | markdownify}}</div>

#### [pip 패키지 업그레이드](#pip-패키지-업그레이드)

1. `WIN` + `S` 키를 눌러 나타난 검색창에 **cmd** 를 검색한 다음 관리자 권한으로 명령 프롬프트를 실행합니다.  
`Ctrl` + `Shift` 를 누른 상태에서 `명령 프롬프트` 를 클릭해도 됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_01_kr.png)

2. 명령 프롬프트가 실행되면 아래와 같은 화면이 나타납니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_02_kr.png)

3. 명령 프롬프트에서 아래의 명령어를 입력해주세요.

    ``` posh
    python -m pip install --upgrade pip
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_03_kr.png)

4. pip패키지가 성공적으로 업그레이드되면 아래와 같이 표시됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_04_kr.png)

    pip 패키지가 업그레이드되지 않는다면, 아나콘다가 `C 드라이브` 에 정상적으로 설치되었는지 확인해주세요.
    {: .notice--warning}

#### [폴더생성](#폴더생성)

1. `D 드라이브`에 `!R+Smart` 폴더를 만들어 주세요.

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_01_kr.png)

    - 폴더 위치는 `D 드라이브` 또는 `C 드라이브` 등 상관없습니다. 매뉴얼에서는 `D 드라이브` 기준으로 설명합니다.
    - 폴더 이름은 사용자가 임의로 변경할 수 있습니다. 매뉴얼에서는 `!R+Smart` 기준으로 설명합니다.
    {: .notice--info}

2. `!R+Smart` 폴더가 생성된 위치로 이동해야 합니다. 현재 드라이브가 `C 드라이브` 이므로, 아래의 명령어를 입력하여 `D 드라이브`로 이동합니다.

    ``` posh
    d:
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_02_kr.png)


3. 아래의 명령어를 입력하여, `!R+Smart` 폴더로 이동합니다.

    ``` posh
    cd !R+Smart
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_03_kr.png)

#### [아나콘다 가상실행 환경 만들기](#아나콘다-가상실행-환경-만들기)

1. 아래의 명령어를 입력해서 아나콘다 가상실행 환경을 만들어주세요.

    ``` posh
    conda create -n tensorflow python=3.5
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_01_kr.png)

2. 진행여부를 묻습니다. `y` 입력후, `Enter Key`를 눌러 패키지 설치를 진행합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_02_kr.png)

3. 성공적으로 설치되면 아래의 사진과 같이 나옵니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_03_kr.png)

#### [텐서플로우 설치하기](텐서플로우-설치하기)

머신러닝을 구동시키기 위해 텐서플로우를 설치합니다.

1. 아래의 명령어를 입력하여, 미리 구축했던 아나콘다 가상실행 환경에 텐서플로우를 활성화시킵니다.

    ``` posh
    activate tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_04_kr.png)

2. 마지막으로 아래의 명령어를 입력해서 텐서플로우를 설치합니다.

    ``` posh
    pip install tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_05_kr.png)

#### [파일과 폴더 생성](#파일과-폴더-생성)

1. `retrain.py` 파일을 다운로드합니다.

    [retrain.py 다운로드](http://www.robotis.com/service/download.php?no=1778)
    {: .notice}

2. `!R+Smart` 폴더에 다운로드받은 `retrain.py` 파일을 복사한 다음, 객체 추가를 위한 `photos` 폴더를 만듭니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_retrain_kr.png)

3. `photos` 폴더 안에 `001 dummy`, `002 banana` 그리고 `003 pineapple`과 같이 객체 이미지를 추가할 하위 폴더를 만들고 객체와 관련된 이미지를 각각의 폴더에 추가합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_image_01_kr.png)

 {% capture notice_01 %}
  **참고** :
  - `001 dummy` 폴더는 지정해둔 객체 이외의 이미지에 반응하기 위해 만들어 주세요. 더미 폴더는 객체인식 오류를 줄여줄수가 있습니다.  
  - 여러 이미지를 반복해서 학습시키기 때문에, 이미지가 많을수록 학습효과가 높아집니다.
  - 카메라의 객체 인식률을 높이기 위해 100개 이상의 이미지를 사용하는 것을 추천합니다.
  - 폴더명을 `001`, `002` 와 같은 숫자로 작성하면, 추가한 아이템번호가 순서대로 정렬됩니다.
 {% endcapture %}
 <div class="notice--info">{{notice_01 | markdownify}}</div>

  **주의** : 폴더와 파일 이름은 반드시 영문으로 작성해주세요.
  {: .notice--warning}

#### [이미지 학습](#이미지-학습)

1. 아래의 명령어를 입력하여, `photos` 폴더에 추가한 객체 이미지들을 학습시킬 수 있습니다.

    ```posh
    python retrain.py --bottleneck_dir=./bottlenecks --model_dir=./inception  --output_graph=./Smart_OC.pb --output_labels=./Smart_OC.txt --image_dir ./photos --architecture mobilenet_1.0_224 --how_many_training_steps 1000
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_img_learning_01_kr.png)

    학습 명령어에서 `how_many_training_steps` 옵션은 이미지 학습의 횟수를 나타냅니다. 횟수는 1000회 정도가 적당하며, 예시의 명령어는 1000회로 학습합니다.
    {: .notice--info}

    **주의** : 폴더와 파일의 이름은 반드시 영문이어야 합니다. 한글 이름을 사용할 경우 오류가 발생합니다.
    {: .notice--warning}

2. 학습이 완료되면 아래와 같이 `Smart_OC.txt` 와 `Smart_OC.pb` 파일이 `!R+Smart` 폴더에 생성됩니다.

   ![](/assets/images/edu/engineer/kit1/obj_classification_oc_kr.png)

#### [프로젝트에 학습파일 적용하기](#프로젝트에-학습파일-적용하기)

1. ROBOTIS ENGINEER가 설치된 스마트 기기를 PC와 연결합니다.

2. 스마트 기기의 저장공간에서 `RoboPlus` > `ROBOTIS ENGINEER` > `CUSTOM` 폴더를 찾아 들어갑니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_01_kr.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_02_kr.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_03_kr.png)

3. 프로젝트 폴더를 생성합니다. 여기에서는 `Project 1`을 프로젝트 폴더로 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_04.png)

    **참고** : 이미 사용중인 프로젝트가 있다면, 프로젝트 폴더를 생성하는 3번 과정은 건너뛸 수 있습니다.
    {: .notice--info}

4. 데이터베이스를 사용하기 위해서 `Db` 폴더를 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_05_kr.png)

5. `!R+Smart` 에서 생성된 학습파일인 `Smart_OC.txt` 와 `Smart_OC.pb` 을 `Db` 폴더에 복사합니다.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_06_kr.png)

6. 스마트 기기를 PC에서 분리한 다음 `ROBOTIS ENGINEER` 앱을 실행합니다.

    ![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

7. `User` 탭으로 이동합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_01_kr.png)

8. 3번 단계에서 생성한 `Project 1` 프로젝트 폴더의 `설정` 아이콘을 클릭합니다.   

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_02_kr.png)

9. `비전` > `객체 분류` 를 선택합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_03_kr.png)

10. 이미지 폴더가 추가되었는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_04_kr.png)

11. 객체를 놓고, 카메라를 통해 사물인식이 잘 되는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_05.png)   

{% capture retrain %}
**참고** : 이미 생성된 학습파일인 `Smart_OC.txt` 와 `Smart_OC.pb` 에는 새로운 데이터를 추가할 수 없습니다.  
원하는 객체를 추가하려면 객체 이미지 폴더에 이미지를 추가한 다음, 새로운 학습파일을 만들어야 합니다.
- [파일과 폴더 생성 방법](#파일과-폴더-생성)
- [이미지 학습 방법](#이미지-학습)
{% endcapture %}
<div class="notice--info">{{ retrain | markdownify }}</div>

# [교육자료 다운로드](#교육자료-다운로드)

{% capture edu_application %}
아래의 링크에서 로보티즈 엔지니어 키트의 다양한 교육자료를 받을 수 있습니다.

- [**교육자료 신청하기**](https://www.robotis.com/pdf_project/register.php)
{% endcapture %}
<div class="notice--info">{{ edu_application | markdownify }}</div>

![](/assets/images/edu/engineer/kit1/engineer_edu_metarials_kr.png)

[로보플러스 태스크 3.0]: /docs/kr/software/rplustask3/
[로보플러스 태스크 2.0]: /docs/kr/software/rplus2/task/
[로보플러스 모션 2.0]: /docs/kr/software/rplus2/motion/
[동작 모드]: /docs/kr/parts/controller/cm-550/#동작-모드
[제어기와 PC 연결하기]: /docs/kr/popup/engineer/connect_controller_pc
[PC에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_pc
[PC에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_pc
[모바일 앱과 제어기 연결하기]: /docs/kr/popup/engineer/connect_controller_mobile
[모바일 앱에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_mobile
[모바일 앱에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_mobile
