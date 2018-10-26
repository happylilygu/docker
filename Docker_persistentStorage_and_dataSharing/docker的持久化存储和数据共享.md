数据持久化的必要性：容器被删除，希望保留的数据就会消失。  

1.**镜像（images）与层级（layers）：**  
Docker 镜像是由多个文件系统（只读层）叠加而成，每个层仅包含了前一层的差异部分。当我们启动一个容器的时候，Docker 会加载镜像层并在其上添加一个可写层。容器上所做的任何更改，譬如新建文件、更改文件、删除文件，都将记录与可写层上。容器层与镜像层的结构如下图所示。  

![镜像层级](https://github.com/momokanni/docker/blob/master/piture/dataSahring_1.png)  


