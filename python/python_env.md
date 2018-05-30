# Python Environment Setup

## pyenv

- pyenv 原理
> pyenv 的美好之处在于，他并没有使用将不同的 PATH植入不同的shell这种高耦合的工作方式，而是简单地在PATH植入不同的shell这种高耦合的工作方式，而是简单地在PATH 的最前面插入了一个垫片路径（shims）：~/.pyenv/shims:/usr/local/bin:/usr/bin:/bin。所有对 Python 可执行文件的查找都会首先被这个 shims 路径截获，从而架空了后面的系统路径。

- install `pyenv`
```bash
curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```
- config pyenv and virtualenv; actually,previous step will provide the config like below paste.
```bash
# Load pyenv automatically by adding
# the following to ~/.bash_profile:

export PATH="/home/leson/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
- install others version python.
```bash
pyenv install -l        # preview the versions list that can be installed so far 

pyenv install 3.6.4

pyenv versions          # show the version of python that have installed
```

- switch python version
```bash
pyenv global 3.6.4
python -version
```

- uninstall useless python version 
```bash
pyenv uninstall 3.6.4
```


## virtualenv

- use virtualenv if we have install the pyenv;create virtual environment of python
```bash
pyenv virtualenv 3.6.4 env364
```

- use the virtual environment
```bash
pyenv activate env364
```

- switch back the virtual environment
```bash
pyenv deactivate
```
