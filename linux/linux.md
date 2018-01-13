# linux

## user|group|file/folder
```bash
/etc/group
id <user>
```
- add group 

- add user to group 

- change user to other group

- change file/folder to other group

## calculate
- `echo |awk '{print 3.0/2}'`
- `echo |awk '{printf("%.3f\n",3.0/4)}'`

## Transfer File|Folder
> scp <from\> <to\>

- transfer file 
```bash 
scp pi@192.168.1.5:/home/leson/hello.txt /home/vicky/aa.txt`
```
- transfer folder 
```bash
scp -rv /home/leson/testFolder/ pi@192.168.1.5:/home/leson/
```

## kill all Process by Process ID

```bash
ps -ef |grep <your pattern> |awk '{print $2}' |xargs -i sudo kill {}
```
