# 룰 체크

룰 체크란, 태스크 코드(Task Code)가 정해진 문법에 맞게 작성되었는지 검사하는 과정입니다. RoboPlus Task에서는 문법 오류를 검사하여 오류 원인과 위치를 자동으로 찾아주는 기능을 지원합니다. 만약, 문법 오류가 있다면 아래와 같이 에러 종류와 위치가 출력됩니다.

![img](/assets/images/sw/rplus1/task/syntax_error.png)

### 룰 에러: 장치나 숫자를 정해주세요.

##### 오류 원인

- 파라미터 설정을 하지 않았습니다.

   ![img](/assets/images/sw/rplus1/task/load_error_1.png)

##### 해결책

- 설정되지 않은 파라미터를 찾아 적절히 설정합니다.

   ![img](/assets/images/sw/rplus1/task/load_error_2.png)

### 룰 에러: 구간 시작이 없습니다.

##### 오류 원인

- 구간이 필요한 명령문에서 구간이 없는 경우 발생합니다.

   ![img](/assets/images/sw/rplus1/task/interval_error_1.png)

##### 해결책

- 구간을 적절히 설정 해 주십시오.

   ![img](/assets/images/sw/rplus1/task/interval_error_2.png)

### 룰 에러: 구간 지정으로 수행할 문장을 묶어줘야 합니다.

##### 오류 원인

- 구간이 필요한 명령문이 구간 없이 중복으로 나올 경우 발생합니다.

   ![img](/assets/images/sw/rplus1/task/interval_error_3.png)

##### 해결책

- 구간을 적절히 설정 해 주십시오.

   ![img](/assets/images/sw/rplus1/task/interval_error_4.png)

### 룰 에러: 프로그램 시작은 오직 1개만 존재할 수 있습니다.

##### 오류 원인

- 프로그램 시작이 2개 이상일 때 발생합니다.

   ![img](/assets/images/sw/rplus1/task/program_start_error_1.png)

##### 해결책

- 프로그램 시작을 1개만 만듭니다.

   ![img](/assets/images/sw/rplus1/task/program_start_error_2.png)

### 룰 에러: 프로그램 시작은 구간 안에 만들 수 없습니다.

##### 오류 원인

- 프로그램 시작이 구간 안에 존재합니다.

   ![img](/assets/images/sw/rplus1/task/program_start_error_3.png)

##### 해결책

- 프로그램 시작을 구간 안에서 뺍니다.

   ![img](/assets/images/sw/rplus1/task/program_start_error_4.png)

### 룰 에러: 함수는 구간 안에 만들 수 없습니다.

##### 오류 원인

- 함수가 구간 안에 있습니다.

   ![img](/assets/images/sw/rplus1/task/function_in_interval_1.png)

##### 해결책

- 함수를 구간 안에서 뺍니다.

-    ![img](/assets/images/sw/rplus1/task/function_in_interval_2.png)

### 룰 에러: 지정한 구간을 수행할 명령문이 없습니다.

##### 오류 원인

  - 명령, 조건문 없이 구간만 있습니다.

     ![img](/assets/images/sw/rplus1/task/interval_no_command_1.png)

##### 해결책

  - 누락된 명령을 추가하거나, 구간이 필요없으면 삭제 해 주십시오.

     ![img](/assets/images/sw/rplus1/task/interval_no_command_2.png)

### 룰 에러: 이 문장은 구간 안에 포함되어야 합니다.

##### 오류 원인

  - 구간 없이 가장 바깥에 명령문이 존재합니다.

     ![img](/assets/images/sw/rplus1/task/command_out_interval_1.png)

##### 해결책

  - 명령문을 적절한 위치로 이동하거나, 잘못 정의된 경우 삭제해야 합니다.

     ![img](/assets/images/sw/rplus1/task/command_out_interval_2.png)

### 룰 에러: 구간의 시작과 끝이 짝이 맞지 않습니다.

##### 오류 원인

  - 구간의 시작과 끝이 맞지 않는 경우 발생합니다.

     ![img](/assets/images/sw/rplus1/task/interval_matching_error_1.png)

##### 해결책

  - 구간을 적절히 설정 해 주십시오.

     ![img](/assets/images/sw/rplus1/task/interval_matching_error_2.png)

### 룰 에러: 프로그램의 시작을 찾을 수 없습니다.

##### 오류 원인

  - 프로그램 시작이 없습니다.

     ![img](/assets/images/sw/rplus1/task/program_not_start_1.png)

##### 해결책

  - 프로그램 시작을 만듭니다.

     ![img](/assets/images/sw/rplus1/task/program_not_start_2.png)

### 룰 에러: 같은 이름의 함수가 이미 존재합니다.

##### 오류 원인

  - 같은 이름의 함수가 이미 있습니다.

     ![img](/assets/images/sw/rplus1/task/same_function_name_1.png)

##### 해결책

  - 중복되는 함수 이름을 적절히 바꾸거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/same_function_name_2.png)

