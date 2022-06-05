# common shadowsocks setup

```shell
GK_VERSION="8.5.0"
mkdir -p ~/.app/
DR -f https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz -O ~/.app/"GK-${GK_VERSION}.tgz"
DR -xI ~/.app/"GK-${GK_VERSION}.tgz" -O ~/.app/"gitkraken-${GK_VERSION}/"
ln -sfT "gitkraken-${GK_VERSION}/gitkraken" ~/.app/gitkraken
rm ~/.app/"GK-${GK_VERSION}.tgz"
```
