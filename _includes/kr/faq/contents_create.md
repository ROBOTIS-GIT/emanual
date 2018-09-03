# [컨텐츠 작성방법](#컨텐츠-작성방법)

  파일의 최상단에 반드시 아래의 YFM(Yaml Front matter)을 추가하고 내용을 알맞게 업데이트합니다.
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
  개요번호를 만들기 위해서는 아래와 같이 제목 앞에 #을 붙이고 한칸을 띄운다음 제목을 입력한다.
  ```
  # 1번 제목

  ## 1-1번 제목

  ### 1-1-1번 제목

  ## 1-2번 제목

  # 2번 제목

  ## 2-1번 제목

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
**참고** : 이와 같은 상자에 글을 입력하려면 아래와 같이 사용한다.
{: .notice}

**notice--primary** 다양한 종류의 상자
{: .notice--primary}

*notice--info* 색상도 다르고
{: .notice--info}

`notice--warning` 한줄짜리 공지에 유용합니다.
{: .notice--warning}

**`notice--danger`** 여러줄은 다른 방법을 써야합니다.
{: .notice--danger}

`Success` 조금 아쉽죠
{: .notice--success}

```
**참고** : 이와 같은 상자에 글을 입력하려면 아래와 같이 사용한다.
{: .notice}

**notice--primary** 다양한 종류의 상자
{: .notice--primary}

*notice--info* 색상도 다르고
{: .notice--info}

`notice--warning` 한줄짜리 공지에 유용합니다.
{: .notice--warning}

**`notice--danger`** 여러줄은 다른 방법을 써야합니다.
{: .notice--danger}

`Success` 조금 아쉽죠
{: .notice--success}
```

{% capture group_notice_01 %}
**참고** : 여러줄짜리 글상자를 사용하려면 조금 복잡합니다.
1. 글상자로 묶고자 하는 문단의 첫번째에 "{% capture group_notice_01 %}"를 넣고 마지막 숫자 01은 다른 그룹 글상자의 이름과 겹치지 않게 사용한 그룹 글상자의 숫자만큼 증가시켜줍니다.
2. 글상자로 묶고자 하는 문단의 마지막 줄에 "{% endcapture %}"를 추가합니다.
3. 글상자를 넣고자하는 부분에 아래의 코드를 추가하고 글상자의 유형에 따라 notice를 notice--info, notice--warning 등으로 변경한 뒤 group_notice_01의 01을 해당 그룹 글상자의 숫자와 맞춰줍니다.
4. <div class="notice">{{ group_notice_01 | markdownify }}</div>
{% endcapture %}

<div class="notice">{{ group_notice_01 | markdownify }}</div>

```
{% capture group_notice_01 %}
**참고** : 여러줄짜리 예제입니다.
1. 첫번째 문장
2. 두번째 문장
3. 세번째 문장
4. <div class="notice">{{ group_notice_01 | markdownify }}</div>
{% endcapture %}

<div class="notice">{{ group_notice_01 | markdownify }}</div>
```

## [표](#표)
아래의 예제를 보시기 바랍니다.
각 셀은 '|'로 구분되며 줄을 맞추지 않아도 되며 표 내용과 헤더로 구분됩니다.
한 컬럼의 좌우정렬은 헤더 아래의 | :------- | 에서 지정할 수 있습니다.
콜론(:)이 왼쪽에만 있으면 왼쪽정렬, 오른쪽에만 있으면 오른쪽 정렬, 양쪽에 모두 있으면 가운데 정렬입니다.
셀 병합기능이 없기 때문에 사용에 다소 불편함이 있을 수 있습니다.
한칸에 여러줄을 입력하려면 **&lt;br /&gt;**태그를 이용할 수 있습니다.
표의 시작과 끝에는 반드시 한줄의 공백이 있어야 합니다.

```
| 항목 1         | 항목 2       |
| :------------: | :---------- |
| 이름           | 똘망<br />Thormang3|
|소속|로보티즈|
```

| 항목 1         | 항목 2       |
| :------------: | :---------- |
| 이름           | 똘망<br />Thormang3|
|소속|로보티즈|


## [그림](#그림)
그림 삽입은 그림을 업로드한 후에 그림의 주소를 지정해서 사용할 수 있습니다. 주소를 저장하는 레퍼런스는 문서의 가장 하단에 작성합니다.

```text
![성능그래프][performance graph]

[performance graph]: {{site.url}}/assets/images/dxl/x/xh430_w210_performance_graph.jpg
```

![성능그래프][image reference]

[image reference]: {{site.url}}/assets/images/dxl/x/xh430_w210_performance_graph.jpg

## [동영상](#동영상)
동영상 삽입은 유튜브 동영상을 기준으로 아래의 코드를 복사한 후 src의 동영상 주소만 변경해서 작성합니다.

```html
<iframe width="640" height="360" src="https://www.youtube.com/embed/rvm-m2ogrLA" frameborder="0" allowfullscreen=""></iframe>
```

<iframe width="640" height="360" src="https://www.youtube.com/embed/rvm-m2ogrLA" frameborder="0" allowfullscreen=""></iframe>

## [링크](#링크)
링크 삽입은 아래와 같이 사용할 수 있습니다. 주소를 저장하는 레퍼런스 태그는 문서의 가장 하단에 작성합니다.

[컨텐츠 작성방법][link reference]

[link reference]: {{site.url}}/docs/kr/faq

```text
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

  ```cmake
  find_package( thormang3_kinematics_dynamics )
  target_link_libraries( thormang3_kinematics_dynamics )
  ```

  &#96;&#96;&#96;cmake
  find_package( thormang3_kinematics_dynamics )
  target_link_libraries( thormang3_kinematics_dynamics )
  &#96;&#96;&#96;

- 2번 방법

  ```
  find_package( thormang3_kinematics_dynamics )
  target_link_libraries( thormang3_kinematics_dynamics )
  ```

  &#96;&#96;&#96;
  find_package( thormang3_kinematics_dynamics )
  target_link_libraries( thormang3_kinematics_dynamics )
  &#96;&#96;&#96;
