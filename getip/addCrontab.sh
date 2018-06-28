#!/bin/bash
scriptPath=$(cd `dirname $0`; pwd)
# cmd1="* * * * * "$scriptPath"/start.sh"
# cmd2="* * * * * "$scriptPath"/test.sh"
# echo "* * * * * "$scriptPath"/start.sh"
# grep "$cmd" /var/spool/cron/root

# grep "* * * * * "$scriptPath"/start.sh" /var/spool/cron/root > /dev/null &&  echo "start任务已存在" || echo "不存在start"
# grep "* * * * * "$scriptPath"/test.sh" /var/spool/cron/root  > /dev/null && echo "test任务已存在" || echo "不存在test"

if grep "1 \* \* \* \* "$scriptPath"/start.sh" /var/spool/cron/root > /dev/null
then
    echo "已存在start任务" 
    echo "跳过"
else
    echo "start任务不存在"
    echo "1 * * * * "$scriptPath"/start.sh" >> /var/spool/cron/root
    echo "创建任务"
fi
echo "是否需要使用curl单独进行检测 [y/n] 默认n"
read n
if [ '$n' == "y" ]
then
    if [grep "1 \* \* \* \* "$scriptPath"/test.sh" /var/spool/cron/root > /dev/null]
    then
        echo "已存在test任务" 
        echo "跳过"
    else
        echo "test任务不存在"
        echo "1 * * * * "$scriptPath"/test.sh" >> /var/spool/cron/root
        echo "创建任务"
    fi    
fi

echo "结束"
# grep "* * * * * "$scriptPath"/start.sh" /var/spool/cron/root && echo "start任务已存在" || echo "* * * * * "$scriptPath"/start.sh" >> /var/spool/cron/root
# grep "* * * * * "$scriptPath"/test.sh" /var/spool/cron/root && echo "test任务已存在" || echo "* * * * * "$scriptPath"/test.sh"

# echo "* * * * * "$scriptPath"/start.sh" >> /var/spool/cron/root
# echo "* * * * * "$scriptPath"/test.sh" >> /var/spool/cron/root


# #!/bin/bash
# scriptPath=$(cd `dirname $0`; pwd)
# cmd1="* * * * * "$scriptPath"/start.sh"
# #这个能正常输出为 * * * * * path/start.sh
# echo "* * * * * "$scriptPath"/start.sh"

# # 这个就输出了当前目录下的所有文件= = 
# echo $cmd1
