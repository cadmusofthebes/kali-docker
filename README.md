# Overview
This is a dockerfile that can be used to build a Kali image that is fully updated, has the metapackages, and RDP configured automatically
<br>

-----
# Steps
1\. Save the the Dockerfile to a location of your choosing

2\. Navigate to that directory

3\. Run the following command
```bash
docker build -t <desired image name> .
```

4\. Create the container. You can view the [docker documentation](https://docs.docker.com/) for details on what each switch does.
```bash
docker run -p 3390:3390 --expose=3390 -v ~/<local>/<mount>:/mnt/<docker folder> --name <desired container name> --security-opt seccomp=unconfined --cap-add=net_admin --device=/dev/net/tun -it <image name from step 3> /bin/bash
```
<br>

-----
# Troubleshooting
## XRDP Doesn't work
\- Make sure you are RDPing into your docker container over `127.0.0.1:3390` and not the IP of the docker container.

\- Sometimes just need to start/stop it to get it working again as it gets hung at startup
```bash
/etc/init.d/xrdp stop
/etc/init.d/xrdp start
```

\- View `/var/log/xrdp.log` for messages and clues
