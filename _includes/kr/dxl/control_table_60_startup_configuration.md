{% if page.product_group == 'xl330' or page.product_group == 'xc330' %}
{% assign firmware_version_startup_configuration = "펌웨어 v46" %}
{% else %}
{% assign firmware_version_startup_configuration = "펌웨어 v45" %}
{% endif %}

다이나믹셀의 전원이 켜진 직후의 상태를 결정할 수 있습니다.  

|     Bit     |       명칭        | 상세 설명                                                                                                                                 |
|:-----------:|:-----------------:|:------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 6(0x40) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 5(0x20) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 4(0x10) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 3(0x08) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 2(0x04) |         -         | 미사용, 항상 ‘0’                                                                                                                          |
| Bit 1(0x02) |    RAM Restore    | **[0]** 부팅 시 RAM영역의 값은 기본값으로 복구 <br>**[1]** Backup Data가 준비되어 있다면, 부팅 시 RAM 영역의 값은 해당 Backup Data로 복구 |
| Bit 0(0x01) | Startup Torque On | **[0]** 부팅 시 Torque Enable(64) ‘0’ (Torque Off) 상태 <br>**[1]** 부팅 시 Torque Enable(64) ‘1’(On) 상태                                |

**참고**: Startup Configuration은 {{ firmware_version_startup_configuration }}부터 지원합니다. 
{: .notice}

**참고**: RAM Restore에 대한 사용방법은 [RAM 영역 복구하기](/docs/kr/software/dynamixel/dynamixel_wizard2/#ram-영역-복구하기)을 참고하세요.
{: .notice}
