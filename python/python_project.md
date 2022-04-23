# python project structure
```
/myproject
    /pkg
    __init__.py
    m2.py
        /sub-pkg
        __init_.py
        m3.py
m1.py
run.py
```

## python project management
> generally , the entrance py file locate at root folder of project !!!
there will avoid not modules or package found issue.

## import self defined modules
`m1.py`
```python
from .m1 import f1
```

## python package relative path import 
`m2.py`
```python
sys.path()
print(__name__)
__name__="<pkg.xxxx>" 
sys.path.append("/home/zhangsan/myproject/")

from .m2 import f2
```

## python package absolutely path import
```python
from pkg.m2 import f2
```

## `pkg/__init__.py` usage
> init import methods from modules under `pkg`
```bash
from .m2 import f2
```

## sub package 
`m3.py`
```python
from ...m1 import f1
from ..m2 import f2

```



