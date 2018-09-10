### docker环境配置(Centos) + 命令集合
1. 系统内核版本要大于3.10：`uname -sr` : Linux 4.18.6-1.el7.elrepo.x86_64 </br>
2. **未安装**过docker的Linux机器可参照[docker官方文档](https://docs.docker.com/install/linux/docker-ce/centos/#install-docker-ce-1),可跳过第三步:Optional。</br>
3. [卸载docker](https://my.oschina.net/lwenhao/blog/1617108)
---
### 命令：
##### 创建类命令：
1. 根据Dockerfile创建image：`docker image(可省略) build [OPTIONS] PATH | URL | -` : `docker build -t XXX/XXXX:latest . `
2. Create new image from a container's changes:`docker container commit` -> `docker commit`
##### 查询命令：
1. 列出所有container id集合：`docker container ls -aq` == `docker container ls -a | awk {'print$1'}`
2. 根据状态查找container集合：`docker container ls -f "status=exited"` ,-q:可以只列出ID。
##### 删除命令：
1. 批量删除: `docker rm $(docker container ls -aq)` or `docker rm $(docker container ls -f "status=exited" -q)`

