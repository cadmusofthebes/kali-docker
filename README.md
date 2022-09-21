# Overview
This is a dockerfile that can be used to build a Kali image that is fully updated, has the metapackages, and RDP configured automatically

# Steps
1\. Save the the Dockerfile to a location of your choosing

2\. Navigate to that directory

3\. Run the following command
```bash
docker build -t <image name> .
```

4\. Create the container
```bash
docker run -p 3390:3390 --expose=3390 -v ~/<local>/<mount>:/mnt/<docker folder> --name <image name> --security-opt seccomp=unconfined --cap-add=net_admin --device=/dev/net/tun -it kalilinux/kali-rolling /bin/bash
```
