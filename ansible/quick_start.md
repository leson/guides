

# ansible command line

## configuration file

1. configuration file `ansible.cfg`

   ```yml
   [defaults]
   host_key_checking=false
   ```

2. inventory file `hosts`

   ```yml
   [local-pi]
   192.168.1.119
   
   [local-pi:vars]
   ansible_ssh_user=pi
   ansible_ssh_pass=asdfasdf
   
   [remote-host]
   55.66.77.88
   
   [remote-host:vars]
   ansible_ssh_user=leson
   ansible_ssh_pass=asdfasdf
   ansible_become=true
   ansible_become_method=su
   ansible_become_user=root
   ansible_become_pass=asdfasdf
   ```

   

3. testing the host avaiable or not 

   ```shell
   ansible -i hosts local-pi -m ping
   ```

   > 192.168.1.119 | SUCCESS => {
   >     "ansible_facts": {
   >         "discovered_interpreter_python": "/usr/bin/python"
   >     }, 
   >     "changed": false, 
   >     "ping": "pong"
   > }

## usage

> demonstration of copy shell script and execute the shell script on destination host.

- prepare a simple shell script `init.sh`

  ```shell
  #!/bin/bash
  touch ansible.test
  ```

- copy above shell script o destination host

  ```shell
  ansible -i hosts remote-host -m copy -a 'src=./init.sh dest=/root/init.sh'
  ```

- execute the destination host specified shell script `/root/init.sh`

  ```shell
  ansible -i hosts remote-host -m shell -a 'sh ~/init.sh'
  ```

- check if the file `ansible.test` file generated or not on destination host

- more easy approach `script` module 

  ```shell
  ansible -i hosts local-pi -m script -a 'init.sh'
  ```

  

# playbook

1. playbook `playbook.yml`

   ```shell
   - hosts: local-pi
     name: play testing
     tasks:
     - name: check host connection
       ping:
   ```

2. invoke playbook file

   ```shell
   ansible-playbook -i hosts playbook.yml 
   ```

   

