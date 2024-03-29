### 容器间如何通过bridge实现相互访问(单台机器) + 容器访问外网  

分解：
1. 安装brctl: `yum install bridge-utils`
2. 运行两个docker container(具体命令看[前文](https://github.com/momokanni/docker/blob/master/README.md))
3. 命令集：   
    `docker network ls # 列举该台机器上的docker网络`   
    `docker ps `,  
    ` docker network inspect bridge #查看网络详细信息`  
    ` ip a `  
    ` ifconfig `  
    ` brctl show ` , **brctl： 用来进行以太网桥接（bridge）的管理**  
    ` ip addr show 端口名称 `  
    ` iptables -L -n -t nat --line-numbers` 查看nat表  
    ` route -n`  
    ` iptables -nat -L -n `
  
  
#### docker0的作用：  

![图1](https://github.com/momokanni/docker/blob/master/piture/bridge_1.png "图1：ifconfig")  
**解：** docker0的IP为`172.18.0.1`,其所在网段默认为`172.18.0.0/16`,可以将docker0看做是host主机的一块**虚拟网卡**。这样host主机就等同于配置了双网卡，两块网卡之间可以通信，但前提是启用ip_forward。  

---

![图2](https://github.com/momokanni/docker/blob/master/piture/bridge_2.png "图2：docker ps")  
![图3](https://github.com/momokanni/docker/blob/master/piture/bridge_4.png "图3: brctl show,ip a")  
**解：** docker运行test1 && test2 两个container，在host主机运行命令`brctl show`发现，每运行一个container，就会产生**一对veth端口**，其中一端连接到docker0上，另一端连接到container中eth0上，这样，所有连接到docker0的容器组成了一个局域网。在此的作用就是**虚拟交换机**，类似于下图： 
![图4](https://github.com/momokanni/docker/blob/master/piture/bridge.png "图4: 总结概括")  

---
![图5](https://github.com/momokanni/docker/blob/master/piture/bridge_3.png "图5：docker network inspect bridge")

1. 通过命令：`docker network inspect bridge` or ` ip addr show veth8e24a52 ` 查看 绑定到docker0 上的两个容器veth端口,都有mac地址。这也说明了docker0的**虚拟交换机**的身份，交换机是通过mac地址通信的，连接到交换机的设备必须具有mac地址。  
2. 由于docker0自身也具有mac地址,所以与纯二层交换机不同。并且绑定了IP `172.18.0.1`，容器默认把docker0作为了网关。也就是docker0还兼具**路由**的功能，因此可以把docker0看做是一个三层交换机，可以做二层数据包转发，也可以做三层路由转发。  
3. 在容器内和host主机上分别运行命令：`route -n` 查看路由。  
   在host中，访问网段`169.254.0.0 , 172.17.224.0`是通过eth0转发数据包的，访问`172.18.0.0`网段是通过docker0转发数据包的，而对于其他如公网是通过eth0将数据包转发给网关`172.17.239.253`，再由该网关进行数据包转发的，比如上网。  
![图6](https://github.com/momokanni/docker/blob/master/piture/bridge_6.png "图6：路由")  

场景：  
![场景图](https://github.com/momokanni/docker/blob/master/piture/bridge_7.png "场景图")

***  

##### 结合上图↑分析：容器访问外网
```
    如果采用云服务器，默认情况下不需要进行设置，即可访问外网。 
    通过docker0实现container间的访问。  
    通过host eth0实现访问外网。  
    通过docker0组成了网段为：172.18.0.0/16的以太网，container发起请求时，相同网段则经由docker0转发到目标contaier,  
    如果是不同网段地址，则经由docker0转发到host另一个网卡eth0上，由eth0负责下一步的数据包转发，比如外网地址。
```  

##### 分析一下报文是怎么发送到外部的  
```  
    container内部发起一条外网请求报文，通过container的eth0传输，在docker0的veth端口被接收。  
    此时报文已经来到host主机，通过查询主机路由表`route -n`，发现报文应通过docker0转发到host的eth0（默认网关）再发送出去。  
    注：要实现host主机的docker0和eth0两个网卡间传递数据包，必须先启用ip_forward功能。  
    如果目标地址并不属于host主机所在网段，那么会匹配机器上的 iptables中的nat表POSTROUTING链中的规则。  
```  
注：
    1.在host主机运行命令 `iptables -L -n -t nat --line-numbers`，查看nat表，只需看POSTROUTING链：  
    ![图7](https://github.com/momokanni/docker/blob/master/piture/bridge_8.png "图7: 查看nat表")  
    选中标白行说明：对于源地址为`172.18.0.0/16`的数据包，发出去之前通过MQSQUERADE伪装。  
    Linux内核会修改数据包源地址为host主机eth0的地址（也就是172.17.235.100），  
    然后把报文转发出去。对于外部来说，报文是从主机eth0发送出去的。  
    局域网内的机器由于都是私有IP，是无法直接访问互联网的（数据包可以发出去，但回不来。）  
    如果要上网，可以通过硬件路由器 or 软件路由，在iptables的nat表中的POSTROUTING链中添加SNAT规则。  
    
    
 [**推一篇极好的文章，本文大部分摘自该篇**](https://www.jianshu.com/p/7abe38059c8b?nomobile=yes)
    

![图示](https://github.com/momokanni/docker/blob/master/piture/bridge_5.png)
