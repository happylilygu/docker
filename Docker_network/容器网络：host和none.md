#### host && none  
***有些知识点，需要实操感悟，所以图多，话少***  

命令：  
  ` docker run -d --name 容器名称 --network none/host busybox /bin/sh -c "while true;do sleep 3600;done"  `  
  ` docker network inspect none/host `  
  ` docker exec -it 容器名称 /bin/sh `  
  ` ip a `  

图示：  

![图1](https://github.com/momokanni/docker/blob/master/piture/none_1.png "图1：运行docker容器指定network-none")  
![图2](https://github.com/momokanni/docker/blob/master/piture/none_2.png "图2: 进入到test4容器内 ip a")  

**注：**  
  1. network-none: test4并没有ip和mac地址  
  2. test4容器内执行：ip a,发现test4 只有回环口，没有其他接口。  
  3. 只有docker exec -it test4 /bin/sh 方式才能访问。    

![图3](https://github.com/momokanni/docker/blob/master/piture/host_1.png "图3：运行docker容器指定network-host")  
![图4](https://github.com/momokanni/docker/blob/master/piture/host_2.png "图4：host容器访问接口和host主机一致")  

**注：**  
1. 容器接口和host主机接口一致，说明该容器没有独立的nameSpace，和主机共用一个nameSpece  
  


