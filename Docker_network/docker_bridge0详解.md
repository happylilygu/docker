### 容器间如何通过bridge实现相互访问(单台机器) + 容器访问外网
`该篇主要以命令和截图为主，很好理解`
感知步骤：
1. 安装brctl: `yum install bridge-utils`
2. 运行两个docker container(具体命令看[前文]())
3. `docker ps `,` ip a `,` docker network inspect bridge `
![]()
