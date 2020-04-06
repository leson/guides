## ssh key management

1. key generation

   ```shell
   ssh-keygen
   
   ```

2. push the ssh pub key to destination host

   ```shell
   # ssh-copy-id		# copy ssh pub key to remote host.
   ansible -i hosts pi -m authorized_key -a 'user=leson key="{{ lookup("file","/home/leson/.ssh/id_rsa.pub") }}"' -k
   ```

   