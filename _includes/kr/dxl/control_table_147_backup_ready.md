{% if page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_backup = "펌웨어 v46" %}
{% else %}
{% assign firmware_version_backup = "펌웨어 v45" %}
{% endif %}

Control table Backup 패킷을 통하여 저장된 컨트롤 테이블 데이터의 유무를 나타냅니다.

| 값 | 상세 설명                            |
|:--:|:-------------------------------------|
| 0  | Backup된 컨트롤 테이블 데이터가 없음 |
| 1  | Backup된 컨트롤 테이블 데이터가 있음 |

**참고**: {{ firmware_version_backup }}부터 지원합니다. 사용방법은, [백업 및 복구](/docs/kr/software/dynamixel/dynamixel_wizard2/#백업-및-복구)을 참고하세요.
{: .notice}
