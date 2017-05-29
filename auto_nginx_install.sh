#!/bin/bash
read -p "Input the nginx version:" version
echo "The version is $version"
isOK=$(curl -I http://nginx.org/download/nginx-$version.tar.gz | grep 200)
while [ "$isOK" == "" ];
do
read -p "The version is not exist,re-enter:" version
isOK=$(curl -I http://nginx.org/download/nginx-$version.tar.gz | grep 200)
done
read -p "Input the user and group:" user group
read -p "Nginx will install in /usr/local/nginx. agree?(Y/N):" flag
if [ "$flag" == "N" ] || [ "$flag" == "n" ]; then
read -p "Input where the nginx install(e.x.:/usr/local/nginx):" Nginx_path
else
Nginx_path="/usr/local/nginx"
fi
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel
yum install -y gcc
yum install -y gcc-c++
yum install -y wget
wget -c http://nginx.org/download/nginx-$version.tar.gz
tar -zvxf nginx-$version.tar.gz
cd nginx-$version
groupadd $group
useradd -g $user $user
./configure --user=$user --group=$group --prefix=$Nginx_path --with-http_stub_status_module --with-http_ssl_module && make && make install
