이 위치에 --- 를 입력하세요
layout: archive
lang: kr
ref: 확장자를 제외한 파일명(영문소문자)
read_time: true
share: true
author_profile: false
permalink: /docs/kr/파일위치/확장자를 제외한 파일명(영문소문자)/
sidebar:
  title: 제품명
  nav: "확장자를 제외한 파일명(영문소문자)"
이 위치에 --- 를 입력하세요

# [개요](#개요)

![제품_이미지](/assets/images/이미지파일_위치/이미지파일명)

**기본** 텍스트는 *다양한* 효과를 `지원합니다`.

## [두번째 제목](#두번째-제목)

|링크를|포함한|테이블 예시|
|:---:|:---:|:---:|
|[링크]가|가운데|정렬되어 있네?|

> 인용문은 이렇게 사용하는겁니다.

### [세번째 제목(이_단계까지-앵커가_있어야-합니다)](#세번째-제목이_단계까지-앵커가_있어야-합니다)

- [링크 예제 1] : 동일문서 내부링크
- [링크 예제 2] : 매뉴얼문서 링크
- [링크 예제 3] : 외부링크
- [링크 예제 4]{: .popup} : 팝업링크

#### 네번째 제목부터는 앵커를 만들지 않아도 됩니다(자동생성)

- Youtube 비디오

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

- 글상자

  - 한줄짜리 글상자

    아아 춥다!{: .notice--danger}

  - 여러줄짜리 글상자

    {% capture notice_01 %}
    - 나는 미세먼지가
    - 싫어요
    {% endcapture %}

    <div class="notice--success">{{ notice_01 | markdownify }}</div>


- 하이라이트

```c
//여기에 코드를 쓰세요
#include <stdio.h>

void main()
{
  //to do
}
```


[링크]: http://
[링크 예제 1]: #Introduction
[링크 예제 2]: /docs/en/parts/communication/bt-110/#specifications
[링크 예제 3]: http://google.com
[링크 예제 4]: /docs/en/popup/opencm904_ex_button/
