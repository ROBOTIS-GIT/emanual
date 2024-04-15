When a problem occurs with the device, the Error Code (153) is displayed, indicating the specific error. If an error occurs while the Error Code (153) value is not '0' (No Error) due to a previous error, the value of Error Code (153) will be changed to the corresponding error value. In other words, the value of Error Code (153) indicates the most recent error occurred. In such cases, the Error Code (153) that occurred in Error Code History 1 to 16 (154 ~ 169) are stored sequentially.

Note : The same error does not occur multiple times.
{: .notice}

If more than 16 errors occur, the oldest errors (Error Code History 1 (154)) are deleted, and the 16 most recent error values are recorded. The following is an example when 16 errors have occurred, and the 17th error occurs.

![](/assets/images/dxl/y/error_history_1.png)

When clearing Error Code (153) via the Error Clear Packet, the errors that can be cleared from Error Code History 1 ~ 16 are removed, while those that cannot be cleared remain. The following is an example of sending an Error Clear Packet when clearable and impossible errors are recorded in the Error Code History.

![](/assets/images/dxl/y/error_history_2.png)