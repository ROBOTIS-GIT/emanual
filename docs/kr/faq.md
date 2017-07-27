---
layout: archive
lang: kr
ref: faq
read_time: true
share: true
author_profile: false
permalink: /docs/kr/faq
sidebar:
  title: FAQ
  nav: "faq"
---

# [컨텐츠 작성방법](#컨텐츠-작성방법)

  파일의 최상단에 반드시 아래의 YFM을 추가하고 내용을 알맞게 업데이트합니다.
  ```
  ---
  layout: archive
  lang: en    > 영어(en), 한글(kr), 일어(jp), 중국어(cn)
  ref: thormang3_getting_started    > 컨텐츠의 주제(각 언어별로 ref가 같아야 함.)
  read_time: true
  share: true
  author_profile: false
  permalink: /docs/en/platform/thormang3/getting_started/   > /파일위치/파일명/
  sidebar:
    title: THORMANG3    > 제품명
    nav: "thormang3"    > 내비게이션 참조명(navigation.yml파일 참조)
  ---
  ```

## [개요번호](#개요번호)
  H1은 아래와 같이 주제 앞에 #을 한개 붙이고 한칸 띄운다음 주제를 입력한다.
  ```
  # 첫번째 주제

  ## 두번째 주제

  ### 세번째 주제
  ```

## [다단계 목록](#다단계-목록)
- 번호 없는 목록과
  - 하위 항목을 만들 수 있으며

1. 번호를 만들어서 사용할 수도 있고
  - 번호 목록의 하위에 번호없는 목록을 섞어서 사용할수도 있다.
    - 하위항목을 만들 때에는 반드시 두칸 이상 들여쓰기를 해야한다.

```
- 번호 없는 목록과
  - 하위 목록을 만들 수 있으며

1. 번호를 만들어서 사용할 수도 있고
  - 번호 목록의 하위에 번호없는 목록을 섞어서 사용할수도 있다.
    - 하위항목을 만들 때에는 반드시 두칸 이상 들여쓰기를 해야한다.
```

## [글상자](#글상자)
`Note` 이와 같은 상자에 글을 입력하려면 아래와 같이 사용한다.
{: .notice}

**notice--primary** 다양한 종류의 상자
{: .notice--primary}

*notice--info* 색상도 다르고
{: .notice--info}

`notice--warning` 한줄짜리 공지에 유용합니다.
{: .notice--warning}

`**notice--danger**` 여러줄은 다른 방법을 써야합니다.
{: .notice--danger}

`Success` 조금 아쉽죠
{: .notice--success}

```
`Note` 이와 같은 상자에 글을 입력하려면 아래와 같이 사용한다.
{: .notice}

**notice--primary** 다양한 종류의 상자
{: .notice--primary}

*notice--info* 색상도 다르고
{: .notice--info}

`notice--warning` 한줄짜리 공지에 유용합니다.
{: .notice--warning}

`**notice--danger**` 여러줄은 다른 방법을 써야합니다.
{: .notice--danger}

`Success` 조금 아쉽죠
{: .notice--success}
```

## [표](#표)
아래의 예제를 보시기 바랍니다.
각 셀은 '|'로 구분되며 줄을 맞추지 않아도 됩니다.
항목 줄은 표 내용과 | :----------- |로 구분됩니다.
셀 병합기능이 없기 때문에 사용에 다소 불편함이 있을 수 있습니다.
한칸에 여러줄을 입력하려면 {% raw %}'<br />'{% endraw %}태그를 이용할 수 있습니다.

```
| 항목 1         | 항목 2       |
| :------------- | :---------- |
| 이름           | 똘망         |
|소속|로보티즈|
```

| 항목 1         | 항목 2       |
| :------------- | :---------- |
| 이름           | 똘망         |
|소속|로보티즈|


## [그림](#그림)
그림 삽입은 그림을 업로드한 후에 그림의 주소를 지정해서 사용할 수 있습니다. 주소가 지정되어있는 레퍼런스는

![성능그래프][performance graph]
[performance graph]: {{site.url}}/assets/images/dxl/x-series/xh430_w210_performance_graph.jpg
{: .notice}

![성능그래프][performance graph]

[performance graph]: {{site.url}}/assets/images/dxl/x-series/xh430_w210_performance_graph.jpg


## [링크](#링크)
링크 삽입은 아래와 같이 사용할 수 있습니다.

[컨텐츠 작성방법][Contents Format]

[Contents Format]: {{site.url}}/docs/kr/faq

```
[컨텐츠 작성방법][Contents Format]
[Contents Format]: {{site.url}}/docs/kr/faq
```

## [텍스트 효과](#텍스트-효과)

텍스트 효과에는 _기울임1_ 또는 *기울임2*, __두껍게1__ 또는 **두껍게2**, ~~선긋기~~ 를 사용할 수 있습니다.

텍스트 효과에는 _기울임1_ 또는 *기울임2*, __두껍게1__ 또는 **두껍게2**, ~~선긋기~~ 를 사용할 수 있습니다.
{: .notice}

## [소스코드 입력](#소스코드-입력)
소스코드를 표시할 때에는 아래와 같이 할 수 있습니다. 1번 방법은 코딩언어를 명시함으로써 코드에 하이라이트를 해주는 기능입니다.

- 1번 방법

  ```c++
  find_package( thormang3_kinematics_dynamics )   
  target_link_libraries( thormang3_kinematics_dynamics )   
  ```

  &grave;&grave;&grave;c++  
    find_package( thormang3_kinematics_dynamics )   
  target_link_libraries( thormang3_kinematics_dynamics )   
  &grave;&grave;&grave;


- 2번 방법

  ```
  find_package( thormang3_kinematics_dynamics )   
  target_link_libraries( thormang3_kinematics_dynamics )   
  ```

  &grave;&grave;&grave;  
  find_package( thormang3_kinematics_dynamics )   
  target_link_libraries( thormang3_kinematics_dynamics )   
  &grave;&grave;&grave;
