### 容器间如何通过bridge实现相互访问(单台机器) + 容器访问外网
`该篇主要以命令和截图为主，很好理解`
感知步骤：
1. 安装brctl: `yum install bridge-utils`
2. 运行两个docker container(具体命令看[前文](https://github.com/momokanni/docker/blob/master/README.md))
3. No.1. `docker ps `,  
   No.2. ` docker network inspect bridge `,  
   No.3.   ` ip a `
   No.4. ` brctl show ` ,brctl作用： 用来进行以太网桥接（bridge）的管理 
![图示一](https://github.com/momokanni/docker/blob/master/piture/bridge_2.png)  
![图示二](https://github.com/momokanni/docker/blob/master/piture/bridge_3.png)  
![图示三](https://github.com/momokanni/docker/blob/master/piture/bridge_4.png)  
![总结](https://github.com/momokanni/docker/blob/master/piture/bridge_1.png)

##### 容器访问外网
![图示](https://github.com/momokanni/docker/blob/master/piture/bridge_5.png)
