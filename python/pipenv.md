# Pipenv 

## install pipenv
```bash
pip install --user pipenv

echo -e "export PATH=\${PATH}:$(python3 -m site --user-base)/bin >> ~/.bashrc  
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