#!/bin/bash

# 生成日志文件路径
basepath=$(cd `dirname $0`; pwd)"/"`date +"%Y-%m-%d"`".log"
#echo "$basepath 是当前路径" >> $basepath 
# echo success`date +"%Y-%m-%d %H:%M:%S"` >> $basepath 
#`date+"%Y-%m-%d %H:%M:%S"`生成当前日期 %R 生成的是24小时制的时分 [10:33]  %r 是12小时制的时分秒 [上午 10时33分22秒]
# basepath=$(cd `dirname $0`; pwd) 获取当前脚本所在路径

url="https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=ACCESS_TOKEN"
#curl -w -s "响应码:%{http_code}\n http_connect:%{http_connect}\n总时间: %{time_total}\nDNS解析时间: %{time_namelookup}\n建立连接时间: %{time_connect}\n三次握手时间 %{time_appconnect}\n开始传输时间 %{time_pretransfer}\n重定向时间:%{time_redirect}\n重定向链接:%{redirect_url}\n CA证书认证结果:%{ssl_verify_result}" $url >> $basepath
# 吧返回的内容body去掉，只留请求头
#curl -o /dev/null -w -s 响应码:%{http_code} http_connect:%{http_connect}总时间: %{time_total}DNS解析时间: %{time_namelookup}建立连接时间: %{time_connect}三次握手时间 %{time_appconnect}\n开始传输时间 %{time_pretransfer}" $url >> $basepath

echo `date +"%Y-%m-%d %H:%M:%S"`"   [url]"$url >> $basepath
ping -c 1 `echo $url | awk -F'[:///]' '{print $4}'` >> $basepath
curl -I  -s -w "响应码"%{http_code}"\n响应码:"%{http_code}"\n http_connect:"%{http_connect}"\n总时间: "%{time_total}"\nDNS解析时间: "%{time_namelookup}"\n建立连接时间: "%{time_connect}"\n三次握手时间 "%{time_appconnect}"\n开始传输时间 "%{time_pretransfer}"\n重定向时间:"%{time_redirect}"\n重定向链接:"%{redirect_url}"\n CA证书认证结果:"%{ssl_verify_result}"\n下载的大小"%{size_download}"\n下载速度"%{speed_download} $url >> $basepath
echo "\n------------------------------------------------------------------------------------------------------------------------------" >> $basepath

# "响应码"%{http_code}
# "\n响应码:"%{http_code}
# "\n http_connect:"%{http_connect}
# "\n总时间: "%{time_total}
# "\nDNS解析时间: "%{time_namelookup}
# "\n建立连接时间: "%{time_connect}
# "\n三次握手时间 "%{time_appconnect}
# "\n开始传输时间 "%{time_pretransfer}
# "\n重定向时间:"%{time_redirect}
# "\n重定向链接:"%{redirect_url}
# "\n CA证书认证结果:"%{ssl_verify_result}