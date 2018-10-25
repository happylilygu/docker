### 容器间link + 创建network_bridge  

容器间相互通信两种方式:   
假设现有容器：test1、test2  
>1. test1 link test2 容器间直接link，此时在容器test1中能ping通test2,反向则不能。  
>2. 创建bridge，两个容器绑定到该brige上，实现双向link
命令：
>1. ` docker run -d --name test2(容器名称) --link test1(容器名称) --network 网络名称 busybox /bin/sh -c "while true;do sleep 3600;done"`  
     --link(不推荐使用)
>2. ` brctl show`  
>3. ` docker network create -d bridge 网络名称`  
>4. ` docker network ls `  
>5. ` docker network inspect 网络名称`  
>6. ` docker network connect 网络名称 containerName` : 将现有container的网络连接link至其他网络  
 
#### 演示  
![图1](https://github.com/momokanni/docker/blob/master/piture/link_1.png "图1：--link")  

**创建network**  
![图2](https://github.com/momokanni/docker/blob/master/piture/link_2.png "图2：docker network create -d bridge 网络名称")  

运行container：test3，并指定network。
![图3](https://github.com/momokanni/docker/blob/master/piture/link_3.png "图3：docker network inspect 网络名称")  

更改已存在的container的network  
执行命令：`docker network connect my_bridge test1`  
然后分别检查my_bridge和bridge：`docker network inspect 网络名称`  
![图4](https://github.com/momokanni/docker/blob/master/piture/link_4.png "图4: docker network inspect my_bridge")  

![图5](https://github.com/momokanni/docker/blob/master/piture/link_5.png "图5: docker network inspect bridge")  
![图6](https://github.com/momokanni/docker/blob/master/piture/link_6.png "图6：test1有两个端口一个采用bridge网段，另一个为my_bridge网段")  
![图7](https://github.com/momokanni/docker/blob/master/piture/link_7.png "图7: ")  


**注：**  
     test3在未link test1的情况下，之所以能ping通，是因为两个container都连到自己创建的my_bridge上了，所以两个默认是link的 
     





