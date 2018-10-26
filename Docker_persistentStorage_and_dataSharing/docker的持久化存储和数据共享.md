数据持久化的必要性：容器被删除，希望保留的数据就会消失 , 所以再学习持久化存储之前，先要了解docker layer，就需要知道哪一层是可读层(R/O) or 可写层(R/W)。  

data volume的使用场景：某容器内有运行程序能够产生数据或文件，并且当容器消失时，数据或文件依然被保留  

1.**镜像（images）与层级（layers）：**   

Docker 镜像是由多个文件系统（只读层）叠加而成，每个层仅包含了前一层的差异部分。当我们启动一个容器的时候，Docker 会加载镜像层并在其上添加一个可写层。容器上所做的任何更改，譬如新建文件、更改文件、删除文件，都将记录与可写层上。容器层与镜像层的结构如下图所示。  

![镜像层级](https://github.com/momokanni/docker/blob/master/piture/dataSahring_1.png)  

2.**容器（container）与层级(layers):**   

容器与镜像最大的区别就在于可写层上。如果运行中的容器修改了现有的一个已存在的文件，那该文件将会从可写层下的只读层复制到可写层，该文件的只读版本仍然存在，只是已经被可写层中该文件的副本所隐藏。其中，多个容器共享镜像的结构如下所示。  

![container_layer](https://github.com/momokanni/docker/blob/master/piture/dataSahring_2.png)  

3.**docker数据持久化方案:**  
先看图
![R/W](https://github.com/momokanni/docker/blob/master/piture/dataSahring_3.png)  

**注:**  图中container中有运行程序，此时正在进行Write (File_system)的操作,一般默认是write到container 可写层(R/O),但是我们可以通过其他机制，将数据mount到本地或者其他地方的存储上,这样存储就和容器隔离开了，当容器被删掉时，外挂的存储还在。  

所以解决方案呈上：  

>1. 基于本地文件系统的Volume。可以在执行Docker create or run 时，通过-v参数将主机的目录作为容器的数据卷。这部分功能便是基于本地文件系统的volume管理。(本地)  
>2. 基于plugin的Vloume，支持第三方的存储方案，比如NAS、aws。(远程)  

**今天我们只探讨方案1：**  

方案1的数据持久化分为： 1.data volume 2. bind mouting  

#### 先分析data volume

再进一步的扯到了Volume  

4. Volume类型  

>1. 受管理的data-volume,由docker后台自动创建，位置是固定的，名字是随机的.  
>2. 绑定挂载的Volume，具体挂载位置可以由用户通过参数指定。  

**以mysql官方Dockerfile为例:**  

![mysql_dockerfile](https://github.com/momokanni/docker/blob/master/piture/dataSahring_4.png)  

当启动mysql后，数据库产生的数据会通过这个配置，在本机产生对应的Volume，用来做数据的持久化存储，并且不会随着container的消失而消失。  

**完整操作演示, 口述麻烦，直接上图**  

看图之前先解释一下操作命令:  

`docker run -d -v mysql:/var/lib/mysql --name mysql_1 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.6 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci`  

* `-d` : 使程序在后台保持运行  
* `-v mysql:/var/lib/mysql ` : 给volume重命名，并指定容器运行的本机的存放空间  
* `--name mysql_1` : 给容器重命名  
* `-e` : 设置环境变量  
* `MYSQL_ROOT_PASSWORD=123456` : 设置数据库密码  
* `--character-set-server=utf8mb4` : 设置数据库默认编码  
* `--collation-server=utf8mb4_unicode_ci` : 对编码格式为utf8的table进行运行排序  

![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_5.png)   
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_6.png)  
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_7.png)  
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_8.png)  
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_9.png)  
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_10.png)  
![data_volume](https://github.com/momokanni/docker/blob/master/piture/dataSahring_11.png)  

#### 再分析Bind Mouting  

data volume 需要在运行时指定存放空间 ： `docker run -v /var/lib/mysql`  

bind Mouting 需要在运行时指定一个本地目录和容器目录 一一对应的关系  通过这种方式可以实现文件同步。  

在看图之前，先解释一遍命令:  
[nginx Dockerfile文件地址](https://github.com/momokanni/Dockerfile/tree/master/nginx)  

`docker run -d -v /usr/local/sunLin/docker/nginx/:/usr/share/nginx/html -p 80:80 --name nginx docker2sun/nginx`  

* `-v /usr/local/sunLin/docker/nginx/:/usr/share/nginx/html` : 服务器本机目录和容器内的目录做一个映射，关联起来，从而实现文件同步  

![bind_mouting](https://github.com/momokanni/docker/blob/master/piture/dataSahring_12.png)  
![bind_mouting](https://github.com/momokanni/docker/blob/master/piture/dataSahring_13.png)  
![bind_mouting](https://github.com/momokanni/docker/blob/master/piture/dataSahring_14.png)  
![bind_mouting](https://github.com/momokanni/docker/blob/master/piture/dataSahring_15.png)  
![bind_mouting](https://github.com/momokanni/docker/blob/master/piture/dataSahring_16.png)  














