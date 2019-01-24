#!/bin/bash
#-------------------------------
#--    
#--    multi-process  bind fifo file
#--    http://my.oschina.net/sanpeterguo/blog/133304?fromerr=hPYR9UTR    
#--    fixed by leson 
#--    管道文件是进程之间通信的一种方式
#--------------------------------

#sub process do something
function a_sub_process { 
    echo "processing in pid [$$]"
    sleep 1
}

#创建一个fifo文件
FIFO_FILE=/tmp/$$.fifo    #脚本运行的当前进程ID号作为文件名
mkfifo $FIFO_FILE

#关联fifo文件和文件描述符6
exec 6<>$FIFO_FILE      # 将文件描述符 6指向fifo类型
#没有绑定文件操作符时，在向文件$FIFO_FILE或者&6写入数据时，程序会被阻塞，直到有read读出了管道文件中的数据为止。而执行了上面这一句后就可以在程序运行期间不断向fifo类型的文件写入数据而不会阻塞，并且数据会被保存下来以供read程序读出
rm -rf $FIFO_FILE

#最大进程数
PROCESS_NUM=4

#向文件描述符6中输入$PROCESS_NUM个回车
for ((idx=0;idx<$PROCESS_NUM;idx++));
do
    echo
done >&6    #事实上就是在文件描述符6中放置了$PROCESS_NUM个回车符

#处理业务，可以使用while
for ((idx=0;idx<20;idx++));
do
    read -u6  #read -u6命令执行一次，相当于尝试从文件描述符6中获取一行，如果获取不到，则阻塞
    #获取到了一行后，文件描述符6就少了一行了，开始处理子进程，子进程放在后台执行
    {
      a_sub_process && { 
         echo "sub_process is finished--[$idx]"
      } || {
         echo "sub error"
      }
      #完成后再补充一个回车到文件描述符6中，释放一个锁
      echo >&6 # 当进程结束以后，再向文件描述符6中加上一个回车符，即补上了read -u6减去的那个
    } &
    # {} 这部分语句被放入后台作为一个子进程执行，所以不必每次等待1秒后执行下一个，
    #这部分的echo $idx几乎是同时完成的，当fifo中4个空行读完后 for循环继续等待 read 中读取fifo数据，
    # 当后台的4个子进程等待1秒后，按次序排队往fifo输入空行， 
    # 这样fifo中又有了数据，for语句继续执行 
done

wait    #等待后台进程全部执行完毕，再往下执行代码。

#关闭文件描述符6
exec 6>&- 
exec 6<&-
