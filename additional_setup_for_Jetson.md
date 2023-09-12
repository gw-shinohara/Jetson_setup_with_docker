## JetsonStartup
- Get IP Address of Jetson
- Running fan
- Launch vino server
- Activate auto login

Later
-  ssh key setting

## Get ipAddress of Jetson
in Jetson
1. Start Jetson
2. Get ip address of eth0
```
ifconfig
```
Note the ipAddress written after the inet in the eth0 section.

e.g.: 192.168.100.49
```
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.100.49  netmask 255.255.255.0  broadcast 192.168.100.255
        inet6 fe80::d17d:f493:3585:dda  prefixlen 64  scopeid 0x20<link>
        ether 00:04:4b:cb:a1:72  txqueuelen 1000  (Ethernet)
```


## Setting ssh key and auto authorization
### *To execute this section, "Get ipAddress of Jetson" must be completed
in Cliant PC
In this section, some variables are defined as follows
Jetson's ip address: 192.168.100.49
Jetson's username: nvidia

1. Generate ssh key
```
cd ~
mkdir -p -m 700 .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -f id_rsa_jetson
```
2. Create config
```
cd ~/.ssh
touch config
vi config
```
write config parameter

```config
## Jetson Xavier01
Host jetson01
    Hostname 192.168.100.49
    User nvidia
    Port 22 
    IdentityFile ~/.ssh/id_rsa_jetson
```
3. Copying id_rsa_jetson.pub key
```
cd ~/.ssh
vi id_rsa_jetson.pub
```
Copy all.


3. Connecting Jetson
Editting authorized_keys
```
ssh nvidia@192.168.100.49
cd ~/.ssh
vi authorized_keys
```
Paste all to the end of page.

4. If you need to connect another Jetson, you will need to append another config.


## Add Runfan and activate Vino server service
in jetson

1. Download from gitlab and extract.
2. Change extract directory.
```
cd jetsonstartup
```
2. Running setup.sh
This script copies the service and scripts to the directories "/etc/systemd/system" and "/opt" respectively. 
Then, enable the Fan run max service.

```
sudo sh shactivate_fan_setup.sh
```
3. reboot
Rebooting system for testing service.
```
reboot
```


## Setting up Vino server

0. install vino server
Ref: /media/nvidia/L4T-README/README-vnc.txt

1. activate auto login

```
vi /etc/gdm3/custom.conf
```

2. Uncomment out AutomaticLoginEnable and AutomaticLogin. And user1 to using user name.

```custom.conf
# Enabling automatic login
AutomaticLoginEnable = true
AutomaticLogin = user1
```

3. activate vino_launch service

```
sudo sh activate_vino_server.sh
```

4. Setup Display size

```
vi /etc/X11/xorg.conf
```
Add following section

```/etc/X11/xorg.conf
# Disable extensions not useful on Tegra.
Section "Module"
    Disable     "dri"
    SubSection  "extmod"
        Option  "omit xfree86-dga"
    EndSubSection
EndSection

Section "Device"
    Identifier  "Tegra0"
    Driver      "nvidia"
# Allow X server to be started even if no display devices are connected.
    Option      "AllowEmptyInitialConfiguration" "true"
EndSection


Section "Monitor"
    Identifier "DSI-0"
    Option    "Ignore"
EndSection

Section "Screen"
    Identifier    "Default Screen"
    Monitor        "Configured Monitor"
    Device        "Default Device"
    SubSection "Display"
        Depth    24
        Virtual 1920 1080
    EndSubSection
EndSection
```
