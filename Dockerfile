#os image
FROM centos:latest

#Apache
RUN yum -y install httpd

#wget
RUN yum -y install wget

#MariaDB
RUN yum -y remove mariadb*
RUN rm -rf /var/lib/mysql/

#MySQL
RUN wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
RUN rpm -Uvh mysql-community-release-el7-5.noarch.rpm
RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/mysql-community.repo
RUN yum -y --enablerepo=mysql56-community install mysql-community-server 

#PHP
RUN yum -y install php php-mysql php-mbstring

#phpMyAdmin
RUN yum install -y epel-release
RUN yum install --enablerepo=epel -y phpMyAdmin
COPY conf/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf

RUN mkdir /docker

COPY bootstrap.sh /docker/

ENTRYPOINT ["/docker/bootstrap.sh"]
