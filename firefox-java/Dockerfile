FROM ubuntu:15.10

RUN apt-get update
RUN apt-get -y install pulseaudio firefox icedtea-plugin

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD ["/usr/bin/firefox", "--new-instance"]
