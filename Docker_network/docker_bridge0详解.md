### 容器间如何通过bridge实现相互访问(单台机器) + 容器访问外网  

分解：
1. 安装brctl: `yum install bridge-utils`
2. 运行两个docker container(具体命令看[前文](https://github.com/momokanni/docker/blob/master/README.md))
3. No.1. `docker ps `,  
   No.2. ` docker network inspect bridge `,  
   No.3.   ` ip a `
   No.4. ` brctl show ` , **brctl： 用来进行以太网桥接（bridge）的管理** 
![图示一](https://github.com/momokanni/docker/blob/master/piture/bridge_2.png)  
![图示二](https://github.com/momokanni/docker/blob/master/piture/bridge_3.png)  
![图示三](https://github.com/momokanni/docker/blob/master/piture/bridge_4.png)  

**注：**
1. 通过命令：`docker network inspect bridge` or ` ip addr show veth8e24a52 ` 查看 绑定到docker0 上的两个容器veth端口,都有mac地址。这也说明了docker0的虚拟交换机的身份，交换机是通过mac地址通信的，连接到交换机的设备必须具有mac地址。  
2. 由于docker0自身也具有mac地址,所以与纯二层交换机不同。并且绑定了IP `172.18.0.1`，容器默认把docker0作为了网关。也就是docker0还兼具路由的功能，因此可以把docker0看做是一个三层交换机，可以做二层数据包转发，也可以做三层路由转发。  
3. 在容器内和host主机上分别运行命令：`route -n` 查看路由。  
   在host中，访问本网段`169.254.0.0 , 172.17.224.0`是通过eth0转发数据包的，访问`172.18.0.0`网段是通过docker0转发数据包的，而对于其他如公网是通过eth0将数据包转发给网关`172.17.239.253`，再由该网关进行数据包转发的，比如上网。
![路由图示](https://github.com/momokanni/docker/blob/master/piture/bridge_6.png)  
![总结](https://github.com/momokanni/docker/blob/master/piture/bridge_1.png)

##### 容器访问外网
![图示](https://github.com/momokanni/docker/blob/master/piture/bridge_5.png)
