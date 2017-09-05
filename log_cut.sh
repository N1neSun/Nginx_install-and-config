#!/bin/bash
#
#
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
access_log_path=/nginx/logs    #指定access日志所在路径
mv ${access_log_path}/access.log ${access_log_path}/$(date -d "yesterday" +"%y").$(date -d "yesterday" +%m).$(date -d "yesterday" +%d).access.log
/usr/local/nginx/sbin/nginx -s reload
