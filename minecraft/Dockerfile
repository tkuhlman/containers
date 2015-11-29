FROM ubuntu:15.10

RUN apt-get update
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y mesa-utils xserver-xorg-video-all x11-xserver-utils openjdk-8-jre wget pulseaudio libgl1-mesa-dri

RUN wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
RUN update-ca-certificates -f

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

RUN gpasswd -a tim video

USER tim
ENV HOME /home/tim

CMD ["java", "-jar", "Minecraft.jar"]

# Minecraft forge installs everything to ~/.minecraft so this image can be used with a modded ~/.minecraft also
