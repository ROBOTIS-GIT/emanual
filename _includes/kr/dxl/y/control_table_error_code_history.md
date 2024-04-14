장치에 문제가 발생하면 발생한 Error가 Error Code(153) 값이 표시되며, 이미 Error가 발생하여 Error Code(153) 값이 ‘0’(No Error)이 아닌 상태에서 또 다른 Error가 발생하면 Error Code(153)의 값이 해당 Error 값으로 변경됩니다. 즉, Error Code(153)의 값은 가장 마지막으로 발생한 Error를 표시합니다. 이러한 경우 Error Code History 1 ~ 16(154 ~ 169)에 발생한 Error Code(153)가 순차적으로 저장됩니다.

**참고** : 같은 Error는 여러번 발생하지 않습니다.
{: .notice}

16개 보다 많은 Error가 발생했을 경우, 오래된 Error (Error Code History 1(154))부터 소멸되고 최근 발생한 16개의 Error 값이 기록됩니다. 다음은 16개 Error가 발생하고, 17번 째 Error가 발생했을 때의 예시입니다.

![](/assets/images/dxl/y/error_history_1.png)

Error Clear Packet 을 통해서 Error Code(153) 해제를 수행할 경우, Error Code History 1 ~ 16 중에서 해제 가능한 Error 항목들은 제거되지만, 해제가 불가능한 항목들은 남아 있게 됩니다. 다음은 해제 가능한 Error와 불가능한 Error가 Error Code History에 기록되어 있을 때, Error Clear Packet을 보냈을 때의 예시입니다.

![](/assets/images/dxl/y/error_history_2.png)