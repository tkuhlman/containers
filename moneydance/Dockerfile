FROM ubuntu:15.10

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre
RUN wget http://infinitekind.com/stabledl/2015/moneydance_linux_amd64.deb
RUN dpkg -i moneydance_linux_amd64.deb
RUN rm moneydance_linux_amd64.deb
# Use the system java, move the packaged java to the side
RUN mv /opt/Moneydance/jre /opt/Moneydance/jre-bundled

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD [ "/opt/Moneydance/Moneydance" ]
