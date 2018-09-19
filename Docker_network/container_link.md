### 容器间link + 创建network_bridge
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
![图6](https://github.com/momokanni/docker/blob/master/piture/link_6.png "图6：docker exec -it test1 /bin/sh")  

注：  
     





