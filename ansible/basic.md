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
2. pip \<recommand\>
```
pip install ansible
```
3. yum/apt-get ...

## path of ansible
```
/etc/ansible            #Software Package Management Tools installation will use this path
ll -a |grep ansible     # pip install ansible will use this path.
```
```
find / -name "ansible" 

$> sudo ls -l .pyenv/shims -a |grep ansible
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-config
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-connection
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-console
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-doc
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-galaxy
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-inventory
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-playbook
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-pull
-rwxr-xr-x  1 leson leson  402 9月   1 00:14 ansible-vault
```


## manually of ansible
```
ansible -h 
```

## basically command of ansible 

1. `ansible` 

2. `ansible-doc` using for view the module usage
    ```shell
    ansible-doc -s authorized_key
    ```

3. ansible-galaxy      # similar with pip/yum/npm modules management components
    > ​a free site for finding, downloading, and sharing community developed roles.
    ```shell
    
    ```

4. ansible-playbook

5. ansible-pull

6. ansible-vault



## [Commonly used modules](https://docs.ansible.com/ansible/2.6/user_guide/modules_intro.html) 
`inventory.cfg` contents as below shown:
```yaml 
[pi]
192.168.1.109
```

1. `ping` 

2. `file`

3. `copy`

4. `command`
```
ansible pi -m command -a '/bin/echo hello ansible' -i inventory.cfg -u pi
```
5. `service`

6. `shell`
```
ansible pi -m shell -a '/bin/echo hello ansible' -i inventory.cfg -u pi
```

7. `raw`


