### docker环境配置(Centos) + 命令集合 + Dockerfile
1. 系统内核版本要大于3.10：`uname -sr` : Linux 4.18.6-1.el7.elrepo.x86_64 </br>
2. **未安装**过docker的Linux机器可参照[docker官方文档](https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1),可跳过第三步:Optional。</br>
3. [卸载docker](https://my.oschina.net/lwenhao/blog/1617108)
---
### 命令：
##### 创建：
1. Build an image from a Dockerfile</br>(根据Dockerfile创建image)：`docker image(可省略) build [OPTIONS] PATH | URL | -` : `docker build -t XXX/XXX:latest . `
2. Create new image from a container's changes</br>(某个container发生了改变，例如新添加了某个软件，则根据改变的container可以生成新的image):</br>`docker container commit` -> `docker commit`
##### 查询：
1. 列出所有container id集合：`docker container ls -aq` == `docker container ls -a | awk {'print$1'}`
2. 根据状态查找container集合：`docker container ls -f "status=exited"` ,-q:可以只列出ID。
##### 删除：
1. 批量删除: `docker rm $(docker container ls -aq)` or `docker rm $(docker container ls -f "status=exited" -q)`

### Dockerfile
##### DIY first base image: 
1. ```
     FROM scratch</br>
     ADD 可执行程序 /</br>
     CMD ["/可执行程序"]

