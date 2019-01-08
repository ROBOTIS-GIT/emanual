Insert --- here
layout: archive
lang: en
ref: lower_case_file_name_without_extension
read_time: true
share: true
author_profile: false
permalink: /docs/en/file_path/lower_case_file_name_without_extension/
sidebar:
  title: Product_name
  nav: "lower_case_file_name_without_extension"
Insert --- here

# [Introduction](#introduction)

![product_image](/assets/images/image_file_path/image_file_name)

**Basic** text *writing* can `use` different effects.
 
## [2nd Heading](#2nd-heading)

|Table|Example|with Link|
|:---:|:---:|:---:|
|Center|Aligned|[Link]|

> Sample table with a quote

### [3rd Heading(anchor_required-up_to-this_level)](#3rd-headinganchor_required-up_to-this_level)

- [Link sample 1] : Internal link
- [Link sample 2] : eManual product link
- [Link sample 3] : web url
- [Link sample 4]{: .popup} : popup link

#### 4th heading don't need anchor(auto created)

- Youtube video

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

- textbox

  - single line textbox

    This is Sparta!{: .notice--danger}

  - multiline textbox

{% capture notice_01 %}
- Meanwhile in Korea...   
- It's peaceful
{% endcapture %}

<div class="notice--success">{{ notice_01 | markdownify }}</div>


- Highlight

```c
//Enter source code here
#include <stdio.h>

void main()
{
  //to do
}
```


[Link]: http://
[Link sample 1]: #Introduction
[Link sample 2]: /docs/en/parts/communication/bt-110/#specifications
[Link sample 3]: http://google.com
[Link sample 4]: /docs/en/popup/opencm904_ex_button/
