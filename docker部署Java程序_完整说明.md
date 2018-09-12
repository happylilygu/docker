### 环境说明：
1.springBoot + JDK1.8 + Docker version 18.06.1-ce

### 步骤说明：
1. springBoot程序打成jar包，并上传Dockerfile所在文件夹内（也可以不用，但没必要折腾自己）
2.创建Dockerfile:
  ```
    FROM java:8   # 引用docker官方Java镜像
    LABEL maintainer="XXXX@sina.com"
    VOLUME /tmp  # Spring Boot 使用内置的Tomcat容器，Tomcat 默认使用/tmp作为工作目录
    COPY kill.jar  /usr/local/txhz/
    WORKDIR /usr/local/txhz/ # 指定工作目录
    EXPOSE 8080 # 暴露端口
    ENTRYPOINT ["java","-Djava.security.egd=file:/dev/.urandom","-jar","kill.jar"] # 百度：为了缩短 Tomcat 的启动时间
  ```
3.创建image: `docker build -t XXXX/kill-docker:latest .`(命令只要符合语法，怎么写随意，开心就好)
4.运行image，创建container: `docker run -d --name kill -p 8080:8080 -it XXXX/kill-docker --verbose` (命令分解，search by yourself)

**注：**
  1. 如果服务器采用的是云服务器，需放开指定访问接口(阿里云在***安全组***中设置)  
  2. 要进入container内部：`docker exec -it container_id /bin/bash`  
  3. 查看日志：`docker logs container_id`  
  4. 容器启动：`docker start container_id/container_name`  
  5. 容器关闭：`docker stop container_id/container_name`  
  6. 容器资源检查： `docker inspect container_id/container_name`  
  7. 运行中容器地址：`docker exec -it container_id/container_name ip a`
  命令太多。。。
  
