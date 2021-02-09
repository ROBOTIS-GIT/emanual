{% if page.ref=='mx-28' %}
{% assign mx_model="MX-28" %}
{% elsif page.ref=='mx-64'%}
{% assign mx_model="MX-64" %}
{% elsif page.ref=='mx-106' %}
{% assign mx_model="MX-106" %}
{% endif %}

**주의**: Control Table 의 Compliance 설정부분이 PID설정으로 대체 되었습니다.
{: .notice}

**주의**: 컨트롤테이블에서 PID순서가 0x1E 버젼 이후부터 DIP로 변경되었습니다. 사용시 참고해주세요.
{: .notice}

{% if page.ref=='mx-106' %}
**주의**: {{ mx_model }}T(TTL)와 {{ mx_model }}R(RS485)은 통신방식만 다르며 동일한 성능과 기능을 갖고 있습니다. (TTL은 3핀 커넥터, RS485는 4핀 커넥터를 사용합니다.)
{: .notice}
{% else %}
**주의**: {{ mx_model }}AT(TTL)와 {{ mx_model }}AR(RS485)은 통신방식만 다르며 동일한 성능과 기능을 갖고 있습니다. (TTL은 3핀 커넥터, RS485는 4핀 커넥터를 사용합니다.)
{: .notice}
{% endif %}

**참고**: MX(2.0)은 프로토콜 2.0을 지원하는 MX 시리즈의 별도 펌웨어를 의미합니다. DYNAMIXEL Wizard2.0의 [펌웨어 복구](/docs/kr/software/dynamixel/dynamixel_wizard2/#펌웨어-복구) 기능을 활용 또는 [로보플러스 매니저 2.0](/docs/kr/software/rplus2/manager/#펌웨어-복구)를 활용하여 MX(2.0) 펌웨어로 업그레이드할 수 있습니다. (프로토콜 2.0의 컨트롤 테이블은 [{{ mx_model }} (2.0) 컨트롤 테이블] 에서 확인 가능합니다.)
{: .notice}


<iframe width="560" height="315" src="https://www.youtube.com/embed/q_gAewi_dyY" frameborder="0" allowfullscreen></iframe>

> 로보플러스 매니저 2.0으로 펌웨어 업데이트하기
