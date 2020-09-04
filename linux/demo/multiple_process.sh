#!/bin/bash
####################################################################
#-- 
#-- Desc    : test multi process.
#-- Author  : Leson (https://github.com/leson)
#-- Date    : 4 Apri 2020
#-------------------------------------------------------------------
#-- Ver.      Author          Comment
#-- -----     ------------    -------------------------------
#-- 1.0       Leson           initial create
#--
####################################################################

start=$(date +"%s")

#模拟十个进程
proc_count=10
for (( i=0; i<${proc_count}; i++ ))
do
     {
          sleep 2
          if [ "${i}" -gt 5 ];then
               echo "success：[${i}]"
          else
               xxxxxxxxxx 2>&1 ## 模拟一个错误的程序
          fi
     }& #将{} 中的程序放入后台进程。
done

#分别等待上面后台进程执行完成。
err_count=0
for pid in $(jobs -p)
do
     wait ${pid}
     [ "x${?}" != "x0" ] && (( err_count++ ))
done

end=$( date +"%s")
echo -e "==> spend:[$((${end}-${start}))] Seconds.\n==> sub-process failed:[${err_count}]\n==> sub-process success:[$((${proc_count}-${err_count}))]"