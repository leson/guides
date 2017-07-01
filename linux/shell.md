# 基础知识
## 变量及基础数据结构
### 自定义变量

```
x=5         #定义变量 
$x          #引用变量
echo $x     #显示变量
"$PATH":/home/abc/software  #变量拼接

#运算 ：let [] (()) 
let no1++ ; 
let no2+=3; 
let result=no1+no2; 
no2=$[ no2 + 1 ]; 
result1=$(( no1+no2+3 )); #推荐这种用法

declare -i xxx #将xxx 定义成integer 
-x  #将变量定义成环境变量。等同export var="abc"

```

### 环境变量
```
#path
echo $PATH 
#PS1 
echo "$PS1,$PS2,$PS4"
```

### 位置参数变量

> **$n** : n 为数字，$0代表命令本身， $1-$9代表第一到第九个参数，如果十个以上的参数需要用大括号，如 ${10}. 

> **$*** : 这个变量代表命令行中的所有参数，$*把所有的参数年成一个整体。

> **$@** : 这个变量也代表命令行中所有的参数，不过$@把每个参数区分对待。

> **$#** : 这个变量代表命令行中参数的个数。

### 预定义变量 

> **$?** : 最后一次执行的命令的返回状。0为正确执行，非0为执行不正确。 

> **$$** : 当前进程 的进程号（PID）

> **$!** : 后台运行的最后一个进程的进程号（PID） 


### 数组

```
a=()            #定义
a[0] = 5        #赋值
echo ${#a[@/*]} #读取a数组长度
${a[0]}         #取数组内容,下标对应的值
${a[*]},${a[@]} #取数组全部内容。
${a[@]:0:3}     #数组分片 ${a[@/*]:起始位置:长度} 
${a[@]/helo/hello}  #替换:${a[@/*]/查找字符/替换字符}

```

### 关联数组 
> 只有在bash 4.0 以上版本才有效(`bash --version`)

```
#定义
declare -A a=(["key1"]="hello" ["key2"]="world") 
#赋值
a["key3"]="a bit difference"   
#读取所有键
echo ${!a[*/@]}
#读取所有值
echo ${a[@/*]}
#根据键读取值
echo ${a[key3]}

#遍历数组(key和value)
for key in ${!a[@]}
do
    echo "key=[$key];value=[${a[$key]}]"
done


```

### 变量内容的删除、取代与替换
```
echo ${PATH#/*:} #变量从左向右删除匹配的最短要求

echo ${PATH##/*:} #变量从左到右删除匹配的最长要求 （贪婪模式）
echo ${PATH%/*:} #变量从右到左删除匹配的最短要求

echo ${PATH%%/*:} #变量从右到左删除匹配的最长要求（贪婪模式）

echo ${PATH/home/HOME} #变量从左到右替换匹配的第一个

echo ${PATH//home/HOME} #变量从左到右替换所有匹配到的（贪婪模式）
```

