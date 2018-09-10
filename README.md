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

【**推荐使用dockerfile**】:  
```
     FROM centos
     RUN yum install -y vim
```

##### 查询：
1. 列出所有container id集合：`docker container ls -aq` == `docker container ls -a | awk {'print$1'}`
2. 根据状态查找container集合：`docker container ls -f "status=exited"` ,-q: 只列出ID。
##### 删除：
1. 批量删除: `docker rm $(docker container ls -aq)` or `docker rm $(docker container ls -f "status=exited" -q)`

### Dockerfile：
##### DIY first base image: 
1. ```
     FROM scratch
     ADD 可执行程序 /
     CMD ["/可执行程序"]
  ```
