# 在Centos7下编译搭建PHP开发环境

## 一 配置防火墙，开启80端口、3306端口
CentOS 7.0默认使用的是firewall作为防火墙，这里改为iptables防火墙。

###关闭firewall

```
systemctl stop firewalld.service #停止firewall

systemctl disable firewalld.service #禁止firewall开机启动
```
###安装iptables防火墙
```
yum install -y iptables-services #安装

vi /etc/sysconfig/iptables #编辑防火墙配置文件
```
输入以下内容

```
# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```
```
:wq! #保存退出
systemctl restart iptables.service #最后重启防火墙使配置生效
systemctl enable iptables.service #设置防火墙开机启动
```

### 二 关闭SELINUX

```
vim /etc/selinux/config
#SELINUX=enforcing #注释掉
#SELINUXTYPE=targeted #注释掉
SELINUX=disabled #增加
:wq! #保存退出
setenforce 0 #使配置立即生效
```

## 三 系统约定

软件源代码包存放位置：/usr/local/src
源码包编译安装位置：/usr/local/软件名字

## 四 下载所需软件
```
# 下载nginx1.9.12
wget http://nginx.org/download/nginx-1.9.12.tar.gz


```
## 安装基本软件

```
yum -y install wget git
```

## 安装Mariadb
```
yum install mariadb mariadb-server mariadb-devel
```

## 安装Nginx

## 安装PHP
