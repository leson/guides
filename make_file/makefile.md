## Make File
`Makefile`
```makefile
image_name="leson/alpine:mkfile"
default: build run
build:
	docker build -t ${image_name} .

run:
	docker run -d ${image_name} 

push:
	docker push ${image_name}

debug:
	docker run --rm -it ${image_name} /bin/sh

release: build push

```

## 
```bash
make 
```

## 
```bash
make build
```

## 
```bash
make release
```
