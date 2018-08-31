# quick start of ansible
[official of github](https://github.com/ansible/ansible)

> `answerable` , designing for communication with server smoothly and Increase of efficiency

## there are three approach of installation

1. source code installation
```
git clone git@github.com:ansible/ansible.git
cd ./ansible
source ./hacking/env-setup -q

sudo pip install paramiko PyYAML Jinja2 httplib2 six
```
2. pip
```
pip install ansible
```
3. yum/apt-get ...

## path of ansible
```
/etc/ansible            #Software Package Management Tools installation will use this path
ll -a |grep ansible     # pip install ansible will use this path.
```


## manually of ansible
```
man ansible
```

## basically command of ansible 

```
ansible

ansible-doc

ansible-galaxy      # similar with pip/yum/npm modules management components

ansible-playbook

ansible-pull

```


## Commonly used modules
```
ping 

file

copy

command

service

shell

raw
```
