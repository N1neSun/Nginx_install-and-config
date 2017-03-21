#!/bin/bash
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel
yum install -y gcc
yum install -y gcc-c++
yum install -y wget
wget -c http://nginx.org/download/nginx-1.10.3.tar.gz
tar -zvxf nginx-1.10.3.tar.gz
cd nginx-1.10.3
./configure --prefix=/usr/local/nginx --with-http_stub_status_module && make && make install
