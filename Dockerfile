# Pull latest docker kali image
FROM kalilinux/kali-rolling:latest

# Set variable to make this all non-interactive (no prompts)
ARG DEBIAN_FRONTEND=noninteractive

# Run all system updates and installs
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt install -y wget kali-linux-headless

# Setup xrdp
RUN apt-get install -y kali-desktop-xfce xorg xrdp
RUN useradd -m -p "saHz2oQLytbl2" "kali"
RUN sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
RUN /etc/init.d/xrdp start
RUN update-rc.d xrdp defaults

# Cleanup everything
RUN apt-get -qy autoremove
CMD ["bash"]
