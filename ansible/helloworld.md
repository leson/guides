
# Hello Ansible

## ansible version
```
ansible --version
```

## ssh connection without password
```
ssh-keygen -t rsa   #generate public key to ~/.ssh/id_rsa.pub
ssh-copy-id -i ~/.ssh/id_rsa.pub pi@192.168.1.109       #copy key to remote server.

ssh pi@192.168.1.109        #test connection
```

## check the file of ansible configuration.

1. contents of `/etc/ansible/hosts` as below:
> 192.168.1.109

## test connection with ansible
```
ansible -m ping -u pi 192.168.1.109

ansible -m ping 192.168.1.109 -u pi

ansible 192.168.1.109 -m ping -u pi

# above shown that the order of command 
```