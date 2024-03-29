### Linux命名空间-NameSpace 感受一下就行，不需要特别详细的了解
**该文目的：Docker容器网络在linux上也是基于network namespace实现，所以此文只是将其“自动化”的创建过程做了简单的分解**

 `namespace简称为：ns`

##### Net NameSpace (netns)命令
>1. 查看列表：`ip netns list`  
>2. 新增：`ip netns add ns名称`  
>3. 删除：`ip netns delete ns名称`  
>4. 查看某个ns详细：`ip netns exec ns名称 ip a`, `docker exec -it containerName/containerId ip a`   
>5. 查看某个ns链接： `ip netns exec ns名称 ip link`  
>6. 唤醒端口：`ip netns exec ns名称 ip link set dev 端口名称 up`
![演示图](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180915180000.png)

***注：***  
  1. ip netns exec命令可以在特定ns的内部执行相关程序,这个命令至关重要。  
  2. 执行命令6，link state=UNKNOW,原因：单个端口无法up，必须一对.VETH(Virtual Ethernet )是Linux提供的另外一种特殊的网络设备，中文称为虚拟网卡接口。它总是成对出现，要创建就创建一个pair。一个Pair中的veth就像一个网络线缆的两个端点，数据从一个端点进入，必然从另外一个端点流出。  
  ![图解](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180915182219.png)
  
  **解决步骤：**
>1. 添加一对veth端口：`ip link add 端口名称1 type veth peer name 端口名称2`  
>2. 绑定新创建的veth端口到ns上：`ip link set 端口名称 netns ns名称`  
>3. 端口设置IP： `ip netns exec ns名称 ip addr add IP/掩码 dev 端口名称`  
>4. 唤醒veth端口：ns命令6  
>5. 测试两个ns中veth端口是否调通：`ip netns exec 端口1所在ns名称 ping 端口2_IP`  
![步骤图解](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180916143141.png)

**[附一篇极好的文章](https://yq.aliyun.com/articles/68699?spm=5176.10695662.1996646101.searchclickresult.367dafbcjtbFYG&accounttraceid=0bbdd29a-fb1e-47d4-aa4d-bbe5cf901316)**
