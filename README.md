# Overview
This is a dockerfile that can be used to build a Kali image that is fully updated, has the metapackages, and RDP configured automatically.

Note that using this does require some understanding of Docker and how images and containers work. If you are unfamiliar, see [this](https://www.youtube.com/watch?v=pTFZFxd4hOI) video
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
- From a nix system
```bash
docker run -p 3390:3390 --expose=3390 -v ~/<local folder to mount within the container>:/mnt/<folder on docker to access host folder from> --name <desired container name> --security-opt seccomp=unconfined --cap-add=net_admin --device=/dev/net/tun -it <image name from step 3> /bin/bash
```

- From Windows
```powershell
docker run -p 3390:3390 --expose=3390 -v c:\<local folder to mount within the container>:\mnt\<folder on docker to access host folder from> --name <desired container name> --security-opt seccomp=unconfined --cap-add=net_admin --device=/dev/net/tun -it <image name from step 3> /bin/bash
```
<br>

-----
# Troubleshooting
## XRDP Doesn't work
\- Make sure you are RDPing into your docker container over `127.0.0.1:3390` and not the IP of the docker container.

\- Sometimes just need to start/stop it to get it working again as it gets hung at startup. I have also seen it say "service start failed" but work anyway.
```bash
/etc/init.d/xrdp stop
/etc/init.d/xrdp start
```

\- View `/var/log/xrdp.log` for messages and clues
