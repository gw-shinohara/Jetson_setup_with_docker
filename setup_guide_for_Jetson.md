# Boxer setup manual for Jetson Xavier
## activate fan
```
sh nvpmodel -m 0
```

## Rewrite lsb-release
```
sudo vi /etc/lsb-release
```
Overwrite following text
```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.4 LTS"
```

## OS update
```
sudo apt-get -y update
```