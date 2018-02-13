### 1. Overview  
This chapter will explain how to connect to ROBOTIS-OP3.  

### 2. Direct Connection  
Keyboard and monitor are directly connected to ROBOTIS-OP3.  


### 3. Remote Connection

![](/assets/images/platform/op3/op3_connection.png)

   **Connect to ROBOTIS-OP3 over the network.**  


#### 3.1 Connection Type  
 - Via Wireless(WLAN)  
 IP address will be automatically assigned when connecting to ROBOTIS-OP3-Share.  
 After establishing Wi-Fi connection, use one of the connection methods described in the next section.
 (_password : 111111_)  

 - Via Wired(Ethernet)   
 When using wired connection, connect ROBOTIS OP3 to the same Router with PC so that OP3 can be connected as a DHCP client.  

#### 3.2 How to connect
 - SSH
    1. Execute SSH client program (ex: PuTTY)
    2. Input ROBOTIS-OP3’s IP address : 10.42.0.1
    3. Select SSH as a connection type and then open it.
    4. Input ROBOTIS-OP3’s user name : robotis
    5. Input ROBOTIS-OP3’s password : 111111  

    ![](/assets/images/platform/op3/op3_connection_ssh.png)
 - VNC
    1. Execute VNC client program (ex: Ultra VNC Viewer)
    2. Input ROBOTIS-OP3’s IP address : 10.42.0.1
    3. Input ROBOTIS-OP3’s password : 111111
    4. Accessing ROBOTIS-OP3 via remote desktop may result in slower performance.

    ![](/assets/images/platform/op3/op3_connection_vnc.png)



[&lt;&lt; Back](op3_user's_guide.md)
