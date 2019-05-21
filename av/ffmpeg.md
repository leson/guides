
# [installation on centos](https://trac.ffmpeg.org/wiki/CompilationGuide/Centos)
```bash
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -zxvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure

make && make install
```

```bash
wget https://ffmpeg.org/releases/ffmpeg-4.1.3.tar.bz2
tar -jxvf ffmpeg-4.1.3.tar.bz2
cd ffmpeg-4.1.3
./configure --enable-shared --prefix=$(pwd)/tools/ffmpeg

make && make install
```

# verify installation if can be use
```bash
cd $(pwd)/tools/ffmpeg
./bin/ffmpeg -version
```
