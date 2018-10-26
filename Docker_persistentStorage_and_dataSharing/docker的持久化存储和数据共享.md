数据持久化的必要性：容器被删除，希望保留的数据就会消失 , 所以再学习持久化存储之前，先要了解docker layer，就需要知道哪一层是可读层(R/O) or 可写层(R/W)。  

1.**镜像（images）与层级（layers）：**   

Docker 镜像是由多个文件系统（只读层）叠加而成，每个层仅包含了前一层的差异部分。当我们启动一个容器的时候，Docker 会加载镜像层并在其上添加一个可写层。容器上所做的任何更改，譬如新建文件、更改文件、删除文件，都将记录与可写层上。容器层与镜像层的结构如下图所示。  

![镜像层级](https://github.com/momokanni/docker/blob/master/piture/dataSahring_1.png)  

2.**容器（container）与层级(layers):**   

容器与镜像最大的区别就在于可写层上。如果运行中的容器修改了现有的一个已存在的文件，那该文件将会从可写层下的只读层复制到可写层，该文件的只读版本仍然存在，只是已经被可写层中该文件的副本所隐藏。其中，多个容器共享镜像的结构如下所示。  

![container_layer](https://github.com/momokanni/docker/blob/master/piture/dataSahring_2.png)  



