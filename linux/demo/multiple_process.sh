#!/bin/bash
#---------------------------------------
#-- 
#-- test multi process.
#-- 
#---------------------------------------
start=$(date +"%s")

#模拟十个进程
for (( i = 0; i < 10; i++ ))
do
     {
     echo "success：[${i}]" ;
     sleep 2
     }& #将{} 中的程序放入后台进程。
done

#等待上面后台循环进程执行完成。
wait
end=$( date +"%s")

echo "spend:[$((${end}-${start}))] Seconds."