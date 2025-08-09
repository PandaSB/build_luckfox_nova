# build_luckfox_nova
# Reference doc : https://wiki.luckfox.com/Luckfox-Nova

##build Docker image
```
docker build -t test:latest
```
##Run Docker image
```
docker run -it -v /home/$USER/src:/home/rk_compiler/src test:latest  bash
```

## Command build 
```
cd $HOME/src/
mkdir Nova-sdk && cd Nova-sdk
tar -xzvf ../Luckfox_Nova_SDK_250430.tar.gz 
.repo/repo/repo sync -l
./build.sh lunch
./build.sh
```
