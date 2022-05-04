# Pipenv 

## install pipenv
```bash
sudo apt install python3
pip install  pipenv --user 
## or
python3 -m pip install pipenv --index-url=https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com --user

echo -e "export PIPENV_VENV_IN_PROJECT=1" >> ~/.bashrc
echo -e "export PIPENV_IGNORE_VIRTUALENVS=1" >> ~/.bashrc
echo -e "export PATH=\${PATH}:$(python3 -m site --user-base)/bin" >> ~/.bashrc

source ~/.bashrc  
## test
echo ${PIPENV_VENV_IN_PROJECT}
pipenv -h 

```
## dependencies install
```bash

pipenv install --pypi-mirror https://mirrors.aliyun.com/pypi/simple/

```

# Q&A
1. 
```bash
pipenv lock --clear
```