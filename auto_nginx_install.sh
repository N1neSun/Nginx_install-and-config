#!/bin/bash
read -p "Input the nginx version:" version
echo "The version is $version"
isOK=$(curl -I http://nginx.org/download/nginx-$version.tar.gz | grep 200)
while [ "$isOK" == "" ];
do
read -p "The version is not exist,re-enter:" version
isOK=$(curl -I http://nginx.org/download/nginx-$version.tar.gz | grep 200)
done
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel
yum install -y gcc
yum install -y gcc-c++
yum install -y wget
wget -c http://nginx.org/download/nginx-$version.tar.gz
tar -zvxf nginx-$version.tar.gz
cd nginx-$version
./configure --prefix=/usr/local/nginx --with-http_stub_status_module && make && make install
