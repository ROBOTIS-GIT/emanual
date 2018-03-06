목표 가속도 값의 한계 값입니다.  
Goal Acceleration(606)은 이 값보다 큰 값을 쓸 수 없습니다.  
이 값보다 큰 값을 쓰려 하면, 값이 써지지 않고, Status packet의 error 에 Limit error bit가 set 됩니다.  
Goal Acceleration(606)은 전류 제어 모드를 제외한 모든 제어 모드에서 목표 궤적을 생성하는데 사용됩니다.

|값의 범위|
| :---: |
|0 ~ 2,147,483,647|
