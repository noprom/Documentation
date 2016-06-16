#!/bin/sh
#china
rpm -Uvh http://mirrors.yun-idc.com/epel//6/x86_64/epel-release-6-8.noarch.rpm
#us
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
rpm -Uvh http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum -y install gcc gcc-c++ autoconf automake make
yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel
yum -y install ack screen wget curl zip unzip ntpdate
yum -y install net-snmp net-snmp-devel net-snmp-utils vim git git-common
yum -y install nc htop iotop iftop telnet wget curl
yum -y remove mysql-server mysql httpd
yum -y install ImageMagick-*
yum -y install nginx Percona-Server-server-55 xtrabackup
yum -y install php55w php55w-fpm php55w-common php55w-cli php55w-devel php55w-intl php55w-mysqlnd php55w-pdo php55w-soap php55w-tidy php55w-xml php55w-xmlrpc php55w-zts php55w-gd php55w-mbstring php55w-mcrypt php55w-pecl-zendopcache php55w-pear php55w-posix php55w-pecl-memcached php55w-pecl-memcache php55w-pecl-memcached php55w-mysqlnd php55w-pecl-redis