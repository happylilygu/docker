### Linux命名空间-NameSpace 感受一下就行，不需要特别详细的了解
**namespace简称为：ns**

##### Net NameSpace (netns)命令
>1. 查看列表：`ip netns list`  
>2. 新增：`ip netns add name`  
>3. 删除：`ip netns delete name`  
>4. 查看某个ns详细：`ip netns exec name ip a`   
>5. 查看某个ns链接： `ip netns exec name ip link`  
>6. 唤醒link：`ip netns exec name ip link set dev lo up`
![演示图](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20180915180000.png)
***注：***  
  1. 执行命令6，link state=UNKNOW,原因：单个端口无法up，必须一对。
