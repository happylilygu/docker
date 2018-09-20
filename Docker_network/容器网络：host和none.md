#### host && none  
***有些知识点，需要实操感悟，所以图多，话少***  

命令：  
  ` docker run -d --name test4 --network none busybox /bin/sh -c "while true;do sleep 3600;done"  `  
  ` docker network inspect none `  
  ` docker exec -it test4 /bin/sh `  
  ` ip a `  

图示：  

![图1](https://github.com/momokanni/docker/blob/master/piture/none_1.png "图1：运行docker容器指定network-none")  
![图2](https://github.com/momokanni/docker/blob/master/piture/none_2.png "图2: 进入到test4容器内 ip a")  

**注：**  
  1. network-none: test4并没有ip和mac地址  
  2. test4容器内执行：ip a,发现test4 只有回环口，没有其他接口。  
  3. 只有docker exec -it test4 /bin/sh 方式才能访问。  
  


