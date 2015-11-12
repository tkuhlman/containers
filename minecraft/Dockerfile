FROM ubuntu:15.10

RUN apt-get update
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -y mesa-utils xserver-xorg-video-all x11-xserver-utils openjdk-8-jre wget

RUN wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD ["java", "-jar", "Minecraft.jar"]

# Minecraft forge installs everything to ~/.minecraft so this image can be used with a modded ~/.minecraft also
