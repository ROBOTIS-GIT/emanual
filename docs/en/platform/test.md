---
layout: archive
lang: en
ref: test
permalink: /docs/en/test/
tabs: ros-version
tab_title1: Kinetic
tab_title2: Melodic
tab_title3: Foxy
product_group: test
sidebar:
  title: Test
  nav: "test"
---

<div class="{{ page.tab_title1}}">
{% include en/platform/kinetic.md %}
</div>

<div class="{{ page.tab_title2}}">
{% include en/platform/melodic.md %}
</div>

{% capture foxy_test %}

{% include en/platform/foxy.md %}

{% endcapture %}

<div class="foxy_test" style= "display: block">{{ foxy_test | markdownify }}</div>

<!-- {% capture foxy %} -->
<!-- {% endcapture %} -->

<!--

Log:
20201018
- JS code is addeds to default.html.
- The made js code performs adding a class named "selected" to .archive class.
- when archive class name is changed, I want the include specific fragnments will appear and the other fragments not show up (display: none;)

20201019
- If statement only works one time when the pate is loaded. Manipulate css property, display: none or block.

20201020
- {::options parse_block_html="true" /} 옵션을 통해, Block Level 의 블럭과 마크다운을 같이 사용할수있다.
- {: .} 로 통해, ID 또는 class 지정이 가능하다.

-->
