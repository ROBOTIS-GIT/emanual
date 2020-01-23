**주의** : EEPROM Area의 Data는, 2개의 컨트롤테이블에 존재하는 [Torque Enable(64)]의 값이 모두 `0' 일때만 변경할 수 있습니다.
{: .notice--warning}

**주의** : 2XL430은 두 개의 모터가 각각 별도의 컨트롤 테이블을 갖고 있습니다. 하지만, 통신모듈은 하나이기 때문에 두 모터의 [Baud Rate(8)]와 [Protocol Type(13)]은 항상 동시에 변경되며, 변경 시에는 두 모터의 [Torque Enable(64)]의 값을 모두 **0**으로 설정해야 합니다.
{: .notice--warning}
