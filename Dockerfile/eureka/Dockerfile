FROM java:8
LABEL maintainer="sunchongan@sina.com"
VOLUME /tmp
COPY eureka.jar /usr/local/sunlin/
COPY eureka_start.sh /usr/local/sunlin/
VOLUME /usr/local/sunlin/config
WORKDIR /usr/local/sunlin/
EXPOSE 8761
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/.urandom","-jar","eureka.jar"]