### 룰 에러: "복귀"는 함수에서만 사용합니다.

##### 오류 원인

  - 복귀 명령을 함수 이외의 곳에서 사용할 때 발생합니다.

     ![img](/assets/images/sw/rplus1/task/return_in_function_1.png)

##### 해결책

  - 함수 내부에 복귀명령을 만들거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/return_in_function_2.png)

### 룰 에러: 같은 이름의 레이블이 이미 존재합니다.

##### 오류 원인

  - 레이블 이름이 중복됩니다.

     ![img](/assets/images/sw/rplus1/task/same_lable_name_1.png)

##### 해결책

  - 이름을 다르게 설정하거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/same_lable_name_2.png)

### 룰 에러: 자기 자신을 호출할 수 없습니다.

##### 오류 원인

  - 함수 내부에서 자기 자신을 호출할 때 발생합니다.

     ![img](/assets/images/sw/rplus1/task/self_fuction_call_1.png)

##### 해결책

  - 적절한 명령문으로 대체하거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/self_fuction_call_2.png)

### 룰 에러: 아니면 만약, 아니면의 사용법이 잘못되었습니다.

##### 오류 원인

  - "만약" 없이 "아니면 만약" 혹은 "아니면"이 사용되었습니다.

     ![img](/assets/images/sw/rplus1/task/wrong_condition_1.png)

##### 해결책

  - "만약", "아니면 만약", "아니면"의 용법대로 수정합니다.

     ![img](/assets/images/sw/rplus1/task/wrong_condition_2.png)

### 룰 에러: 끝낼 반복문이 없습니다.

##### 오류 원인

  - 반복문이 아닌 곳에서 '반복 끝내기'명령을 사용한 경우 발생합니다.

     ![img](/assets/images/sw/rplus1/task/loop_return_error_1.png)

##### 해결책

  - 반복 끝내기 명령은 반복문 안에서 사용하며, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/loop_return_error_2.png)

### 룰 에러: 구간 안에 최소 1개의 실행 문장이 있어야 합니다.

##### 오류 원인

  - 구간이 필요한 명령어 뒤에 실행 문장이 없는 경우 발생합니다.

     ![img](/assets/images/sw/rplus1/task/interval_no_command_1.png)

##### 해결책

  - 명령어 뒤에 필요한 실행 문장을 추가하거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/interval_no_command_2.png)

### 룰 에러: 호출할 함수가 없습니다.

##### 오류 원인

  - 존재하지 않는 함수를 호출합니다.

     ![img](/assets/images/sw/rplus1/task/function_name_1.png)

##### 해결책

  - 해당 함수를 만들거나, 필요없는 경우 삭제합니다.

     ![img](/assets/images/sw/rplus1/task/function_name_2.png)

### 룰 에러: 콜백은 오직 1개만 존재할 수 있습니다.

##### 오류 원인

  - 콜백 함수가 2개 이상 존재할 때 발생합니다.

     ![img](/assets/images/sw/rplus1/task/double_callback_1.png)

##### 해결책

  - 콜백함수를 하나만 만듭니다.

     ![img](/assets/images/sw/rplus1/task/double_callback_2.png)

### 룰 에러: 콜백은 구간 안에 만들 수 없습니다.

##### 오류 원인

- 콜백이 구간 안에 존재합니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_main_1.png)

##### 해결책

- 콜백을 구간 안에서 뺍니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_main_2.png)

### 룰 에러: 콜백 구간 내에서 쓸 수 없는 문장입니다.

##### 오류 원인

- 콜백에서 사용할 수 없는 명령문이 있습니다.

   ![img](/assets/images/sw/rplus1/task/callback_syntax_1.png)

##### 해결책

- 해당 명령문을 삭제합니다.

   ![img](/assets/images/sw/rplus1/task/callback_syntax_2.png)

### 룰 에러: 콜백 구간 내에서 쓸 수 없는 장치입니다.

##### 오류 원인

- 콜백에서 사용할 수 없는 파라미터가 있습니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_error_1.png)

##### 해결책

- 해당 파라미터를 삭제합니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_error_2.png)

### 룰 에러: 현재 선택한 제어기에서 사용할 수 없는 명령문입니다.

##### 오류 원인

- 현재 설정된 제어기에서 지원하지 않는 명령문을 사용합니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_cm100_1.png)

##### 해결책

- 해당 명령문을 삭제하거나, 지원하는 제어기로 설정합니다.

   ![img](/assets/images/sw/rplus1/task/callback_in_cm100_2.png)

### 룰 에러: 현재 선택한 제어기에서 사용할 수 없는 장치가 있습니다.

##### 오류 원인

- 현재 설정된 제어기에서 쓸 수 없는 파라미터를 사용합니다.

   ![img](/assets/images/sw/rplus1/task/controller_param_error_1.png)

##### 해결책

- 해당 파라미터를 삭제하거나, 지원하는 제어기로 설정합니다.

   ![img](/assets/images/sw/rplus1/task/controller_param_error_2.png)
