# 시작하기

  임베디드 C를 시작하기 위한 방법을 설명합니다.

## WinAVR 설치

WinAVR은 AVR 프로그래밍을 위해서 필요한 프로그램입니다.
WinAVR은 다음 사이트에서 다운로드 받을 수 있으며, 누구나 무료로 사용 가능합니다.

`link` http://winavr.sourceforge.net/

설치 과정은 다음과 같습니다.

1. 설치 언어를 설정합니다.
  ![](/assets/images/sw/sdk/embedded_001.png)
2. 설치 초기 화면입니다.
  ![](/assets/images/sw/sdk/embedded_002.png)
3. 라이센스 관련 내용입니다. 동의 하여야 설치를 진행할 수 있습니다.
  ![](/assets/images/sw/sdk/embedded_003.png)
4. 설치 폴더를 설정합니다. 사용자가 원하는 곳으로 설정하고 Next버튼을 누릅니다.
  ![](/assets/images/sw/sdk/embedded_004.png)
5. 설치할 프로그램 및 환경 옵션을 선택합니다. 특별한 사유가 없다면 모두 설치하는 것이 좋습니다.
  ![](/assets/images/sw/sdk/embedded_005.png)
6. WinAVR 설치를 시작합니다.
  ![](/assets/images/sw/sdk/embedded_006.png)
7. WinAVR설치가 완료되었습니다.
  ![](/assets/images/sw/sdk/embedded_007.png)

## Atmel Studio 소개

Atmel Studio 소개

Atmel Studio는 AVR 프로그래밍을 쉽게 할 수 있도록 여러가지 매크로와 라이브러리 및 통합 환경을 제공합니다.

Atmel Studio는 다음 사이트에서 다운로드 받을 수 있으며, 누구나 무료로 사용 가능합니다.

`link` http://www.atmel.com/dyn/products/tools_card.asp?tool_id=2725

### Atmel Sudio 설치

Atmel Studio의 설치 과정은 다음과 같습니다.
1. Atmel Studio설치 시작화면입니다.
![](/assets/images/sw/sdk/embedded_008.png)
2. 라이센스 관련 내용입니다. 동의 하여야 설치를 진행할 수 있습니다.
![](/assets/images/sw/sdk/embedded_009.png)
3. 설치 폴더를 설정합니다. 사용자가 원하는 곳으로 설정하고 Next버튼을 누릅니다.
![](/assets/images/sw/sdk/embedded_010.png)
4. Next를 클릭하여 설치를 진행합니다.
![](/assets/images/sw/sdk/embedded_011.png)
5. Atmel Studio 설치를 시작합니다.
![](/assets/images/sw/sdk/embedded_012.png)
6. Atmel Studio 설치가 완료되었습니다.
![](/assets/images/sw/sdk/embedded_013.png)

### 환경 설정

임베디드 C를 사용하려면 설치한 프로그램의 기본적인 환경을 설정해야 합니다

- WinAVR을 설치하고 Atmel Studio를 설치하면 특별한 경우가 아닌 한 Atmel Studio만을 이용하여 프로그래밍을 할 수 있습니다.
- 일반적으로 PC와 제어기가 시리얼 케이블로 연결되어 있으면 기본적인 예제 실행이 가능하며, 예제에 따라 다이나믹셀이 필요하거나, 그 외 외부 장치가 요구될 때도 있습니다.

1. Debug - Options and Settings 를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_014.png)

2. 왼쪽 메뉴에서 Toolchain을 선택합니다. Atmel AVR 8-bit (C language)를 선택합니다. Add Flavour을 클릭합니다.
![img](/assets/images/sw/sdk/embedded_015.png)

3.  [...]을 클릭하여 20100110버전의 WinAVR이 설치 되어 있는 폴더의 bin폴더를 선택하여 줍니다.
Ex) c:WinAVR-20100110bin
![img](/assets/images/sw/sdk/embedded_016.png)

4. Win AVR 을 선택한후 OK 버튼을 누릅니다.
![img](/assets/images/sw/sdk/embedded_017.png)

5. File - Open - Project/Solution 을 클릭합니다.
![img](/assets/images/sw/sdk/embedded_018.png)

6. 예제 파일을 선택하고 열기를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_019.png)

7. 오른쪽 Solution Explorer에 보이는 c파일을 더블 클릭하여 선택합니다. Project -> Properties를 클릭 합니다.
Solution Explorer가 보이지 않는다면 View 에서 Solution Explorer를 선택해주세요.
![img](/assets/images/sw/sdk/embedded_020.png)

8. 왼쪽 메뉴에서 Toolchain을 클릭합니다. Directories를 클릭합니다. 초록색 +모양의 Add Item을 클릭합니다.
![img](/assets/images/sw/sdk/embedded_021.png)

9. Include 폴더를 선택하여 줍니다
 Ex) c:embedded_c(cm700_v1.01)include
![img](/assets/images/sw/sdk/embedded_022.png)

10. Include 폴더가 추가된 것을 확인 할 수 있습니다.
![img](/assets/images/sw/sdk/embedded_023.png)

11. 오른쪽 Solution Explorer에서 프로젝트 파일을 오른쪽 클릭하여 Add Library를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_024.png)

12. Browse Libraries를 클릭합니다. 오른쪽 하단에 [Browse]를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_025.png)

13. 라이브러리를 선택 하기 위해 예제에 포함되어 있는 lib 폴더를 선택하고 [열기]를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_026.png)

14. 3개의 라이브러리를 추가하기 위해 드래그하여 모두 선택하고 오른쪽 아래 [열기]를 클릭합니다.
![img](/assets/images/sw/sdk/embedded_027.png)

15. 3개의 라이브러리가 추가된 것을 확인 할 수 있습니다.
![img](/assets/images/sw/sdk/embedded_028.png)

16. Build -> Rebuild Solution 을 클릭하여 컴파일하고 아래Output창에 Build Succeeded.가 확인되면 모든 작업이 끝나게 됩니다.
![img](/assets/images/sw/sdk/embedded_029.png)

### 로보플러스 복구하기

임베디드 C로 만들어진 결과물은 제어기 펌웨어(hex 파일) 입니다. 이것을 설치하면 기존의 제어기 펌웨어가 지워져서 로보플러스를 사용할 수 없게됩니다. 만약, 로보플러스를 다시 사용하려면 공장 출하시 제어기 펌웨어를 설치해야 합니다. 로보플러스 매니저를 이용하면 공장 출하시 제어기 펌웨어를 쉽게 설치할 수 있습니다.
자세한 사항은 로보플러스 매니저의 [펌웨어 복구하기]를 참조하십시오.

[펌웨어 복구하기]: ??
