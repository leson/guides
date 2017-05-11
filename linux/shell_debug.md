# shell 调试选项

### 查看shell 脚本 manual

* `man sh `
* `man dash`
* `man ksh`
### 调试选项 

* `-v` (verbose) - 告诉 Shell 读取脚本时显示所有行，激活详细模式。
* `-n`（noexec 或 no ecxecution 简称） - 指示 Shell 读取所有命令然而不执行它们，这个选项激活语法检查模式。
* `-x` （xtrace 或 execution trace 简称） - 告诉 Shell 在终端显示所有执行的命令和它们的参数。 这个选项是启用 Shell 跟踪模式。

# shell 调试三种方式
### 1. 改变shell脚本首行
> `#!/bin/sh 选项`

其中，`选项`可以是上面提到的一个或多个调试选项。

### 2. 调用shell调试选项

打开整个脚本调试
```bash
$ shell 选项   参数1 ... 参数N
```
示例：
```bash
$/bin/bash 选项   参数1 ... 参数N
```
### 3. 使用shell内置命令`set`

启用调试模式：

> set -选项

关闭调试模式:

> set +选项

示例：

```bash
#!/bin/bash
typeset SH_NAME=$(echo $0|xargs -i basename {})

function foo(){
    set -x # -v or -n 
    echo show shell name :[${SH_NAME}]
    set +x # +v or +n
}

foo()

``` 