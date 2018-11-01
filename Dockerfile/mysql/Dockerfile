FROM mysql:5.7

# secret free
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# 
COPY setup.sh /mysql/setup.sh
COPY wxOrder.sql /mysql/wxOrder.sql
COPY privileges.sql /mysql/privileges.sql

VOLUME /var/lib/mysql

WORKDIR /usr/local/mysql 

EXPOSE 3306

CMD ["sh", "/mysql/setup.sh"]
