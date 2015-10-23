FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y wget openjdk-8-jre
WORKDIR /opt
RUN wget http://download.jetbrains.com/python/pycharm-community-4.5.4.tar.gz
RUN tar -xzf pycharm-community-4.5.4.tar.gz
RUN rm pycharm-community-4.5.4.tar.gz
RUN ln -s pycharm-community-4.5.4 pycharm

# Set the user, uid, gid appropriately
RUN export uid=1000 gid=1000 user=tim && \
    echo "${user}:x:${uid}:${gid}:local user,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
    echo "${user}:x:${uid}:" >> /etc/group && \
    mkdir -p /home/${user} && \
    chown ${uid}:${gid} -R /home/${user}

USER tim
ENV HOME /home/tim

CMD [ "/opt/pycharm/bin/pycharm.sh" ]