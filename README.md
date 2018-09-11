### docker环境配置(Centos) + 命令集合 + Dockerfile
1. 系统内核版本要大于3.10：`uname -sr` : Linux 4.18.6-1.el7.elrepo.x86_64   
2. **未安装**过docker的Linux机器可参照[docker官方文档](https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1),可跳过第三步:Optional。  
3. [卸载docker](https://my.oschina.net/lwenhao/blog/1617108)
---
### 命令：
##### 创建image：
1. Build an image from a Dockerfile  
(根据Dockerfile创建image)：`docker image(可省略) build [OPTIONS] PATH | URL | -` : `docker build -t XXX/XXX:latest . `
2. Create new image from a container's changes  
(某个container发生了改变，例如新添加了某个软件，则根据改变的container可以生成新的image):  
`docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]` : `docker commit container_name XXX/docker-commit`  
【**不推荐使用**】：实际操作中，将commit后生成的image发布出去，其他人是不知道该image是如何生成的，有可能会夹杂一些不安全的东西
###### 例：
![docker commit](https://github.com/momokanni/docker/blob/master/piture/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180910183210.png?raw=true)

【**推荐使用Dockerfile**】:  ↓见Dockerfile 2


##### 查询：
1. 列出所有container id集合：`docker container ls -aq` == `docker container ls -a | awk {'print$1'}`
2. 根据状态查找container集合：`docker container ls -f "status=exited"` ,-q: 只列出ID。
##### 删除：
1. 批量删除: `docker rm $(docker container ls -aq)` or `docker rm $(docker container ls -f "status=exited" -q)`

### Dockerfile：
##### DIY first base image: 
1. ```
     FROM scratch  # 制作base image
     ADD 可执行程序 /
     CMD ["/可执行程序"]
2.【**↑接docker commit**】
  ```
     FROM centos # 使用base image
     RUN yum install -y vim //在只读image中，能够运行该命令，是因为build过程中，  
                           //会根据centos（image）创建一个临时的container,并在该container中执行RUN语句,创建完成后remove
  ```
  3.LABEL定义了image中的meta-Data == 注释
  ```
     LABEL maintainer="作者"
     LABEL version="版本"
     LABEL description="描述"
  ```
  
  4.RUN：  执行命令并创建新的image layer
  >1. 使用场景：安装软件  
  >2. 没运行一次，对于image来说都会生成新的layer  
      最佳实践： 为了美观，复杂的RUN请用反斜线换行，避免无用分层，合并多条命令成一行  
      【例】： RUN yum update **&&** yum install -y vim **\**  
              yum install -y glibc
              
  5.WORKDIR: 设定当前工作目录，禁止使用RUN cd代替，同时要使用绝对路径  
  ```
       WORKDIR /test //如果没有自动创建test目录  
       WORKDIR demo  
       RUN pwd  //打印当前目录，输出结果为 /test/demo
 ```
    
  6. ADD && COPY: 
  >1.添加**本地文件**到docker image根目录中 `ADD hello /`  
  >2.解压缩 `ADD jdk-8u181-linux-x64.tar.gz`  
  >3.和WORKDIR配合使用：`WORKDIR /root`  
     `ADD hello(可执行程序) demo/` == /root/demo/hello  
  >4. 大部分情况下，COPY优于ADD  
  >5.使用curl or wget 添加**远程文件/目录** `RUN curl or wget`
  
  7.ENV: 增加Dockerfile可维护性
  ```
     ENV MYSQL_VERSION 5.6 # 设置常量
     RUN apt-get install -y mysql-server="${MYSQL_VERSION}" \ # 引用常量
     && rm -rf /var/lib/apt/lists/*
  ```
  8.Dockerfile的两种写法:
  >shell:  
        `FROM centos`</br>
        ` ENV name Docker `</br>
        `ENTRYPOINT echo "hello $name"`
       
  >Exec:   
        `FROM centos`  </br>
        `ENV name Docker`  </br>
        `ENTRYPOINT ["/bin/bash","-c","echo hello $name"]`   
  
