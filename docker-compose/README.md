### 1. docker-compose安装  

[安装docker-compose非常简单，直接看官方文档即可，千万别抵触，早晚都得要面对（对自己说）](https://docs.docker.com/compose/install/#install-compose)  

docker-compose多容器部署机制：  
通过yml格式的配置文件，将需要运行的容器的配置项编写到该文件中，同时还有network等，从而达到只需up一个配置文件,就能启动多个容器及network，通过命令`--scale`还可以快速扩展容器数量。  

![docker-compose-install](https://github.com/momokanni/docker/blob/master/piture/dataCompose-1.png)  

#### docker-compose命令：  

* `docker-compose up -d`  
* `docker-compose images`  
* `docker-compose ps`  
* `docker-compose down`  
* `docker-compose stop`  
* `docker-compose exec serviceName bash`  
* `docker-compose up --scale serviceName=number -d`  
