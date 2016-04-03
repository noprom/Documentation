# 在Centos7下使用Docker搭建tomcat环境

## CentOS 7 中 Docker 的安装
Docker 软件包已经包括在默认的 CentOS-Extras 软件源里。因此想要安装 docker，只需要运行下面的 yum 命令：

```
# https://www.huangwenchao.com.cn/2016/03/docker-compose-production.html

# 更新yum
sudo yum update

# 新增docker的源
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# Install the Docker package.
sudo yum install docker-engine

# 安装python pip
yum -y install epel-release
yum -y install python-pip
yum clean all
# 安装docker compose
pip install -U docker-compose
```

## 启动 Docker 服务
安装完成后，使用下面的命令来启动 docker 服务，并将其设置为开机启动：

```
systemctl start docker.service
systemctl enable docker.service
```

## 下载镜像
```
# 下载之前登陆daocloud.io
docker login daocloud.io
docker pull daocloud.io/noprom/noprom-tomcat:latest
```

## 依次启动容器
```
docker run -p 3306:3306 -v /app/data/mysql:/var/lib/mysql --name mysql -it -d -e MYSQL_ROOT_PASSWORD=1q2w3e4r5t daocloud.io/noprom/noprom-mysql:latest
docker run -p 8080:8080 -v /app:/app --name tomcat -it -d --link mysql:mysql daocloud.io/noprom/noprom-tomcat:latest

docker run -p 6379:6379 --name redis -it -d daocloud.io/noprom/noprom-redis:latest
docker run -p 11211:11211 --name memcache -it -d daocloud.io/noprom/noprom-memcache:latest
docker run -p 3306:3306 -v /app/data/mysql:/var/lib/mysql --name mysql -it -d -e MYSQL_ROOT_PASSWORD=1q2w3e4r5t daocloud.io/noprom/noprom-mysql:latest
docker run -p 9000:9000 -v /app:/app --name php -it -d --link memcache:memcache --link redis:redis --link mysql:mysql daocloud.io/noprom/noprom-php:latest
docker run -p 80:80 -v /app:/app --name nginx -it -d --link php:php daocloud.io/noprom/noprom-nginx:latest
```
## 使用docker-compose 启动容器
```
docker-compose up
```

## 常用docker命令
```
# docker-compose
# https://docs.docker.com/compose/reference/

# docker yml 编写规则
# https://docs.docker.com/compose/compose-file/

# docker 容器连接
# https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/

# 进入nginx操作
docker exec -it nginx /bin/bash
# 连接容器里面的mysql
mysql -uroot -p -h192.168.99.100 -P3306
mysql -uroot -p -h0.0.0.0 -P3306
```