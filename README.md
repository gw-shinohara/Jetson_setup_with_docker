# Overview
Install Jetpack to Nvidia jetson.
The following is the procedure.
1. Boot the host OS, Ubuntu 22.04.
1. Install SDKManager and start the Docker container.
1. Boot and connect the Jetson to host OS.
1. Install Jetpack4.xx on Jetson.

# Import sdkmanager from dockerimage
1. Download Dockerimage from (https://developer.nvidia.com/drive/sdk-manager)

2. Move to tar file directory
   
3. Load docker image
```
docker load -i ./sdkmanager-[version].[build#]-[base_OS]_docker.tar.gz
```
4. Tagging latest 
```
docker tag sdkmanager:[version].[build#] sdkmanager:latest
```

5. Check sdkmanager version
```
docker run -it --rm sdkmanager --ver
```
6. Setting up latest docker image. Please refer following url. (https://docs.nvidia.com/sdk-manager/sdkm-command-line-install/index.html)

7. Execute command
```
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb/ -v /dev:/dev -v /media/$USER:/media/nvidia:slave --name JetPack_NX_Devkit --network host sdkmanager --cli install  --logintype devzone --product Jetson --host --targetos Linux --version 4.5.1 --target JETSON_AGX_XAVIER --select 'Jetson OS' --select 'Jetson SDK Components' --flash all 
```

1. Install HOST COMPONENTS and even flash Jetson OS
   
2. Start Jetson and perform the initial setup. At this time, set UserName to nvidia, Password to nvidia, and install in English.
    
3.  Get ip address. Refer to "Get ipAddress of Jetson"
```
ifconfig
```

1.  Return to the host computer and resume from Jetson SDK Components

