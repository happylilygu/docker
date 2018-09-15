### Linux命名空间-NameSpace 感受一下就行，不需要特别详细的了解
**namespace简称为：ns**

##### Net NameSpace (netns)命令
>1. 查看列表：`ip netns list`  
>2. 新增：`ip netns add ns名称`  
>3. 删除：`ip netns delete ns名称`  
>4. 查看某个ns详细：`ip netns exec ns名称 ip a`   
>5. 查看某个ns链接： `ip netns exec ns名称 ip link`  
>6. 唤醒端口：`ip netns exec ns名称 ip link set dev 端口名称 up`
![演示图](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180915180000.png)

***注：***  
  1. 执行命令6，link state=UNKNOW,原因：单个端口无法up，必须一对。  
  ![图解](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180915182219.png)
  
  **解决步骤：**
>1. 添加一对veth端口：`ip link add 端口名称1 type veth peer name 端口名称2`  
>2. 绑定新创建的veth端口到ns上：`ip link set 端口名称 netns ns名称`  
>3. 端口设置IP： `ip netns exec ns名称 ip addr add IP dev 端口名称`  
>4. 唤醒veth端口：ns命令6  
>5. 测试两个ns中veth端口是否调通：`ip netns exec 端口1所在ns名称 ping 端口2_IP`  
![步骤图解](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180915192138.png)
