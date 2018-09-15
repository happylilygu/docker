### Linux命名空间-NameSpace 感受一下就行，不需要特别详细的了解
**namespace简称为：ns**

##### Net NameSpace (netns)命令
>1. 查看列表：`ip netns list`  
>2. 新增：`ip netns add name`  
>3. 删除：`ip netns delete name`  
>4. 查看某个ns详细：`ip netns exec name ip a`   
>5. 查看某个ns链接： `ip netns exec name ip link`
