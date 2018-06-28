#!/bin/bash
#目标脚本的绝对路径
scriptPath=$(cd `dirname $0`; pwd)/getIp.php
#执行目标脚本
/usr/bin/php $scriptPath >> ./log.log
#echo "* * * * * /home/wwwroot/ddv/getip/start.sh" >> /var/spool/cron/root