## 流程控制语句
### if 判断语句
```
#结构如下：
if [ 条件 ];then
    #do something
fi 
```
==注意：‘[’前后均必须加空格,变量如要保证为空及含空格的多个单词时不出错就要加双引号.==

```
if [ "$aa" = "aa" -a "$bb" = "bb" ] || [ "$cc" = "cc" -a "$dd" = "dd" ]; then
if [[ $1 != "" && $# -eq 1 ]]; then
```

> 数值判断 

```
-eq (equal) 
-ne (not equal) 
-lt (less than) 
-gt (grant than) 
-ge (grant equal) 
-le (less equal)
```
```
$A="aa" $?=0 $#=4
```
> 字符判断 -z (zero 空为真) -n （not 非空为真）

```
[ -z "" ] && echo "yes" || echo "no"
```

> 文件类型判断

```
-b : 是块设备文件为真（block）
-c : 是字符设备文件为真（char）
-L : 是符号连接文件为真(link)
-d : 是目录为真（Directory） 
-e : exist 文件存在为真(exist)。
-s : 文件存在且内容非空为真。
-S : 是套接字文件为真（socket）。
-f : 是普通文件为真

[ -e /root/vicky/abc.log ] && echo "exist file" || echo "not exist file"
```

> 文件权限判断

```
-r : 文件有读权限为真（read）
-w : 文件有写权限为真(write)
-x : 文件有可执行权限为真（execute）
-u : 文件有suid 权限为真
-g ： 文件有sgid 权限为真
-k ： 文件有sbit 权限为真。
```

> 多重条件判断

```
-a : and
-o: or
! : 非
```

### for 循环

```
for file in $(ls ./) 
do 
    echo "this my $file"; 
done 
-----------------------------
sum=0
for (( i=1;i<=100;i=i+1 ))
do
    sum=$(( $sum+$i ))
done

```

### while 循环
```
while [ $i -le 100 ]
do
    #do smthing
done
-------------------------
while read line
do
    echo $line
done < test.txt
```

### case esac 

```
case "$1" in
start)
    echo "start……"
    ;;
stop)
    echo "stop……"
    ;;
*)
    echo "Usage: $0 {start|stop}"
    exit 2
esac
```

# 正则表达式

## 通配符与正则表达式


## 通配符

> \* : 匹配任意内容 

> ? : 匹配任意一个内容 

> [] : 匹配中括号中的一个字符

## 基础正则表达式

> \* ： 前一个字符匹配0次或任意多次。

> . : 匹配除了换行符（\n）外任意一个字符。 

> ^ : 匹配行首。如:^hello 会匹配以hello 开头的行。 

> $ : 匹配行尾。 如:hello$ 会匹配以hello 结尾的行。 

> [] : 匹配中括号中指定的任意一个字符，只匹配一个字符。[a-z][0-9] 匹配小写字符和一位数字构成的两位字符。 

> [^] : 匹配中括号的字符以外的任意一个字符。如：[^0-9] 匹配任意一位非数字字符。 

> \ : 转义符。去除符号的特殊用法。 

> \{n\} ： 表示其前面的字符恰好出现n次。如：[0-9]\{4\} 匹配4位数字。 

> \{n,\} : 表示其前面的字符出现不小于n次。

> \{n,m\} : 表示其前面的字符至少出现n次，最多出现m次。如：[a-z]\{6,8\} 匹配6到8位的小写字符。

==注：以上三个大括号的用法其实要有定界符才能准确匹配，否则光看概念，与实际是有区别的。==

# 其它
> 脚本中的语句不是在当前shell 进程 中执行的。

> 这种方式可以将参数统一写到一个sh中，在另外一个shell 脚本 中引用 。

```
#变量设置成全局变量
export a="aaa"
declare -x a="aaa"

#将其它文件包含到当前进程。
. test.sh
source test.sh 
```
## 同时执行多个脚本

```
#第一个命令成功则执行第二个命令
./hello.sh && ./world.sh 

#第一个命令失败则执行第二个命令
./hello.sh || ./world.sh

#常用综合用法
ls oklar && echo yes || echo no
```

## [shell 调试(debug)](https://github.com/leson/guides/blob/master/linux/shell_debug.md)
```
sh -x aaa.sh

#还可以设置PS4让调试代码显示行号$LINENO
export PS4="+[${LINENO}] "
```

## 进程间通信

```
#pipe line (同一个父进程)
#name pipe (不同父进程)

mkfifo fifo
```

## 一些规则

```
$(command) = ` command` #不建议使用倒引号，不能嵌套使用
```

# Reference Links
- [linux shell quick start](http://note.youdao.com/noteshare?id=b7006c9637c694fc088531a7e3d1fa46)

- [common commands](http://note.youdao.com/noteshare?id=255a7f4991e565426e4ae942b7287da0)

- [shell debug](http://note.youdao.com/noteshare?id=3a26f3d2ce9cdd864d1b238ceecdaba3)