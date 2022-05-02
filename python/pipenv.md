# Pipenv 

## install pipenv
```bash
sudo apt install python3

pip install --user pipenv

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